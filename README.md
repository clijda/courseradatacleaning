coursera data cleaning
====================

this repo stores everything relatied to the project task on "Getting and cleaning data"

explains how all of the scripts work and how they are connected

## explaining the script: run_analysis.R

* Reading data
  - the script starts by reading the 2 datasets (X_train and X_test)
  - Also the corresponding activity and subject datasets are read (Y_train, Y_test, subject_train, subject_test)
  - Finally some help files are read (activity_labels, features)
* Modifying column names for the 2 datasets
  - the features list is made more tidy by removing special characters and putting everything lower case
  - the modified features list is assigned as names for the 2 datasets
* Merging data
  - merge subjects, activity labels and activity descriptions with the train and test datasets
  - merge training and testing datasets
* Subset data to only keep the Mean and Std features
* Create dataset that collects the averages of all features per subject and activity
* Write the 2 resulting datasets (TidyData & AvgData) to csv files


