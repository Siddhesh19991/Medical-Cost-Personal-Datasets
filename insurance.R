insurance <- read.csv("~/Downloads/insurance.csv")
train<-insurance[1:803,]
test<-insurance[804:1338,]
install.packages("ggplot2")
library(ggplot2)

g<-ggplot(insurance,aes(age,charges))+geom_point(aes(color=smoker))


cor(train$age,train$charges)

model<-lm(formula = "charges~smoker+age+sex+children+bmi+region",train)

new<-predict(model,test)

error<-cbind(test$charges,new)
error<-as.data.frame(error)

install.packages("DMwR")
library(DMwR)
regr.eval(error$V1,error$new)

plot(error$V1,type="l",col="red")
lines(error$new,type="l",col="green")


