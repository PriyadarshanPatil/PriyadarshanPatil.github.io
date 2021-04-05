df<-read.csv(file = "Lab_1_dataset.csv",header = T)

summary(df)

df_san <- df[!(df$DIST_WALKED_DAILY<=0 | df$NUM_EATEN_OUTSIDE<10),]
