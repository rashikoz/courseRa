rankall <- function(outcome, num="best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  fPath <- file.path(getwd(),"outcome-of-care-measures.csv")
  data<-read.csv(fPath,header = TRUE,colClasses = "character")
  stateList<-data["State"]
  state<-unique(stateList)
  state<-state[order(state[1]),]
  if(outcome == "heart attack"){
    colSelect = 11
  }else if(outcome =="heart failure"){
    colSelect = 17
  }else if(outcome =="pneumonia"){
    colSelect = 23
  }else{
    stop("invalid outcome\n")
  }
  
  hospital <- c() 
  for(iRun in seq(1,length(state),by = 1)){
  
    curState <- state[iRun]
    stIndex<-which(stateList == curState)
    reqData <- data[stIndex,]
    reqData<-reqData[order(as.numeric(reqData[,colSelect]),reqData[,2],na.last = TRUE), ]
    if(num == "best"){
      hName<-reqData[1,"Hospital.Name"]
    }else if(num =="worst"){
      hName<-reqData[nrow(reqData),"Hospital.Name"]
    }else if(num <= nrow(reqData)){
      hName<-reqData[num,"Hospital.Name"]
    }else{
      hName<-"NA"
    }
    hospital<-c(hospital,hName)       
  }
  dataFrame<-data.frame(state,hospital,row.names = state)
  return(dataFrame)
}
