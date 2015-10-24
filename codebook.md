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
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
and extracted into the working directory of RStudio.

###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
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

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)