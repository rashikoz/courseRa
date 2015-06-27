corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ids<-1:332
  corrArray<-c()
  dFrame<-complete(directory,ids)
  for(i in 1:nrow(dFrame)){
    reqVal<-dFrame[i,2]
    if(reqVal>threshold){
      
      fName<-as.character(dFrame[i,1])
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
      dataSulph<-data[numCom,2]
      dataNit<-data[numCom,3]
      corVal<-cor(dataSulph,dataNit)
      corrArray<-c(corrArray,corVal)
    }
  }
  return(corrArray)  
}