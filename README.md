# Coursera-Course-Project-Week-4  Codebook

## The code is broken into sections with descriptions

The first section reads text files by using either read.csv or read.table and assigns them to a variable. Then it creates a data frame using the three variables and renames the variables to names from the "features" text file. 
It does this for two seperate tables: train and test. 

The second section takes the two data frames and merges them into one data frame using rbind. 

The third section finds the mean and standard deviation for each of the measurements. 

The fourth section uses the activity_labels text file to rename the activity variable data. 

The fifth section renames the variables with more desciptive names

The sixth section creates a new data set with the average of each variable for each activity and each subject and writes it to a table called dataSet2.txt. 

