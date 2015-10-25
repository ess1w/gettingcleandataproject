# Course project submission Readme
This file describes how the script for the course project in Getting and Cleaning Data works.

## Unpacking the files
The data for this project is contained in 8 text files. The files are all contained in the folder "UCI HAR Dataset", so this folder should be extracted into your working directory. You should then change your working directory to this folder with the command:  
```{r, eval=FALSE}
setwd("UCI HAR Dataset/")
```  

## run_analysis.R
The script starts by reading in the training and test data measurements into two variables, xtrain and xtest.

Next, it reads the list of features from the features.txt file and assigns these as the column names of the xtrain and xtest data frames.

It then reads the activity labels from the activity_labels.txt file. 

For each of the training and test data, it then
* reads the y data labels
* merges the y data labels with the activity labels using the y label as an index
* reads the subject data
* joins the subject data to the x measurement dataframe using cbind
* adds the activity labels to the x measurement dataframe using cbind
* renames the first column to "activity"

The next transformation merges the training and test data sets using rbind.

It then filters the columns of the combined dataset using the grepl function and subsetting, so that only those column names with mean() and std() functions remain. This will select 66 variables from the combined dataset that contained mean and standard deviation measurements. Variables containing meanFreq(), like fBodyAccMag-meanFreq(), were not selected as they are means of frequency componenets.

Next, the script edits the variable names to make sure they are readable, while ensuring the names can be easily matched with the original feature variables. Significantly, it ensures the principles of tidy data are adhered to by removing dashes, parentheses and commas, so that the variable names read the same after writing the data to a file and reading them in again. This link contains a discussion of what constitutes tidy data:

[Link to David Hood's blog](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/)

It also corrects an error in some of the variable names that have the word "Body" repeated, removing the duplicate word.

Finally, the script groups the data by activity and by subject (using the group_by function), and summarises by calculating the mean of each varible for each activity and subject, using the summarise_each function.

It generates a tidy data set that meets the principles of tidy data as described in the link above.

## Reading in the tidy data output
The tidy data output can be read by copying the file into your working directory and issuing the following command:  
```{r, eval=FALSE}
output <- read.table("./twinhypeactdata.txt", header = TRUE)
```
