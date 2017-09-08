cd 'E:\Binghamton University\2017 Fall\As a Student\ECON 634 Advanced Macroeconomics\Homework\problem-set-1-floriankuhn\build_data\input'
SCF_data = readtable('SCFP2007.xlsx');
% Quantiles of the 2007 earnings, income and wealth distributions
inflation_07_13 = 0.124;
business_fraction = 0.863;
wageinc_raw = SCF_data(:,{'WAGEINC'});
wageinc = table2array(wageinc_raw)/inflation_07_13;
business_raw = SCF_data(:,{'BUSSEFARMINC'});
business = table2array(business_raw)/inflation_07_13;
earnings = wageinc + business_fraction * business;
earnings_quantile = quantile(earnings,[0 0.01 0.05 0.10 0.20 0.40 0.60 0.80 0.90 0.95 0.99 1]);
income_raw = SCF_data(:,{'INCOME'});
income = table2array(income_raw)/inflation_07_13;
income_quantile = quantile(income,[0 0.01 0.05 0.10 0.20 0.40 0.60 0.80 0.90 0.95 0.99 1]);
wealth_raw = SCF_data(:,{'NETWORTH'});
wealth = table2array(wealth_raw)/inflation_07_13;
wealth_quantile = quantile(wealth,[0 0.01 0.05 0.10 0.20 0.40 0.60 0.80 0.90 0.95 0.99 1]);

% Coefficients of variation
cv_earnings = std(earnings)/mean(earnings);
cv_income = std(income)/mean(income);
cv_wealth = std(wealth)/mean(wealth);

% Variance of the logs
vl_earnings = var(log(earnings));
vl_income = var(log(income));
vl_wealth = var(log(wealth));

% Gini index
% £¿
% weight_raw = SCF_data(:,{'WGT'});
% weight = table2array(weight_raw)/inflation_07_13;
% [~,~,~] = gini(weight, earnings, true);
% [~,~,~] = gini(weight, income, true);
% [~,~,~] = gini(weight, wealth, true);

% Top 1%/lowest 40%
ratio_hl_earnings = quantile(earnings,0.99)/quantile(earnings,0.4); 
ratio_hl_income = quantile(income,0.99)/quantile(income,0.4); 
ratio_hl_wealth = quantile(wealth,0.99)/quantile(wealth,0.4); 

% Location of mean
% £¿

% Mean/median
ratio_mm_earnings = mean(earnings)/median(earnings);
ratio_mm_income = mean(income)/median(income);
ratio_mm_wealth = mean(wealth)/median(wealth);

