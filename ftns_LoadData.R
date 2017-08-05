##Load Data 


##def LoadNOAA


##def loadZip_byCounty
counties <- map_data("county")
counties.AL<-counties%>%filter(region=="alabama")%>%.[,"subregion"]%>%unique


##def loadTemp_fromCDC


df<-read_tsv("North America Land Data Assimilation System (NLDAS) Daily Air Temperatures and Heat Index (1979-2011) (2).txt"
)


county.state<-strsplit(df$County,split=", ")%>%do.call("rbind",.)
df$County<-county.state[,1]
df$State<-county.state[,2]
df$County


##def loadTemp_fromWunderground with http protocol specific url 

##getweather using curl and wunderground website 
getWeather_curlwwst=function(){
month=08 # Only looking at August.


GNV.aug<-list()
for (year in 1973:2016){ #For each year between 1943 and 2016
  
  
  for (day in 1:31){
    
    
    day<-ifelse(day%>%nchar==1,
                yes = "0%s"%>%sprintf(day)
                ,no = day) 
    message("Getting data for %s-%s-%s"%>%sprintf(year,month,day))  
    
    GNV.aug$year$month$day<- 
      df<-curl(url="https://www.wunderground.com/history/airport/GNV/%s/%s/%s/DailyHistory.heml?&format=1"%>%
                 sprintf(year,month,day),open="",handle = new_handle()) %>%read.csv()
    
    
  }
}
}
