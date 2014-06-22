CodeBook
========================================================

The script in run_analysis.R takes Samsung phone data and transforms it to a tidy dataset, as described below.

**Variables and Features**
________________________________________________________
The following description is paraphrased from the features_info.txt file in the source data as referenced in the section Source Data, below. 

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

>tBodyAcc-XYZ  
>tGravityAcc-XYZ  
>tBodyAccJerk-XYZ  
>tBodyGyro-XYZ  
>tBodyGyroJerk-XYZ  
>tBodyAccMag  
>tGravityAccMag  
>tBodyAccJerkMag  
>tBodyGyroMag  
>tBodyGyroJerkMag  
>fBodyAcc-XYZ  
>fBodyAccJerk-XYZ  
>fBodyGyro-XYZ  
>fBodyAccMag  
>fBodyAccJerkMag  
>fBodyGyroMag  
>fBodyGyroJerkMag  

The set of variables that are summarized by ```run_analysis()``` for each of these features are:

mean(): Mean value  
std(): Standard deviation  

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





