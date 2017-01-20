---
title: "CodeBook"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown
## Getting and Cleaning Data Project
 
Owner:Ahmed Kilany
 
### Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

 More Information available in the course project for the Johns Hopkins Getting and Cleaning Data course.
 
### Source Data
 A full description of the data used in this project can be found at (http://archive.ics.uci.edu/ml/datasets/HumanActivityRecognitionUsingSmartphones)
 
 The source data for this project ->(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 
### Objective of Code 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
### Attribute Information
 For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Code Variable Descriptions
#####activityLabels 
-Activity Labels Dataset
-Holding information on the Activity Description loaded from activity_labels.txt file.
#####featuresDetails 
-Feature Details Dataset 
-Holding information of the Feature Details Descriptions loaded from features.txt
#####featuresInterest 
-Of interest MEAN & STD DataSet 
-Holding the of interest MEAN & STD from the Features Details.
#####xTrain 
-Training X DataSet
-Holding the information retreived from X_train.txt
#####yTrain 
-Training Y DataSet
-Holding the information retreived from Y_train.txt
#####subjectTrain 
-Training Subjects DataSet
-Holding the information retreived from subject_train.txt
#####trainSet 
-The Complete Training Data Set
Holding the information of xTrain ,YTrain , subjectTrain
#####xTest 
-Test X DataSet
-Holding the information retreived from X_test.txt
#####yTest 
-Test Y DataSet
-Holding the information retreived from Y_test.txt
#####subjectTrain 
-Training Subjects DataSet
-Holding the information retreived from subject_test.txt
#####testSet 
-The Complete Test Data Set
-Holding the information of xTest ,YTest , subjectTest
#####allDataSet
-Consolidated data set 
Holding the complete data set consolidating Training & Test information.
####tidyDataSet
Cleansed Mean DataSet
