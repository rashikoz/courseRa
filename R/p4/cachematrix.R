## functions calculates the inverse of of invertible square matrix.If the inverse 
## is already calculated it is retreived from the cache.

## Function creates a  special matrix which consists of four functions
## wrapped in a list.

makeCacheMatrix <- function(x = matrix()) {
  # makeCacheMatrix: This function creates a special "matrix" object
  # that can cache its inverse.
  matInverse <- NULL
  # set the matrix
  set <- function(y) {
    x <<- y
    matInverse <<- NULL
  }
  # get the matrix
  get <- function() x
  # set the inverse
  setInverse <- function(invMatrix) matInverse <<- invMatrix
  # set the iverse
  getInverse <- function() matInverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## finds the inverse of matrix.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  ## cacheSolve: This function computes the inverse of the special
  ## matrix returned by makeCacheMatrix above. If the inverse has
  ## already been calculated (and the matrix has not changed), then
  ## cacheSolve should retrieve the inverse from the cache.
  
  # gets the inverse
  matInverse <- x$getInverse()
  # check if matrix inverse is already calculated
  # if calculated return it from cache
  if(!is.null(matInverse)) {
    message("getting cached data")
    return(matInverse)
  }
  # it is not there in the cache
  # hence calculate it using solve funtion
  # set it back to inverse 
  data <- x$get()
  matInverse <- solve(data, ...)
  x$setInverse(matInverse)
  matInverse 
}
