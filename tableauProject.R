library(dplyr)
data<-read.csv(file.choose())
View(data)
data
winner_list<-data[data$WINNER==1,]
seatindex<-c(1:539)
winner_list$SeatIndex<-seatindex
winner_list<-winner_list[,c(20,1:19)]
#checking all the NA values in the Dataset
Na_val<-which(!complete.cases(winner_list))
#Changing All the NA values with 0
winner_list[is.na(winner_list)]<-0

#splitting the Data
first_column_split<-winner_list[,1:6]
second_column_split<-winner_list[,c(1,6:12)]
third_column_split<-winner_list[,c(1,12:20)]

third_column_split<-select(third_column_split,-3,-4)
write.csv(winner_list,"WinnerLokSabha.csv",row.names = FALSE)
write.csv(first_column_split,"1stTableau.csv",row.names = FALSE)
write.csv(second_column_split,"2ndTableau.csv",row.names = FALSE)
write.csv(third_column_split,"3rdTableau.csv",row.names = FALSE)
