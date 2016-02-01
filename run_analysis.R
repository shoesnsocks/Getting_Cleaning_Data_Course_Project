## This script will combine files of data collected from the Human Activity Recognition Using Smartphones Dataset  

## Load all data files into R
      testsubjects <- read.table ("test/subject_test.txt", col.names = "SubjectId") ##participants for test data
      testx <- read.table("test/X_test.txt") ## observations for test data
      testy <- read.table("test/y_test.txt", col.names = "ActNumber") ## activity numbers for test data
      trainsubjects <- read.table("train/subject_train.txt", col.names = "SubjectId") ## participants for train data
      trainx <- read.table("train/X_train.txt") ## observations for train data
      trainy <- read.table("train/y_train.txt", col.names = "ActNumber") ## activity numbers for train data
      activities <- read.table("activity_labels.txt", col.names = c("ActNumber", "ActName"), stringsAsFactors = FALSE) ## labels of activities
      headers <- read.table("features.txt", stringsAsFactors = FALSE) ## labels of observations
      
## Combine test data into one data frame
      testall <- cbind(testsubjects, testy, testx)
      
## Combine train data into one data frame
      trainall <- cbind(trainsubjects, trainy, trainx)
      
## Combine test and train data into one data frame
      complete <- rbind(testall, trainall)      

## Update Activity Numbers to Activity Names
      act <- activities[complete$ActNumber,]
      complete$ActNumber <- act$ActName
      
## Add column headers to data frame
      names(complete) <- c("SubjectId", "ActivityName", headers$V2)
      
## Extract only columns for mean and standard deviation (std)
      meancols <- grep("mean()", names(complete), fixed = TRUE) ##get column numbers that contain "mean()"
      stdcols <- grep("std()", names(complete), fixed = TRUE) ##get column numbers that contain "std()"
      finalfile <- cbind(complete[1:2], complete[meancols], complete[stdcols])
     
## Clean-up column headers
      names(finalfile) <- gsub("-", ".", names(finalfile))
      names(finalfile) <- gsub("\\(\\)", "", names(finalfile))
      names(finalfile) <- gsub("^t", "time.", names(finalfile))
      names(finalfile) <- gsub("^f", "freq.", names(finalfile))
      
## Create summary file of mean by SubjectID and ActivityName
      averages <- group_by(finalfile, SubjectId, ActivityName) %>% summarize_each(funs(mean))
      