#maps
install.packages(c("maps", "mapdata"))

# the github version of ggmap, which recently pulled in a small fix I had
# for a bug 
devtools::install_github("dkahle/ggmap")

df.T.FL<-read_tsv("FL_temp_ts.txt")



library(mapdata)
states <- map_data("state")
west_coast <- subset(states, region %in% c("california", "oregon", "washington"))

ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat, group = group), fill = "palegreen", color = "black") + 
  coord_fixed(1.3)

ca_df <- subset(states, region == "california")
##home price per county in NJ, NY, FL
counties <- map_data("county")

name_state<-"florida"; abb_state<-"FL"


  
  fc_state<-subset(states, region == name_state)
  fc_counties <- subset(counties, region == name_state)
  cnames <- aggregate(cbind(long, lat) ~ subregion, data=fc_counties, FUN=mean)
  #
  
  
  
  ##get 2017 avg price of 3 bedroom for each county 
  
  
  fc_counties%<>%inner_join(df.2017.bycounty,by="subregion")
  
 
  
  fig<-ggplot(fc_counties, aes(long, lat))+
    geom_polygon(aes( group=group), fill="dark green",color = "white")+
    geom_point(data = us.cities%>%filter(country.etc==abb_state), 
               mapping = aes(x = long, y = lat, label=name),
    )+theme_bw()
    #geom_label_repel(data = us.cities%>%filter(country.etc==abb_state), 
    #                mapping = aes(x = long, y = lat, label=name))+
    #geom_label_repel(data=cnames,aes(x=long,y=lat,label=subregion))

cowplot::plot_grid(fig.avg.price,fig.std.price)

qmap('New Jersey',zoom=8)+geom_polygon(fc_counties, aes(long, lat, fill = avg_price, group=group), color = "white")+
  geom_point(data = us.cities%>%filter(country.etc==abb_state), 
             mapping = aes(x = long, y = lat, label=name, color="red"),
  )

