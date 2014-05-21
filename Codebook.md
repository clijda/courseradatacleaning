## Codebook
describes the variables, the data, and any transformations or work that you performed to clean up the data

### description of variables in TidyData (TidyData1.csv)
* labelid: 1 to 6, corresponding to the activity
* subject: 1 to 30, identifier of the subject who carried out the experiment
* activitylabel: char, descriptive field for the activity
* type = train or test, depending whether data where collected from training or testing data set
* mean and std features of
  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag
  - angle variables

All transformations are generally described in the README.md file as well as in the run_analysis.R script itself.

### description of variables in AvgData (TidyData2.csv)
* activitylabel: as in TidyData
* subject: as in TidyData
* features as in TidyData: but only the average value per activity and subject

