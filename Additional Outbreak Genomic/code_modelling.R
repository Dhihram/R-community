install.packages('purr')
install.packages('DescTools')
install.packages("superspreading", repos = c("https://epiverse-trace.r-universe.dev"))


##Estimating R0
library(purrr)
# count secondary cases per infector
infector_secondary <- final_chain %>%
  purrr::pluck("contacts") %>%
  dplyr::count(from, name = "secondary_cases")

all_secondary <- final_chain %>%
  # extract ids in contact *and* linelist using "which" argument
  epicontacts::get_id(which = "all") %>%
  # transform vector to dataframe to use left_join()
  tibble::enframe(name = NULL, value = "from") %>%
  # join count secondary cases per infectee
  dplyr::left_join(infector_secondary) %>%
  # infectee with missing secondary cases are replaced with zero
  tidyr::replace_na(
    replace = list(secondary_cases = 0)
  )
## plot the distribution
all_secondary %>%
  ggplot(aes(secondary_cases)) +
  geom_histogram(binwidth = 1) +
  labs(
    x = "Number of secondary cases",
    y = "Frequency"
  )
mean(all_secondary$secondary_cases)

library(DescTools)
Mode(all_secondary$secondary_cases)

library(fitdistrplus)
#install.packages('fitdistrplus')
## fit distribution
offspring_fit <- all_secondary %>%
  dplyr::pull(secondary_cases) %>%
  fitdistrplus::fitdist(distr = "nbinom")

offspring_fit

# Set seed for random number generator
set.seed(33)

# estimate the probability of
# having a cluster size of 5, 10, or 25
# secondary cases from a primary case,
# given known reproduction number and
# dispersion parameter.

library(superspreading)
superspreading::proportion_cluster_size(
  R = offspring_fit$estimate["mu"],
  k = offspring_fit$estimate["size"],
  cluster_size = c(2,3, 5)
)

# Parameters
R0 <- offspring_fit$estimate[2]  # Median basic reproduction number
T <- si_fit$mu      # Serial interval in days

# Calculating beta
beta <- R0 / T

# Simulation settings
days <- 400  # Number of days to simulate
S <- rep(0, days)  # Susceptible population over time
I <- rep(0, days)  # Infected population over time

# Initial conditions
S[1] <- 49  # Initial number of susceptible individuals
I[1] <- 1    # Initial number of infected individuals

# SI model simulation
for (t in 1:(days - 1)) {
  new_infections <- beta * I[t] * S[t] / (S[t] + I[t])
  S[t + 1] <- S[t] - new_infections
  I[t + 1] <- I[t] + new_infections
}
model <- data.frame(t = 1:days,S,I)

# Plotting the results
plot(model$t, model$S, type = 'l', col = 'blue', ylim = c(0, max(S[1], I[1])), xlab = "Days", ylab = "Population", main = "SI Model Simulation")
lines(model$t, model$I, col = 'red')
legend("right", legend = c("Susceptible", "Infected"), col = c("blue", "red"), lty = 1)
