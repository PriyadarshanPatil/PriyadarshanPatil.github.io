# read csv
df = read.csv(file = 'Lab_12_dataset.csv', header=1)
x = df$NUM_EATEN_OUTSIDE
y = df$DIST_WALKED_DAILY
plot(x,y)

### THE HARD WAY

# beta coefficients
beta_1 = cov(x,y)/var(x)
beta_0 = mean(y)-beta_1*mean(x)

# predicted
ypred = beta_0 + beta_1*x

# sse
sse = sum((y-ypred)**2)

# sst
sst = sum((y-mean(y))**2)

# r-squared
r2 = 1 - sse/sst

# graph it
plot(x,y)
abline(a=beta_0, b=beta_1)



### THE EASY WAY
model = lm(df$DIST_WALKED_DAILY~df$NUM_EATEN_OUTSIDE)
summary(model)
easy_sse = sum(model$residuals**2)

# graph it
plot(df$NUM_EATEN_OUTSIDE,df$DIST_WALKED_DAILY)
abline(model)
