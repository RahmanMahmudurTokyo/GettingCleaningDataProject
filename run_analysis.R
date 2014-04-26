### 1.Merges the training and the test sets to create one data set
getwd()  
X_train <- read.table("X_train.txt", header =F, sep="")
str(X_train)
Y_train <- read.table("y_train.txt", header =F, sep="")
str(Y_train)
Subject_train <- read.table("subject_train.txt", header =F, sep="")
str(Subject_train)
SXY_train <- cbind(Subject_train, X_train, Y_train)
str(SXY_train)

getwd()
X_test <- read.table("X_test.txt", header =F, sep="")
Y_test <- read.table("y_test.txt", header =F, sep="")
Subject_test <- read.table("subject_test.txt", header =F, sep="")
SXY_test <- cbind(Subject_test, X_test, Y_test)
str(SXY_test)

# rbind rows of SXY_train & SXY_test dataframe in order to create one dataset
SXY_TrainTest <- rbind(SXY_train, SXY_test)
str(SXY_TrainTest)      #SXY_TrainTest is the dataset that merges both the training and test sets





### 2.Extracts only the measurements on the mean and standard deviation for each measurement
names(SXY_TrainTest)
getwd()
Feature <- read.table("features.txt", header=F, sep="")
str(Feature)
head(Feature)
str(Feature$V2)
FeatureName <- as.character(Feature$V2)
str(FeatureName)
str(SXY_TrainTest)
SXY_ColNames <- names(SXY_TrainTest)
head(SXY_ColNames, 13)
str(SXY_ColNames)
SXY_ColNames[2:562] <- FeatureName
names(SXY_TrainTest)
colnames(SXY_TrainTest) <- SXY_ColNames  # labeling feature related variable with descriptive measurement name as per feature file
str(SXY_TrainTest)

install.packages("plyr")
library(plyr)
SXY_TrainTest <- SXY_TrainTest[,c(1,563,2:562)]
SXY_TrainTest <- arrange(SXY_TrainTest,SXY_TrainTest[2])   # sort by SXY_TrainTest[2] which represents activity
names(SXY_TrainTest)
SXY_TrainTest_MnStd <- SXY_TrainTest[ ,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]
str(SXY_TrainTest_MnStd)  #SXY_TrainTest_MnStd dataset contains mean and standard deviation for each measurement





### 3.Uses descriptive activity names to name the activities in the data set
### 4.Appropriately labels the data set with descriptive activity names
SXY_TrainTest_MnStd_ColNames <- names(SXY_TrainTest_MnStd)     
SXY_TrainTest_MnStd_ColNames[1] <- "SubjectID"
SXY_TrainTest_MnStd_ColNames[2] <- "ActivityCode"
names(SXY_TrainTest_MnStd) <- SXY_TrainTest_MnStd_ColNames   #in order to appropriately labels the data set with descriptive activity names
colnames(SXY_TrainTest_MnStd)     
SplitActivityCode <- split(SXY_TrainTest_MnStd$ActivityCode, SXY_TrainTest_MnStd$ActivityCode)
str(SplitActivityCode)

Activity_labels <- read.table("activity_labels.txt", header=F, sep="")
str(Activity_labels)
head(Activity_labels)
SplitActivityCode[[1]][1:1722]<- "WALKING"
Walking <- SplitActivityCode[[1]][1:1722]
SplitActivityCode[[2]][1:1544] <- "WALKING UPSTAIRS"
WalkingUp <- SplitActivityCode[[2]][1:1544]
SplitActivityCode[[3]][1:1406] <- "WALKING DOWNSTAIRS"
WalkingDown <- SplitActivityCode[[3]][1:1406]
SplitActivityCode[[4]][1:1777] <- "SITTING"
Sitting <- SplitActivityCode[[4]][1:1777]
SplitActivityCode[[5]][1:1906] <- "STANDING"
Standing <- SplitActivityCode[[5]][1:1906]
SplitActivityCode[[6]][1:1944] <- "LAYING"
Laying <- SplitActivityCode[[6]][1:1944]

