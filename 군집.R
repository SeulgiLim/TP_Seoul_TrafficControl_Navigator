library(dplyr)
library(ggplot2)
library(tidyverse)
library(lubridate)

park_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 단속건수.csv', header = T, sep = ',')
cctv_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m cctv개수.csv', header = T, sep = ',')
cctv_park_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m cctv단속건수.csv', header = T, sep = ',')
child_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 어린이보호.csv', header = T, sep = ',')
fire_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 소방.csv', header = T, sep = ',')
store_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 소상공인수.csv', header = T, sep = ',')
bus_500 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 정류소수.csv', header = T, sep = ',')

park_500 <- park_500[,-c(1:4)]
cctv_500 <- cctv_500[,-c(1:5)]
cctv_park_500 <- cctv_park_500[,-c(1:5)]
child_500 <- child_500[,-c(1:5)]
fire_500 <- fire_500[,-c(1:5)]
store_500 <- store_500[,-c(1:5)]
bus_500 <- bus_500[,-c(1:5)]

clu_test <- cbind(park_500,cctv_500,cctv_park_500,child_500,fire_500,store_500,bus_500)

write.csv(file = 'C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 모음.csv',clu_test)

clu_test1 <- read.csv('C:/Users/지훈/Desktop/프로젝트/500m 헥사곤/500m 모두 0 제거.csv',header = T, sep = ',')

str(clu_test1)
clu1 <- clu_test1
str(clu1)

install.packages('factoextra')
install.packages('FactoMineR')
install.packages('cluster')
install.packages('fpc')
install.packages('fclust')
library(factoextra)
library(FactoMineR)
library(cluster)
library(fpc)
library(fclust)

clu1 <- data.frame(clu1)
rownames(clu1) <- clu1[,1]
clu1[,1] <- NULL

clu1_st <- scale(clu1)
fviz_nbclust(clu1_st,kmeans,method = 'gap_stat')

residual <- kmeans(clu1_st,6,nstart =25)
res <- as.data.frame(residual$cluster)

write.csv(file = 'C:/Users/지훈/Desktop/프로젝트/cluster.csv',res)

fviz_cluster(residual, data = clu1_st)

pca.res <- PCA(clu1_st,graph = F)
fviz_contrib(pca.res,choice = 'var', axes = 1)
fviz_contrib(pca.res,choice = 'var', axes = 2)

c <- data.frame(residual$cluster)
c[,2] <- rownames(c)
colnames(c) <- c('cluster','id')
d <- merge(clu_test1,c,by = 'id')


############어린이 보호구역 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$child_500[d$cluster == i],
                d$child_500[d$cluster == j])
    print(i)
    print(j)
    print(t)
  }
}

############cctv 설치 수 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$cctv_500[d$cluster == i],
                d$cctv_500[d$cluster == j])
    print(i)
    print(j)
    print(t)
  }
}

#############cctv 단속 건 수 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$cctv_park_500[d$cluster == i],
                d$cctv_park_500[d$cluster == j])
    print(i)
    print(j)
    print(t$p.value)
  }
}

#########단속 건 수 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$X500m.단속건수[d$cluster == i],
                d$X500m.단속건수[d$cluster == j])
    print(i)
    print(j)
    print(t$p.value)
  }
}

########소방용수 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$fire_500[d$cluster == i],
                d$fire_500[d$cluster == j])
    print(i)
    print(j)
    print(t$p.value)
  }
}

############정류장 t test############
for (i in 1:5) {
  j <- i
  while (j < 6 ) {
    j <- j+1
    t <- t.test(d$bus_500[d$cluster == i],
                d$bus_500[d$cluster == j])
    print(i)
    print(j)
    print(t$p.value)
  }
}
