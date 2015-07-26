#Introduction

The script run_analysis.R performs the 5 steps described in the course project's definition.

- All the similar data is merged using the rbind() function. 
- address those files having the same number of columns and referring to the same entities.
- Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
- As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
- For whole dataset, those columns with vague column names are corrected.
- Finally, generate a new dataset with all the average measures for each subject and activity type. 

# Variables Information 

Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt
Assign column names and merge to create one data set.

Section 2. Extract only the measurements on the mean and standard deviation for each measurement.
columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

Section 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activity table to conclude the descriptive activity names

Section 4. Appropriately label the data set with descriptive activity names.
A similar approach is taken with activity names through the activities variable.

Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
As per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject
