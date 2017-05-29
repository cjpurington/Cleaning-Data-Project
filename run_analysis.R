## run_analysis.R
## Created by Chris Purington on May 27th
## For use in the Coursera "Getting and Cleaning Data" class


# Load required library, set unzipped directory with data files
library(plyr)
fileDirectory <- "./rprog/cleanData/"


## 1. Merges the training and the test sets to create one data set.

# Load all data and combine by data set type
Xtrain <- read.table(paste(fileDirectory, "train/X_train.txt", sep=""))
Xtest <- read.table(paste(fileDirectory, "test/X_test.txt", sep=""))

Ytrain <- read.table(paste(fileDirectory, "train/y_train.txt", sep=""))
Ytest <- read.table(paste(fileDirectory, "test/y_test.txt", sep=""))

Strain <- read.table(paste(fileDirectory, "train/subject_train.txt", sep=""))
Stest <- read.table(paste(fileDirectory, "test/subject_test.txt", sep=""))

Xall <- rbind(Xtrain, Xtest)
Yall <- rbind(Ytrain, Ytest)
Sall <- rbind(Strain, Stest)


## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement.

# Rename variables by feature name
features <- read.table(paste(fileDirectory, "features.txt", sep=""))[,2]
names(Xall) = features

# Filter for mean and std
featureSort <- grep("-(mean|std)\\(\\)", features)
Xall = Xall[,featureSort]

# Clean up column names a little
names(Xall) <- gsub("\\(|\\)", "", names(Xall))
names(Xall) <- tolower(names(Xall))


## 3. Uses descriptive activity names to name the activities in the data set
activitylabels <- read.table(paste(fileDirectory, "activity_labels.txt", sep=""))[,2]

# Change Yall values to activity names
Yall[,1] = activitylabels[Yall[,1]]


## 4. Appropriately labels the data set with descriptive variable names.
names(Sall) <- "subject"
names(Yall) <- "activity"

# Combine all data into one data frame
alldata <- cbind(Sall, Yall, Xall)

## 5. From the data set in step 4, creates a second, independent 
## tidy data set with the average of each variable for each activity 
## and each subject.

# Start at third column (after subject and activity) to the last column
meandata <- ddply(alldata, .(subject, activity), function(x) 
        colMeans(x[, 3:dim(alldata)[2]]))

# Create a new file for uploading
write.table(meandata, "meandata.txt", row.name=FALSE)
