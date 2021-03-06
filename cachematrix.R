## These functions facilitate the calculation of the inverse of
## a matrix by providing for the caching of the inverse to be
## used if it already exists and the matrix has not changed.

## This function creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
           x <<- y
           inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) inv <<- solve
    getinv <- function () inv
    list( set = set, get = get,
          setinv = setinv, getinv = getinv)
}


## This function computes the inverse of the matrix.
## If the inverse has already been calculated and the matrix
## has not changed then it retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
              message("getting cached inverse")
              return(inv)
        }
        matrix <- x$get()
        inv <- solve(matrix)
        x$setinv(inv)
        inv
}
