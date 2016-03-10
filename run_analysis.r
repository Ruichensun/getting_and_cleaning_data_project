#########BEGINS#############

setwd('C:\\Users\\Ruichen\\Desktop\\Coursera\\UCI HAR Dataset')

#Load activity labels and names of the features

activity_label = read.table("activity_labels.txt") #reads the activity label
features = read.table("features.txt") #reads the feature names

#Load training and test data

train_X = read.table("train/X_train.txt") #reads the training data
train_Y = read.table("train/Y_train.txt") #reads the training label
train_subjectID = read.table("train/subject_train.txt") #reads the subject ID in the training
test_X = read.table("test/X_test.txt") # reads the test data
test_Y = read.table("test/Y_test.txt") # reads the test label
test_subjectID = read.table("test/subject_test.txt") #reads the subject ID in the test



## Task 1: Merges the training and the test sets to create one data set.
all_X = rbind(train_X,test_X) #Merges training data with test data
all_Y = as.vector(rbind(train_Y,test_Y)) #Merges training activity labels with test activity labels 
all_subjectID = c(as.vector(train_subjectID[,1]),as.vector(test_subjectID[,1])) #Merges training subject ID with test subject IDs 
all_data = cbind(all_Y, all_subjectID,all_X) #Merges all the three previously-merged data to create one single dataset

column_vector<-c("activity_label","subjectID",as.vector(features[,2])) #Creates column names for the merged data file
colnames(all_data)=colname_vector #Puts the column names into the data

## Task 2: Extracts only the measurements on the mean and standard deviation for each measurement.

mean_and_std_data<-all_data[,c(grep("mean",names(all_data)),grep("std",names(all_data)))] #Extracts only the measurements from the columns that contains the words "mean" or "std"

## Task 3: Uses descriptive activity names to name the activities in the data set
all_activity = activity_label[all_Y[,1],2] #creates an vector that is the descriptive names for all the data in the all_data data.frame
all_data[[1]]<-all_activity #Uses the newly created descriptive name vector to replace the activity label, which was the first list of the all_data data frame

## Task 4: Appropriately labels the data set with descriptive variable names.
## I changed all the key words to its readable format
names(all_data)<-gsub("Acc","Accelerometer",names(all_data))
names(all_data)<-gsub("Gyro","Gyroscope",names(all_data))
names(all_data)<-gsub("tBody","Time_Body",names(all_data))
names(all_data)<-gsub("BodyBody","Body",names(all_data))
names(all_data)<-gsub("Mag","Magnitude",names(all_data))
names(all_data)<-gsub("tGravity","Time_Gravity",names(all_data))
names(all_data)<-gsub("-mean()","Mean_Value",names(all_data))
names(all_data)<-gsub("-std()","Standard_Deviation",names(all_data))
names(all_data)<-gsub("-freq()","Frequency",names(all_data))
names(all_data)<-gsub("fBody","Frequency_Body",names(all_data))
names(all_data)<-gsub("-mad()","Median_Absolute_Deviation ",names(all_data))

## Task 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data<-data.frame(all_data$activity_label,all_data$subjectID,all_data[,c(grep("Mean",names(all_data)))]) #Creates the tidy data set with required components
write.table(tidy_data,file="tidy_data.txt") #Writes a txt file

#########END#############