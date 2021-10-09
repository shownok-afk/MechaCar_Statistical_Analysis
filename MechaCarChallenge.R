### DELIVERABLE 1

# Use the library() function to load the dplyr package.
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a data frame.
library(tidyverse)
m_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

# Perform linear regression using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=m_mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=m_mpg)) 


### DELIVERABLE 2

# Import and read in the Suspension_Coil.csv file as a table.
S_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

# Create a total_summary data frame using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil's PSI column.
total_summary <- S_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI),.groups = 'keep')

# Create a lot_summary data frame using the group_by() and the summarize() functions to group each manufacturing lot.                                                                
lot_summary <- S_Coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI),.groups = 'keep')


### DELIVERABLE 3

# Use t.test() to determine if the PSI across ALL lots is statistically different from the pop. mean of 1,500 PSI.
t.test(S_Coil$PSI,mu=1500)


#2. Use t.test() function 3 more times with subset() to determine if PSI for each manufacturing lot is statistically different from the pop. mean of 1,500 PSI
t.test(subset(S_Coil,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

t.test(subset(S_Coil,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

t.test(subset(S_Coil,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)
