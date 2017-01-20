# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# Source of data used in the below files https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##########################################################################################################

setwd("C:\Users\AKilany1\Documents\Coursera\UCI HAR Dataset")

#Check if All Mandatory input Files existed First 
# IF any file not existing Exiting program with and error
#########################################################################################################
if (!(file.exists("activity_labels.txt")) &
  (file.exists("features.txt")) &
  (file.exists("train\\X_train.txt"))&
  (file.exists("train\\Y_train.txt"))&
  (file.exists("train\\subject_train.txt"))&
  (file.exists("test\\X_test.txt"))&
  (file.exists("test\\Y_test.txt"))&
  (file.exists("test\\subject_test.txt")))
{
    print("Mandatory Files not complete!")
  return()
}
  
  
#Cleanse the Activity Labels by switching to characters and Upper 
#Adding Descriptive Column Names to the dataset
#########################################################################################################
activityLabels <- read.table("activity_labels.txt")
activityLabels[,2]<-as.character(toupper(activityLabels[,2]))
colnames(activityLabels)  = c('activityId','activityType');


#Cleanse the featuresDetails by switching to characters and Upper
#Getting Mean & STD attributes only
#Removing un-needed attributes of the Attributes names.
#########################################################################################################
featuresDetails <- read.table("features.txt")
featuresDetails[,2]<-as.character(toupper(featuresDetails[,2]))
featuresInterest <- grep(".*MEAN.*|.*STD.*", featuresDetails[,2])
featuresInterest.Names <- featuresDetails[featuresInterest,2]
featuresInterest.Names <- gsub('[-(),]', '', featuresInterest.Names)

#Collecting of Interest Columns of the Training DataSet
#Binding the three files to create Training DataSet
#########################################################################################################
xTrain <- read.table("train\\X_train.txt")[featuresInterest]
yTrain <- read.table("train\\Y_train.txt")
subjectTrain <- read.table("train\\subject_train.txt")
trainSet<- cbind(xTrain,yTrain,subjectTrain)

#Collecting of Interest Columns of the Test DataSet
#Binding the three files to create Test DataSet
#########################################################################################################
xTest <- read.table("test\\X_test.txt")[featuresInterest]
yTest <- read.table("test\\Y_test.txt")
subjectTest <- read.table("test\\subject_test.txt")
testSet <- cbind(xTest, yTest, subjectTest)


#Binding the Training Set & Test Set to create the Full DataSet
#########################################################################################################
allDataSet<-rbind(trainSet, testSet)

#Cleansing the data Set to be descriptive
#Adding Mean Aggregation required to the All DataSet requested.
#Adding Activty Description to the Final DataSet
#########################################################################################################
colnames(allDataSet) <- c(featuresInterest.Names,"activityId", "subjectId")

tidyDataSet  = aggregate(allDataSet[,names(allDataSet) != c('activityId','subjectId')],by=list(activityId=allDataSet$activityId,subjectId = allDataSet$subjectId),mean);

tidyDataSet<-merge(tidyDataSet,activityLabels,by='activityId',all.x=TRUE);

#Dumping DataSet to File.
#########################################################################################################
write.table(tidyDataSet, './tidyData.txt',row.names=TRUE,sep='\t')
