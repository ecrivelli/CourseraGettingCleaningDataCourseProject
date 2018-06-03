#############################################################################################################################################
## Coursera - Getting and Cleaning Data by Johns Hopkins University                                                                        ##
## https://www.coursera.org/learn/data-cleaning/home/welcome                                                                               ##
##                                                                                                                                         ##
## Course Project - Main script - run_analysis()                                                                                           ##
## ---------------------------------------------                                                                                           ##
##                                                                                                                                         ##
## TODO: Change the directory path to reflect your own directory structure                                                                 ##
##                                                                                                                                         ##
## PART A                                                                                                                                  ##
## Creates a new tidy data file based on Samsung Galaxy S smartphone data named SamsungGalaxyS.txt following the instructions bellow:      ##
##      1 - Merges the training and the test sets to create one data set.                                                                  ##
##      2 - Extracts only the measurements on the mean and standard deviation for each measurement.                                        ##
##      3 - Uses descriptive activity names to name the activities in the data set                                                         ##
##      4 - Appropriately labels the data set with descriptive variable names.                                                             ##
##                                                                                                                                         ##
## PART B                                                                                                                                  ##
## From the data set in Part A, creates a second, independent tidy data set with the average of each variable for each activity and        ##
## each subject and save it as a new data file SamsungGalaxySAverages.txt                                                                  ##
##                                                                                                                                         ##
## Samsung Galaxy S smartphone data available at (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). ##
#############################################################################################################################################
run_analysis <- function(){
        library(dplyr)
        library(stringr)

        ###########################################################################################################################
        MY_WORKING_DIRECTORY <- "./GettingAndCleaningData/course_project/" #TODO: change it to reflect your own directory structure
        ###########################################################################################################################
        
        # PART A - Begin
        ################
        print("PART A - Begin")
        
        # READING DATA - Common values
        #################################
        print("    READING DATA - Common values")
        #(6 x 2) 'activity_labels.txt': Links the class labels with their activity name.
        activity_labels <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/activity_labels.txt"), fill=TRUE, sep=" ", header=FALSE)
        #(561 x 2) features: List of all features.
        features <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/features.txt"), fill=TRUE, sep=" ", header=FALSE)

        # READING DATA - Test values
        #############################
        print("    READING DATA - Test values")
        #(2947 x 1)'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
        subjectTest <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/test/subject_test.txt"), fill=TRUE, sep=" ", header=FALSE)
        #(2947 x 561) 'test/X_test.txt': Test set.
        xTest <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/test/X_test.txt"), fill=TRUE, sep="", header=FALSE)
        #(2947 x 1) 'test/y_test.txt': Test labels.
        yTest <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/test/y_test.txt"), fill=TRUE, sep=" ", header=FALSE)
        
        # TIDING DATA - Test values
        ############################
        print("    TIDING DATA - Test values")
        #replacing the generic colnames of Test set (V1, V2,...) for the actual feature names.
        colnames(xTest) <- features[,2]
        #replacing the generic colname V1 for subjectTest.
        colnames(subjectTest) <- c("subject")
        #replacing the generic colname V1 for test label.
        colnames(yTest) <- c("activity")
        #replacing the integer values for factor with 6 levels mapping to activity_labels
        yTest$activity <- factor(yTest$activity, labels = activity_labels$V2)
        #binding together the two data.frames by columns
        tidyTest <-bind_cols(subjectTest, yTest)
        #Extracts only the measurements on the mean and standard deviation for each measurement.
        xTest <-  xTest[, grep("[Mm]ean|[Ss]td", colnames(xTest))]
        #binding the test set to the tidy data.frame
        tidyTest <- bind_cols(tidyTest, xTest)
        # Cleaning variables;
        subjectTest <-NULL; xTest <-NULL; yTest<-NULL
        
        # READING DATA - Train values
        #############################
        print("    READING DATA - Train values")
        #(2947 x 1)'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
        subjectTrain <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/train/subject_train.txt"), fill=TRUE, sep=" ", header=FALSE)
        #(2947 x 561) 'train/X_train.txt': Train set.
        xTrain <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/train/X_train.txt"), fill=TRUE, sep="", header=FALSE)
        #(2947 x 1) 'train/y_train.txt': Train labels.
        yTrain <-read.csv(paste0(MY_WORKING_DIRECTORY, "UCI\ HAR\ Dataset/train/y_train.txt"), fill=TRUE, sep=" ", header=FALSE)
        
        # TIDING DATA - Train values
        ############################
        print("    TIDING DATA - Train values")
        #replacing the generic colnames of Test set (V1, V2,...) for the actual feature names.
        colnames(xTrain) <- features[,2]
        #replacing the generic colname V1 for subjectTest.
        colnames(subjectTrain) <- c("subject")
        #replacing the generic colname V1 for test label.
        colnames(yTrain) <- c("activity")
        #replacing the integer values for factor with 6 levels mapping to activity_labels
        yTrain$activity <- factor(yTrain$activity, labels = activity_labels$V2)
        #binding together the two data.frames by columns
        tidyTrain <-bind_cols(subjectTrain, yTrain)
        #Extracts only the measurements on the mean and standard deviation for each measurement.
        xTrain <-  xTrain[, grep("[Mm]ean|[Ss]td", colnames(xTrain))]
        #binding the test set to the tidy data.frame
        tidyTrain <- bind_cols(tidyTrain, xTrain)
        
        # TIDING DATA - Merging Test and Train values
        #############################################
        print("    TIDING DATA - Merging Test and Train values")
        tidyData <- bind_rows(tidyTest,tidyTrain)
        # Cleaning variables;
        subjectTrain <-NULL; xTrain <-NULL; yTrain <-NULL;tidyTest<-NULL;tidyTrain<-NULL;features <-NULL;activity_labels<-NULL
        
        # TIDING DATA - Last minute grooming
        ####################################
        print("    TIDING DATA - Last minute grooming")
        #last touch on variable names
        colnames(tidyData) <-gsub(pattern = "\\(\\)", replacement = "", colnames(tidyData))
        colnames(tidyData) <-gsub(pattern = "-", replacement = "", colnames(tidyData))
        
        # SAVING NEW DATA SET
        #####################
        print(paste0("    SAVING NEW DATA SET - PATH: ", MY_WORKING_DIRECTORY, "data/SamsungGalaxyS.txt"))
        write.table(tidyData, paste0(MY_WORKING_DIRECTORY, "data/SamsungGalaxyS.txt"), row.name=FALSE)
        
        # PART A - END
        ########################
        print("PART A - End")
        
        
        # PART B - Begin
        ################
        print("PART B - Begin")
        
        # SAVING NEW DATA SET
        #####################
        print("    CREATING DATA SET")
        #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        tidyData2 <-
                tidyData %>%
                group_by(activity,subject)%>%
                summarize_at(vars("tBodyAccmeanX":"angle(Z,gravityMean)"), mean)
        # Cleaning variables;
        tidyData <- NULL
        
        # SAVING NEW DATA SET
        #####################
        print(paste0("    SAVING DATA SET - PATH: ", MY_WORKING_DIRECTORY, "data/SamsungGalaxySAverages.txt"))
        write.table(tidyData2, paste0(MY_WORKING_DIRECTORY, "data/SamsungGalaxySAverages.txt"), row.names = FALSE)
        
        # PART B - END
        ########################
        print("PART B - End")
        
}