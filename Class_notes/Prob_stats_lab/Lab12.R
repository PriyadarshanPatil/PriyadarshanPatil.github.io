# define our hypotheses and confidence level
# H_0: xbar = mu_0, the mean distance walked is the same as last year
# H_a: xbar =/= mu_0, the mean distance walked is not the same as last year
mu_0 = 5 # the mean distance walked last year is 5 miles
alpha = 1-.95

# read csv
df = read.csv(file = 'Lab_12_dataset.csv', header=1)
summary(df)

# keep only reasonable values
dists_good = df$DIST_WALKED[df$DIST_WALKED>=0]

# setup and find the test statistic
xbar = mean(dists_good)
s = sd(dists_good)
n = length(dists_good)
tstat = (xbar-mu_0)/(s/sqrt(n))

### TWO-SIDED HYPOTHESIS TEST ###

# compare against 95% confidence interval assuming a normal distribution
zlow = qnorm(alpha/2)
zhigh = qnorm(1-alpha/2)
print(c(zlow, tstat, zhigh))

# alternatively you could put the mean and sd directly into
# the qnorm function without calculating a tstat
zlow_nonstandard = qnorm(alpha/2, mean=mu_0, sd=sd(dists_good)/sqrt(n))
zhigh_nonstandard = qnorm(1-alpha/2, mean=mu_0, sd=sd(dists_good)/sqrt(n))
print(c(zlow_nonstandard, xbar, zhigh_nonstandard))

# compare against 95% confidence interval assuming a t-distribution
df = n-1
tlow = qt(alpha/2, df)
thigh = qt(1-alpha/2, df)
print(c(tlow, tstat, thigh))


### ONE-SIDED HYPOTHESIS TEST ###
# redefine our alternative hypothesis 
# H_a: xbar > mu_0, the mean distance walked is greater than last year

# compare against 95% confidence interval assuming a normal distribution
zcutoff = qnorm(1-alpha)
print(c(tstat, zcutoff))

# again without calculating the test statistic
zcutoff_nonstandard = qnorm(1-alpha, mean=mu_0, sd=sd(dists_good)/sqrt(n))
print(c(xbar, zcutoff_nonstandard))

# compare against 95% confidence interval assuming a t-distribution
tcutoff = qt(1-alpha, df)
print(c(tstat, tcutoff))

