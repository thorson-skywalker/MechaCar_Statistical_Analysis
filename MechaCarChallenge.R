library(dplyr)

MC_mpg <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

head(MC_mpg)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance
   + AWD, data=MC_mpg) # create linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle
             + ground_clearance + AWD, data=MC_mpg)) # determine p-value and r-squared value

coil_data <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
head(coil_data)

total_summary <- coil_data %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

lot_summary <- coil_data %>%
  group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

t.test(log10(coil_data$PSI),mu=1500)

Lot1_table <- subset(coil_data, Manufacturing_Lot == 'Lot1')
Lot2_table <- subset(coil_data, Manufacturing_Lot == 'Lot2')
Lot3_table <- subset(coil_data, Manufacturing_Lot == 'Lot3')

t.test(Lot1_table$PSI, mu=1500)
t.test(Lot2_table$PSI, mu=1500)
t.test(Lot3_table$PSI, mu=1500)

