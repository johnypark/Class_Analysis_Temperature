##Load Data 


##def LoadNOAA


##def loadZip_byCounty
counties <- map_data("county")
counties.AL<-counties%>%filter(region=="alabama")%>%.[,"subregion"]%>%unique


##def loadTemp_fromCDC


df.T.FL<-read_tsv("FL_temp_ts.txt")


county.state<-strsplit(df.T.FL$County,split=", ")%>%do.call("rbind",.)
df.T.FL$County<-county.state[,1]
df.T.FL$State<-county.state[,2]
df.T.FL%>%names
names(df.T.FL)[9]<-"Avg_Min_T"
names(df.T.FL)[8]<-"Avg_Max_T"
df.T.FL%<>%mutate(Avg_Max_T_C=(Avg_Max_T-32)*5/9,Avg_Min_T_C=(Avg_Min_T-32)*5/9)
df.T.FL%<>%select(Notes,County,State,Year,Month,'Month Code',Avg_Max_T_C,Avg_Min_T_C)


##def loadTemp_fromWunderground with http protocol specific url ##getweather using curl and wunderground website 
loadTemp_fromwwcurl=function(){
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
