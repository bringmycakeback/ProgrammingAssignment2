## This assignment consists of two functions that, when used together, allow
## caching of matrix inversions.  To uses these functions, first call makeCacheMatrix()
## which creates a special matrix that will store the result of its inversions.
## Then call cacheSolve() on this special matrix.  The first time this function is called
## it will compute the inversion and store it in the cache.  On subsequent calls,
## the cached inversion will be used, providing the matrix has not changed


## makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  # i variable is cached inverse, which is initially set to NULL
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  
  # returned object is list of four getter/setter functions
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# cacheSolve function computes the inverse of the special
# matrix returned by makeCacheMatrix() above. If the inverse has
# already been calculated (and the matrix has not changed), then
# cacheSolve() should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  # First get the cached inverse
  i <- x$getinverse()
  
  # If the cached inverse is not NULL, it does not need to be recalculated
  if(!is.null(i)) {
    message("getting cached inverse")
    return(i)
  }
  
  # If the cached inverse is NULL, it needs to be calculated
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
