rankhospital <- function(state, outcome, num) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
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
  
  #reqDataFrame <-data.frame(reqData["Hospital.Name"],reqData[[colSelect]])
  reqData<-reqData[order(as.numeric(reqData[,colSelect]),reqData[,2],na.last = NA), ]
  if(num == "best"){
    rankSelect = 1
  }else if(num =="worst"){
    rankSelect = nrow(reqData)
  }else if(num <= nrow(reqData)){
    rankSelect = num
  }else{
    rankSelect = num
    #stop("invalid \n")
  }
  return(reqData[rankSelect,"Hospital.Name"])
  
}