install.packages("data.table")
library(data.table)
SXY_TrainTest_MnStd$ActivityCode <- as.character(SXY_TrainTest_MnStd$ActivityCode)
SXY_TrainTest_MnStd <- data.table(SXY_TrainTest_MnStd)
str(SXY_TrainTest_MnStd)
setkey(SXY_TrainTest_MnStd, ActivityCode)
SXY_TrainTest_MnStd$ActivityCode
Walking1 <- SXY_TrainTest_MnStd['1']
str(Walking1)
Walking1 <- Walking1[,ActivityDescription:=Walking] 
Walking1 <- data.frame(Walking1)
Walking1 <- Walking1[ ,c(2,1,69,3:68)]
table(Walking1$ActivityCode); table(Walking1$ActivityDescription)
WalkingUp1 <- SXY_TrainTest_MnStd['2']
str(WalkingUp1)
WalkingUp1 <- WalkingUp1[,ActivityDescription:=WalkingUp] 
WalkingUp1 <- data.frame(WalkingUp1)
str(WalkingUp1)
WalkingUp1 <- WalkingUp1[ ,c(2,1,69,3:68)]
table(WalkingUp1$ActivityCode); table(WalkingUp1$ActivityDescription)
WalkingDown1 <- SXY_TrainTest_MnStd['3']
WalkingDown1 <- WalkingDown1[,ActivityDescription:=WalkingDown] 
WalkingDown1 <- data.frame(WalkingDown1)
WalkingDown1 <- WalkingDown1[ ,c(2,1,69,3:68)]
table(WalkingDown1$ActivityCode); table(WalkingDown1$ActivityDescription)
Sitting1 <- SXY_TrainTest_MnStd['4']
Sitting1 <- Sitting1[,ActivityDescription:=Sitting] 
Sitting1 <- data.frame(Sitting1)
Sitting1 <- Sitting1[ ,c(2,1,69,3:68)]
table(Sitting1$ActivityCode); table(Sitting1$ActivityDescription)
Standing1 <- SXY_TrainTest_MnStd['5']
Standing1<- Standing1[,ActivityDescription:=Standing] 
Standing1 <- data.frame(Standing1)
Standing1 <- Standing1[ ,c(2,1,69,3:68)]
table(Standing1$ActivityCode); table(Standing1$ActivityDescription)
Laying1 <- SXY_TrainTest_MnStd['6']
Laying1<- Laying1[,ActivityDescription:=Laying] 
Laying1 <- data.frame(Laying1)
Laying1 <- Laying1[ ,c(2,1,69,3:68)]
table(Laying1$ActivityCode); table(Laying1$ActivityDescription)
SXY_TrainTest_MnStd <- rbind(Walking1, WalkingUp1, WalkingDown1, Sitting1, Standing1, Laying1)
SXY_TrainTest_MnStd$ActivityCode <- as.integer(SXY_TrainTest_MnStd$ActivityCode)
str(SXY_TrainTest_MnStd)        # ActivityDescription variable of SXY_TrainTest_MnStd dataset contains activity names 







### 5.Creates a second, independent tidy data set with the average & standard deviation of each variable for each activity and each subject
install.packages("plyr")
library(plyr)
SXY_TrainTest_MnStd$ActivityDescription <- factor(SXY_TrainTest_MnStd$ActivityDescription, 
                                           levels=c("WALKING","WALKING UPSTAIRS","WALKING DOWNSTAIRS","SITTING","STANDING","LAYING"), ordered=T)
head(SXY_TrainTest_MnStd$ActivityDescription)
SXY_TrainTest_MnStd <- arrange(SXY_TrainTest_MnStd, ActivityCode)
str(SXY_TrainTest_MnStd)
Split_SXY_TrainTest_MnStd <- split(SXY_TrainTest_MnStd[ ,4:69], list(SXY_TrainTest_MnStd$ActivityDescription, SXY_TrainTest_MnStd$SubjectID))
Tidy_SXY_TrainTest_MnStd <- sapply(Split_SXY_TrainTest_MnStd, colMeans)
head(Tidy_SXY_TrainTest_MnStd)
Tidy_SXY_TrainTest_MnStd <- t(Tidy_SXY_TrainTest_MnStd)   # using t() in order to transpose the dataset in order to show the variable across columns
head(Tidy_SXY_TrainTest_MnStd)

getwd()
write.csv(Tidy_SXY_TrainTest_MnStd, file="TidyTrainTestData.csv", quote = FALSE, row.names=T)







