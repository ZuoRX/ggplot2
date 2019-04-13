AQI<-read.csv("c:/users/lenovo/desktop/AQI.csv")

a<-data.frame(AQI$TIME,AQI$AQI)
names(a)<-c("time","AQI")

ggplot(data=a, aes(x=time, y=AQI)) +
  geom_point(size=1) 
  


plot(AQI~time,data=a,type="l") #550,231

library(zoo)
plot(zoo(a$AQI,as.Date(a$time)), ylab="AQI",xlab="Date")
box(which="figure")


