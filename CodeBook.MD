CODE BOOK

Data used in this project is from:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

SUBJECT AND ACTIVITY

These variables identify the unique subject/activity pair the variables relate to:

Subject: the integer subject ID.

Activity: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying.

THE DATA

The dataset includes the following files used in my file preparation.  Other files in the dataset were not used.

subject_test.txt
X_test.txt
y_test.txt
subject_train.txt
X_train.txt
y_train.txt
activity_labels.txt
features.txt

THE WORK

The dataset was downloaded into working directory from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Install and/or load dplyr package

Load above files into R using read.table

Combine test data using cbind

Combine train data using cbind

Combine test and train tables using rbind

Updated activity numbers to activity names

Added column headers to table

Extract only columns for mean and standard deviation

Clean-up column headers using gsub

Create summary file using group_by and summarize_each

Write out final table to text file
