##Example

jet.colors <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))


green2yellow2red<- colorRampPalette(c("#7FFF7F", "yellow", "red"))

sunflower<-colorRampPalette(c("#b44601",
  "#cf722a",
  "#fecb01",
  "#bdc901",
  "#8aab00"))


greenhill<-colorRampPalette(c("#3e5586",
  "#5da8a0",
  "#cbe552",
  "#95b54c",
  "#607123"))

jajakflwr<-colorRampPalette(c("#3a0853",
"#930784",
"#ba07bb",
"#cccef7",
"#917ed9"))

honeyLavender<-colorRampPalette( c("#fed337",
"#da9101",
"#666103",
"#7d488e",
"#2a1227")
  
)
  
  
  

#test
filled.contour(volcano, color = honeyLavender, asp = 1, nlevels=100)

ex.1<-df.minT.FL.Jan.shapef%>%filter(Month=="Jan")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  scale_fill_gradientn(colors=honeyLavender(20))+
  theme(legend.position = c(0.25,0.5))+ggtitle("jet.colors")

#same result
ex.2<-df.minT.FL.Jan.shapef%>%filter(Month=="Aug")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  scale_fill_gradientn(colors=matlab.like(400)+
  theme(legend.position = c(0.25,0.5))+ggtitle("colorRamps::matlab.like1")

ex.3<-df.minT.FL.Jan.shapef%>%filter(Month=="Aug")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  scale_fill_gradientn(colors=matlab.like2(400))+
  theme(legend.position = c(0.25,0.5))+ggtitle("colorRamps::matlab.like2")


ex.4<-df.minT.FL.Jan.shapef%>%filter(Month=="Aug")%>%ggplot(.,aes(long,lat))+
  geom_polygon(aes(group=group,fill=Avg_Max_T_C_30yr), color="white")+theme_bw()+
  #scale_fill_gradientn("Avg_Min_T_C_30yr", colors=c('blue', 'yellow', 'red'))#+
  #scale_fill_gradientn(colours=rev(brewer.pal(9,"Blues")))
  #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))+
  scale_fill_gradientn(colors=colorRamps::blue2red(400))+
  theme(legend.position = c(0.25,0.5))+ggtitle("colorRamps::blue2red()")

cowplot::plot_grid(ex.1,ex.2,ex.3,ex.4)
