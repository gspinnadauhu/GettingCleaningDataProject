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
#Loading column label key df
library(data.table)
label_key<-read.table(paste0(datadir,"activity_labels.txt"))
view(label_key)
names(label_key)<-c("code","label")
##Tidy up label names
label_key$label<-gsub("_","",label_key$label)
#Training data sets
##Loading sets
train_subject<-read.table(paste0(datadir,"train/subject_train.txt"))
train_labels_numeric<-read.table(paste0(datadir,"train/y_train.txt"))
train_values<-read.table(paste0(datadir,"train/X_train.txt"))
##Labelling subject vector and combining binding with value df
###Labeling the subject vector
names(train_subject)<-c("subject")
###Binding to values vector
training_set<-cbind(train_subject,train_values)
##Matching training label codes with names




