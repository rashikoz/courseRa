complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  irun<-0
  nobs<-c()
  ids<-c()
  slNum<-c()
  for(i in id){
    irun <- irun + 1
    fName<-as.character(i)
    # build the file name
    if (nchar(fName) == 1){
      fName<-paste0("00",fName)      
    } else if (nchar(fName) == 2){
      fName<-paste0("0",fName)
    }else{
      # dont do anything
    } 
    fName<-paste0(fName,".csv")
    fPath <- file.path(getwd(),directory,fName)
    data<-read.csv(fPath)
    numCom <- ((!is.na(data[2])) & (!is.na(data[3])))
    numOfComplete <- length(numCom[numCom])
    nobs<-c(nobs,numOfComplete)
    ids<-c(ids,i)
  }
  dataFrame<-data.frame(ids,nobs)
  return(dataFrame)
}
  
  
  
