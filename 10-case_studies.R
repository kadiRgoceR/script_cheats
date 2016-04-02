# 0
library(foreign)
gss2012 <- read.spss("beginningR_data/GSS2012merged_R5.sav", to.data.frame = TRUE)
myWords <- paste0 ("word", letters [1:10])
vocabTest <- gss2012 [ myWords ]
head(vocabTest)
table(vocabTest[, myWords[1]], useNA = "ifany")

proportion_table <- function(x) {
  prop.table(table( x ) )
}
percents <- lapply(vocabTest, proportion_table)
do.call(rbind,percents)
# 1


