library(reshape2)


##Download the zipfile
filename <- "coursera_mod3"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#download all variables
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt")
features = read.table("UCI HAR Dataset/features.txt")

subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
X_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
X_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")


#Extract the Mean and Std only
index = grep(".*mean.*|.*std.*", features[,2])
features_names = features[index,2,drop=FALSE]

#Merge Train and Test Data

X_train_subset = X_train[,index]
X_test_subset = X_test[,index]

train = cbind(subject_train,y_train,X_train_subset)
test = cbind(subject_test,y_test,X_test_subset)
fulldata = rbind(train,test)

#Add descriptive variable names 
colnames(fulldata) = c("subject","activity",t(features_names))

#Add Activity Labels
labels = match(fulldata$activity,activity_labels$V1)
fulldata$activity = activity_labels[labels,2,drop = TRUE]

#Melt by Activity
fulldata_subject = melt(fulldata,id.vars = c("subject","activity"),measure.vars = t(features_names))
fulldata_mean = dcast(fulldata_subject,subject + activity ~ variable, mean)

write.table(fulldata_mean,"fulldata_mean.txt",row.names = FALSE)
