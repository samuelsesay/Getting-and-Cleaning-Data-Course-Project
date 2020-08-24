## packages to load
library(reshape2)

setwd("/Users/mac/Desktop/UCI HAR Dataset")
list("/Users/mac/Desktop/UCI HAR Dataset")

# read in data 
features <- read.table("/Users/mac/Desktop/UCI HAR Dataset/features.txt")
activity <- read.table("/Users/mac/Desktop/UCI HAR Dataset/activity_labels.txt")


# read train data

# features data
train <- read.table("/Users/mac/Desktop/UCI HAR Dataset/train/X_train.txt")

## For Step 4
colnames(train) <- features$V2 

# activity labels
y_train <- read.table("/Users/mac/Desktop/UCI HAR Dataset/train/y_train.txt")
train$activity <- y_train$V1

# subjects
subject_train <- read.table("/Users/mac/Desktop/UCI HAR Dataset/subject_train.txt") 
train$subject <- factor(subject_train$V1)

# read  test data 
test <- read.table("/Users/mac/Desktop/UCI HAR Dataset/X_test.txt")
colnames(test) <- features$V2

y_test <- read.table("/UCI HAR Dataset/test/y_test.txt") 
test$activity <- y_test$V1

subject_test <- read.table("/UCI HAR Dataset/test/subject_test.txt")
test$subject <- factor(subject_test$V1)

## STEP 1
# merge train and test sets
dataset <- rbind(test, train) 

## STEP 2
# filter column names
column.names <- colnames(dataset)

# get only columns for standard deviation 
# and mean values, saves activity and subject values 
column.names.filtered <- 
    grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)

dataset.filtered <- dataset[, column.names.filtered] 

## STEP 3
# add descriptive values for activity labels 
dataset.filtered$activitylabel <- 
    factor(dataset.filtered$activity, 
           labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                     "SITTING", "STANDING", "LAYING"))


# create tidy dataset with mean values for subject and activity
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)

dataset.melt <-melt(dataset.filtered, 
                    id = c('activitylabel', 'subject'), 
                    measure.vars = features.colnames)

dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)

# create tidy dataset file  
write.table(dataset.tidy, file = "tidydataset.txt", row.names = FALSE)
