xgroup <- rbind(x_train, x_test)
ygroup <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
finaldata <- cbind(Subject, ygroup, xgroup)