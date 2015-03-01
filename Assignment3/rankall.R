rankall <- function(outcome,num = "best") {
	
	##declaring variabkles
	result_column <- c()
	final_column <- c()
	x <- data.frame() 
	z <- data.frame() 
	hospital_name <- c()
	checkoutcome <-c("heart attack","heart failure","pneumonia") 

	## Read the raw data
	outcome_data <- read.csv("C:/Users/venkat hari/Documents/R Programming/rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv",
					   colClasses = "character")
	
	## convert into data frame for convenient coding
	outcome_data <- data.frame(outcome_data)
	
	##convert the outcome string particular column name 
	if (!outcome %in% checkoutcome)
	{
		stop("Invalid outcome")
	}
	else
	{
		if(length(grep(" ",outcome))>0)
			{
				outcome <- strsplit(outcome," ")[[1]]
				outcome <- paste(toupper(substring(outcome , 1,1)), substring(outcome , 2),sep="", collapse=" ")
				##find the character and replacement
				outcome  <- sub(" ",".", outcome )
			}
		else
			{
				outcome <- paste(toupper(substring(outcome , 1,1)), substring(outcome , 2),sep="", collapse=" ")
				##find the character and replacement
				outcome  <- sub(" ",".", outcome )
			}	
		
		outcome <- paste("Hospital.30.Day.Death..Mortality..Rates.from",outcome,sep =".")
	
		col_num <- which(colnames(outcome_data)==outcome )
		
		##get the unique state names
		state <- sort(unique(outcome_data[,7]))
		
		for (i in 1:length(state))
		{
			x <- data.frame(subset(outcome_data, outcome_data$State == state[i] ))
			
			##order by col_name for ranking
			x <- x[order(as.double(x[,col_num]),x[,1],decreasing = FALSE,na.last=NA),]
			this.num =num
			if (this.num== "best")
			{
					this.num=1
			}
			else if (this.num== "worst")
			{
				this.num=nrow(x)
			}
			##get the hospital name
			hospital_name <- c(hospital_name,x[this.num,"Hospital.Name"])
		}
		##return the data frame
		data.frame(hospital=hospital_name,state=state,row.names=state)	
		
	}
}
