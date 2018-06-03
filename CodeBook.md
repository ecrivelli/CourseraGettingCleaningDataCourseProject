# Coursera - Getting and Cleaning Data by Johns Hopkins University
<https://www.coursera.org/learn/data-cleaning/home/welcome>

## Getting and Cleaning Data Course Project - Code book

The purpose of this project is to demonstrate our ability as students to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This code book describes the variables, the data, and work performed to clean up the data from the Human Activity Recognition Using Smartphones Dataset[1].


### The dataset for this project includes the following files:
Orignal files from Human Activity Recognition Using Smartphones Dataset[1]:
- **features.txt**: List of all features.
- **activity_labels.txt**: Links the class labels with their activity name.
- **train/X_train.txt**: Training set.
- **train/y_train.txt**: Training labels.
- **test/X_test.txt**: Test set.
- **test/y_test.txt**: Test labels.

Derivated new datasets created by run_analysis R script:
- **SamsungGalaxyS.txt**: which merges the test and train sets from the Samsung Galaxy S smartphone for the mean and standard deviation measurements with descriptive activity names and labels.
- **SamsungGalaxySAverages.txt**: which summarizes the file above by the average of each variable for each activity and each subject.

In order to create the SamsungGalaxyS.txt, the **run_analysis.R** script:
- Merges the training and the test (sets and labels) to create one single data set;
- Extracts only the measurements on the mean and standard deviation for each measurement;
- Uses descriptive activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) to name the activities in the data set;
- Appropriately labels the data set with descriptive variable names.

In the case of the SamsungGalaxySAverages.txt, the run_analysis R script uses the same data source from the SamsungGalaxyS.txt file and summarize it by the average of each variable for each activity and each subject.


The following variables are available in the two new files and their descriptions follows the original documentation[1]. 

|index|feature|
|---|---|
|1|activity|
|2|subject|
|3|tBodyAccmeanX|
|4|tBodyAccmeanY|
|5|tBodyAccmeanZ|
|6|tBodyAccstdX|
|7|tBodyAccstdY|
|8|tBodyAccstdZ|
|9|tGravityAccmeanX|
|10|tGravityAccmeanY|
|11|tGravityAccmeanZ|
|12|tGravityAccstdX|
|13|tGravityAccstdY|
|14|tGravityAccstdZ|
|15|tBodyAccJerkmeanX|
|16|tBodyAccJerkmeanY|
|17|tBodyAccJerkmeanZ|
|18|tBodyAccJerkstdX|
|19|tBodyAccJerkstdY|
|20|tBodyAccJerkstdZ|
|21|tBodyGyromeanX|
|22|tBodyGyromeanY|
|23|tBodyGyromeanZ|
|24|tBodyGyrostdX|
|25|tBodyGyrostdY|
|26|tBodyGyrostdZ|
|27|tBodyGyroJerkmeanX|
|28|tBodyGyroJerkmeanY|
|29|tBodyGyroJerkmeanZ|
|30|tBodyGyroJerkstdX|
|31|tBodyGyroJerkstdY|
|32|tBodyGyroJerkstdZ|
|33|tBodyAccMagmean|
|34|tBodyAccMagstd|
|35|tGravityAccMagmean|
|36|tGravityAccMagstd|
|37|tBodyAccJerkMagmean|
|38|tBodyAccJerkMagstd|
|39|tBodyGyroMagmean|
|40|tBodyGyroMagstd|
|41|tBodyGyroJerkMagmean|
|42|tBodyGyroJerkMagstd|
|43|fBodyAccmeanX|
|44|fBodyAccmeanY|
|45|fBodyAccmeanZ|
|46|fBodyAccstdX|
|47|fBodyAccstdY|
|48|fBodyAccstdZ|
|49|fBodyAccmeanFreqX|
|50|fBodyAccmeanFreqY|
|51|fBodyAccmeanFreqZ|
|52|fBodyAccJerkmeanX|
|53|fBodyAccJerkmeanY|
|54|fBodyAccJerkmeanZ|
|55|fBodyAccJerkstdX|
|56|fBodyAccJerkstdY|
|57|fBodyAccJerkstdZ|
|58|fBodyAccJerkmeanFreqX|
|59|fBodyAccJerkmeanFreqY|
|60|fBodyAccJerkmeanFreqZ|
|61|fBodyGyromeanX|
|62|fBodyGyromeanY|
|63|fBodyGyromeanZ|
|64|fBodyGyrostdX|
|65|fBodyGyrostdY|
|66|fBodyGyrostdZ|
|67|fBodyGyromeanFreqX|
|68|fBodyGyromeanFreqY|
|69|fBodyGyromeanFreqZ|
|70|fBodyAccMagmean|
|71|fBodyAccMagstd|
|72|fBodyAccMagmeanFreq|
|73|fBodyBodyAccJerkMagmean|
|74|fBodyBodyAccJerkMagstd|
|75|fBodyBodyAccJerkMagmeanFreq|
|76|fBodyBodyGyroMagmean|
|77|fBodyBodyGyroMagstd|
|78|fBodyBodyGyroMagmeanFreq|
|79|fBodyBodyGyroJerkMagmean|
|80|fBodyBodyGyroJerkMagstd|
|81|fBodyBodyGyroJerkMagmeanFreq|
|82|angle(tBodyAccMean,gravity)|
|83|angle(tBodyAccJerkMean),gravityMean)|
|84|angle(tBodyGyroMean,gravityMean)|
|85|angle(tBodyGyroJerkMean,gravityMean)|
|86|angle(X,gravityMean)|
|87|angle(Y,gravityMean)|
|88|angle(Z,gravityMean)|

## References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012