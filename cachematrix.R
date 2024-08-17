## Put comments here that give an overall description of what your
## functions do
# This file functions cashes the value of matrix inverse
# value in order to save computation time

## Write a short comment describing this function
# Creates a special "vector", which is a list
# containing a function to:
#   1. set the value of the matrix
#   2. get the value of the matrix
#   3. set the value of the inverse
#   4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(mat_inverse) inv <<- mat_inverse
    getInverse <- function() inv
    list(
        set = set,
        get = get,
        setInverse = setmean,
        getInverse = getmean)
}


## Write a short comment describing this function
# Calculates the inverse of the special "matrix" created with
# makeCacheMatrix function, makes use of cashed values
# ASSUMPTION: x matrix value is invertible square matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if ( !is.null(inv) ) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
}