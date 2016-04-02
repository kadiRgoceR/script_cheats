### Further programming with R pdf class notes
oddcount <- function(x) {
  sum(x %% 2 == 1)
}
oddcount2 <- function(x) {
  k <- 0
  for (i in 1:length(x) ){
    if(x[i] %% 2 ==1){
      k <- k + 1
    }
  }
  return (k)
}

x <- 1:10
oddcount(x)
oddcount2(c(1,2,3,7,9))

library(microbenchmark)
microbenchmark(
  oddcount(100000),
  oddcount2(100000)
)

x <- c(1,0,0,1,1,1,0,1,1)
x <- round(runif(1000,0,1))
findruns <- function(x) {
  runs <- as.integer()
  for(i in 1:(length(v)-1) ) {
    if(x[i] == 1 & x[i+1] == 1){
      runs <- c(runs,i)
    }
  }
  return(runs)
}
findruns(x)

findruns2 <- function(x,k) {
  n <- length(x)
  runs <- NULL
  for (i in 1:(n-k+1)) {
    if (all(x[i:(i+k-1)]==1)) runs <- c(runs,i)
  }
  return(runs)
}

findruns3 <- function(x,k) {
  n <- length(x)
  runs <- vector(length=n)
  count <- 0
  for (i in 1:(n-k+1)) {
    if (all(x[i:(i+k-1)]==1)) {
      count <- count + 1
      runs[count] <- i
    }
  }
  if (count > 0) {
    runs <- runs[1:count]
  } else runs <- NULL
  return(runs)
}

microbenchmark(
  findruns(x),
  findruns2(x,2),
  findruns3(x,2)
)


function(x,c) {
  if (length(c) != 1) stop("vector c not allowed")
  return((x+c)^2)
}


###apply
z <- matrix(1:6,3,2)
z
library(microbenchmark)
microbenchmark(
  colMeans(z),
  apply(z,2,mean)
)

f <- function(x) x/c(2,4)
apply(x,2,f) 

x <- matrix(round(runif(20)),4,5)
copymaj <- function(rw,d){
  maj <- sum(rw[1:d]) / d
  return(if(maj > 0.5) 1 else 0)
}

apply(x, 1, copymaj,3) ###looks first 3 element in row and gives 1 or zero

x <- matrix(round(runif(16,0,10)),4,4)
mind <- function(d) {
  n <- nrow(d)
  # add a column to identify row number for apply()
  dd <- cbind(d,1:n)
  wmins <- apply(dd[-n,],1,imin)
  # wmins will be 2xn, 1st row being indices and 2nd being values
  i <- which.min(wmins[2,])
  j <- wmins[1,i]
  return(c(d[i,j],i,j))
}
# finds the location, value of the minimum in a row x
imin <- function(x) {
  lx <- length(x)
  i <- x[lx] # original row number
  j <- which.min(x[(i+1):(lx-1)])
  k <- i+j
  return(c(k,x[k]))
}

diag(x) <- x[lower.tri(x)] <- Inf

minda <- function(d) {
  smallest <- min(d)
  ij <- which(d == smallest,arr.ind=TRUE)
  return(c(smallest,ij))
}

library(microbenchmark)
microbenchmark(
  mind(x),
  which(x == min(x), arr.ind = TRUE),
  minda(x)
)






text <- scan("testconcorda.txt", "")
T <- list()
i <- 1
k <- 1

findwords <- function(textFile){
  T <- list()
  for(i in 1: length(textFile)){
    word <- textFile[i]
    ind <- which(word == text)
    if(!(word %in% names(T)) ) {
      T[[word]] <- ind
    }
    
  }
  return(T)
  
}

findwords2 <- function(textFile) {
  # read in the words from the file, into a vector of mode character
  wl <- list()
  for (i in 1:length(textFile)) {
    wrd <- textFile[i] # ith word in input file
    wl[[wrd]] <- c(wl[[wrd]],i)
  }
  return(wl)
}

microbenchmark (
  findwords(text),
  findwords2(text)
)

x <- 1:8
z12 <- function(z) return(c(z,z^2))
z12(x)
sapply(1:8,z12)
lapply(list(1:3,25:29),median)
sapply(list(1:3,25:29),median) # does the same only vector...
T <- findwords2(text)



BMI <- function() {
  cat (" Please enter your height in Meters","\n")
  height <- as.numeric ( readline (" height = "))
  bmi <- c(18.5,24.9)
  cat (" According to the National Heart, Lung, and Blood Institute,","\n")
  cat("For a normal body mass index: which means between",bmi[1], " and", bmi[2],"\n")
  ideal_weight <- round(bmi * (height^2))
  cat (" your weight should be in the interval: ",ideal_weight[1],"-",ideal_weight[2],"\n")
}

BMI()

test <- function(x, y, ...) {
  print(x)
  args = list(...)
  print(args)
  if ("z" %in% names(args)) 
    print(args$z)
}

foo <- function(x) {
  cl <- match.call()
  ans <- x + 2
  attr(ans, "funname") <- as.character(cl[[1]])
  ans
}
?match.call
foo(123)
z <- foo(123)
z
attributes(z)

XX <- list(1:3, 2:4,4:7)
#lapply
(ans <- lapply(XX, function(x){c(summary(x), cv=sd(x)/mean(x))}))
do.call(rbind, ans)
#sapply
(ans <- sapply(XX, function(x){c(summary(x), cv=sd(x)/mean(x))}))
#tapply
XX2 <- unlist(XX)
gg <- c(1,1,1,2,2,2,3,3,3,3)
(ans <- tapply(XX2, gg, function(x){c(summary(x), cv=sd(x)/mean(x))}))
#mapply
mapply(function(x,y,z){x+y+z}, x=1:3, y=c(10,20,30), z=100, SIMPLIFY=FALSE)

head(cars)
X <- model.matrix(~speed+I(speed^2)+I(speed^3)+I(speed^4), data=cars)
y <- cars$dist
lsfit1 <- function(X, y){
  solve(t(X) %*% X) %*% t(X) %*% y
}
Rprof()
for (ii in 1:10000) lsfit1(X,y)
Rprof(NULL)
rr<-summaryRprof()
rr$by.self

class(`[`)
class("[")
typeof(`[`)
typeof(ls)

x <- 1:10
names(x)  <- LETTERS[1:10]
x
sum(x) # it is a vector
x["C"] # with name
x[["C"]] # without name

