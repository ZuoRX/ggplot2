library(car)
library(xlsx)
library(devEMF)

iris1<-read.xlsx("c:/users/lenovo/desktop/zhixiang/Left kidney.xlsx",1,
                 check.names=T)

names(iris1)<-c("Age","Transverse.diameter.of.abdomen_mm",
                "p.left.kidney.","s.left.kidney.",
                "Renal.prone.to.supine.movement_mm",
                "Left.kidney.of.stones")
# iris1$`Left number of stones`[which(iris1$`Left number of stones`==0)]<-"with stones"
# iris1$`Left number of stones`[which(iris1$`Left number of stones`==1)]<-"without stones"

iris1$Left.kidney.of.stones[which(iris1$Left.kidney.of.stones==0)]<-"with stones"
iris1$Left.kidney.of.stones[which(iris1$Left.kidney.of.stones==1)]<-"without stones"

# text.legend<-c("without stone","with stone")
# col1=c("#817878","#272424")

# emf(file = "c:/users/lenovo/desktop/Rplot.emf", width = 8, height = 8,
#     bg = "transparent", fg = "black")
# win.metafile("c:/users/lenovo/desktop/Rplot-left.emf", height =30, 
#              width=30,pointsize = 23) 
# pdf("c:/users/lenovo/desktop/3Rplot-left8_8.pdf", width=8, height=8,
#     pointsize = 9.6)
pdf("c:/users/lenovo/desktop/1Rplot-left7_7.pdf", width=7, height=7,
    pointsize = 8.4)

spm(~Renal.prone.to.supine.movement_mm+ 
    Age+ Transverse.diameter.of.abdomen_mm|Left.kidney.of.stones,
    data = iris1, 
    pch=c(21,17),
    col=c("#817878","#272424"),
    legend.plot=T,
    legend.pos="topright",
    main='Scatterplot matrix of prone-to-supine left renal displacement, age, transverse diameter')

 # legend("top",pch=c(21,15),legend=text.legend,
 #        col=col1,bty="n",horiz=T,inset=.05,cex=0.7)

dev.off()
#help("pdf")
#--------------------------------------------#


iris2<-read.xlsx("c:/users/lenovo/desktop/zhixiang/Right kidney.xlsx",1)

names(iris2)<-c("Age","Transverse.diameter.of.abdomen_mm",
                "p.right.kidney.","s.right.kidney.",
                "Renal.prone.to.supine.movement_mm",
                "right.number.of.stones")
iris2$right.number.of.stones[which(iris2$right.number.of.stones==0)]<-"with stones"
iris2$right.number.of.stones[which(iris2$right.number.of.stones==1)]<-"without stones"

# text.legend<-c("without stone","with stone")
# col1=c("#817878","#272424")

# emf(file = "c:/users/lenovo/desktop/Rplot.emf", width = 8, height = 8,
#     bg = "transparent", fg = "black")
# pdf("c:/users/lenovo/desktop/Rplot-right.pdf", width=10, height=10)
# pdf("c:/users/lenovo/desktop/3Rplot-right8_8.pdf", width=8, height=8,
#     pointsize = 9.6)
# pdf("c:/users/lenovo/desktop/3Rplot-right9_9.pdf", width=9, height=9,
#     pointsize = 10.8)
pdf("c:/users/lenovo/desktop/1Rplot-right7_7.pdf", width=7, height=7,
    pointsize = 8.4)

# win.metafile("c:/users/lenovo/desktop/Rplot-right.emf", height =30, 
#              width=30,pointsize = 33) 

spm(~Renal.prone.to.supine.movement_mm+ 
      Age+ Transverse.diameter.of.abdomen_mm|right.number.of.stones,
    data = iris2, 
    pch=c(21,17),
    col=c("#817878","#272424"),
    legend.plot=T,
    legend.pos="topright",
    main='Scatterplot matrix of prone-to-supine right renal displacement, age, transverse diameter')

#legend("top",pch=c(21,18),legend=text.legend,
 #      col=col1,bty="n",horiz=T,inset=.05,cex=0.7)

dev.off()







