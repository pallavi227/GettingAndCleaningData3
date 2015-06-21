#Code Book

##This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

#Overview

##30 volunteers performed 6 different activities while wearing a smartphone 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING. 
The smartphone captured various data about their movements.


#Explanation of each file

###features.txt: Names of the 561 features.
###activity_labels.txt: Names and IDs for each of the 6 activities.

###X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers(70%).

###Subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
###y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

###X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

###subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
###y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

More information about the files is available in README.txt. More information about the features is available in features_info.txt.

Processing steps
1) Read Subject, Test/Train Labels and measurments into appropriate data tables.

2) Give Meaningful column names to the Data table.

3) Get Measurement Feature details from the features.txt file and assign column names to the measurements.

4) Merge the Train & Test data into a single data table.

5) Extract Columns containing only mean or std data.

6) Assign descriptive Activity Labels to the Data set, eg set 1 to Walking

7) Melt the data set using ids, subject and activity label

8) use dcast to find the mean of the data based on subject and activity Label.

9) write the result into tidy.txt

