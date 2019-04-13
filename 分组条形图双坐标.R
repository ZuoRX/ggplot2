library(plotrix)

Date <- seq(from=as.Date('2015-01-01'), to=as.Date('2015-12-01'),
            by='month')
Consumers <- c(100,80,120,153,200,188,220,322,300,321,282,304)
Amount <- c(1000,840,1458,1844,2045,2000,2548,5081,5000,5200,4800,4971)
df1 <- data.frame(Date=Date, Consumers=Consumers,Amount=Amount)

twoord.plot(lx=df1$Date, ly=df1$Consumers,
            rx=df1$Date,ry=df1$Amount,
            main='双轴的两条线图',xlab='月份', ylab='会员人数', 
            rylab='总消费额', type=c('l','l'))



























































