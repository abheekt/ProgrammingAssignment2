## The functions here are used to cache the inverse of a matrix

## Create an instance of a matrix which also stores its inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse_matrix <- NULL
  set <- function(m){
    x <<- m
    inverse_matrix <- NULL
  }
  get <- function() x
  setinverse <- function(inv_mat) inverse_matrix <- inv_mat
  getinverse <- function() inverse_matrix
  list(set=set, get=get, setinverse = setinverse, getinverse=getinverse)
}


## Function to get the inverse of a matrix from cache (if it exists in cache)
## create the inverse and store in cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse_matrix <- x$getinverse()
    if(!is.null(inverse_matrix)){
      message("getting cached data")
      return(inverse_matrix)
    }
    data <- x$get
    inverse_matrix <- solve(x)
    x$setinverse(inverse_matrix)
    inverse_matrix
}
