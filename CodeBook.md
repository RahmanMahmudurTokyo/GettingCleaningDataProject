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
* tBodyGyroJerk.mean...X : average value of tBodyGyroJerk-X where X denotes X direction
* tBodyGyroJerk.mean...Y : average value of tBodyGyroJerk-Y where Y denotes Y direction
* tBodyGyroJerk.mean...Z : average value of tBodyGyroJerk-Z where Z denotes Z direction
* tBodyGyroJerk.std...X  : standard deviation of tBodyGyroJerk-X where X denotes X direction
* tBodyGyroJerk.std...Y  : standard deviation of tBodyGyroJerk-Y where Y denotes Y direction
* tBodyGyroJerk.std...Z  : standard deviation of tBodyGyroJerk-Z where Z denotes Z direction
* tBodyAccMag.mean..  : average value of tBodyAccMag
* tBodyAccMag.std..   : standard deviation of tBodyAccMag
* tGravityAccMag.mean.. : average value of tGravityAccMag
* tGravityAccMag.std..  : standard deviation of tGravityAccMag
* tBodyAccJerkMag.mean.. : average value of tBodyAccJerkMag
* tBodyAccJerkMag.std..  : standard deviation of tBodyAccJerkMag
* tBodyGyroMag.mean.. : average value of tBodyGyroMag 
* tBodyGyroMag.std..  : standard deviation of tBodyGyroMag
* tBodyGyroJerkMag.mean.. : average value of tBodyGyroJerkMag
* tBodyGyroJerkMag.std..  : standard deviation of tBodyGyroJerkMag
* fBodyAcc.mean...X : average value of fBodyAcc-X where X denotes X direction
* fBodyAcc.mean...Y : average value of fBodyAcc-Y where Y denotes Y direction
* fBodyAcc.mean...Z : average value of fBodyAcc-Z where Z denotes Z direction
* fBodyAcc.std...X  : standard deviation of fBodyAcc-X where X denotes X direction
* fBodyAcc.std...Y  : standard deviation of fBodyAcc-Y where Y denotes Y direction
* fBodyAcc.std...Z  : standard deviation of fBodyAcc-Z where Z denotes Z direction
* fBodyAccJerk.mean...X : average value of fBodyAccJerk-X where X denotes X direction
* fBodyAccJerk.mean...Y : average value of fBodyAccJerk-Y where Y denotes Y direction
* fBodyAccJerk.mean...Z : average value of fBodyAccJerk-Z where Z denotes Z direction
* fBodyAccJerk.std...X  : standard deviation of fBodyAccJerk-X where X denotes X direction
* fBodyAccJerk.std...Y  : standard deviation of fBodyAccJerk-Y where Y denotes Y direction
* fBodyAccJerk.std...Z  : standard deviation of fBodyAccJerk-Z where Z denotes Z direction
* fBodyGyro.mean...X  : average value of fBodyGyro-X where X denotes X direction
* fBodyGyro.mean...Y  : average value of fBodyGyro-Y where Y denotes Y direction
* fBodyGyro.mean...Z  : average value of fBodyGyro-Z where Z denotes Z direction
* fBodyGyro.std...X : standard deviation of fBodyGyro-X where X denotes X direction
* fBodyGyro.std...Y : standard deviation of fBodyGyro-Y where Y denotes Y direction
* fBodyGyro.std...Z : standard deviation of fBodyGyro-Z where Z denotes Z direction
* fBodyAccMag.mean.. : average value of fBodyAccMag
* fBodyAccMag.std..  : standard deviation of fBodyAccMag 
* fBodyBodyAccJerkMag.mean.. : average value of fBodyBodyAccJerkMag
* fBodyBodyAccJerkMag.std..  : standard deviation of fBodyBodyAccJerkMag
* fBodyBodyGyroMag.mean..  : average value of fBodyBodyGyroMag
* fBodyBodyGyroMag.std..   : standard deviation of fBodyBodyGyroMag
* fBodyBodyGyroJerkMag.mean.. : average value of fBodyBodyGyroJerkMag
* fBodyBodyGyroJerkMag.std..  : standard deviation of fBodyBodyGyroJerkMag 
