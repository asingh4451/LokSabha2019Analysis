# LokSabha2019Analysis
Tableau Dashboard on Analysis of LokSabha2019 with Information about Education,Criminal Cases and Diversity of Members of Parliament
 ## [Dataset](https://www.kaggle.com/datasets/prakrutchauhan/indian-candidates-for-general-election-2019)
 ### Sample
 |STATE|CONSTITUENCY                 |NAME  |WINNER                                       |PARTY                             |SYMBOL        |GENDER|CRIMINAL CASES|AGE                  |CATEGORY|EDUCATION    |ASSETS                      |LIABILITIES               |GENERAL VOTES|POSTAL VOTES|TOTAL VOTES|OVER TOTAL ELECTORS  IN CONSTITUENCY|OVER TOTAL VOTES POLLED  IN CONSTITUENCY|TOTAL ELECTORS|
|-----|-----------------------------|------|---------------------------------------------|----------------------------------|--------------|------|--------------|---------------------|--------|-------------|----------------------------|--------------------------|-------------|------------|-----------|------------------------------------|----------------------------------------|--------------|
|Telangana|ADILABAD                     |SOYAM BAPU RAO|1                                            |BJP                               |Lotus         |MALE  |52            |52                   |ST      |12th Pass    |Rs 30,99,414  ~ 30 Lacs+    |Rs 2,31,450  ~ 2 Lacs+    |376892       |482         |377374     |25.33068419                         |35.4682479                              |1489790       |
|Telangana|ADILABAD                     |Godam Nagesh|0                                            |TRS                               |Car           |MALE  |0             |54                   |ST      |Post Graduate|Rs 1,84,77,888  ~ 1 Crore+  |Rs 8,47,000  ~ 8 Lacs+    |318665       |149         |318814     |21.39992885                         |29.96436953                             |1489790       |
|Telangana|ADILABAD                     |RATHOD RAMESH|0                                            |INC                               |Hand          |MALE  |3             |52                   |ST      |12th Pass    |Rs 3,64,91,000  ~ 3 Crore+  |Rs 1,53,00,000  ~ 1 Crore+|314057       |181         |314238     |21.09277146                         |29.53428505                             |1489790       |
|Telangana|ADILABAD                     |NOTA  |0                                            |NOTA                              |              |      |              |                     |        |             |                            |                          |13030        |6           |13036      |0.875022654                         |1.225214455                             |1489790       |
|Uttar Pradesh|AGRA                         |Satyapal Singh Baghel|1                                            |BJP                               |Lotus         |MALE  |5             |58                   |SC      |Doctorate    |Rs 7,42,74,036  ~ 7 Crore+  |Rs 86,06,522  ~ 86 Lacs+  |644459       |2416        |646875     |33.38382301                         |56.46461464                             |1937690       |
|Uttar Pradesh|AGRA                         |Manoj Kumar Soni|0                                            |BSP                               |Elephant      |MALE  |0             |47                   |SC      |Post Graduate|Rs 13,37,84,385  ~ 13 Crore+|Rs 2,22,51,891  ~ 2 Crore+|434199       |1130        |435329     |22.46639039                         |37.99912537                             |1937690       |
|Uttar Pradesh|AGRA                         |Preeta Harit|0                                            |INC                               |Hand          |FEMALE|0             |54                   |SC      |Post Graduate|Rs 5,50,75,753  ~ 5 Crore+  |Rs 0  ~                   |44877        |272         |45149      |2.330042473                         |3.940979148                             |1937690       |
|Maharashtra|AHMADNAGAR                   |Dr. SUJAY RADHAKRISHNA VIKHEPATIL|1                                            |BJP                               |Lotus         |MALE  |0             |37                   |GENERAL |Doctorate    |Rs 16,86,64,576  ~ 16 Crore+|Rs 26,23,964  ~ 26 Lacs+  |696961       |7699        |704660     |37.85653348                         |58.42515898                             |1861396       |
|Maharashtra|AHMADNAGAR                   |SANGRAM ARUNKAKA JAGTAP|0                                            |NCP                               |Clock         |MALE  |1             |34                   |GENERAL |Graduate     |Rs 9,44,88,381  ~ 9 Crore+  |Rs 3,25,49,132  ~ 3 Crore+|419364       |3822        |423186     |22.73487211                         |35.08743129                             |1861396       |

The Data Comprised of Candidates,Parties,Criminal Cases,Education,Voters in Constituency etc.

## Data Preprocessing
The Data PreProcessing of Selecting Winners Removing NA values and Splitting with Primary Key of Seat Index is Done in R
```
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
```
## Dashboard Overview
![Dashboard 1](https://github.com/asingh4451/LokSabha2019Analysis/assets/108614474/5343aed5-9801-4b6e-b89b-38151056ac4f)

## Link To Tableau Dashboard
[Dashboard](https://public.tableau.com/app/profile/abhijot.singh6547/viz/IndianLokSabhaElection/Dashboard1)
