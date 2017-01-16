#This Readme details the procedures for the Getting & Cleaning Data Week 4 project
#
#The Script uses the data found here and saves it in ./data.
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#run_analysis.R first assigns subject ID, found in subject_train.txt and subject_text.txt, to the observations in train.txt and test.txt, respectively. 
#Activity id, provided in y_train.txt and y_test.txt, are converted to their respectable human-readable forms, based on activity_labels.txt.
#Activity labels are then assigned to observations in train.txt and test.txt.
#Although not needed, the script assigns an observation id to each observation per activity for each subject.

