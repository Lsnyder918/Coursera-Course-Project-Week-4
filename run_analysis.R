
##reads the data

features <- read.csv("./data/UCIDataset/features.txt", header = FALSE, sep = " ")
features <- as.character(features[,2])

train_x <- read.table("./data/UCIDataset/train/X_train.txt")
train_activity <- read.csv("./data/UCIDataset/train/y_train.txt", header = FALSE, sep = " ")
train_subject <- read.csv("./data/UCIDataset/train/subject_train.txt", header = FALSE, sep = " ")

train <- data.frame(train_subject, train_activity, train_x)
names(train) <- c(c("subject", "activity"), features)

test_x <- read.table('./data/UCIDataset/test/X_test.txt')
test_activity <- read.csv('./data/UCIDataset/test/y_test.txt', header = FALSE, sep = ' ')
test_subject <- read.csv('./data/UCIDataset/test/subject_test.txt', header = FALSE, sep = ' ')

test <- data.frame(test_subject, test_activity, test_x)
names(test) <- c(c('subject', 'activity'), features)

##binds the data into one data set

data <- rbind(train, test)

## finds the mean and standard deviation for each measurement

mean_std <- grep("mean|std", features)
msdata <- data[ ,c(1,2,mean_std + 2)]

##Use activity names to name the activities in the dataset

activity_labels <- read.table('./data/UCIDataset/activity_labels.txt', header = FALSE)
activity_labels <- as.character(activity_labels[ ,2])
msdata$activity <- activity_labels[msdata$activity]

## Relabel with descriptive variable names

reName <- names(msdata)
reName <- gsub('[(][)]', ' ', reName)
reName <- gsub('^t', "TimeDomain_", reName)
reName <- gsub('^f', "FrequencyDomain_", reName)
reName <- gsub("Acc", "Accelerometer", reName)
reName <- gsub("Gyro", "Gyroscope", reName)
reName <- gsub("Mag", "Magnitude", reName)
reName <- gsub("-mean-", "_Mean_", reName)
reName <- gsub("-std-", "_StandardDeviation_", reName)
reName <- gsub("-", "_", reName)
names(msdata) <- reName

## Create a data set with the average of each variable for each activity and each subject

dataSet2 <- aggregate(msdata[ ,3:81], by = list(activity = msdata$activity, subject = msdata$subject), FUN = mean)
write.table(x = msdata, file = "dataSet2", row.names = FALSE)






