#This Readme details the procedures for the Getting & Cleaning Data Week 4 project
<<<<<<< HEAD

The Script uses the data found here and saves it in ./data.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R first assigns subject ID, found in subject_train.txt and subject_text.txt, to the observations in train.txt and test.txt, respectively. 

Activity id, provided in y_train.txt and y_test.txt, are converted to their respectable human-readable forms, based on activity_labels.txt.

Activity labels are then assigned to observations in train.txt and test.txt.

Although not needed, the script assigns an observation id to each observation per activity for each subject.

The test and train sets are then combined, by appending test to data.

Then the columns are filtered to only include mean & std deviation variables. The dataframe is stored as "tidy_set_final".

Lastly, the second set is computed and stored as a separate dataframe called "second_tidy_set"
=======
###
###The Script uses the data found here and saves it in ./data.
###https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###
###run_analysis.R first assigns subject ID, found in subject_train.txt and subject_text.txt, to the observations in train.txt and test.txt, respectively. 
###Activity id, provided in y_train.txt and y_test.txt, are converted to their respectable human-readable forms, based on activity_labels.txt.
###Activity labels are then assigned to observations in train.txt and test.txt.
###Although not needed, the script assigns an observation id to each observation per activity for each subject.

>>>>>>> 62c189ead86ac34a0725587ed848908b24653aa6
