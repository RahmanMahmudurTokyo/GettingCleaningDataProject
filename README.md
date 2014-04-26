GettingCleaningDataProject
==========================

Coursera Getting and Cleaning Data Project
================================================================================

The experiments (done by Smartlab) have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
================================================================================



The dataset includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md' : CodeBook contains input , transformation process and output.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'X_train.txt': Training set.

- 'y_train.txt': Training labels.

- 'X_test.txt': Test set.

- 'y_test.txt': Test labels.

- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'run_analysis.R': R script that has all codes 

- 'TidyTrainTestData.csv' and  'TidyTrainTestData.pdf': Output tidy dataset in csv& pdf format with the average of each variable for each activity and each subject. 



Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to 
denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, 
fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are followings. During the transformation phase of input dataset, only measurements on the mean and 
standard deviation for each measuremen have been included in the tidy output dataset. Other measurements (ex.max, min, sma etc) have been excluded during 
the transformation phase.

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean



Activity 
=========
In addition, each subject performed six activities- 1)WALKING
2 2) WALKING_UPSTAIRS
3 3)WALKING_DOWNSTAIRS
4 4)SITTING
5 5)STANDING
6 6)LAYING which are respresented as 1,2,3,4,5 & 6 respectively in the dataset. 
 



Input & datapload Process
=========================
First, get and set the working directy into the folder where all respective files are stored. Following files are uploaded into R and have been assigned following object names. 
"X_train.txt" is uploaded and values have been assined to an object called X_Train.
"y_train.txt" is uploaded and values have been assined to an object called Y_Train.
"subject_train.txt"is uploaded and values have been assined to an object called Subject_train.
"X_test.txt" is uploaded and values have been assined to an object called X_test.
"y_test.txt" is uploaded and values have been assined to an object called Y_test.
"subject_test.txt" is uploaded and values have been assined to an object called Subject_test.
"features.txt" is uploaded and values have been assined to an object called Feature.
"activity_labels.txt" is uploaded and values have been assined to an object called Activity_labels.



Transformation/Modification Process
====================================
- Set the current working directly into the folder where all respective files are stored.
- Subject_train, X_train, Y_train objects are combined(by column) by cbind function in order to get newly combined object called SXY_train.
- Subject_test, X_test, Y_test objects are combined(by column) by cbind function in order to get newly combined object called SXY_test.
- SXY_train & SXY_test are combined(by rows) by rbind function and newly created object is called SXY_trainTest.
- Feature$V2 has been converted from factor to character using as.character() and values have been assigned to object called FeatureName.
- Column names of SXYTrainTest have been extracted using names function and values have been assigned to an object called SXY_ColNames.
- From 2nd to 562th components of SXY_ColNames vector have been assigned the same value as FeatureName which represent different features names values. 
- In order to label feature related variables of SXY_TrainTest with descriptive measurement name, SXY_ColNames vectors values have been assigned to Column names of SXY_TrainTest using colnames().
- Install  and load "plyr" package. SXY_TrainTest columns no 563 have been rearranged as 2nd column of SXY_TrainTest using SXY_TrainTest[,c(1,563,2:562)] where 1st & 2nd column values represents Subject & Activity.
- Using arrange function , sort SXY_TrainTest dataset by SXY_TrainTest[2],which represents activity
- Using names function, look at the Column names of SXY_TrainTest and manully takes notes(using pen) of position of column names which contain the word "mean" & "standard devitiation" since
we need to extract mean and standard deviation for each measurement.Then, using SXY_TrainTest[ ,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)] 
all data are extracted with mean and standard deviation for each measurement and values are assigned to an object called SXY_TrainTest_MnStd.


