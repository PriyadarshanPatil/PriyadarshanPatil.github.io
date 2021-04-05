#R fucntions
vec_5 = c(1,3,5,8,15)
mean_vec_5 = mean(vec_5)
print(mean_vec_5)

stdev_vec_5 = sd(vec_5)
print(stdev_vec_5)

#Let us make a sequence in a vector
vec_seq = c(1:5)
mean_s = mean(vec_seq)
var_s = var(vec_seq)

#More vector manipulation
vec_seq = vec_seq+5
#How do linear transformations to base data affect the mean and variance?
mean_s_new = mean(vec_seq)
var_s_new = var(vec_seq)
#What do you observe?

#Download the csv file from the files tab in the lab section page on canvas
#People->Groups->Your lab section->Files
#Set your working directory to wherever your csv file is
setwd("SET YOUR DIRECTORY ADDRESS HERE")
#Read the csv file. What do all these commands mean?
new_data = read.csv("Lab_1_dataset.csv",header = TRUE)
#Head command shows the first 6 lines of your dataset, regardless how large it actually is.
#you can make it show different number of rows
head(new_data)

mean_new_data = mean(new_data$NUM_EATEN_OUTSIDE)
#Why is $NUM_EATEN_OUTSIDE needed?
#What's the variance?
#What's the median? mode?

#What about mode? There is no inbuilt function. What do you do?
install.packages('modes')
library(modes)
modes_new_data = modes(new_data$NUM_EATEN_OUTSIDE)

#Basic summary statistics
summary(new_data$NUM_EATEN_OUTSIDE)

#Now, let's do some basic plots
plot_data = read.csv("Lab_2_dataset.csv", header = TRUE, fileEncoding =  "UTF-8-BOM", check.names = FALSE )
data_2017 = plot_data$`2017`
hist(data_2017,col = rgb(0,167/255, 225/255), border = rgb(54/255,103/255,115/255), xlab = "Number of students", ylab = "Number of universities", main = "University enrolment numbers in 2017")
#What do all these commands mean? Let's go over them one by one
texas_data = plot_data[2,]
#What does this tell us about selecting specific elements?
texas_data = texas_data[2:6]
#What was the enrolment in UT Dallas in 2015? How'd you refer to that value?