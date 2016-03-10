This codebook explains the variables, data, and any other related information of the run_analysis.R file.

The original data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You can use 7-zip software to unzip it, or run the unzip function in R.

activity_label: the activity label
features: the feature names
train_X: the training data
train_Y: the training label
train_subjectID: the subject ID in the training
test_X: the test data
test_Y: the test label
test_subjectID: the subject ID in the test
all_X: combined data of training and test
all_Y: combined activity labels of training and test
all_subjectID: combined subject ID of training and test
all_data: combined data of all_X,all_subjectID, and all_Y
column_vector: column names for all_data
mean_and_std_data:the all_data's subset containing only the mean and standard deviation info.
all_activity: the descriptive activity names for all the measurements from all subjects
tidy_data: final tidy data containing the average of each variable for each activity and each subject.