library(maps)
library(sp)
map()
map('world', fill = TRUE,col=heat.colors(10))
map("state", interior = FALSE)
map("state", boundary = FALSE, col="red", add = TRUE)

load(url("http://gadm.org/data/rda/GBR_adm1.RData"))
spplot(gadm,"Shape_Area")

#=============================================================#
#=======================颜色==================================#
#=============================================================#
#画典型时间序列图，  ~右边为x     type= L
sales<-read.csv("F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 1\\Data Files/dailysales.csv")
plot(sales$units~as.Date(sales$date,"%d/%m/%y"),
     type="l",col="blue")
# Plot函数中，使用col = 参数来决定要素的颜色
# 如果不指定plot type，颜色加在散点上，如果指定了plot type，例如line，则颜色加在线上

#列出所有颜色
colors() 
#调出调色板的颜色
palette()
# col=n
#  n为当前调色板上的颜色值
# 缺省调色板下，1表示黑色，2表示红色，0表示背景色


plot(rnorm(1000),col="#AC5500BB")
# 红色，绿色，蓝色，alpha（透明度）
rgb(0.5,0.5,0.5,0.5)


#自动产生红黄颜色
heat.colors(5)  #暗色到亮色

#方便更好的管理调色板
library(RColorBrewer)
#显示所有的调色板
display.brewer.all()
brewer.pal(7,"YlOrRd")  #大写+小写  结构  中间是or
display.brewer.pal(7,"YlOrRd")


#使用多颜色画图
sales<-read.csv("F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 1\\Data Files/citysales.csv",header=TRUE)
sales
barplot(as.matrix(sales[,2:4]), beside=T,
        legend=sales$City,
        col=c("red","blue","green","orange","pink"),
        border="white")
#热力图
barplot(as.matrix(sales[,2:4]), beside=F,#循环
        legend=sales$City,
        col=heat.colors(length(sales$City)),#有多少个城市，设定颜色数量
        border="white")#柱状图之间的间隔
#彩虹色
barplot(as.matrix(sales[,2:4]), beside=T,
        legend=sales$City,
        col=rainbow(length(sales$City)),
        border="white")

# cm.colors()
# topo.colors()

#设置背景颜色
par(bg="gray")   #设定画板参数   两个最常用的画图参数
plot(rnorm(100))
#1.设定新的par
#2.dev.off()
dev.off()

plot(rnorm(1000),type="n")
x<-par("usr")
rect(x[1],x[3],x[2],x[4],col="lightgray ")
points(rnorm(1000))


# 
# Win下能用的字体非常有限
# 用par(family=“serif”,font=2) 设置Times New Roman字体
# 0 缺省，1 粗体，2 斜体，3 粗斜体


#用bty参数控制坐标系的风格
par(bty="l")
plot(rnorm(100))
# par(bty="7")     #后面的都不好看
# plot(rnorm(100))
# par(bty="c")
# plot(rnorm(100))
# par(bty="u")
# plot(rnorm(100))

######################################################
#box()函数      这个有用
par(oma=c(1,1,1,1))   #oma  outer margin 的宽度
plot(rnorm(100),bty="l")
box(which="figure")
#设置坐标轴刻度
plot(rnorm(100),xaxp=c(0,100,10))   # 0到100，隔10
######################################################

#las参数：刻度数字的方向
par(las=3)
plot(rnorm(100),xaxp=c(0,100,10))
par(las=2)
plot(rnorm(100),xaxp=c(0,100,10))
par(las=1)
plot(rnorm(100),xaxp=c(0,100,10))
#设置画图区域大小
par(fin=c(5,5),   #figure区域
    pin=c(3,3))   #画图区域




#=========================第三周=========================#
#画散点图
library(lattice)  #可以对散点进行分组
xyplot(mpg~disp,  #定义xy轴
       data=mtcars,
       groups=cyl,    #通过cyl分组
       auto.key=list(corner=c(1,1)))  #生成图例， 定义坐标



############################################################
library(ggplot2) #强大升级        达到昂贵商业软件的功能
#非常常用的函数，每天都用，万能函数 qplot
qplot(disp,mpg,data=mtcars,
      col= as.factor(cyl)) #根据因子取颜色
