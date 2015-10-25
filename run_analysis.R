## Read in data from text files
## Start with the training data
## First, read x training data and x test data
xtrain <- read.table("./train/X_train.txt", colClasses = "numeric")
xtest <- read.table("./test/X_test.txt", colClasses = "numeric")

## Next, get column names from features.txt
columns <- read.table("./features.txt", colClasses = "character")
## Set column names
colnames(xtrain) <- columns$V2
colnames(xtest) <- columns$V2

## get activity labels
actlabels <- read.table("activity_labels.txt", col.names = c("id", "activity"))

## Read y train labels
ytrain <- read.table("./train/y_train.txt", col.names = c("id"))
## Merge with activity labels to get activity names
ytrain$label <- as.factor(actlabels$activity[ytrain$id])

## Read training subject data
subjecttrain <- read.table("./train/subject_train.txt", col.names = c("subject"))
## join subjects to training data columns
xtrain2 <- cbind(subjecttrain, xtrain)
## join activity labels to training data columns
xtrain3 <- cbind(ytrain$label, xtrain2)
colnames(xtrain3)[1] <- "activity"

## Read y test labels
ytest <- read.table("./test/y_test.txt", col.names = c("id"))
## Merge with activity labels to get activity names
ytest$label <- as.factor(actlabels$activity[ytest$id])

## Read test subject data
subjecttest <- read.table("./test/subject_test.txt", col.names = c("subject"))
## join subjects to test data columns
xtest2 <- cbind(subjecttest, xtest)
## join activity labels to test data columns
xtest3 <- cbind(ytest$label, xtest2)
colnames(xtest3)[1] <- "activity"

## Merge training and test data
traintest <- rbind(xtrain3, xtest3)

## extract mean and stddev variables
actsub <- traintest[,1:2]
meanstdtraintest <- traintest[, union(grep("mean()", colnames(traintest)[3:563], fixed = TRUE, value = TRUE),grep("std()", colnames(traintest)[3:563], fixed = TRUE, value = TRUE))]
meanstdtraintest <- cbind(actsub, meanstdtraintest)

## edit variable names 
newcols <- gsub("BodyBody", "Body", colnames(meanstdtraintest))
newcols <- gsub("\\()|\\(|\\)|-", "", newcols)
newcols <- gsub(",", "and", newcols)
colnames(meanstdtraintest)<-newcols

## group by activity and subject
groupedset <- group_by(meanstdtraintest, activity, subject)
## summarise - get average of each variable by activity and by subject
summarisedset <- summarise_each(groupedset, funs(mean))
