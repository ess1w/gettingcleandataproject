---
title: "Codebook for Getting and Cleaning Data Course Project"
author: "Daniel Chaytor"
date: "24 October 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project prepares a tidy data set from a set of experimental measurement data carried out on a group of 30 people. It involved merging training and test data, extracting specific variables, editing variable names and summarising the data to produce a tidy data set suitable for further analysis.

##Study design and data processing

###Collection of the raw data
The data for the project was collected from embedded accelerometer and gyroscope readings on Samsung Galaxy SII smartphones worn on the waist of the 30 volunteers. The project data was downloaded from the link
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
and extracted into the working directory of RStudio.

###Notes on the original (raw) data 
There was an error in some of the feature variable names, where the word "Body" was duplicated. In tidying up the variable names, I modified these by removing the duplicate word.

##Creating the tidy datafile

###Guide to create the tidy data file  
The steps taken to create the tidy file are as follows:  
1. Download the data and extract it to your working directory  
2. Change your working directory to the data folder by issuing the following command in RStudio:  
```{r, eval=FALSE}
setwd("UCI HAR Dataset/")
```
3. Run the script run_analysis.R in this directory  
4. Issue the following command to create the tidy data set file in your working directory:  
```{r, eval=FALSE}
write.table(summarisedset, file = "./twinhypeactdata.txt", quote = FALSE, row.names = FALSE)
```  

###Cleaning of the data
The script starts by reading in the training and test data measurements into two separate data frames, and reading the list of features from the features.txt file and assigning these as the column names of the two data frames.

It then reads the activity labels from the activity_labels.txt file. 

For each of the training and test data, it then
* reads the y data labels and merges them with the activity labels 
* reads the subject data and joins it to the dataframes 
* adds the activity labels to the dataframes

It then merges the training and test data sets and filters the columns of the combined dataset so that only those column names with mean() and std() functions remain. It also edits these variable names to make sure they are readable.

Finally, the script groups the data by activity and by subject and summarises by calculating the mean of each variable for each activity and subject.

