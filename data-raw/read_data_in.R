# This is an internal script to add new thorlabs data to the sysdata.rda internal dat file of the package.
# ONly run this script when adding new data to the package

APD120A2_data <- read.csv("data-raw/APD120A2_data.csv", sep = ";")

FEL0550_data <- read.csv("data-raw/FEL0550_data.csv", sep = ";")

FES0550_data <- read.csv("data-raw/FES0550_data.csv", sep = ";")

FEL0600_data <- read.csv("data-raw/FEL0600_data.csv", sep = ";")

devtools::use_data(APD120A2_data, FES0550_data, FEL0550_data, FEL0600_data, internal = T)
