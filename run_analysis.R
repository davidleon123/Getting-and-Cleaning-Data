library(dplyr)

features <- read.table("features.txt")
X_test <- read.table("./test/X_test.txt")
Y_test <- read.table("./test/y_test.txt")
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
X_train <- read.table("./train/X_train.txt")
Y_train <- read.table("./train/y_train.txt")
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

variables <- features$V2

names(X_test) <- variables
names(X_train) <- variables
names(activity_labels) <- c("labels", "activity")

test_df <- data.frame(subject = subject_test$V1, labels = Y_test$V1,  X_test)
train_df <- data.frame(subject = subject_train$V1, labels = Y_train$V1, X_train)

test_df <- merge(test_df, activity_labels, by.x = "labels", by.y = "labels", all.x = TRUE)
train_df <- merge(train_df, activity_labels, by.x = "labels", by.y = "labels", all.x = TRUE)

df <- rbind(test_df,train_df)
tidy_df <- df %>% select(subject, activity,  matches("mean|std")) %>%
        group_by(activity, subject) %>%
        summarise_each(funs(mean)) %>%
        arrange(subject, activity)

write.table(tidy_df, file = "tidy.txt", sep = " ", row.names = FALSE)

