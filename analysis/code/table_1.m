%question 3 table 1
%import data of earning income and wealth as datand
%name x the quantile of 3 variables times 1000
x=quantile(datand,[0 0.01 0.05 0.1 0.2 0.4 0.6 0.8 0.9 0.95 0.99 1])./1000
%let x1 be the transpose of quantiles, so we can get each variable in a row
x1=transpose(x)

