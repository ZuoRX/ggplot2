library(car)
library(xlsx)
library(devEMF)

iris1<-read.xlsx("c:/users/lenovo/desktop/zhixiang/Left kidney.xlsx",1)

names(iris1)<-c("Age","Transverse.diameter.of.abdomen..mm.",
                "p.left.kidney.","s.left.kidney.",
                "Distance.left.kidney.P.A.moved.mm.",
                "Left.kidney.of.stones")
iris1$Left.kidney.of.stones[which(iris1$Left.kidney.of.stones==0)]<-"with stones"
iris1$Left.kidney.of.stones[which(iris1$Left.kidney.of.stones==1)]<-"without stones"

text.legend<-c("without stone","with stone")
col1=c("#817878","#272424")

# emf(file = "c:/users/lenovo/desktop/Rplot.emf", width = 8, height = 8,
#     bg = "transparent", fg = "black")
win.metafile("c:/users/lenovo/desktop/Rplot-left.emf", height =14, width=14) 

spm(~Distance.left.kidney.P.A.moved.mm.+ 
      Age+ Transverse.diameter.of.abdomen..mm.|Left.number.of.stones,
    data = iris1, 
    pch=c(21,18),
    col=c("#817878","#272424"),
    legend.plot=T,
    legend.pos="topright",
    main='The Scatterplot Matrix of The Diameter Left Kidney P-A moved')

# legend("top",pch=c(21,15),legend=text.legend,
#        col=col1,bty="n",horiz=T,inset=.02,cex=0.7)

dev.off()

#--------------------------------------------#


iris2<-read.xlsx("c:/users/lenovo/desktop/zhixiang/Right kidney.xlsx",1)

names(iris2)<-c("Age","Transverse.diameter.of.abdomen..mm.",
                "p.right.kidney.","s.right.kidney.",
                "Distance.right.kidney.P.A.moved.mm.",
                "right.number.of.stones")
iris2$right.number.of.stones[which(iris2$right.number.of.stones==0)]<-"with stones"
iris2$right.number.of.stones[which(iris2$right.number.of.stones==1)]<-"without stones"

text.legend<-c("without stone","with stone")
col1=c("#817878","#272424")

# emf(file = "c:/users/lenovo/desktop/Rplot.emf", width = 8, height = 8,
#     bg = "transparent", fg = "black")
win.metafile("c:/users/lenovo/desktop/Rplot-right.emf", height =14, width=14) 

spm(~Distance.right.kidney.P.A.moved.mm.+ 
      Age+ Transverse.diameter.of.abdomen..mm.|right.number.of.stones,
    data = iris2, 
    pch=c(21,18),
    col=c("#817878","#272424"),
    legend.plot=T,
    legend.pos="topright",
    main='The Scatterplot Matrix of The Diameter Right Kidney P-A moved')

# legend("top",pch=c(21,18),legend=text.legend,
#        col=col1,bty="n",horiz=T,inset=.02,cex=0.7)

dev.off()







