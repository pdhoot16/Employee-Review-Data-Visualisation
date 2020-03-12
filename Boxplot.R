library("RColorBrewer")

data <- read.csv("D:\\Data Visualization\\CA1\\employee_reviews cleaned.xlsb.csv")
head(data)



boxplot(data$overall.ratings~data$company, col=brewer.pal(n = 6, name = "Dark2"),
        main = "Overall Ratings" , horizontal = T, xlab = "Rating", ylab = "Company", outwex = 0.2)

boxplot(data$work.balance.stars~data$company,col=brewer.pal(n = 6, name = "Dark2"),
        main = "Work-Life Balance Ratings" , horizontal = T,xlab = "Rating", ylab = "Company")


boxplot(data$culture.values.stars~data$company,col=brewer.pal(n = 6, name = "Dark2"),
        main = "Culture Value Ratings" , horizontal = T, xlab = "Rating", ylab = "Company")


boxplot(data$carrer.opportunities.stars~data$company,col=brewer.pal(n = 6, name = "Dark2"),
        main = "Career Opportunity Ratings" , horizontal = T, xlab = "Rating", ylab = "Company")


boxplot(data$comp.benefit.stars~data$company,col=brewer.pal(n = 6, name = "Dark2"),
        main = "Company Benefit Ratings" , horizontal = T, xlab = "Rating", ylab = "Company")



boxplot(data$senior.mangemnet.stars~data$company,col=brewer.pal(n = 6, name = "Dark2"),
        main = "Senior Management Ratings" , horizontal = T,xlab = "Rating", ylab = "Company")



best_reply <- data[which.max(data$helpful.count),]
best_review <- paste0( "Job-Title: ",best_reply$job.title, sep = "\n",
                      "Company: ",best_reply$company, sep = "\n",
                     "Location: ",best_reply$location, sep = "\n",
                     "Date: ",best_reply$dates, sep = "\n",sep = "\n",
                     "Review: ",sep = "\n",
                     best_reply$summary,sep = "\n", sep = "\n",
                     "Pros: ",sep = "\n",
                     best_reply$pros, sep = "\n",sep = "\n",
                     "Cons: ",sep = "\n", 
                     best_reply$cons, sep = "\n",
                     "Advice To Management", best_reply$advice.to.mgmt, sep = "\n",sep = "\n",
                     "Helpful Count: ",best_reply$helpful.count, sep = "\n",sep = "\n",
                     "Rating:", sep = "\n",
                     "Overall: ", best_reply$overall.ratings, sep = "\n",
                     "Work Balance: ", best_reply$work.balance.stars, sep = "\n",
                     "Culture and Values: ",best_reply$culture.values.stars, sep = "\n",
                     "Career Opportunities: ",best_reply$carrer.opportunities.stars, sep = "\n",
                     "Company and Benefits: ", best_reply$comp.benefit.stars, sep = "\n",
                     "Senior Management: ",best_reply$senior.mangemnet.stars)
cat(best_review)


