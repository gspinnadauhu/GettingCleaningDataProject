#Download & Unzip
if(!file.exists("data")){
        dir.create("data")
}
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="./data/exercise_dataset.zip",method="curl")
unzip("./data/exercise_dataset.zip",overwrite=TRUE,exdir="./data/")