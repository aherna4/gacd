# Tidy Data Codebook

## The data:
The original UCI HAR data contains 561 measurements collected from smart phone accelerometers of 30 Subjects during 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING). From this data, we extracted only the measurements that included the mean and standard deviation for each measurement.

## The variables:
Our tidy data contains 180 observations on 88 variables. Each observation contains the mean of each variable for each subject and activity. So, for example, the first observation has Subject 1's mean for each measurement for the WALKING activity; the second observation has Subject 1's mean for each measurement for the WALKING UPSTAIRS activity, and so on. The variables of the tidy dataset are as follows:

	Subject 
	Activity 
	tBodyAccMeanX
	tBodyAccMeanY 
	tBodyAccMeanZ 
	tGravityAccMeanX 
	tGravityAccMeanY 
	tGravityAccMeanZ 
	tBodyAccJerkMeanX 
	tBodyAccJerkMeanY 
	tBodyAccJerkMeanZ 
	tBodyGyroMeanX 
	tBodyGyroMeanY 
	tBodyGyroMeanZ 
	tBodyGyroJerkMeanX 
	tBodyGyroJerkMeanY 
	tBodyGyroJerkMeanZ 
	tBodyAccMagMean 
	tGravityAccMagMean 
	tBodyAccJerkMagMean 
	tBodyGyroMagMean 
	tBodyGyroJerkMagMean 
	fBodyAccMeanX 
	fBodyAccMeanY 
	fBodyAccMeanZ 
	fBodyAccMeanFreqX 
	fBodyAccMeanFreqY 
	fBodyAccMeanFreqZ 
	fBodyAccJerkMeanX 
	fBodyAccJerkMeanY 
	fBodyAccJerkMeanZ 
	fBodyAccJerkMeanFreqX 
	fBodyAccJerkMeanFreqY 
	fBodyAccJerkMeanFreqZ 
	fBodyGyroMeanX 
	fBodyGyroMeanY 
	fBodyGyroMeanZ 
	fBodyGyroMeanFreqX 
	fBodyGyroMeanFreqY 
	fBodyGyroMeanFreqZ 
	fBodyAccMagMean 
	fBodyAccMagMeanFreq 
	fBodyBodyAccJerkMagMean 
	fBodyBodyAccJerkMagMeanFreq 
	fBodyBodyGyroMagMean 
	fBodyBodyGyroMagMeanFreq 
	fBodyBodyGyroJerkMagMean 
	fBodyBodyGyroJerkMagMeanFreq 
	angletBodyAccMean.gravity 
	angletBodyAccJerkMean.gravityMean 
	angletBodyGyroMean.gravityMean 
	angletBodyGyroJerkMean.gravityMean 
	angleX.gravityMean 
	angleY.gravityMean 
	angleZ.gravityMean 
	tBodyAccStdX 
	tBodyAccStdY 
	tBodyAccStdZ 
	tGravityAccStdX 
	tGravityAccStdY 
	tGravityAccStdZ 
	tBodyAccJerkStdX 
	tBodyAccJerkStdY 
	tBodyAccJerkStdZ 
	tBodyGyroStdX 
	tBodyGyroStdY 
	tBodyGyroStdZ 
	tBodyGyroJerkStdX 
	tBodyGyroJerkStdY 
	tBodyGyroJerkStdZ 
	tBodyAccMagStd 
	tGravityAccMagStd 
	tBodyAccJerkMagStd 
	tBodyGyroMagStd 
	tBodyGyroJerkMagStd 
	fBodyAccStdX 
	fBodyAccStdY 
	fBodyAccStdZ 
	fBodyAccJerkStdX 
	fBodyAccJerkStdY 
	fBodyAccJerkStdZ 
	fBodyGyroStdX 
	fBodyGyroStdY 
	fBodyGyroStdZ 
	fBodyAccMagStd 
	fBodyBodyAccJerkMagStd 
	fBodyBodyGyroMagStd 
	fBodyBodyGyroJerkMagStd 

## Transformations/work done to clean up the data.
First, the names of the variables were cleaned up. The original names made use of a lot of underscores and parenthesis, so we removed to make the names more compact and easier to read. We also recoded the Activity values (which were numeric) with the actual activity names (i.e. we replaced values 1-6 with WALKING, WALKING_UPSTAIRS, etc).

Second, once we labelled and recoded the values, we merged the training and testing data sets. From here we used the dplyr package to extract the columns that contained the means and standard deviations.

Finally, we used the reshape2 package to find the mean of all the variables for each subject and activity.

The code can be found in the run_analysis.R script.

## Why is this data considered tidy?
Well, because it adheres to the definition of tidy data:

1. Each variable forms a column. (Every variable has its own column)
2. Each observation forms a row. (Each row contains the mean of the variables for a specific Subject and Activity)
3. Each table, file stores data about one kind of observation. (This file contains all the data specified by the project description)
