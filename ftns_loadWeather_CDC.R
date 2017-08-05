
df<-read_tsv("North America Land Data Assimilation System (NLDAS) Daily Air Temperatures and Heat Index (1979-2011) (2).txt"
           )


county.state<-strsplit(df$County,split=", ")%>%do.call("rbind",.)
df$County<-county.state[,1]
df$State<-county.state[,2]
df$County