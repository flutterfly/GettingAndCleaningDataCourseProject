run_analysis <- function(){
        
        ## Read the data files into R data frames.
        subject_test <- read.table("subject_test.txt")
        X_test <- read.table("X_test.txt")
        y_test <- read.table("y_test.txt")
        
        subject_train <- read.table("subject_train.txt")
        X_train <- read.table("X_train.txt")
        y_train <- read.table("y_train.txt")
                
        ## Convert the numeric activity descriptors to names.
        act_labels <- read.table("activity_labels.txt", as.is=TRUE)
        for(i in 1:nrow(y_test)) {
                actNum <- y_test[i,1]
                actName <- act_labels[actNum,2]
                y_test[i,1] <- actName
        }
        
        for(i in 1:nrow(y_train)) {
                actNum <- y_train[i,1]
                actName <- act_labels[actNum,2]
                y_train[i,1] <- actName
        }
                
        ## Bind the six data frames into one data frame. 
        
                ## Column bind the test data.
                test_data <- cbind(subject_test,y_test,X_test)
                ## Column bind the train data.
                train_data <- cbind(subject_train,y_train,X_train)
                ## Row bind the text and train data.
                all_data <- rbind(test_data,train_data)
                
        ## Read the features text file in for later use in assigning 
        ## description variable names. Use as.is=TRUE to prevent the strings
        ## from being read in as factors.
        features <- read.table("features.txt", as.is=TRUE)
        
        ## Convert the features object to a character vector.
        featuresChar <- features[,2]
                
        ## Assign descriptive variable names to the data frame columns.
        colnames(all_data) <- c("Subject","Activity",featuresChar)
                
        ## Extract only measurements on the mean and standard deviation
        ## for each measurement.
        
                DCols <- colnames(all_data)
                M_SD <- grep("Subject|Activity|[Mm]ean\\(|[Ss]td\\(",DCols)
                all_data <- subset(all_data,select=M_SD)
        
        ## Make the variable names from features syntactically valid.
        colnames(all_data) <- make.names(colnames(all_data))
        
        ## Create a second, independent tidy dataset with an average of each 
        ## variable for each activity and each subject.
        
        melt_data <- melt(all_data,id=c("Subject","Activity"))
        tidy_data <- dcast(melt_data, Subject + Activity ~ variable, mean)
        
        ## Output the data frame to a text file.
        write.table(all_data,"all_data.txt", row.names=FALSE) 
        
        # Output the tidy data frame to a text file.
        write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
        
}