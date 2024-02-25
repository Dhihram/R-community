###############################################################################
### inner_join(), full_join()
# x = the first (left) table
# y = the second (right) table
# by = what columns to match on. If you leave this blank, it will match on all columns

# Create example data frames
subject <- tibble(
  id = 1:5,
  gender = c("m", "m", "f", "nb", "f"),
  age = c(19, 22, 95, 19, 18)
)

data <- tibble(
  id = c(2, 3, 4, 4, 5, 5, 6, 6, 7),
  score = c(10, 18, 21, 23, 9, 11, 11, 12, 3)
)

## left_join()
# A left_join keeps all the data from the first (left) table and joins anything that matches from the second (right) table.
left_df_subj <- left_join(subject, data, by = "id") # when the rows/column doesnt match, it will return to NA

# The order of tables is swapped here, so the result is all rows from the exp table joined to any matching rows from the subject table.
left_df_dat <- left_join(data, subject, by = "id")


# right_join()
right_df <- right_join(subject, data, by = "id")

# inner_join()
# returns all the rows that have a match in the other table.
inner_df <- inner_join(subject, data, by = "id")

# full_join()
# join up rows in two tables while keeping all of the information from both tables.
# If a row doesn't have a match in the other table, the other table's column values are set to NA.
full_df <- full_join(subject, data, by = "id")


################################################################################
### pivot_longer(), pivot_wider()
# Example wide format data
wide_data <- data.frame(
  ID = 1:4,
  aspek_psikologis = c(10, 15, 20, 25),
  aspek_biologis = c(20, 25, 15, 10),
  aspek_genetis = c(30, 35, 15, 20)
)

# Pivot wide format data to long format
long_data <- pivot_longer(wide_data, 
                          cols = starts_with("as"), # remember starts_with() ?
                          names_to = "aspek", 
                          values_to = "score")

# data: The data frame to pivot.
# cols: The columns to pivot into longer format.
# names_to: The name of the new column that will store the variable names.
# values_to: The name of the new column that will store the values.

# Pivot long format data to wide format
bring_back_to_wider <- pivot_wider(long_data,
                                   names_from = aspek,
                                   values_from = score)