- In order to use descriptive activity names to name activities in the dataset and appropriately labels the dataset with descriptive activity names following task are performed.
	* using names function extract the column names of SXY_TrainTest_MnStd and assign these value to newly created object named SXY_TrainTest_MnStd_ColNames	
	* Rename the 1st& 2nd component of SXY_TrainTest_MnStd_ColNames as "Subject ID" & "Activity Code"
        * In order to appropriately labels the data set with descriptive activity names assign the values of SXY_TrainTest_MnStd_ColNames to the column names of SXY_TrainTest_MnStd using names(SXY_TrainTest_MnStd) <- SXY_TrainTest_MnStd_ColNames.
	* Split SXY_TrainTest_MnStd dataset by Activity Code & assign the values to an object named SplitActivityCode using SplitActivityCode <- split(SXY_TrainTest_MnStd$ActivityCode, SXY_TrainTest_MnStd$ActivityCode).
	* Look at the values of Activity_labels using str() and use similar values(WALKING UPSTAIRS,WALKING DOWNSTAIRS), remaining same values(WALKING,SITTING,STANDING,LAYING) in order to create six different objects called Walking, WalkingUp, WalkingDown, Sitting, Standing & Laying using following codes:
        	> SplitActivityCode[[1]][1:1722]<- "WALKING"
		> Walking <- SplitActivityCode[[1]][1:1722]
		> SplitActivityCode[[2]][1:1544] <- "WALKING UPSTAIRS"
		> WalkingUp <- SplitActivityCode[[2]][1:1544]
		> SplitActivityCode[[3]][1:1406] <- "WALKING DOWNSTAIRS"
		> WalkingDown <- SplitActivityCode[[3]][1:1406]
		> SplitActivityCode[[4]][1:1777] <- "SITTING"
		> Sitting <- SplitActivityCode[[4]][1:1777]
		> SplitActivityCode[[5]][1:1906] <- "STANDING"
		> Standing <- SplitActivityCode[[5]][1:1906]
		> SplitActivityCode[[6]][1:1944] <- "LAYING"
		> Laying <- SplitActivityCode[[6]][1:1944]
	* Install data.table package and load the package.
	* Convert the values from factor to text of SXY_TrainTest_MnStd$ActivityCode using as.character function.
	* Convert from dataframe to datatable of SXY_TrainTest_MnStd object using data.table function.
	* Using setkey(SXY_TrainTest_MnStd, ActivityCode), set ActivityCode as key.
	* Create a new object called Walking 1 and assign all the values of SXY_TrainTest_MnStd where Activity code = 1 in order to extract WALKING activity. Then, create a new column named Activity Description inside Walking1 object in order to assign text value of "WALKING" to this newly created column. Then
          convert Walking1 datatable to dataframe. Finaally rearrange 2nd,1st & 69th column of Walking1 as 1st,2nd & 3rd column of Walking1 object. Above stated tasks are done using the following codes:   
		> Walking1 <- SXY_TrainTest_MnStd['1']
		> Walking1 <- Walking1[,ActivityDescription:=Walking] 
		> Walking1 <- data.frame(Walking1)
		> Walking1 <- Walking1[ ,c(2,1,69,3:68)]
	  Using the above stated same process & similar coding , five more objects namely WalkingUp1, WalkingDown1, Sitting1, Standing1 & Laying1 are also created in order to assign activity text values of WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING & LAYING  . Columns of these five objects have been also rearranged same as above stated process.  
	* Using the following code, Walking1, WalkingUp1, WalkingDown1, Sitting1, Standing1, Laying1 are combined into one combined object named SXY_TrainTest_MnStd which now contains activity names in text values and also have prober labels for all variables across columns. Finally, ActivityCode column of SXY_TrainTest_MnStd object have been converted to integer using as.integer function.
		> SXY_TrainTest_MnStd <- rbind(Walking1, WalkingUp1, WalkingDown1, Sitting1, Standing1, Laying1)

 - Creates a second,independent tidy dataset with the average & standard deviation of each variable for each activity and each subject following tasks have been performed.
	* Load plyr package. Change the order of the value of ActivityDescription as "WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS","SITTING","STANDING","LAYING" [order] factor function have been used.
	* Arrange SXY_TrainTest_MnStd by Activity Code variable using arrange function.
	* In order to get average & standard deviation of each variable for each activity and each subject, one new object called Tidy_SXY_TrainTest_MnStd is created using the following code 
		> Split_SXY_TrainTest_MnStd <- split(SXY_TrainTest_MnStd[ ,4:69], list(SXY_TrainTest_MnStd$ActivityDescription, SXY_TrainTest_MnStd$SubjectID))
		> Tidy_SXY_TrainTest_MnStd <- sapply(Split_SXY_TrainTest_MnStd, colMeans)
	* When we look at the value of Tidy_SXY_TrainTest_MnStd using head(Tidy_SXY_TrainTest_MnStd), we notice that all variables are in rows. Therefore, in order to show all variables across the columns we transpose object using t functions as follows.
 	  Finally, using following write.csv function, we create a new csv file named "TidyTrainTestData" that now contains average & standard deviation of each variable for each activity and each subject. Since Coursera does not support csv format, csv file has been opened and saved as pdf format.
		> Tidy_SXY_TrainTest_MnStd <- t(Tidy_SXY_TrainTest_MnStd) 
		> write.csv(Tidy_SXY_TrainTest_MnStd, file="TidyTrainTestData.csv", quote = FALSE, row.names=T)