#背景细节特别豪华
############################################################


#使用散点形状和大小来表示分组
qplot(disp,mpg,data=mtcars,shape=as.factor(cyl))
qplot(disp,mpg,data=mtcars,size=as.factor(cyl))


#用text()标识点
plot(mpg~disp, data=mtcars)
text(258,22,"Hornet")

health<-read.csv("F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 3\\Data Files/HealthExpenditure.csv",header=TRUE)
plot(health$Expenditure,health$Life_Expectancy,type="n")
text(health$Expenditure,health$Life_Expectancy,health$Country)
box(which="figure")

#例子：散点图+相关系数
panel.cor <- function(x, y, ...)
{
  par(usr = c(0, 1, 0, 1))  #自定义小坐标  user
  #cor返回相关系数 两个小数点
  txt <- as.character(format(cor(x, y), digits=2))
  #文本大小为6*相关系数
  text(0.5, 0.5, txt, cex = 6* abs(cor(x, y)))
}
pairs(iris[1:4], upper.panel=panel.cor)


#jitter( ) #解决散点比较接近的情况
x <- rbinom(1000, 10, 0.25)
y <- rbinom(1000, 10, 0.25)
plot(x,y)
#看不到所有点的情况

plot(jitter(x), jitter(y))
#Jitter函数：给向量加上少许噪音



#三维散点图

install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(x=mtcars$wt,
              y=mtcars$disp,
              z=mtcars$mpg)


scatterplot3d(mtcars$wt,mtcars$disp,mtcars$mpg,
              #设置颜色渐变效果  设置倾斜角度
              pch=16, highlight.3d=TRUE, angle=20,
              xlab="Weight",ylab="Displacement",zlab="Fuel Economy (mpg)",
              #画散点的垂线
              type="h",
              main="Relationships between car specifications")


#数据各种旋转，特效

# 高维数据展现专业扩展包rggobi
# install.packages("rggobi")
# http://www.ggobi.org/rggobi/
#   动画demo
# http://www.ggobi.org/demos/

#画密度函数
x<-rnorm(1000)
plot(density(x))


#smoothScatter()
n <- 10000
x <- matrix(rnorm(n), ncol=2)
y <- matrix(rnorm(n, mean=3, sd=1.5), ncol=2)
smoothScatter(x,y)



#=========================第四周=========================#
#画线图

#使用cityrain.csv数据
rain<-read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
     xaxt="n",ylim=c(0,300),col="black",
     xlab="Month",ylab="Rainfall (mm)",
     main="Monthly Rainfall in major cities")
axis(1,at=1:length(rain$Month),labels=rain$Month)
lines(rain$Berlin,col="red",type="b",lwd=2)   #b  有点有线
lines(rain$NewYork,col="orange",type="b",lwd=2)
lines(rain$London,col="purple",type="b",lwd=2)
legend("topright",legend=c("Tokyo","Berlin","New York","London"),
       lty=1,lwd=2,pch=21,col=c("black","red","orange","purple"),
       ncol=2,bty="n",cex=0.8,
       text.col=c("black","red","orange","purple"),
       inset=0.01)

legend(1,300,legend=c("Tokyo","Berlin","New York","London"),
       lty=1,lwd=2,pch=21,col=c("black","red","orange","purple"),
       #水平放置   没有框框包围起来
       horiz=TRUE,bty="n",bg="yellow",cex=1,
       text.col=c("black","red","orange","purple"))


#设定工作路径
setwd('F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 4\\Data Files/')
gdp<-read.table("gdp_long.txt",header=T)



#画底纹格子
rain<-read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
     xaxt="n",ylim=c(0,300),col="black",
     xlab="Month",ylab="Rainfall (mm)",
     main="Monthly Rainfall in Tokyo")
axis(1,at=1:length(rain$Month),labels=rain$Month)
grid()#底纹命令

#水平线底纹
grid(nx=NA, ny=8,
     lwd=1,lty=2,col="blue")

########################################################
#垂直线
rain <- read.csv("cityrain.csv")
plot(rain$Tokyo,type="b",lwd=2,
     xaxt="n",ylim=c(0,300),col="black",
     xlab="Month",ylab="Rainfall (mm)",
     main="Monthly Rainfall in Tokyo")
