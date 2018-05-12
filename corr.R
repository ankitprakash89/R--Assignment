dir<- "C:/Users/Administrator/Downloads/Assignment 2/OneDrive_2018-01-28" # stored as a string
corr <- function(directory, threshold = 0) { 
  dir.files <- paste(dir, directory, sep="/")# for adding directory to the dir
  setwd(dir.files) #to set the working directory
  files<- list.files(pattern = '\\.csv') # to get the list of the names of the files present in the working directory
  i<-1
  case <- data.frame()
  k <- 1
  # forst loop is used to calculate the no of nobs in each file to check which is above threshold
  while (i<=332){
    data <- read.csv(files[i], header = TRUE) # used to read each file and store file id and nobs in a new dataframe called case
    complete_data <-data[complete.cases(data), ] #complete.cases also returns the nobs in the file
    nobs<- nrow(complete_data) 
    case[k,1] <- i
    case[k,2] <- nobs
    k <- k + 1
    i <- i + 1
  }
  colnames(case) <- c("id","nobs")
  fg<- case$id[case$nobs > threshold]
  k <- 1
  hj <- vector()
  for(i in fg){
    data <- read.csv(files[i], header = TRUE) # to read file where nobs are greater than the threshold value
    data <- data[complete.cases(data),]
    hj[k] <- cor(data$sulfate,data$nitrate)
    k <- k + 1
  }
  return(hj)
}  

df <- (corr("specdata",150))
head(df)
summary(df)
df <- (corr("specdata",400))
head(df)
summary(df)
df <- (corr("specdata",5000))
head(df)
summary(df)

