# Coursera - Getting and Cleaning Data by Johns Hopkins University 

<https://www.coursera.org/learn/data-cleaning/home/welcome>

## Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate our ability as students to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The source data we are going to use in this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone [1] and can be obtained from the course website at: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

This projetct has one R script called **run_analysis.R** that based on Samsung data, creates two new tidy data sets folowing the course instructions:

1) **SamsungGalaxyS.txt** which merges the test and train sets from the Samsung Galaxy S smartphone for the mean and standard deviation measurements with descriptive activity names and labels. This file is not required to be saved by the course project but I decided to keep it because it can be useful in future;

2) **SamsungGalaxySAverages.txt** which summarizes the file above. It contains the average of each variable for each activity and each subject.

if you want to read those files, something like this line of code in R will do:

```myTidyData <- read.table("./GettingAndCleaningData/course_project/data/SamsungGalaxyS.txt", header=TRUE)```


### Directory structure
* UCI HAR Dataset: contains the Human Activity Recognition Using Smartphones Dataset[1].
* Data: contains the two Samsung Galaxy files generated by this project script.

### Set up
First you need to download or clone this entire project. After that, you must change the variable My_WORKING_DIRECTORY inside the run_analysis.R to point your directory structure correctly.

```MY_WORKING_DIRECTORY <- "./GettingAndCleaningData/course_project/" #TODO: change it to reflect your own directory structure```


I decided to fill run_analysis.R with comments and print out each major step of the script on the console window so that my code could be more readable. When you are all set, please type the command below on your console and see the script performing its magic. :)

```run_analysis()```



## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. **Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine**. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.