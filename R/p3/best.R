best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  fPath <- file.path(getwd(),"outcome-of-care-measures.csv")
  data<-read.csv(fPath,header = TRUE,colClasses = "character")
  hdings<-names(data)
  stateList<-data["State"]
  stIndex<-which(stateList == state)
  if (length(stIndex) == 0 ){
    stop("invalid state\n")
  }else{
    reqData <- data[stIndex,]
  }
  
  if(outcome == "heart attack"){
    colSelect = 11
  }else if(outcome =="heart failure"){
    colSelect = 17
  }else if(outcome =="pneumonia"){
    colSelect = 23
  }else{
    stop("invalid outcome\n")
  }
    
  return(reqData[which.min(reqData[[colSelect]]),"Hospital.Name"])
}