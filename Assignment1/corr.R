corr <- function(directory, threshold = 0) {
	
	##getting complete task 
	id <- complete("specdata",1:10)
 	id <- subset(id, nobs > threshold)

	##initailizing vector
	corr <- c()
	
	for (integer in id[,1])
	{	
		file_name <- paste(integer ,"csv",sep =".")
		full_directory <- paste(directory,file_name,sep ="/")
		x <- data.frame (read.csv(full_directory))
		
		complete <- x[complete.cases(x),]
      	rowno <- nrow(complete)

       if( rowno >= threshold ) 
	 {           
		corr <- c(corr , cor(complete$nitrate, complete$sulfate) )
	 }
    }

    round(corr, 5)
}
