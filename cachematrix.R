## Assignment: Caching the Inverse of a Matrix

## Matrix inversion is usually a costly computation
## and their may be some benefit to caching the inverse of a matrix
## rather than compute it repeatedly
## (there are also alternatives to matrix inversion that we will not discuss here).
## Your assignment is to write a pair of functions that cache the inverse of a matrix.

## Write the following functions:
  
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

## Computing the inverse of a square matrix can be done with the solve function in R.
## For example, if X is a square invertible matrix, then solve(X) returns its inverse.

## For this assignment, assume that the matrix supplied is always invertible.


## START OF CODE

## Function makeCacheMatrix()
## Description:
##    1. Creates a special "matrix" object that can cache its inverse.
##    2. get()        : To get the original matrix.
##    3. setinverse() : To set its inverse (this will be used by cacheSolve() - i.e. Don't use this manually)
##    4. getinverse() : To get the inverse of the matrix.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
    
  }
  
  get <- function() x
    
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Function cacheSolve()
## Description:
##    1. This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##    2. If the inverse has already been calculated (and the matrix has not changed),
##       then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

## END OF CODE