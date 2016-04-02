z <- c(5,2,-3,8)
z[z*z > 8]

x <- c(12,15,8,11,24)
y <- x[-1] - x[-length(x)] # avoid loop, diffrences
x[x > 3] <- 0

x <- matrix(1:8, ncol = 4, nrow = 2)
x[x[,2] >= 4,]
z <- c(5,12)
x[z %% 2 == 1,]

#returns a matrix or dataframe, not vector
r <- x[2,, drop=FALSE]
x <- df[2:3,2,drop=FALSE]

subset(mtcars, am == 1, select = mpg : disp)

