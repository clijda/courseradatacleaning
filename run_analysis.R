# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## read raw train and test data
X_train <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt", quote="\"")

## read subject and labels
subject_train <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", quote="\"")
y_train <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", quote="\"")
y_test <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt", quote="\"")
activity_labels <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt", quote="\"")
names(activity_labels)<-c("labelid","activitylabel")

## read features of the data
features <- read.table("~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/features.txt", quote="\"")
features<-as.vector(features[,2])
# remove all weird characters ("(",")","-",",") and make lower case
features<-gsub("\\(","",features)
features<-gsub("\\)","",features)
features<-gsub("\\-","",features)
features<-gsub("\\,","",features)
features<-tolower(features)

names(X_train)<-features
names(X_test)<-features

## merge subjects, labels with training and testing data
X_train$type<-"train"
X_train<-cbind(X_train,subject_train)
names(X_train)[length(X_train)]<-"subject"
X_train<-cbind(X_train,y_train)
names(X_train)[length(X_train)]<-"labelid"
X_train<-merge(X_train,activity_labels,by.x="labelid",by.y="labelid")

X_test$type<-"test"
X_test<-cbind(X_test,subject_test)
names(X_test)[length(X_test)]<-"subject"
X_test<-cbind(X_test,y_test)
names(X_test)[length(X_test)]<-"labelid"
X_test<-merge(X_test,activity_labels,by.x="labelid",by.y="labelid")


## merge training and testing data
Data<-rbind(X_train,X_test)

## define only the needed columns
meanfeatures<-grep("mean",names(Data))
stdfeatures<-grep("std",names(Data))
basicfeatures<-c(1,563:565)
cols<-c(meanfeatures,stdfeatures)

## create tidy dataset by subsetting
TidyData<-Data[,c(basicfeatures,cols)]

## melt Data based on needed columns
## Datamelt is the tidy dataset containing mean and std variables and values
## AvgData is the second dataset which contains averages of all measurements per subject and activity
library(reshape2)
DataMelt<-melt(Data,id.vars=basicfeatures,measure.vars=cols)
AvgData<-dcast(DataMelt,activitylabel+subject~variable,mean)

## write Datasets to csv files
write.csv(TidyData,"~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/TidyData1.csv")
write.csv(AvgData,"~/Coursera/Getting and Cleaning Data/UCI HAR Dataset/TidyData2.csv")
