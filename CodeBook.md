# Process

run_analysis.R completes the steps of the assignment in the following way:

* First, the plyr library is loaded and the "FileDirectory" variable is set to the location of the unzipped data files. You should change this variable to wherever this directory is on your hard drive.
* Next, run_analysis.R reads all test and train files, and combines them by type (X, y, subject) into Xall, Yall and Sall respectively.
* run_analysis.R then loads feature names, changes Xall's variable codes to the feature names, and sorts out all variables with mean and standard deviation variables. Once this is done, feature names are cleaned up a little for readability.
* Next the script loads the activity labels and replaces Yall's coded number values with the corresponding activity name.
* "Activity" and "subject" columns are then given proper names to reflect the values in those columns.
* A single unified data set called alldata is created, arranged first by subject, then activity type and finally the variable measurements in Xall.
* Finally using the ddplyr function, the alldata set is cleaned up and turned into meandata, which contains the average variable for each activity for each subject, and meandata.txt is written into the working directory.

# Variables

* `fileDirectory` is the directory of the unzipped folder on the disk drive.
* `Xtrain`, `Ytrain`, `Xtest`, `Ytest`, `Strain` and `Stest` contain data from the read files.
* `Xall`, `Yall` and `Sall` are merged data sets of the corresponding X, Y and S data read from the files.
* `features` contains the names for the variables in the `Xall` dataset.
* `featureSort` is a numeric vector that identifies which features in `Xall` contain mean or std information and is used to filter out irrelevant columns from `Xall`.
* `activitylabels` contains the activity names which are used to replace the coded numbers in the `Yall` dataset.
* `alldata` merges `Sall`, `Yall` and `Xall` into one dataset, with subject name and activity in the first two columns.
* `meandata` contains the tidy data set that is written into a .txt file for the assignment. The `ddply` function is used to generate this tiny dataset, and requires the `plyr` library.