xgroup <- rbind(x_train, x_test)
ygroup <- rbind(y_train, y_test)
mysubject <- rbind(subject_train, subject_test)
finaldata <- cbind(mysubject, ygroup, xgroup)

tidydata <- finaldata %>% select(subject, code, contains("mean"), contains("std"))
tidydata$code <- activities[tidydata$code, 2]

names(tidydata)[2] = "activity"
names(tidydata)<-gsub("Acc", "Accelerometer", names(tidydata))
names(tidydata)<-gsub("Gyro", "Gyroscope", names(tidydata))
names(tidydata)<-gsub("BodyBody", "Body", names(tidydata))
names(tidydata)<-gsub("Mag", "Magnitude", names(tidydata))
names(tidydata)<-gsub("^t", "Time", names(tidydata))
names(tidydata)<-gsub("^f", "Frequency", names(tidydata))
names(tidydata)<-gsub("tBody", "Time Body", names(tidydata))
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "Standard Deviation", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("angle", "Angle", names(tidydata))
names(tidydata)<-gsub("gravity", "Gravity", names(tidydata))

finaldataset <- tidydata %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(finaldataset, "finaldata.txt", row.name=FALSE)

finaldataset
