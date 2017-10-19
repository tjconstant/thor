# This is an internal script to add new thorlabs data to the sysdata.rda internal dat file of the package.
# Only run this script when adding new data to the package

#APD120A2_data <- read.csv("data-raw/APD120A2_data.csv", sep = ";")
#FEL0550_data <- read.csv("data-raw/FEL0550_data.csv", sep = ";")
#FES0550_data <- read.csv("data-raw/FES0550_data.csv", sep = ";")
#FEL0600_data <- read.csv("data-raw/FEL0600_data.csv", sep = ";")


# Generalized Function: takes any csv found in data-raw and adds it to sysdata avaliable internally to package functions. Only run this script in development mode.

data_files <- dir("data-raw/", pattern = ".csv")
data_names <- gsub(pattern = ".csv", replacement = "", x = data_files)


for(i in 1:length(data_files)){
  eval(parse(text = paste(data_names[i],"<-read.csv('data-raw/", data_files[i], "', sep=';')", sep="")))
}

eval(
  parse(
    text = paste("devtools::use_data(",paste(data_names, collapse = ","), ", internal = TRUE, overwrite = TRUE)", sep="")
    )
  )






