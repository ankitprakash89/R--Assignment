library(dplyr)
dir<- "C:/Users/Administrator/Downloads/Assignment 2/OneDrive_2018-01-28" # stored as a string
complete<- function(directory, id){
  dir.files <- paste(dir, directory, sep="/")# for adding directory to the dir
  setwd(dir.files) # to set the working directory
  files<- list.files(pattern = '\\.csv') # to get the list of the names of the files present in the working directory 
  test<- data.frame() # used for stroing the monitor id and the nobs
  k<-1
  for(i in id)
  {
    temp <- read.csv(files[i], header = TRUE)
    test[k,1] <- i
    # below is the pipeline methodology to read get the nobs in each file as per the requirement
    test[k,2] <- count(temp[complete.cases(temp),])
    k = k+1
  }
  colnames(test) <- c("id","nobs")
  return(test) 
}
complete("specdata", 1)
complete("specdata", c(2,4,8,10,12)) 
complete("specdata", 30:25)
complete("specdata", 3)

