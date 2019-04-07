#!/usr/bin/env Rscript

# Data from: http://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv
# see http://web.stanford.edu/class/archive/cs/cs109/cs109.1166/problem12.html
# in turn from https://www.encyclopedia-titanica.org/

# wget http://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv


require("tidyr")
require("dplyr")

data <- read.csv("titanic.csv")

data$female <- as.integer(as.logical(data$Sex == "female"))

# one good feature
data$child <- as.integer(as.logical(data$Age < 10))

# one bad feature
data$PclassDuplicate <- data$Pclass

drops <- c("Survived", "Sex") # not needed in covariates file
data <- data[ , !(names(data) %in% drops)]
tidy_covariates <- data %>% gather(features, covariates, -Name)
write.csv(tidy_covariates, "titanic-covariates.csv")