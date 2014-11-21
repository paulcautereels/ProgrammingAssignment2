source("cachematrix.R")

# create 2 regular matrices
m1 <- matrix(c(1,2,3,4), ncol=2, nrow = 2)
m2 <- matrix(c(2,3,2,3,2,2,2,2,3), ncol=3, nrow = 3)

# create the 2 caching version of these matrices
cm1 <- makeCacheMatrix(m1)
cm2 <- makeCacheMatrix(m2)

# take the inverse of each matrix twice
## the first time the inverse is calculated
## the second time the cached version is returned
print(cacheSolve(cm1))
print(cacheSolve(cm2))
print(cacheSolve(cm1))
print(cacheSolve(cm2))

