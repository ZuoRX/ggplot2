rm(list=ls())
library(rJava)
library(xlsx)    
library(plyr)
library(dplyr) 
library(dtplyr)
library(openxlsx)
library(Hmisc)
library(ggplot2)
library(gcookbook)
library(tidyr) #数据转换包
library(splines) #数据差值包
library(maps)
library(sp)
library(RColorBrewer)
library(lattice) 
library(scatterplot3d)
library(gcookbook)
library(ggthemes)

#=========================三图并列================================
f3<-read.table("C:/Users/lenovo/Desktop/3.csv",header=T,sep = ",")
df1 <- f3 %>% gather("item",value,-1) %>% 
  bind_cols(data.frame(item_id=rep(1:7,3))) 
#使用tidyr和dplyr包进行数据转换

ggplot(df1,aes(x=item,y=value,fill=n))+
  theme_set(theme_few())+ 
  geom_bar(stat="identity",position = "dodge",width=0.8,color="white")+
  xlab("")+ylab("% reduction from BIGRU")+
  scale_y_continuous(breaks=seq(-1,0, 0.2),
                   labels = c("-100%","-80%","-60%","-40%","-20%","0%"),
                   limits = c(-1,0))+
  theme(legend.title=element_blank()) 


#=========================两图并列================================
f2<-read.table("C:/Users/lenovo/Desktop/2.csv",header = T,sep = ",")
df1 <- f2 %>% gather("item",value,-1) %>% 
  bind_cols(data.frame(item_id=rep(1:8,2))) 
#使用tidyr和dplyr包进行数据转换

ggplot(df1,aes(x=item,y=value,fill=n))+
  theme_set(theme_few())+ 
  geom_bar(stat="identity",position ="dodge",color="white")+
  xlab("")+ylab("")+
  theme(legend.title=element_blank()) 


#--
f2<-read.table("C:/Users/张凡/Desktop/2.csv",header = T,sep = ",")
df1 <- f2 %>% gather("item",value,-1) %>% 
  bind_cols(data.frame(item_id=rep(1:8,2))) 
#使用tidyr和dplyr包进行数据转换
pdf(file="C:/Users/张凡/Desktop/论文绘图/2.pdf")
ggplot(df1,aes(x=item,y=value,fill=n))+
  theme_set(theme_few())+
  geom_bar(stat="identity",position = "dodge",color="white")+
  xlab("")+ylab("")+
  theme(legend.title=element_blank()) 
dev.off()











f2<-read.table("C:/Users/lenovo/Desktop/2.csv",header = T,sep = ",")
names(f2)<-c("n","R-square","DA")

x<-barplot(as.matrix(f2[,2:3]), beside=T,  #横着并排还是堆叠
           col=brewer.pal(8,"Set1"),border="white",
           space=c(0.1,3),     #组间距离和 柱子之间的距离
           ylim = c(-0.04,1),
           cex.lab=1.2,
           legend.text=f2$n,
           args.legend=list(x="topright", cex = .6,ncol=2)
)

box(which="figure")

ggplot(f2,aes(x=n,y=DA))+
  geom_bar()   



#-----------------------------------------------------------------------#
f3<-read.table("C:/Users/lenovo/Desktop/3.csv",header=T,sep = ",")

x<-barplot(as.matrix(f3[,2:4]), beside=T,  #横着并排还是堆叠
           col=brewer.pal(7,"Set1"),border="white",
           space=c(0.1,3),     #组间距离和 柱子之间的距离
           ylim = c(-1,0),
           cex.lab=1.2,
           legend.text=f3$n,
           args.legend=list(x="bottomright", cex = .5,ncol=3),
           ylab = "% reduction from BIGRU"
           # axis(side = 2,at=c(0.0,-0.2,-0.4,-0.6,-0.8,-1.0),
           #      labels=c("0%","-20%","-40%","-60%","-80%","-100%"))
           #axisnames = T,
           #names.arg = as.matrix(f3[,2:4])
           #axis(1,labels=c("0%","-20%","-40%","-60%","-80%","-100%"),at=1:6,las=3)
)
box(which="figure")


