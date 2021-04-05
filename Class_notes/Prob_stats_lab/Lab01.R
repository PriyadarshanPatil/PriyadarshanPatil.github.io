#Defining variables
a = 1
b = 2
#Generally a good practice to have descriptive variable names, as shown below

#Performing basic arithmatic
sum_ab = a+b
#Printing something to the console
print (sum_ab)

#More arithmetic and printing
diff_ab = a-b
print (diff_ab)
prod_ab = a*b
print (prod_ab)
frac_ab = a/b
print (frac_ab)
#This is just a start. There are commands for pretty much all mathematical operations you know. 
#Use the help tab or google it.


#Let us have 5 numbers, 1,3,5,8,15
#The crude way of calculating mean is:
mean_5 = (1+3+5+8+15)/5
print(mean_5)

variance_5 = ((1-mean_5)^2 + (3-mean_5)^2 + (5-mean_5)^2 + (8-mean_5)^2 + (15-mean_5)^2 )/4
print(variance_5)

Stdev_5 = (Variance_5^0.5)
#What is the issue? Remember that capitalization matters
print(Stdev_5)

#Or, R does that for you using a function.
vec_5 = c(1,3,5,8,15)
mean_vec_5 = mean(vec_5)
print(mean_vec_5)

stdev_vec_5 = stdev(vec_5)
print(stdev_vec_5)

#Add 4 to every element of the vector

#Set your working directory to wherever your csv file is
setwd("SET YOUR DIRECTORY ADDRESS HERE")
new_data = read.csv("Lab_1_dataset.csv",header = TRUE)
head(new_data)
mean_new_data = mean(new_data$NUM_EATEN_OUTSIDE)
#Why is $NUM_EATEN_OUTSIDE needed?

#What about mode? There is no inbuilt function. What do you do?
install.packages('modes')
library(modes)
modes_new_data = modes(new_data$Data)

#Basic summary statistics
summary(new_data$NUM_EATEN_OUTSIDE)

#library(IPSUR)