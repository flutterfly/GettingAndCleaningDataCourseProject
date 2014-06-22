Run_analysis ReadMe file
========================================================

When running this script, you will need to have the following files in your working directory:

        1. subject_test.txt
        2. subject_train.txt
        3. X_test.txt
        4. X_train.txt
        5. y_test.txt
        6. y_train.txt
        7. features.txt
        8. activity_labels.txt
        
The script performs the following tasks:

- combines the test and train data into one dataset, 
- subsets the data to only keep variables relating to mean and standard deviation (meanFreq variables are deleted)
- converts the activity numeric ids into their descriptive names (eg standing, sitting, etc),
- creates labels for the variables from the features.txt file, and makes the names R-friendly
- creates a tidy data set with the average of each variable for each activity and each subject

To run the script:
- Put the run_analysis.R file in your working directory
- On the command line, enter ```source("run_analysis.R")``` and hit enter
- On the command line, enter ```run_analyis.R```

The script will output two files in your working directory:

1. "all_data.txt" - the dataset created after implementing steps 1 through 4 of the course project instructions.
2. "tidy_data.txt" - the dataset created after implementing step 5 of the course project instructions.


