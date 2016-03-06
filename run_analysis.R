setwd('C:\\Users\\Ruichen\\Desktop\\Coursera\\UCI HAR Dataset')

activity_label = read.table("activity_labels.txt")
features = read.table("features.txt")

train_X = read.table("train/X_train.txt")
train_Y = read.table("train/Y_train.txt")
train_subjectID = read.table("train/subject_train.txt")

test_X = read.table("test/X_test.txt")
test_Y = read.table("test/Y_test.txt")
test_subjectID = read.table("test/subject_test.txt")

## Task 1
all_X = rbind(train_X,test_X)
all_Y = as.vector(rbind(train_Y,test_Y))
all_subjectID = c(as.vector(train_subjectID[,1]),as.vector(test_subjectID[,1]))
#all_data = cbind(all_data_Y, all_data_X)

## Task 2
all_X[,c(grep("mean",features[,2]),grep("std",features[,2]))]
#features[c(grep("mean",features[,2]),grep("std",features[,2])),2]

## Task 3
all_activity = activity_label[all_Y[,1],2]

## Task 4
colnames(all_X) = features[,2]
#colnames(all_data) = c("activity",features[,2])

## Task 5
tidy_data = aggregate(all_X,by=list(all_activity,all_subjectID),mean)
colnames(tidy_data)[1:2] = c("activity","subjectID")