The [README.md](https://github.com/twinhype/gettingcleandataproject/blob/master/README.md) file contains a detailed description of these steps.

##Description of the variables in the twinhypeactdata.txt file
The file contains a tidy set of 180 observations of 68 variables

Variable Name		| Description
--------------------| ----------------------------------------------------------------------	
activity			| The activity the volunteer performed while the measurements were taken
subject				| Represents the volunteer for whom the measurements were taken
tBodyAccmeanX		| Mean of body acceleration time domain signal, X axis
tBodyAccmeanY		| Mean of body acceleration time domain signal, Y axis
tBodyAccmeanZ		| Mean of body acceleration time domain signal, Z axis
tGravityAccmeanX	| Mean of gravity acceleration time domain signal, X axis
tGravityAccmeanY	| Mean of gravity acceleration time domain signal, Y axis
tGravityAccmeanZ	| Mean of gravity acceleration time domain signal, Z axis
tBodyAccJerkmeanX 	| Mean of body acceleration time domain jerk signal, X axis
tBodyAccJerkmeanY 	| Mean of body acceleration time domain jerk signal, Y axis
tBodyAccJerkmeanZ 	| Mean of body acceleration time domain jerk signal, Z axis
tBodyGyromeanX 		| Mean of body angular velocity time domain signal, X axis
tBodyGyromeanY 		| Mean of body angular velocity time domain signal, Y axis
tBodyGyromeanZ 		| Mean of body angular velocity time domain signal, Z axis
tBodyGyroJerkmeanX 	| Mean of body angular velocity time domain jerk signal, X axis
tBodyGyroJerkmeanY 	| Mean of body angular velocity time domain jerk signal, Y axis
tBodyGyroJerkmeanZ 	| Mean of body angular velocity time domain jerk signal, Z axis
tBodyAccMagmean 	| Mean of the magnitude of body acceleration time domain signals
tGravityAccMagmean 	| Mean of the magnitude of gravity acceleration time domain signals
tBodyAccJerkMagmean | Mean of the magnitude of body acceleration time domain jerk signals
tBodyGyroMagmean 	| Mean of the magnitude of body angular velocity time domain signals
tBodyGyroJerkMagmean| Mean of the magnitude of body angular velocity time domain jerk signals
fBodyAccmeanX 		| Mean of body acceleration frequency domain signal, X axis
fBodyAccmeanY 		| Mean of body acceleration frequency domain signal, Y axis
fBodyAccmeanZ 		| Mean of body acceleration frequency domain signal, Z axis
fBodyAccJerkmeanX 	| Mean of body acceleration frequency domain jerk signal, X axis
fBodyAccJerkmeanY 	| Mean of body acceleration frequency domain jerk signal, Y axis
fBodyAccJerkmeanZ 	| Mean of body acceleration frequency domain jerk signal, Z axis
fBodyGyromeanX 		| Mean of body angular velocity frequency domain signal, X axis
fBodyGyromeanY 		| Mean of body angular velocity frequency domain signal, Y axis
fBodyGyromeanZ 		| Mean of body angular velocity frequency domain signal, Z axis
fBodyAccMagmean		| Mean of the magnitude of body acceleration frequency domain signals
fBodyAccJerkMagmean	| Mean of the magnitude of body acceleration frequency domain jerk signals
fBodyGyroMagmean	| Mean of the magnitude of body angular velocity frequency domain signals
fBodyGyroJerkMagmean| Mean of the magnitude of body angular velocity frequency domain jerk signals
tBodyAccstdX		| Standard deviation of body acceleration time domain signal, X axis
tBodyAccstdY		| Standard deviation of body acceleration time domain signal, Y axis
tBodyAccstdZ		| Standard deviation of body acceleration time domain signal, Z axis
tGravityAccstdX		| Standard deviation of gravity acceleration time domain signal, X axis
tGravityAccstdY		| Standard deviation of gravity acceleration time domain signal, Y axis
tGravityAccstdZ		| Standard deviation of gravity acceleration time domain signal, Z axis
tBodyAccJerkstdX	| Standard deviation of body acceleration time domain jerk signal, X axis
tBodyAccJerkstdY	| Standard deviation of body acceleration time domain jerk signal, Y axis
tBodyAccJerkstdZ	| Standard deviation of body acceleration time domain jerk signal, Z axis
tBodyGyrostdX		| Standard deviation of body angular velocity time domain signal, X axis
tBodyGyrostdY		| Standard deviation of body angular velocity time domain signal, Y axis
tBodyGyrostdZ		| Standard deviation of body angular velocity time domain signal, Z axis
tBodyGyroJerkstdX	| Standard deviation of body angular velocity time domain jerk signal, X axis
tBodyGyroJerkstdY	| Standard deviation of body angular velocity time domain jerk signal, Y axis
tBodyGyroJerkstdZ	| Standard deviation of body angular velocity time domain jerk signal, Z axis
tBodyAccMagstd		| Standard deviation of the magnitude of body acceleration time domain signals
tGravityAccMagstd	| Standard deviation of the magnitude of gravity acceleration time domain signals
tBodyAccJerkMagst	| Standard deviation of the magnitude of body acceleration time domain jerk signals
tBodyGyroMagstd		| Standard deviation of the magnitude of body angular velocity time domain signals
tBodyGyroJerkMagstd	| Standard deviation of the magnitude of body angular velocity time domain jerk signals
fBodyAccstdX		| Standard deviation of body acceleration frequency domain signal, X axis
fBodyAccstdY		| Standard deviation of body acceleration frequency domain signal, Y axis
fBodyAccstdZ		| Standard deviation of body acceleration frequency domain signal, Z axis
fBodyAccJerkstdX	| Standard deviation of body acceleration frequency domain jerk signal, X axis
fBodyAccJerkstdY	| Standard deviation of body acceleration frequency domain jerk signal, Y axis
fBodyAccJerkstdZ	| Standard deviation of body acceleration frequency domain jerk signal, Z axis
fBodyGyrostdX		| Standard deviation of body angular velocity frequency domain signal, X axis
fBodyGyrostdY		| Standard deviation of body angular velocity frequency domain signal, Y axis
fBodyGyrostdZ		| Standard deviation of body angular velocity frequency domain signal, Z axis
fBodyAccMagstd		| Standard deviation of the magnitude of body acceleration frequency domain signals
fBodyAccJerkMagstd	| Standard deviation of the magnitude of body acceleration frequency domain jerk signals
fBodyGyroMagstd		| Standard deviation of the magnitude of body angular velocity frequency domain signals
fBodyGyroJerkMagstd	| Standard deviation of the magnitude of body angular velocity frequency domain jerk signals


###Variable descriptions
Each value in the tidy data set represents the average of the respective variable for each activity and each subject.

####Class of the variable
Each variable is numeric.

####Unit of measurement 
The values are all averages and therefore have no unit of measurement.


##Sources
Human Activity Recognition Using Smartphones Dataset ReadMe file

