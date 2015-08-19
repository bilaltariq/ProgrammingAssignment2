##The code below is quiet simple. The function below create an object that stores a matrix and cache its inverse.
# function makeCacheMatrix takes an argument matrix x
# get and set are used for normal matrix.
# getInverse and setInverse are used to return inverse of Matrix

makeCacheMatrix <- function(x = matrix()) {
#null value for m
m <- NULL 
  
#set function
	set <- function(y) 
	{
	x <<- y
	m <<- NULL
	}
  
#get function, returning x which is the Matrix
	get <- function() 
	{
    x
	}
  
#set the inverse of Matrix x
	setInverse <- function(inv)
	{
    m <<- inv
	}
  
#get the inverse of Matrix x
	getInverse <- function() 
	{
    m
	}
  
#building a list from all the functions that have being made above. The list is going to be used in "CacheSolve" function  
	list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}

#the function below calculates the inverse of Matrix that is saved in the special object create by makeCacheMatrix
#If the inverse is already calculated then the funtion will only retrive the inverse of the matrix from getInverse function.

cacheSolve <- function(x, ...) 
{
#saving the Matrix in m via the getInverse function.
m <- x$getInverse() 

#if m is not empty, the inverse is going to be return. Otherwise, it will not get into the condition.  
	if(!is.null(m)) 
    {
    message("getting cached data")
    return(m)
    }

# m is empty at this level. get() function will save the Matrix(Not the inverse one) into data.	
data <- x$get() 
  
#calculating the inverse of the Matrix by using a simple default function solve().
 m <- solve(data)

#setting this inverse for future use.   
x$setInverse(m)
 
#printing the Inverse of Matrix 
m
}
