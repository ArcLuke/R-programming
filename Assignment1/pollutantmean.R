pollutantmean <- function (directory,pollutant,id = 1:332) 
{	
	##Intialize the vector
	data <- c()

	##loop for the id vecto
	for (integer in id)
	{	
		##file location
		file_name <- paste(integer ,"csv",sep =".")
		full_directory <- paste(directory,file_name,sep ="/")
		
		x <- read.csv(full_directory)
		
		##getting particular column value 
		y<- x[,pollutant]
		bad<-is.na(y)
		y<-y[!bad]
		
		##appending all data into single vector
		data <- c(data, y)
	}
	##mean and rouding value
	round(mean(data),3)
}