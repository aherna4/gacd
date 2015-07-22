# In this script, we clean the Human Activity Recognition Using Smartphones
# dataset by: 
# 1. Merging the training and test data.
# 2. Extracting the mean and standard deviations measurements. 
# 3. Replace the activity values with descriptive names.
# 4. Appropriately label the data with descriptive variable names.
# 5. Finally, create a tidy dataset with the average of each variable for
#    each activity and each subject.
# Though, not necesarily in this order.

# Data download -----------------------------------------------------
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(file_url, temp, method = "auto")
unzip(temp)
unlink(temp)

# First, we read in the files that contain the activity labels and the 
# feature descriptions.
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # 6 X 2, col 2
features <- read.table("./UCI HAR Dataset/features.txt") # 561 X 2, col 2
features <- as.character(features[, 2])
features <- gsub('mean', 'Mean', features) # cleans up some of the names
features <- gsub('std', 'Std', features) # cleans up some of the names
features <- gsub('[-()]', '', features) # cleans up some of the names
features <- make.names(features, unique = TRUE) # need this because ...
# there are repeated column names and that gives an error when I try to use dplyr later.

# Next, we read the training data. ----------------------------------
train <- read.table("./UCI HAR Dataset/train/X_train.txt") # 7352 X 561
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "Subject") # 7352
activity_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = "Activity") # 7352
# We then label the training data columns and 
# replace the activities with more descriptive names.
names(train) <- features
activity_train$Activity <- factor(activity_train$Activity, activity_labels[, 1], activity_labels[,2])
train <- cbind(subject_train, activity_train, train)

# Now, we put the test data together. -------------------------------
test <- read.table("./UCI HAR Dataset/test/X_test.txt") # 2947 X 561
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "Subject") # 2947
activity_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = "Activity") # 2947
# Again, we label the columns and replace the 
# activity values with more descriptive names.
names(test) <- features
activity_test$Activity <- factor(activity_test$Activity, activity_labels[, 1], activity_labels[,2])
test <- cbind(subject_test, activity_test, test)

# Finally, we merge the training and testing data. ------------------
complete <- rbind(train, test)

# Now, as instructed, we take the Activity, Subject, mean and std columns.
library(dplyr)
relevant_data <- complete %>% select(Subject, Activity, contains("mean"), contains("std"))

# Using this data, we create the tidy data set with the average of each
# variable for each activity and each subject.
library(reshape2)
long_form <- melt(relevant_data, id = c("Subject", "Activity")) # 885714 X 4
tidy_data <- dcast(long_form, Subject + Activity ~ variable, mean) # 180 X 88

# And we create the tidy_data.txt file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)
