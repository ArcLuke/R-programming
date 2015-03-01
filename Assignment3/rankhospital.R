rankhospital <- function(state, outcome,num = "best") {
	
	##declaring variabkles
	result_column <- c()
	final_column <- c()
	result  <- c()
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
		stop("invalid outcome")
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
		## Check that state and outcome are valid	
		##get the rows belongs to the state 
	
		x <- data.frame(subset(outcome_data, (outcome_data$State == state)))
		
		if (nrow(x) == 0)
			{
				##if it's invalid state
				stop("Invalid state")
			}
		else
			{				
				col_num <- which( colnames(x)==outcome )
				
				##if there is no outcome for that exclude it 
				z <- data.frame(subset(x[,c(2,col_num)], (!is.na(as.double(x[,col_num])))))
				
				##ordering the data frame for ranking
				z <- z[order(as.double(z[,2]),z[,1],decreasing = FALSE),]	
				
				if (num == "best")
				{
					num =1
				}
				else if (num == "worst")
				{
					num =nrow(z)
				}
					
				##return the result
				z[num,"Hospital.Name"]
				
			}
		
	}
	
}
