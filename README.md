# Getting and Cleaning Data Project

### Creates a tidy data set from :

* features.txt

* activity_labels.txt

* X_train.txt

* y_train.txt

* X_test.txt

* y_test.txt

* subject_train.txt

* subject_test.txt 

### Script :

Based on dplyr 

Creates the test et train data data frames by putting into a single dataframe the activity labels column, the variable names from the feature file, the subject column and the data set
Maps activity labels to activity names by merging the data frames with the activity names from the activity_labels file
Binds the test and train dataframes
Filters mean and std columns
Aggregate by the mean by subject and activity for each remaining column


## Data Source:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


