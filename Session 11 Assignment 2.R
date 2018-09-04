getwd()
setwd("D:/acadgilds/rlecture")

library("readr")
bank_new = read.csv("bank-additional.csv", header = TRUE, na.strings = TRUE, sep = ";")

## a. Is there any association between Job and default?
chisq.test(bank_new$job,bank_new$default)

## We reject the null hypothesis as the p value is very low. There is an association between Job and default.

## b. Is there any significant difference in duration of last call between people having housing loan or not?
chisq.test(bank_new$duration,bank_new$housing)

## We accept the null hypothesis as the p value is greater than 0.05.
## So there is no significant difference in duration of last call between people having housing loan and not.

## c. Is there any association between consumer price index and consumer?
chisq.test(bank_new$cons.price.idx)

## We accept the null hypothesis as the p value is 1. There is no association between consumer price index and consumer.

## d. Is the employment variation rate consistent across job types?

chisq.test(bank_new$nr.employed,bank_new$job)
## We reject the null hypothesis as the p value is very low. Hence the employment variation rate is consistent across job types

## e. Is the employment variation rate same across education?

chisq.test(bank_new$nr.employed,bank_new$education)

## We reject the null hypothesis as the p value is very low. Hence the employment variation rate is same across education.

## f. Which group is more confident? 
chisq.test(bank_new$job,bank_new$cons.conf.idx)

## We reject the null hypothesis as the p value is very low.
library(dplyr)
con = as.data.frame(bank_new$cons.conf.idx)
job = as.data.frame(bank_new$job)
new = data.frame(job, con)
grouped_df(new, job, drop = TRUE)
