
dir<- "C:/Users/Administrator/Downloads/Assignment 2/OneDrive_2018-01-28"

pollutantmean <- function (directory, pollutant, id = 1:332)
{
  dir.files <- paste(dir, directory, sep="/") # for adding directory to the dir
  setwd(dir.files) # to set the working directory
  files<- list.files(pattern = '\\.csv') # to get the list of the names of the files present in the working directory
  monitor_mean<-data.frame() # null data set to store the id and mean of the pollutant
  k <- 1
  for (i in id){
    temp <- read.csv(files[i], header = TRUE) # a temporary dataframe used to get the data of the file required
    monitor_mean[k,1] <- i
    j<-1
    while(j<= nrow(temp))
    {
      if(pollutant=="sulfate" ) # to check the pollutant that is passed through the function
        monitor_mean[k,2] <- mean(temp$sulfate, na.rm=TRUE)
      else
        monitor_mean[k,2] <- mean(temp$nitrate, na.rm=TRUE)
      j<-j+1
    }
    k <- k+1
  }
  return(monitor_mean) #will return the monitor_mean after all the required files have been read
  
}

pollutantmean("specdata", "sulfate", 1:10)

