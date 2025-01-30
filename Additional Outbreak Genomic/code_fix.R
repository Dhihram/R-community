#Installingpackages
install.packages("seqinr")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("ggtree", "treeio", "ape","phytools"))
install.packages('readxl')
install.packages('epitrix')
install.packages('outbreaker2')

#genomic data and tree data
#seq
library(seqinr)
library(tidyverse)

setwd("C:/Users/dhihr/Documents/inbios training/materi")
mydna <- seqinr::read.fasta("PHM-EVD_WGS.fasta")   
mylength <- sapply(mydna, length)
mylength

#tree
library(ggtree)
mytree <- treeio::read.tree('tree.txt')
mytree
plot(mytree)
ggtree::ggtree(mytree) + geom_tiplab() + geom_tippoint() + theme_tree2()


#epi-data
setwd("C:/Users/dhihr/Documents/inbios training/materi")
library(readxl)
linelist <- readxl::read_xlsx("PHM-EVD-linelist.xlsx")
linelist
class(linelist$onset)
head(linelist)
linelist$onset <- as.Date(linelist$onset)
linelist$date_infection <- as.Date(linelist$date_infection)

linelist$onset <- as.Date(linelist$onset)
head(linelist$onset)
class(linelist$onset)

contacts <- readxl::read_xlsx("PHM-EVD-contacts.xlsx")
contacts$from <- ifelse(contacts$from == 'NA', NA, contacts$from)

library(epicontacts)
myepi <- epicontacts::make_epicontacts(linelist=linelist, contacts=contacts,
                                       directed=TRUE)
myepi
epicontacts::vis_epicontacts(myepi)
epicontacts::vis_epicontacts(myepi, node_color = "sex")
contact_tracing <- epicontacts::vis_epicontacts(myepi, node_color = "sex", node_shape="sex", 
                             shapes=c(male="male", female="female"))
contact_tracing
#tree and epid data
#reroot
myroot <- which(mytree$tip.label=="C_01")
library(phytools)
tre_rooted <- phytools::reroot(mytree, myroot)


#tree viz
library(ggtree)
ggtree(tre_rooted, colour="#99d8c9") + geom_tiplab() +
  geom_tippoint(colour="#2ca25f") + geom_nodepoint(colour="#99d8c9") +
  theme_tree2()

ggtree(tre_rooted) +  geom_tiplab()+ 
  geom_text2(aes(subset=!isTip, label=label),
             size = 3.5,
             color = "#0063B1",
             hjust = 1,
             vjust = -1.5) 

ggtree(tre_rooted) %<+%  linelist +
  geom_tiplab(aes()) +
  geom_tippoint(aes(colour=location)) +
  theme_tree2() + geom_text2(aes(subset=!isTip, label=label),
                             size = 2.5,
                             color = "#0063B1",
                             hjust = 1,
                             vjust = -1.5) + 
  geom_treescale(x=0.0004, y=20, fontsize = 4, linesize = 1.5) 

#generation time and incubation period distribution
#incubation period
library(epitrix)
incub_obs <- as.integer((with(linelist, onset - date_infection)))
summary(incub_obs)
incub_fit <- epitrix::fit_disc_gamma(incub_obs)
incub <- incub_fit$distribution
incub_fit

#serial interval
myepi_si <- get_pairwise(myepi, "onset")
summary(myepi_si)
hist(myepi_si, xlab = "Days after symptom onset", ylab = "Frequency",
     main = "Serial interval (empirical distribution)",
     col = "grey", border = "white", breaks = 40)

si_fit <- epitrix::fit_disc_gamma(myepi_si)
si_fit
si <- si_fit$distribution
si


#Consensus chain
#configuration
library(ape)
dna <- ape::read.FASTA("Galaxy5-[MAFFT on data 4].fasta")   
dna <- dna[match(linelist$case_id, names(dna))]
identical(labels(dna), linelist$case_id)

## only keep linelist and contacts elements in linelist_clean
epi_contacts_clean <- myepi[i = linelist$case_id, ## keep linelist
                            j = linelist$case_id, ## keep contacts
                            contacts = 'both'] ## both contacts must be in linelist
epi_contacts_clean$directed ## check directionality

library(outbreaker2)
mydata <- outbreaker2::outbreaker_data(
  dates = linelist$onset, # Dates of symptoms onset
  ctd = epi_contacts_clean, # The contact data
  dna = dna, # The DNA sequences
  w_dens = si$d(1:100), # The generation time distribution
  f_dens = incub$d(1:100)) # The incubation distribution

myconfig <- outbreaker2::create_config(
  move_kappa = FALSE, # Don't look for missing links
  move_pi = FALSE, # Don't estimate the reporting frequency
  init_pi = 1, # Set reporting to 100%
  find_import = FALSE, # Don't look for additional imported cases
  n_iter=1000, sample_every=10) # Set the number of iterations

set.seed(123)
myoutbreak <- outbreaker2::outbreaker(data = mydata, config = myconfig)
class(myoutbreak)
myoutbreak
plot(myoutbreak)
plot(myoutbreak, burnin = 250)

#running consensus chain
myoutbreak.sum <- summary(myoutbreak)
myoutbreak.sum$tree$support_cat <- cut(myoutbreak.sum$tree$support, breaks = c(0, 0.75, 1),
                                       labels = c("low", "high"))
myoutbreak.sum$tree$support <- round(myoutbreak.sum$tree$support, 2)
head(myoutbreak.sum$tree)

linelist$id <- 1:nrow(linelist)
linelist$age_class <- cut(linelist$age, breaks = c(0, 10, 20, 30, 40, 90),
                          labels = c("0-10", "11-20", "21-30", "31-40", "41+" ))
consensus_chain <- epicontacts::make_epicontacts(linelist, contacts=myoutbreak.sum$tree[-1, ], 
                                                 from = 1, to = 2, id = "id", directed = TRUE)
mypalette <- grDevices::colorRampPalette(c("#3288BD", "#ABDDA4", "#FDAE61",
                                           "#D53E4F"))
epicontacts::vis_epicontacts(consensus_chain, node_color = "sex", node_shape="sex", 
                             edge_color='support_cat',
                             shapes=c(male="male", female="female"))
consensus <- epicontacts::vis_epicontacts(consensus_chain, edge_color='support_cat', node_color =
                               "age_class", node_shape="sex",
                             shapes=c(male="male", female="female"), 
                             col_pal=mypalette)
consensus

plot(
  consensus_chain,
  x_axis = "onset",
  node_color = "sex",
  arrow_size = 0.5,
  node_size = 13,
  label = FALSE,
  height = 700,
  width = 700
)


# final chain 
subset_myoutbreak.sum <- myoutbreak.sum$tree
subset_myoutbreak.sum <- subset(subset_myoutbreak.sum, support_cat == 'high')
sub <- c(subset_myoutbreak.sum$from, subset_myoutbreak.sum$to)
sub <- unique(sub)
subset_linelist <- linelist %>% filter(id %in% sub)

final_chain <- epicontacts::make_epicontacts(subset_linelist, contacts=subset_myoutbreak.sum[-1, ], 
                                             from = 1, to = 2, id = "id", directed = TRUE)
mypalette <- grDevices::colorRampPalette(c("#3288BD", "#ABDDA4", "#FDAE61",
                                           "#D53E4F"))
final_chain <- epicontacts::vis_epicontacts(final_chain, edge_color='support_cat', node_color =
                               "age_class", node_shape="sex", 
                             shapes=c(male="male", female="female"),
                             col_pal=mypalette)
final_chain 
