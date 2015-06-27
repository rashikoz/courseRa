pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  allReqDat<-c()
  for(i in id){
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
    if(pollutant == "sulfate"){
      reqData<-data[2]
    }else{
      reqData<-data[3]
    }
    allReqDat<-rbind(allReqDat,reqData)
 }
  #calculate the mean
  mean(allReqDat[!is.na(allReqDat)])
}