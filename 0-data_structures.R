### Vectors
x <- seq(from = 1, to = 10, by = 1)
example(seq)
str(vec)
typeof(vec)
attributes(vec)
is.vector(vec)
x <- vec
is.atomic(x)
is.list(x)
rep(1:4, 1:4)
rnorm(10)
runif(10,4,7)
if (any(x > 2) ) print("yes")
if (all(x > 0) ) print("yes")

# integer, max: 2^31-1
x <- c(1L, 6L, 10L)
is.integer(x)
as.integer(2^31)
is.vector(x)
# double
x <- c(1, 2.5, 4.5)
typeof(x)
is.double(8.9)
is.vector(x)
# !
0.3 == 0.1 + 0.1 + 0.1

# logical
log_var <- c(TRUE, FALSE, T, F)
x <- c(9, 166)
(y <- (3 < x) & (x <= 10))
x <- c(FALSE, FALSE, TRUE)
as.numeric(x)
is.vector(x)

# character
x <- c("these are", "some strings", NA_character_)
chr_var <- c("these are", "some strings", NA)
is.character(chr_var)
ch <- c("a", 1)
is.vector(x)
u <- paste("abc","de","f")
v <- strsplit(u," ") # split the string according to blanks

# complex
x <- complex(5, real = 2, im = 6)
sqrt(as.complex(-1))
is.vector(x)
# raw
raw(3)
typeof(raw(3))

# What are the three properties of a vector, other than its contents?
typeof(sex)
length(sex)
attributes(sex)


# Factors
sex <- c("male", "male", "female", "male", "female")
sex <- factor(sex)
levels(sex)
table(sex)
unclass(sex)

Income <- c("High", "Low", "Average", "Low", "Average", "High", 
  "Low")
Income <- ordered(Income, levels = c("Low", "Average", "High"))
class(Income)
typeof(Income)
Income_numeric <- as.double(Income)
is.vector(sex)

ages <- c(25,26,55,37,21,42)
affils <- c("R","D","D","R","U","D")
tapply(ages,affils,mean)
d <- data.frame(list(gender=c("M","M","F","M","F","F"),age=c(47,59,21,32,33,24),income=c(55000,88000,32450,76500,123000,45650)))
d$over25 <- ifelse(d$age > 25,1,0)
#!
tapply(d$income,list(d$gender,d$over25),mean)
mean(d[d$gender == "M" & d$age > 25,]$income)
#!
split(d$income,list(d$gender,d$over25))
#!
by(d$income,d$gender,mean) # wie tapply but, for al objects ..

#tables
fl <- list(c(5,12,13,12,13,5,13),c("a","bc","a","a","bc","a","a"))
u <-1:7
tapply(u, fl, length)#u has the only length importance
t <- table(fl)
margin.table(t, 2)
prop.table(t, 1)
df <- c(5,12,13,4,3,28,12,12,9,5,5,13,5,4,12)
dtab <- table(df)
ind <- which(names(d) == "gender")
#!
aggregate(d[,-ind],list(d$gender),mean)
z <- sample(10,replace = TRUE) / 10
binmarks <- seq(from = 0, to = 1, by = 0.1)
cut(z,binmarks,labels=F)



      ### Dates and Timeseries
date()
today <- Sys.Date()
cat ( format (today , format = "%a, %B %d, %Y")," Happy New Year !", "\n")
temp <- c("12-09-1973", "29-08-1974")
# %d The day as a number, 
z <- as.Date(temp, "%d-%m-%Y")
class(z)
format(z, "%d-%m-%Y")
t2 <- as.POSIXct("2003-04-23 15:34")
x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- strptime(x, "%d%b%Y")
zt <- as.POSIXct(z)
class(z)
class(zt)
p <- as.POSIXlt(Sys.time())
names(unclass(p))
p$wday
p$sec

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03")
x <- paste(dates, times)
z <- strptime(x, "%m/%d/%y %H:%M:%S")
zt <- as.POSIXct(z)
weekdays(zt)
seq(as.POSIXct("2003-04-23"), by = "month", length = 12)
seq(ISOdate(1910,1,1), ISOdate(1999,1,1), "years")
myts2 <- ts(data = matrix(rnorm(100),ncol=2), start=c(1987,4), freq=12)
tsp(myts2)
        
### Strings
dir()
fisherSays <- readLines("fishersays.txt")
nchar(fisherSays)
#replace it...
sub("R. A. Fisher", "Jerzy Neyman", fisherSays)
grep("R. A. Fisher",fisherSays)
grepl("R. A. Fisher",fisherSays)

lang_domain <- "statistics"
lang_domain <- toupper(lang_domain)
substr(lang_domain, 3, 5)
gsub("I", "1", lang_domain) # substitutes every "I" for "1"
paste("R does", lang_domain, "!!!")


          
            ### Matrices
x <- matrix(1:8, ncol = 4, nrow = 2)
x * x
y <- c(1:4)
x * y #columnwise multiplication
str(1:3)                   # 1d vector
str(matrix(1:3, ncol = 1)) # column vector
str(matrix(1:3, nrow = 1)) # row vector
m <- matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)

         ### Arrays
b <- array(1:12, c(2, 2, 3))
typeof(b)
class(b)
attributes(b)
str(b)
dimnames(b) <- list(c("one", "two"), c("a", "b"), c("A", "B","C"))
# abind, aperm in package: abind
str(array(1:3, 3))         # "array" vector
l <- list(1:3, "a", TRUE, 1.0)
dim(l) <- c(2, 2)

firsttest <- matrix(sample(100,6),3,2)
secondtest <- matrix(sample(100,6),3,2)
tests <- array(data = c(firsttest,secondtest),dim=c(3,2,2))
tests[3,2,2] # nrow,col,arrayelement

          ###Data frames
kids <- c("Jack","Jill")
ages <- c(12,10)
df <- data.frame(kids,ages,stringsAsFactors=FALSE)
str(df)
row.names(df)
names(df)
df[[1]]
df[,1]
df$x


d5 <- d4[complete.cases(d4),]

### plyr::rbind.fill() can combine not same columns.
df <- data.frame(x = 1:3)
df$y <-  list(1:2, 1:3, 1:4)

roster <- read.csv("beginningR_data/roster - Copy.csv")
stackeData <- roster[,c("Jersey","Class")]
unstack(stackeData)

# convert columns named "First" and "Last"
stringcols <- c("First","Last")
data[stringcols] <- lapply(data[stringcols], as.character)



            ###List
j <- list(name="Joe", salary=55000, union=T)
#return as vector
j$salary
r <- j[["salary"]] ###creat with names...
typeof(r)
j[[2]]

#return as list
r <- j["salary"]
typeof(r)
j[2]

names(j)
k <- unlist(j)
unname(k)

x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
x[[c(1, 3)]]
x[[1]][[3]]
x[c(1, 3)]

x <- list(list(list(list())))
x
is.recursive(x)
x <- list(list(1, 2), c(3, 4))
x

y <- 1:10
attr(y, "my_attribute") <- "This is a vector"
y
str(attributes(y))
structure(1:10, my_attribute = "This is a vector")

y <- c(a = 1, 2, 3)
unname(y)
names(y) <- NULL

x <- list(aardvark = 1:5)
x$a
x[["a",exact = FALSE]]

