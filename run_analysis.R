#Parts specific to Assignment Requirements Mentioned by Requirement Number 1-5

#Download & Unzip
if(!file.exists("data")){
        dir.create("data")
}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data/exercise_dataset.zip",method="curl")
unzip("./data/exercise_dataset.zip",overwrite=TRUE,exdir="./data/")
datalist<-list.files("./data/")
datadir<-paste0("./data/",datalist[2],"/")
list.files(datadir)
#Loading activity label key df
library(data.table)
activity_key<-read.table(paste0(datadir,"activity_labels.txt"))
view(activity_key)
names(activity_key)<-c("code","activity")
#loading feature label dfs - will become variable labels for training set
feature_key<-read.table(paste0(datadir,"features.txt"))
names(feature_key)<-c("number","feature")
##Tidy up activity and feature variables
activity_key$activity<-tolower(gsub("_","",activity_key$activity))
feature_key$feature<-gsub("[[:punct:]]","",feature_key$feature)

#Training data sets
##Loading sets
train_subject<-read.table(paste0(datadir,"train/subject_train.txt"))
train_activity_numeric<-read.table(paste0(datadir,"train/y_train.txt"))
train_values<-read.table(paste0(datadir,"train/X_train.txt"))
##Labelling subject vector and binding with value df
###Labeling the subject vector
names(train_subject)<-"subject"
###Binding subject to values vector
training_set<-cbind(train_subject,train_values)
##Adding activity labels to training set
###Number 3 (1/2): labeling the train labels vector
names(train_activity_numeric)<-"code"
library(dplyr)
train_activity<-right_join(activity_key,train_activity_numeric,by="code")
###binding activity labels to training set
training_set<-cbind(train_activity$activity,training_set)
colnames(training_set)[1]<-"activity"
###re-arrange so subject nr is first variable
training_set<-training_set[c(2,1,3:563)]
##Number 4(1/2): Labeling training set w/the variables with the feature key
colnames(training_set)[c(3:563)]<-feature_key$feature
##creating reading variable to show sequence each reading by subj and activity
subj_act<-data.table(paste0(training_set$subject,training_set$activity))
subj_act<-subj_act %>% group_by(V1) %>% mutate(reading = seq_along(V1))
training_set<-cbind(subj_act$reading,training_set)
training_set<-training_set[c(2,1,3:564)]
colnames(training_set)[2]<-"reading"

#Test Sets
##Loading sets
test_subject<-read.table(paste0(datadir,"test/subject_test.txt"))
test_activity_numeric<-read.table(paste0(datadir,"test/y_test.txt"))
test_values<-read.table(paste0(datadir,"test/X_test.txt"))
##Labelling subject vector and binding with value df
###Labeling the subject vector
names(test_subject)<-"subject"
###Binding subject to values vector
testing_set<-cbind(test_subject,test_values)
##Adding activity labels to testing set
###Number 3(2/2): labeling the test labels vector
names(test_activity_numeric)<-"code"
library(dplyr)
test_activity<-right_join(activity_key,test_activity_numeric,by="code")
###binding activity labels to testing set
testing_set<-cbind(test_activity$activity,testing_set)
colnames(testing_set)[1]<-"activity"
###re-arrange so subject nr is first variable
testing_set<-testing_set[c(2,1,3:563)]
##Number 4(2/2): Labeling testing set w/the variables with the feature key
colnames(testing_set)[c(3:563)]<-feature_key$feature
##creating reading variable to show sequence each reading by subj and activity
subj_act_test<-data.table(paste0(testing_set$subject,testing_set$activity))
subj_act_test<-subj_act_test %>% group_by(V1) %>% mutate(reading = seq_along(V1))
testing_set<-cbind(subj_act_test$reading,testing_set)
testing_set<-testing_set[c(2,1,3:564)]
colnames(testing_set)[2]<-"reading"

#Number 1: Merges the training and the test sets to create one data set.
tidy_set<-rbindlist(list(training_set,testing_set),use.names=TRUE)

#Number 2: Extracts only the measurements on the mean and standard deviation for each measurement.
tidy_set_final<-select(tidy_set,subject,reading,activity,contains("mean"),contains("std"))

#Number 5: 2nd tiny set for averages
second_tidy_set<-tidy_set_final %>%
        group_by(activity,subject) %>%
        summarise_each(funs(mean),4:89)
colnames(second_tidy_set)[3:88] <- paste0("Mean", colnames(second_tidy_set)[3:88])

#exporting 2nd file
write.table(second_tidy_set,"finaltidyset.txt",row.name=FALSE)