## These functions will calculate or cache the inverse of a matrix

## Creates a function whose output is a list of functions that
## sets/gets the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  inversematrix <- NULL
  set <- function(y) {
    x <<- y
    inversematrix <<- NULL
  }
  get <- function() {
    x
  }
  setinverse <- function(inverse) {
    inversematrix <<- inverse
  }
  getinverse <- function(){
    inversematrix
  }
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Calculates or Caches the inverse of a function

cacheSolve <- function(x, ...) {
  inversematrix <- x$getinverse()
  if(!is.null(inversematrix)) {
    message ("getting cached inverse of matrix")
    return (inversematrix)
  }
  data <- x$get()
  inversematrix <- solve(data, ...)
  x$setinverse(inversematrix)
  inversematrix
}
