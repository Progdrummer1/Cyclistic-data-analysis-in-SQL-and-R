
# Load dplyr
library(dplyr)

test <- read.csv(".../12_months_divvy_tripdata/202409-divvy-tripdata.csv")

`2024_05`<- read.csv(".../12_months_divvy_tripdata/202405-divvy-tripdata.csv")
`2024_06`<- read.csv(".../12_months_divvy_tripdata/202406-divvy-tripdata.csv")
`2024_07`<- read.csv(".../12_months_divvy_tripdata/202407-divvy-tripdata.csv")
`2024_08`<- read.csv(".../12_months_divvy_tripdata/202408-divvy-tripdata.csv")
`2024_09`<- read.csv(".../12_months_divvy_tripdata/202409-divvy-tripdata.csv")
`2024_10`<- read.csv(".../12_months_divvy_tripdata/202410-divvy-tripdata.csv")


# Calculate the midpoint
midpoint05 <- nrow(`2024_05`) %/% 2
midpoint06 <- nrow(`2024_06`) %/% 2
midpoint07 <- nrow(`2024_07`) %/% 2
midpoint08 <- nrow(`2024_08`) %/% 2
midpoint09 <- nrow(`2024_09`) %/% 2
midpoint10 <- nrow(`2024_10`) %/% 2

# Split the data frame
part1_05 <- `2024_05`[1:midpoint05, ]   # First half
part2_05 <- `2024_05`[(midpoint05 + 1):nrow(`2024_05`), ]   # Second half
part1_06 <- `2024_06`[1:midpoint06, ]   # First half
part2_06 <- `2024_06`[(midpoint06 + 1):nrow(`2024_06`), ]   # Second half
part1_07 <- `2024_07`[1:midpoint07, ]   # First half
part2_07 <- `2024_07`[(midpoint07 + 1):nrow(`2024_07`), ]   # Second half
part1_08 <- `2024_08`[1:midpoint08, ]   # First half
part2_08 <- `2024_08`[(midpoint08 + 1):nrow(`2024_08`), ]   # Second half
part1_09 <- `2024_09`[1:midpoint09, ]   # First half
part2_09 <- `2024_09`[(midpoint09 + 1):nrow(`2024_09`), ]   # Second half
part1_10 <- `2024_10`[1:midpoint10, ]   # First half
part2_10 <- `2024_10`[(midpoint10 + 1):nrow(`2024_10`), ]   # Second half




# View the updated data frame



# Export the data frame to a CSV file
write.csv(part1_05 , file = ".../R_output_splits/2024_05_part1.csv", row.names = FALSE)
write.csv(part2_05 , file = ".../R_output_splits/2024_05_part2.csv", row.names = FALSE)
write.csv(part1_06 , file = ".../R_output_splits/2024_06_part1.csv", row.names = FALSE)
write.csv(part2_06 , file = ".../R_output_splits/2024_06_part2.csv", row.names = FALSE)
write.csv(part1_07 , file = ".../R_output_splits/2024_07_part1.csv", row.names = FALSE)
write.csv(part2_07 , file = ".../R_output_splits/2024_07_part2.csv", row.names = FALSE)
write.csv(part1_08 , file = ".../R_output_splits/2024_08_part1.csv", row.names = FALSE)
write.csv(part2_08 , file = ".../R_output_splits/2024_08_part2.csv", row.names = FALSE)
write.csv(part1_09 , file = ".../R_output_splits/2024_09_part1.csv", row.names = FALSE)
write.csv(part2_09 , file = ".../R_output_splits/2024_09_part2.csv", row.names = FALSE)
write.csv(part1_10 , file = ".../R_output_splits/2024_10_part1.csv", row.names = FALSE)
write.csv(part2_10 , file = ".../R_output_splits/2024_10_part2.csv", row.names = FALSE)

  



