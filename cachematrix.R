## The function makeCacheMatrix can be used to generate a new matrix.
## The matrix itself is contained in the scope of that function
## The first time an inverse is calculated also the inverse is stored in the same scope
## Future calculations of the inverse just recall the cached version

## makeCacheMatrix can be used to create a new matrix.  
## the following functions are available:
##  set: can be used to write the matrix
##  get: can be used to read the matrix back
##  setinv: store the inverse in the scope of this function
##  getinv: retrieve the inverse
  
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  mat <- x
  set <- function(y) {
    mat <<- y
    inv <<- NULL
  }
  get <- function() mat
  setinv <- function(i) inv <<- i
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## cacheSolve will calculate the matrix inverse
## the first time this function is called, it actually calculates the inverse and caches the result
## the next time the cached version is returned
cacheSolve <- function(x, ...) {
  inv <- x$getinv()
  # check if there is a cached inverse
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  # if not, calculate the inverse, store and return the result
  message("no cached inverse available, calculate it")
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  ## Return a matrix that is the inverse of 'x'
  inv
}