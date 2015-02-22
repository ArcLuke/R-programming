###makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
###cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
	  If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.



###Execution

>func <- makeCacheMatrix()
>summary(func)
>func$set(matrix(1:4, nrow = 2, ncol = 2) )
>func$get()
>cacheSolve(func)

or 

>func <- makeCacheMatrix(1:4, nrow = 2, ncol = 2) )
>summary(func)
>func$get()
>cacheSolve(func)


###when we run the function, we get the cached value
cacheSolve(func)
