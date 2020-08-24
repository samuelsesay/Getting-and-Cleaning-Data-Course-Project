#This is the code book for the project

##How to get to the tinyData.txt:

Download data from the link below and unzip it into working directory of R Studio.
Execute the R script.
About the source data

The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script

File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):

Reading in the files and merging the training and the test sets to create one data set.
1.1 Reading files
1.1.1 Reading trainings tables
1.1.2 Reading testing tables
1.1.3 Reading feature vector
1.1.4 Reading activity labels
1.2 Assigning variable names
1.3 Merging all data in one set
Extracting only the measurements on the mean and standard deviation for each measurement
2.1 Reading variable names
2.2 Create vector for defining ID, mean and standard deviation
2.3 Making nessesary subset from merged data set
Using descriptive activity names to name the activities in the data set
Appropriately labeling the data set with descriptive variable names
Creating a second, independent tidy data set with the average of each variable for each activity and each subject
5.1 Making second tidy data set
5.2 Writing second tidy data set in txt file
The code assumes all the data is present in the same folder, un-compressed and without names altered.
Initial data for research

Data taken from UCI HAR Dataset.

Dataset contains following variables:

subject - ID of participant
activity - ID of activity type
Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used)
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
Features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

CodeBook

Following data transformations were conducted to tidy dataset:

Added a new feature activitylabel - factor variable for activities with the following levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

Tidy dataset was build as a mean values of features grouped by activitylabel and subject - for each subject and activity type determined mean values over all activities of that type.
