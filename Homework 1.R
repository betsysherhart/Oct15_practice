#Homework 1
#get current working directory
getwd()

#set working directory if necessary
#setwd("Documents/SDS 313")

#Import data
bonds <- read.csv('Homework1_Bonds.csv')

#Question 1

#show table of results carried(approved) vs. defeated
table(bonds$Result)

#need two-way table to compare bonds approved/defeated by government type
#table(bonds$Result,bonds$Type)
#in addition need proportion table of columns to find rate(percent carried(approved) vs. defeated) of approved bonds in each government type
prop.table(table(bonds$Result,bonds$Type),2)*100

#Question 2

#create new variable Votes_Total by adding votes "for" and "against" together
bonds$Votes_Total <- bonds$VotesFor + bonds$VotesAgainst

#show full row of bond with highest voter turnout to get data of the when, where, what of the bond
bonds[bonds$Votes_Total== max(bonds$Votes_Total),]

#Question 3

#Create subset that contains bonds approved and Votes_Total >= 100
bonds_approved_with100 <- bonds[bonds$Result=='Carried'& bonds$Votes_Total >= 100,]

#create new variable within the subset that gives the percentage of total votes that were approved for the bond measure
bonds_approved_with100$percentage_for <- bonds_approved_with100$VotesFor / bonds_approved_with100$Votes_Total * 100

#create graph(histogram) of the distribution of variable
hist(bonds_approved_with100$percentage_for,main='Histogram of Percentage of Votes For When a Bond is Approved',xlab='Percentage of Votes For',col='powderblue',xlim=c(50,100),ylim=c(0,700))

#describe distribution with the appropriate statistics...since skewed median and IQR
median(bonds_approved_with100$percentage_for)
IQR(bonds_approved_with100$percentage_for)

#Question 4

# Use subset to create graph to display relationship between cost (Amount) and margin approved by (percentage_for-50)
plot(bonds_approved_with100$Amount, bonds_approved_with100$percentage_for-50,,main='Cost and Margin Approved by',xlab='Cost (dollars)',ylab='Percent Margin Approved By',pch=20, col='mediumpurple')

#calculate descriptive statistic the correlation coefficient
cor(bonds_approved_with100$percentage_for,bonds_approved_with100$Amount)

bonds_approved_with100



