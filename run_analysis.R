library(reshape2)

##Load the subject details, Subject has details of person doing the exp
s_train <- read.table(".\\train\\subject_train.txt")
s_test <- read.table(".\\test\\subject_test.txt")

## set_train contains the measurements of each exp
set_train <- read.table(".\\train\\X_train.txt")

##lbl_train contain the label of each exp
lbl_train <- read.table(".\\train\\y_train.txt")

## set_test contains the measurements of each exp
set_test <- read.table(".\\test\\X_test.txt")

## lbl_test contain the label of each exp
lbl_test <- read.table(".\\test\\y_test.txt")

##Set Column name for Subject
names(s_train) <- "Subject"
names(s_test) <- "Subject"

##Set Column name for Activity
names(lbl_train) <- "ActivityLabel"
names(lbl_test) <- "ActivityLabel"

##Set Column name for the measurements set
features <- read.table ("features.txt")
names(set_train)<-features$V2
names(set_test)<-features$V2


## Merges the Train and Test Data
merged_Data <- rbind(cbind(s_train,lbl_train,set_train),cbind(s_test,lbl_test,set_test))

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
colInd <- grep("mean\\(\\)|std\\(\\)",names(merged_Data))
colInd <- c(1:2,colInd)

mean_std <- merged_Data[,colInd]

##3.Uses descriptive activity names to name the activities in the data set
mean_std[,2]<- factor(mean_std[,2], labels=c("Walking",
    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create the tidy data set, measure.vars will be all the measured variables so no need to specify
melted <- melt(mean_std, id=c("Subject","ActivityLabel"))
tidy <- dcast(melted, Subject+ActivityLabel ~ variable, mean)

# write the tidy data set to a file
write.table(tidy, "tidy.txt", row.names=FALSE)


