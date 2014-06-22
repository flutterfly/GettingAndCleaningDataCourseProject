CodeBook
========================================================

**Variables**
________________________________________________________
The following features are included in the dataset created by ```run_analysis()```. 

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

The set of variables that are included for each of these features are:

mean(): Mean value  
std(): Standard deviation  

For a description of how the original variables were collected and a technical description of the variables, see the source file features_info.txt (see below on where to download the source data).  

The tidy dataset created from ```run_analysis()``` presents the above variables for 30 subjects, across 6 activities for each subject (ie 180 rows of data).

**Source Data**
________________________________________________________

The source data was downloaded from the following website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**Transformations**
________________________________________________________
"y_test.txt" and "y_train.txt"" activity labels were numeric. The source file "activity_labels.txt gives English descriptors of the activities. The numeric labels were converted to English labels.

Datasets contained in the following source files were combined into one dataset:

        1. subject_test.txt
        2. subject_train.txt
        3. X_test.txt
        4. X_train.txt
        5. y_test.txt
        6. y_train.txt
        
The datasets were combined as follows:

- C-bind was performed on subject_test.txt, y_test.txt and X_test.txt to create a test dataset.
- C-bind was performed on subject_train.txt, y_train.txt and X_train.txt to create a train dataset.
- R-bind was performed on the test and train datasets created above to create an all_data dataset.

Any variables in the all_data dataset that did not relate to mean or standard deviation, were deleted. Variables relating to meanFreq were also deleted.

Column labels were created from the source file features.txt. These labels were made R-friendly with the R function ```make.names()```.

A tidy dataset, "tidy_data" was created from the all_data dataset by first melting all_data using the ```melt()``` function, and then by casting the dataset again using the R function ```dcast()```. 





