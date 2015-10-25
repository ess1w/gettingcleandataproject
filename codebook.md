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
setwd("UCI HAR Dataset/")
3. Run the script run_analysis.R in this directory
4. Issue the following command to create the tidy data set file in your working directory:
write.table(summarisedset, file = "./twinhypeactdata.txt", quote = FALSE, row.names = FALSE)

###Cleaning of the data
The script starts by reading in the training and test data measurements into two separate data frames, and reading the list of features from the features.txt file and assigning these as the column names of the two data frames.

It then reads the activity labels from the activity_labels.txt file. 

For each of the training and test data, it then
* reads the y data labels and merges them with the activity labels 
* reads the subject data and joins it to the dataframes 
* adds the activity labels to the dataframes

It then merges the training and test data sets and filters the columns of the combined dataset so that only those column names with mean() and std() functions remain. It also edits these variable names to make sure they are readable.

Finally, the script groups the data by activity and by subject and summarises by calculating the mean of each varible for each activity and subject.

The README.md file contains a detailed description of these steps.

##Description of the variables in the twinhypeactdata.txt file
The file contains a tidy set of 180 observations of 68 variables
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)