source("model_config.R")

folder <- paste(name, format(Sys.time(), "%d-%m-%Y_%H:%M"), model_length, sep="_")

dir.create(folder)


#Sources formating

SRCS=read.table(sources,sep=",",header=T)
listisosrc=c()
for(i in c(1:length(moysrc))){
  t=paste0("Meanisotope",i)
  listisosrc=append(listisosrc,t)  
}
for(i in c(1:length(etsrc))){
  t=paste0("SDisotope",i)
  listisosrc=append(listisosrc,t)  
}
colnames(SRCS)[c(moysrc,etsrc,n)]=c(listisosrc,"n")
write.csv(SRCS,paste(folder,"sourcesMS.csv",sep='/'),row.names=F,quote=F)
#print (SRCS)

# Disc formating

discr=SRCS[,c(nomsrc,moysrc,etsrc)]
discr[,c(2:(1+length(etsrc)+length(moysrc)))]= 0
colnames(discr)[1] = "Group"
write.csv(discr,paste(folder,"discrMS.csv",sep='/'),row.names=F,quote=F)

MIXING=read.table(samples,sep=",",header=T)
listisomix=c()
for (i in c(1:length(colmix))){
  t=paste0("isotope",i)
  listisomix=append(listisomix,t)  
}

# Mix formating

colnames(MIXING)[c(colobj,colmix)]=c("nobj",listisomix)
write.csv(MIXING,paste(folder,"mixingMS.csv",sep='/'),row.names=F,quote=F)


