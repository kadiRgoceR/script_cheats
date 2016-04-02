          #input

            #read from consol
newVector <- scan ()
# with dialog
myName <- readline(" What shall I call you ? ")

            #read from file
#scan
vector <- scan("beginningR_data/yvector - Copy.txt")
#read csv
data <- read.csv("datafile.csv", stringsAsFactors=FALSE)
#read table
read.table("clipboard", header=TRUE, strip.white=TRUE)
load("mydata.rda")
#binary form
unserialize() # for reading single R objects in binary form
dget() # for reading in R code files, inverse dput
source('mycode.R') # for reading in R code files (inverse of dump)
readLines() #for reading lines of a text file


#Outside World
file() # opens a connection to a file
gzfile() # opens a connection to a file compressed with gzip
bzfile() # opens a connection to a file compressed with bzip2
url() # opens a connection to a webpage

hsb2.small <- read.csv ("http://www.ats.ucla.edu/stat/data/hsb2_small.csv")
dat.tab <- read.table("http://www.ats.ucla.edu/stat/data/hsb2.txt", header=TRUE, sep = "\t")
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)

library(foreign)
# SPSS files
dat.spss <- read.spss("http://www.ats.ucla.edu/stat/data/hsb2.sav", to.data.frame=TRUE)
# Stata files
dat.dta <- read.dta("http://www.ats.ucla.edu/stat/data/hsb2.dta")

# these two steps only needed to read excel files from the internet
install.packages("xlsx")
library(xlsx)
f <- tempfile("hsb2", fileext=".xls")
download.file("http://www.ats.ucla.edu/stat/data/hsb2.xls", f, mode="wb")
dat.xls <- read.xlsx(f, sheetIndex=1)
head(dat.xls)


          #output
write.table() # for writing tabular data to text files (i.e. CSV) or connections
writeLines() # for writing character data line-by-line to a file or connection
dump(c("x", "y"), file = "data.R") #for dumping a textual representation of multiple R objects
dput(y, file = "y.R") # for outputting a textual representation of an R object
save(a, b, file = "mydata.rda")#for saving an arbitrary number of R objects in binary format 
x <- list(1, 2, 3)
serialize(x, NULL) # for converting an R object into a binary format for outputting to a connection 
save.image(file = "mydata.RData")


library(readr) # faster hadley


