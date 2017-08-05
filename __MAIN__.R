##Main 
source("required.packages.R")
source("ftns_LoadData.R")



##def intprtr.county 
intprtr.county<-data.frame(subregion=counties%>%filter(region=="florida")%>%.[,"subregion"]%>%unique,
                           County=df.T.FL$County%>%unique%>%.[1:67]
)

##def merge FL county polygon with temperature data of January

df.minT.FL.Jan<-df.T.FL%>%group_by(Month,County)%>%summarise(Avg_Min_T_C_30yr=mean(Avg_Min_T_C,na.rm=TRUE), 
                                                             sd_Min_T_C_30yr=sd(Avg_Min_T_C,na.rm=TRUE),
                                                             Avg_Max_T_C_30yr=mean(Avg_Max_T_C,na.rm=TRUE), 
                                                             sd_Max_T_C_30yr=sd(Avg_Max_T_C,na.rm=TRUE)
                                                             )#%>%
  #filter(Month=="Jan")#dont need to get only month Jan, automatically gets all months 
# for future reference 


df.minT.FL.Jan.shapef<-counties%>%
  filter(region=="florida")%>%
  inner_join(intprtr.county)%>%
  inner_join(df.minT.FL.Jan)

## def plot

fig.mean<-df.minT.FL.Jan.shapef%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Min_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  viridis::scale_fill_viridis()+
  theme(legend.position = c(0.25,0.5))

fig.sd<-df.minT.FL.Jan.shapef%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=sd_Min_T_C_30yr), color="white")+
  theme_bw()+
  viridis::scale_fill_viridis()+
  theme(legend.position = c(0.25,0.5))#+
#geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))


## result # reference https://groups.google.com/forum/#!topic/ggplot2/fJAEJgAqb7U
cowplot::plot_grid(fig.mean,fig.sd)


#def plot
fig.mean<-df.minT.FL.Jan.shapef%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  viridis::scale_fill_viridis()+
  theme(legend.position = c(0.25,0.5))

fig.sd<-df.minT.FL.Jan.shapef%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=sd_Max_T_C_30yr), color="white")+
  theme_bw()+
  viridis::scale_fill_viridis()+
  theme(legend.position = c(0.25,0.5))#+
#geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))


## result # reference https://groups.google.com/forum/#!topic/ggplot2/fJAEJgAqb7U
cowplot::plot_grid(fig.mean,fig.sd)

#Max August

fig.mean<-df.minT.FL.Jan.shapef%>%filter(Month=="Aug")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  viridis::scale_fill_viridis(option="plasma",direction=-1)
  theme(legend.position = c(0.25,0.5))

fig.sd<-df.minT.FL.Jan.shapef%>%filter(Month=="Aug")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=sd_Max_T_C_30yr), color="white")+
  theme_bw()+
  viridis::scale_fill_viridis(option="plasma",direction=-1)
  theme(legend.position = c(0.25,0.5))#+
#geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))


## result # reference https://groups.google.com/forum/#!topic/ggplot2/fJAEJgAqb7U
cowplot::plot_grid(fig.mean,fig.sd)