Output
==========
Tidy_SXY_TrainTest_MnStd  has the following variables across the columns. Across the rows, six activities performed by all repective subjects are represented. For instance, WALKING.1 represents WALKING activity performed by Subject 1. Final output tidy second dataset has now 66 variables and 180 records which represent mean & standard deviatios of 66 variables for different combination of Activity & Subjects. 
"TidyTrainTestData.csv"/"TidyTrainTestData.pdf" files have output tidy dataset.

* tBodyAcc.mean...X : average value of tBodyAcc-X where X denotes X direction
* tBodyAcc.mean...Y : average value of tBodyAcc-Y where Y denotes Y direction
* tBodyAcc.mean...Z : average value of tBodyAcc-Z where Z denotes Z direction
* tBodyAcc.std...X  : standard deviation of tBodyAcc-X where X denotes X direction
* tBodyAcc.std...Y  : standard deviation of tBodyAcc-Y where Y denotes Y direction
* tBodyAcc.std...Z  : standard deviation of tBodyAcc-Z where Z denotes Z direction
* tGravityAcc.mean...X : average value of tGravityAcc-X where X denotes X direction
* tGravityAcc.mean...Y : average value of tGravityAcc-Y where Y denotes Y direction
* tGravityAcc.mean...Z : average value of tGravityAcc-Z where Z denotes Z direction
* tGravityAcc.std...X  : standard deviation of tGravityAcc-X where X denotes X direction
* tGravityAcc.std...Y  : standard deviation of tGravityAcc-Y where Y denotes Y direction
* tGravityAcc.std...Z  : standard deviation of tGravityAcc-Z where Z denotes Z direction
* tBodyAccJerk.mean...X : average value of tBodyAccJerk-X where X denotes X direction
* tBodyAccJerk.mean...Y : average value of tBodyAccJerk-Y where Y denotes Y direction
* tBodyAccJerk.mean...Z : average value of tBodyAccJerk-Z where Z denotes Z direction
* tBodyAccJerk.std...X  : standard deviation of tBodyAccJerk-X where X denotes X direction
* tBodyAccJerk.std...Y  : standard deviation of tBodyAccJerk-Y where Y denotes Y direction
* tBodyAccJerk.std...Z  : standard deviation of tBodyAccJerk-Z where Z denotes Z direction
* tBodyGyro.mean...X : average value of tBodyGyro-X where X denotes X direction
* tBodyGyro.mean...Y : average value of tBodyGyro-Y where Y denotes Y direction
* tBodyGyro.mean...Z : average value of tBodyGyro-Z where Z denotes Z direction
* tBodyGyro.std...X : standard deviation of tBodyGyro-X where X denotes X direction
* tBodyGyro.std...Y : standard deviation of tBodyGyro-Y where Y denotes Y direction
* tBodyGyro.std...Z : standard deviation of tBodyGyro-Z where Z denotes Z direction