##getweather using curl and wunderground website 

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

