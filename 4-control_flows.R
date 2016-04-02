          ###Loops
i <- 1
while (i <= 10) {
  i <- i+4
}
i <- 1
while(TRUE) { # similar loop to above
    i <- i+4
    if (i > 10) break
}
i <- 1
repeat { # again similar
    i <- i+4
    if (i > 10) break
}
ls()
ls.str()
?get
z <- NULL
for (i in 1:10) if (i %%2 == 0) z <- c(z,i)

#ifelse
x <- 1:10
y <- ifelse(x %% 2 == 0, 5, 12)
ifelse(x > 6,2*x,3*x)
args(ifelse)
g <- c("M", "F", "F", "I", "M", "M", "F")
ifelse(g == "M",1,ifelse(g == "F",2,3))

grps <- list()
for (i in c("M","F","I")) grps[[i]] <- which(g==i)
grps

x <- c(1:10)
y <- c(5:14)
all(x == y)
identical(x,y) # type must be too equal
