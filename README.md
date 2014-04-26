### Introduction

This assignment consists of two functions that, when used together, allow
caching of matrix inversions.  To uses these functions, first call `makeCacheMatrix()`
which creates a special matrix that will store the result of its inversions.
Then call `cacheSolve()` on this special matrix.  The first time it is called
it will compute the inversion and store it in the cache.  On subsequent calls,
the cached inversion will be used, as long as the matrix has not changed

### Example: How to call these functions

```splus
# Make test matrix:

test_matrix <- rbind(c(1, -1/4), c(-1/4, 1))
test_matrix
```
```rout
## Output:
##       [,1]  [,2]
## [1,]  1.00 -0.25
## [2,] -0.25  1.00
```
```splus
# First, make the special matrix object

special_matrix <- makeCacheMatrix(test_matrix)

# Call cacheSolve() the first time on the special matrix:

cacheSolve(special_matrix)
```
```rout
## Output:
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
```
```splus
# Calling cacheSolve() a second time will used the cached inverse value:

cacheSolve(special_matrix)
```
```rout
## Output:
## getting cached inverse
##           [,1]      [,2]
## [1,] 1.0666667 0.2666667
## [2,] 0.2666667 1.0666667
```