axis(1,at=1:length(rain$Month),labels=rain$Month)
abline(v=9,col="red")

abline(h=150,col="red",lty=2)
#######################################################

rain <- read.csv("cityrain.csv")
par(mfrow=c(4,1),mar=c(5,7,4,2),omi=c(0.2,2,0.2,2))
for(i in 2:5){
  #ann  annotation注释
  plot(rain[,i],ann=FALSE,axes=FALSE,type="l",
       col="gray",lwd=2)
  mtext(side=2,at=mean(rain[,i]),names(rain[i]),
        las=2,col="black")
  mtext(side=4,at=mean(rain[,i]),mean(rain[i]),
        las=2,col="black")
  #标记最小的点   最大的点
  points(which.min(rain[,i]),min(rain[,i]),pch=19,col="blue")
  points(which.max(rain[,i]),max(rain[,i]),pch=19,col="red")
}

#时间序列图
sales<-read.csv("dailysales.csv")
plot(sales$units~as.Date(sales$date,"%d/%m/%y"),type="l",
     xlab="Date",ylab="Units Sold")

#处理时间序列数据的包zoo
library(zoo)
plot(zoo(sales$units,as.Date(sales$date,"%d/%m/%y")))

#数据较多的例子
air<-read.csv("openair.csv")
  #时 分
plot(air$nox~as.Date(air$date,"%d/%m/%Y %H:%M"),type="l",
     xlab="Time", ylab="Concentration (ppb)",
     main="Time trend of Oxides of Nitrogen")

plot(zoo(air$nox,as.Date(air$date,"%d/%m/%Y %H:%M")),
     xlab="Time", ylab="Concentration (ppb)",
     main="Time trend of Oxides of Nitrogen")



#################################################################
plot(air$nox~as.Date(air$date,"%d/%m/%Y %H:%M"),type="l",
     xaxt="n",
     xlab="Time", ylab="Concentration (ppb)",
     main="Time trend of Oxides of Nitrogen")
xlabels<-strptime(air$date, format = "%d/%m/%Y %H:%M")
#1  画在下方
axis.Date(1, at=xlabels[xlabels$mday==1], format="%b-%Y")
#标记特定的时间事件
abline(v=as.Date("25/12/2003","%d/%m/%Y"))
#################################################################


#求出均值后画时间序列
#针对图太密集的情况，对月或星期取均值后描点或线
air$date = as.POSIXct(strptime(air$date, format = "%d/%m/%Y %H:%M","GMT"))
#aggregate聚集
means <- aggregate(air["nox"], format(air["date"],"%Y-%U"),mean,na.rm = TRUE)
means$date <- seq(air$date[1], air$date[nrow(air)],length = nrow(means))
plot(means$date, means$nox, type = "l")



#画股票数据
#install.packages("quantmod")
#install.packages("tseries")
library(quantmod)
library(tseries)

#抓取  苹果  谷歌 微软三家的股票数据
aapl<-get.hist.quote(instrument = "aapl", quote = c("Cl", "Vol"))
goog <- get.hist.quote(instrument = "goog", quote = c("Cl", "Vol"))
msft <- get.hist.quote(instrument = "msft", quote = c("Cl", "Vol"))
plot(msft$Close,main = "Stock Price Comparison",
     ylim=c(0,800), col="red", type="l", lwd=0.5,
     pch=19,cex=0.6, xlab="Date" ,ylab="Stock Price (USD)")
lines(goog$Close,col="blue",lwd=0.5)
lines(aapl$Close,col="gray",lwd=0.5)
legend("top",horiz=T,legend=c("Microsoft","Google","Apple"),
       col=c("red","blue","gray"),lty=1,bty="n")

getSymbols("AAPL",src="yahoo")
barChart(AAPL)

candleChart(AAPL,theme="white")



#=========================第五周=========================#
#柱形图
library(RColorBrewer)
setwd('F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 1\\Data Files/')

citysales<-read.csv("citysales.csv")
        #beside=T
