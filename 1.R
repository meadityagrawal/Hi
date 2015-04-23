

library(e1071)
library(lubridate)

#read the data
train <- read.csv("train.csv",header=TRUE)
test <- read.csv("test.csv",header=TRUE)


#select relevant columns
train_cols<-train[,c(12:55)]
labels<-as.matrix(train[,56])
testdata<-test[,12:55]


#run support vector regression and predict on test data
fit<- svm(x=as.matrix(train_cols),y=labels,type="C-classification")
predictions<-as.data.frame(predict(fit,newdata=testdata))

#create submission file
submit<-as.data.frame(cbind(test[,1],predictions))
colnames(submit)<-c("Id","Prediction")
write.csv(submit,"submission.csv",row.names=FALSE,quote=FALSE)