# This is a repo for the Getting and Cleaning Data course project.

Version of R used 3.2.3

The GitHub Repo contains the following files:

1. README.MD
2. tidy_averages.txt - This is the final tidy dataset.
3. run_analysis.R - This is the R Code that creates the Getting_and_Cleaning_Data_Final_Tidy_Data.txt
4. Codebook.MD - This tells you what all the ariables are and the summaries Calculated with units

Source Data

Source data files orginally sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source dataset has additional documentation describing the orginal data collection and setup of the source files.

How the Script Works

The run_analysis.R script assumes you have the UCI HAR Dataset (the unzipped source from link above) in your working directory and that the dplyr package is installed.

The script loads all test, train, activity label and column label data into R.  Test and train datasets are then merged int one table.  Activity numbers are then replaced with activity names.   Then only the measurements on the mean and standard deviation for each measurement, in addition to the Activity Name and Subject ID are loaded into a final dataset.  Column names are tidied.

Finally the dataset is grouped by Subject ID and Activity Name and the remaining variables are averaged using the summarise_each command from dplyr.

The final data set is then saved as a .txt file in the working directory and printed.
