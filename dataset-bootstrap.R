rm(list=ls()) # clear all variables
cat("\014") # clear console
dev.off() # clear plots

# -----------------------------------------------------------------------------
# Environment definition
datasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datasetPath <- "data/household_power_consumption.txt" # The file name is the same one inside the zip above

# -----------------------------------------------------------------------------
# Ensure the dataset to be used is downloaded and unzips it in "data/"
?download.file()
if (file.exists(datasetPath) == FALSE) {
  tmpZipFile <- "data/dataset-tmp.zip"
  download.file(datasetUrl, destfile = tmpZipFile, mode = "wb")
  unzip(tmpZipFile, exdir = dirname(datasetPath))
}

# -----------------------------------------------------------------------------
# Defining dataset
columnTypes = c(
  "character",
  "character",
  "numeric",
  "numeric",
  "numeric",
  "numeric",
  "numeric",
  "numeric",
  "numeric"
)
fullDataset <- read.table(
  datasetPath,
  header = TRUE,
  colClasses = columnTypes,
  sep = ";",
  na.strings = "?"
)
# Converting dates to Date types
fullDataset$Date <- as.Date(fullDataset$Date, format = "%d/%m/%Y")
# Filtering the dataset for just the 2 relevant days
dataset <- subset(fullDataset, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
# Creating `datetime` column for Plots 2, 3 and 4
datetime <- paste(dataset$Date, dataset$Time) # Join both columns
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S") # Convert the column to DateTime object
dataset <- cbind(datetime, dataset) # Prepends the vector to the dataset
dataset <- dataset[ , !(names(dataset) %in% c("Date", "Time"))] # Removes the old columns from the dataset
rm(fullDataset, datetime, columnTypes, datasetPath, datasetUrl, tmpZipFile) # Clear unneded variables