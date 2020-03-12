install.packages("sentimentr")
install.packages("wordcloud2")
library(sentimentr)
library("tm")
library("wordcloud")
library("RColorBrewer")
library("wordcloud2")

reviewFile = read.csv("D:\\Data Visualization\\CA1\\employee_reviews cleaned.xlsb.csv",header = TRUE)
str(reviewFile)


#NetflixPro
netflixPro = reviewFile[which(reviewFile$company=='netflix',arr.ind = TRUE),'pros']
head(netflixPro)
z <- as.character(netflixPro)

docs <- Corpus(VectorSource(netflixPro))
inspect(docs)
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
docs <- tm_map(docs, stemDocument)


dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 20)
class(d)

set.seed(543)
wordcloud(words = d$word, freq = d$freq, min.freq = 20,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



