## This file contains two functions
##  * makeCahceMatrix: a wrapper around ordinary matrices that allows caching the inverse
##  * cacheSolve: either compute the inverse or return the cached value if already computed

## Create a 'special' matrix that can cache its inverse
## Return a list containing a function to 
##  * set/get the initial matrix
##  * set/get the cached inverse matrix
makeCacheMatrix <- function(x = matrix()) {
  cached_inverse <- NULL
  set <- function(y) {
    x <<- y
    cached_inverse <<- NULL
  }
  get <- function() x
  setinverse  <- function(inverse ) cached_inverse <<- inverse 
  getinverse  <- function() cached_inverse
  list(set = set, get = get,
       setinverse  = setinverse ,
       getinverse  = getinverse )
}

## Solve the matrix
##  * if the inverse is already computed, return the cache value
##  * otherwise: compute the inverse, set in the cache and return the inverse
cacheSolve <- function(x, ...) {
  inv  <- x$getinverse ()
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv  <- solve (data, ...)
  x$setinverse (inv)
  inv
}
