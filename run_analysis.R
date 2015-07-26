# setwd to to UCI HAR Dataset

library(plyr)

# Step1
# Merges the training and the test to create one data set.

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

#merging and creating x data set 
x_data <- rbind(x_train, x_test)

#merging and creating y data set
y_data <- rbind(y_train, y_test)

#merging and creating 'subject' data set
subject_data <- rbind(subject_test, subject_train)

#Step 2 
# Extract the measurements on teh mean and std deviation

features <- read.table("features.txt")
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

#subset the columns
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

#Step 3
#Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

#update values with correct activity name
y_data[, 1] <- activities[y_data[, 1], 2]

#correct column name
names(y_data) <- "activity"

#Step 4, Appropriately label the data set with descriptive variable names

names(subject_data) <- "subject"

#bind all data in a single set
all_data <- cbind(x_data, y_data, subject_data)

#Step 5 is to create  a second, independent tidy data set with the average of each variable

tidydata <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidydata, "tidydata.txt", row.name=FALSE)