barplot(as.matrix(citysales[,2:4]), beside=TRUE,
        #图例内容
        legend.text=citysales$City,
        #bty 本来应该有边框的
        args.legend=list(bty="n",horiz=TRUE),
        col=brewer.pal(5,"Set1"),
        border="white",ylim=c(0,100),
        ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")
box(bty="l")

###########################################################################
#调整柱形图的宽度，间隔和颜色
barplot(as.matrix(citysales[,2:4]), beside=TRUE,
        legend.text=citysales$City, args.legend=list(bty="n",horiz=T),
        col=c("#E5562A","#491A5B","#8C6CA8","#BD1B8A","#7CB6E4"),
        #柱间距离为0  组间距离为5
        border=FALSE,space=c(0,5),
        ylim=c(0,100),ylab="Sales Revenue (1,000's of USD)",
        main="Sales Figures")

x<-barplot(as.matrix(citysales[,2:4]), beside=TRUE,
           legend.text=citysales$City, args.legend=list(bty="n",horiz=TRUE),
           col=brewer.pal(5,"Set1"),border="white",
           ylim=c(0,100),ylab="Sales Revenue (1,000's of USD)",
           main="Sales Figures")
y<-as.matrix(citysales[,2:4])
text(x,y+2,labels=as.character(y))
###########################################################################



#=========================第八周=========================#
#ggplot   grammar of graphics
library(ggplot2)
diamonds
#过渡函数  从plot 到ggplot
qplot(carat, price, data = diamonds)
qplot(log(carat), log(price), data = diamonds)
qplot(carat, x * y * z, data = diamonds)

#装饰属性
set.seed(1410) # Make the sample reproducible
#用sample抽样  100个
dsmall <- diamonds[sample(nrow(diamonds), 100), ]
qplot(carat, price, data = dsmall, colour = color) #color是个变量
qplot(carat, price, data = dsmall, shape = cut)

#Alpha值   透明度   越小越透明
qplot(carat, price, data = diamonds, alpha = I(1/10))
qplot(carat, price, data = diamonds, alpha = I(1/100))
qplot(carat, price, data = diamonds, alpha = I(1/200))

#geometry 几何对象
# geom = “point”，画散点图，当提供x,y时为缺省选项
# geom = “smooth”，画平滑曲线及标准误
# geom = “boxplot”，画箱线图
# geom = “path” 或geom = “line”，画连线
# geom = “histogram”，画直方图，当只提供x时为缺省选项
# geom =“freqpoly”，画频率多边形
# geom = “density”，画密度曲线
# geom = “bar”，画柱形图

qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
qplot(carat, price, data = diamonds, geom = c("point", "smooth"))

#弯曲程度取决于span   越小越弯曲
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),span = 0.2)
qplot(carat, price, data = dsmall, geom = c("point", "smooth"),span = 1)


qplot(carat, price, data = dsmall, 
      geom = c("point", "smooth"),
      method = "gam", formula = y ~ s(x))
qplot(carat, price, data = dsmall, 
      geom = c("point", "smooth"),
      method = "gam", formula = y ~ s(x, bs = "cs"))

#箱线图
#平均每克拉的价格
qplot(color, price / carat, data = diamonds, geom = "boxplot")


#jitter  抖动  散点直方图  可以看到稀疏情况
qplot(color, price / carat, data = diamonds, geom = "jitter")

############################################################################
#直方图
qplot(carat, data = diamonds, geom = "histogram")
#设置直方图的区间
qplot(carat, data = diamonds, geom = "histogram", binwidth = 1,xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.1,xlim = c(0,3))
qplot(carat, data = diamonds, geom = "histogram", binwidth = 0.01,xlim = c(0,3))
#设置色彩
qplot(carat, data = diamonds, geom = "histogram", fill = color)


#柱状图
qplot(color, data = diamonds, geom = "bar")

#其它选项
# xlim, ylim
#  log
#  main
#  xlab, ylab



############################################################################


#路径表达方式
year <- function(x) as.POSIXlt(x)$year + 1900
qplot(unemploy / pop, uempmed, data = economics,geom = c("point", "path"))
#彩色路径
qplot(unemploy / pop, uempmed, data = economics,geom = "path", colour = year(date)) + scale_area()



