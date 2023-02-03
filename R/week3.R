#Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import and Cleaning
raw_df<-read.csv("data/week3.csv")
raw_df$timeStart<-as.POSIXct(raw_df$timeStart,format = "%Y-%m-%d %H:%M:%S")
raw_df$timeEnd<-as.POSIXct(raw_df$timeEnd,format = "%Y-%m-%d %H:%M:%S")
clean_df<-raw_df[-(1:6),]
clean_df<-clean_df[clean_df$q6 == 1,]

#Analysis
clean_df$timeSpent<-difftime(clean_df$timeEnd, clean_df$timeStart,units = "secs")
hist(clean_df$timeSpent<-as.numeric(clean_df$timeSpent, units = "secs"))
frequency_tables_list <-lapply(clean_df[,5:14], table)
lapply(frequency_tables_list,barplot)
sum(clean_df$q1 >= clean_df$q2 & clean_df$q2!= clean_df$q3)
for (i in 1:length(frequency_tables_list)) {
   barplot(frequency_tables_list[[i]])}