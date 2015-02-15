complete <- function(directory, id) 
{	
	##Intializing the variables 
	result  <- data.frame(id=numeric(0),nobs=numeric(0))
	file <- c()
	complete <- c() 
	
	##loop for the id vector
	for (integer in id)
	{	
		##file location
		file_name <- paste(integer ,"csv",sep =".")
		full_directory <- paste(directory,file_name,sep ="/")
		x <- data.frame (read.csv(full_directory))
		
		##hard coded
		##z <- data.frame(subset(x, ((!is.na(x[,2])) & (!is.na(x[,3])))))
		##file <- c(file,integer)
		##complete <- c(complete,nrow(z))	
		
		## complete.cases functionality
		z <- x[complete.cases(x),]
		file <- c(file,integer)
		complete <- c(complete,nrow(z))
	}
	result  <- data.frame(id=file,nobs=complete)
	print(result)     
}