#=========================第九周=========================#
setwd('F:\\BaiduNetdiskDownload\\R语言\\R语言进阶\\资料\\Code\\Chapter 1\\Data Files/')

#散点图
qplot(displ, hwy, data = mpg, colour = factor(cyl))
#上图中的装饰属性
# 点
# 点的位置
# 点的大小
# 点的颜色

# 数据到装饰属性的映射（Mapping）
# Disp映射到x坐标，hwy映射到y坐标，cyl映射到颜色

#几何对象（geom）决定统计图的类型

# Scaling     数据规范化
# 把数据从其计量单位（例如油耗的升数，里程等
# ）转化为计算机能识别的显示要素（例如像素，颜色等）的过程，称为Scaling
# 在右图中有几项scaling
# 1)将水平坐标x映射到[0,1]区间。这里不使用具体像素值的原因是grid包替我们
# 完成最终的转换
# 2)将垂直坐标y映射到[0,1]区间
# 3)由坐标系统(coord)根据x,y的组合最终定位，常见的坐标系统包括直角坐标系
# ，极坐标系，球面映射等
# 4)颜色的scaling


#更复杂的例子   facets 分组 （n.面向；切面） 
#stats 统计变换          geom_smooth 拟合曲线
qplot(displ, hwy, data=mpg, facets = . ~ year) + geom_smooth()

# 总结：基于图层概念的绘图过程
# Layer的组成
# 1 数据到装饰属性的映射
# 2 统计变换
# 3 几何对象
# 4 位置变换
# Scale
# Coord    #坐标系
# Faceting #分组

#aesthetics美学  aesthetic审美的，美学的
#aes定义一个映射 x, y，颜色
p <- ggplot(diamonds, aes(carat, price, colour = cut))
p
summary(p)
#图层（layer）
# layer函数: layer(geom, geom_params, stat, stat_params, data, mapping,position)
p <- ggplot(diamonds, aes(x = carat))
p <- p + layer(
  geom = "bar",
  geom_params = list(fill = "steelblue"), #铁蓝色
  stat = "bin",#按频数统计变换
  stat_params = list(binwidth = 2)#统计区间宽度
)
p

# 捷径函数
# 样例： geom_histogram(binwidth = 2, fill = "steelblue")
# 函数名一般以“geom_”或“stat_”开头
# 参数： geom_XXX(mapping, data, ..., geom, position
#               )或stat_XXX(mapping, data, ..., stat, position)

p<-p+geom_histogram(binwidth = 2, fill = "steelblue")
p


ggplot(msleep, aes(sleep_rem / sleep_total, awake)) +geom_point()
# which is equivalent to
qplot(sleep_rem / sleep_total, awake, data = msleep)


# You can add layers to qplot too:
qplot(sleep_rem / sleep_total, awake, data = msleep) +geom_smooth()
# This is equivalent to
qplot(sleep_rem / sleep_total, awake, data = msleep,geom = c("point", "smooth"))
# or
ggplot(msleep, aes(sleep_rem / sleep_total, awake)) +geom_point() + geom_smooth()


#########################################################################
#修改图
p <- ggplot(mtcars, aes(mpg, wt, colour = cyl)) + geom_point()
p

#修改数据集
mtcars <- transform(mtcars, mpg = mpg ^ 2)
#用新的mtcars取代p中的旧mtcars
p %+% mtcars

#Aesthetic mappings  修改颜色
 #aes(x = weight, y = height, colour = age)
 #aes(weight, height, colour = sqrt(age))
#########################################################################


#Facet grid 栅格式排版分组
mpg2 <- subset(mpg, cyl != 5 & drv %in% c("4", "f"))
qplot(cty, hwy, data = mpg2) + facet_grid(. ~ cyl)#按列排版
#按行排版
qplot(cty, data = mpg2, geom="histogram", binwidth = 2) + facet_grid(cyl ~ .)
#列和行
qplot(cty, hwy, data = mpg2) + facet_grid(drv ~ cyl)

#自定义排版
movies$decade <- floor(movies$year/10)*10
qplot(rating, ..density.., data=subset(movies, decade > 1890),geom="histogram", binwidth = 0.5) +facet_wrap(~ decade, ncol = 6)












