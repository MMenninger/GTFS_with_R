### Source: https://code.google.com/p/rpostgresql/

# Load the package
library(DBI)
library(RPostgreSQL)
drv <- dbDriver("PostgreSQL")

#Connect
con <- dbConnect(drv, dbname="GTFS", user = "postgres", password = "martin")


#Assess connection
dbListConnections(drv)
dbGetInfo(drv)
summary(con)
dbListTables(con)
dbListFields(con,"gtfs_routes")
agency_table <-dbReadTable(con,"gtfs_agency") #How to read a table into R



rs <- dbSendQuery(con,"select * from gtfs_calendar")
fetch(rs,n=-1) ## return all elements
fetch(rs,n=2) ##returns last 2 elements in record set.

dbGetRowCount(rs)
dbColumnInfo(rs)
