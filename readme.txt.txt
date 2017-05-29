## Coursera Getting & Cleaning Data

This repo contains the following files

 * run_analysis.R: This is the main script for merging the data files for this assignment.
 * codebook.md: Contains the codebook for variables used in this data set
 * readme.txt: Contains information about the run_analysis.R script


To run this code, follow these steps:
1) Acquire and unzip the source data into a folder on your directory. The source data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Download run_analysis.R
2a) If you haven't already, acquire the "plyr" package in R. This will be loaded automatically by 
the run_analysis.R script.

3) In the run_analysis.R script, set the "FileDirectory" variable to the location of the unzipped data
files. (By default this has been set to ".\rprog\CleanData\")

4) Execute run_analysis.R in your preferred R platform. The script will read the data files that were unzipped
and will output the file "meandata.txt" in your working directory. This file will contain the tidy data
set produced by the final step of the assignment.


For questions about the operation process and variable names in run_analysis.R please read the codebook.md file.