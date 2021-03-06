#install.packages("plyr")
library("plyr")
library("tools")
webdata <- read.csv("webdata.csv", stringsAsFactors=FALSE)
PCPath <- getwd()
list.files(PCPath)
dir.create("Zips")
dir.create("Unzips")

#Download One File
i <-1
webdata[i,1]
folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
target<- file.path(PCPath, paste("Zips/", folder, ".zip", sep= ""))
download.file(webdata[i,1], target)
unzip(target, exdir = file.path("Unzips/", folder))
     

#Download All Files
for (i in 1:nrow(webdata)) {
                            folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
                            folder #tells you what file is working on
                            target<- file.path(PCPath, paste("Zips/", folder, ".zip", sep=""))
                            download.file(webdata[i,1], target)
                            unzip(target, exdir = file.path(PCPath, paste("Unzips/", folder, sep="")))
                            }
#Clean up
rm(list = c("agency", "calendar", "calendar_dates", "frequencies", "routes", "shapes", "stop_times", "stops", "transfers", "trips"))


agency <-dbReadTable(con,"gtfs_agency") #May be a better way to make all of these??
calendar <-dbReadTable(con,"gtfs_calendar")
calendar_dates <-dbReadTable(con,"gtfs_calendar_dates")
frequencies<-dbReadTable(con,"gtfs_frequencies")
routes<-dbReadTable(con,"gtfs_routes")
shapes<-dbReadTable(con,"gtfs_shapes")
stop_times<-dbReadTable(con,"gtfs_stop_times")
stops<-dbReadTable(con,"gtfs_stops")
transfers<-dbReadTable(con,"gtfs_transfers")
trips<-dbReadTable(con,"gtfs_trips")

#Load Files in R
#for (i in 1:nrow(webdata)) {
for (i in 9:10) {
                folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
                folder #tells you what file working on
                Active <- file.path(getwd(), "Unzips", folder)
                print(Active) # to tell you where fails if it does and status
                print(Sys.time())
                list.files(Active) [i] #For testing
                file_path_sans_ext(list.files(Active) [i]) # For testing
             
                if (file.exists(paste(Active, "/agency.txt", sep="")))    
                  { agency<-rbind.fill(read.csv(paste(Active, "/agency.txt", sep="")), agency)}
                if (file.exists(paste(Active, "/calendar.txt", sep="")))    
                  { calendar<-rbind.fill(read.csv(paste(Active, "/calendar.txt", sep="")), calendar)}
                if (file.exists(paste(Active, "/calendar_dates.txt", sep="")))    
                  {  calendar_dates<-rbind.fill(read.csv(paste(Active, "/calendar_dates.txt", sep="")), calendar_dates)}
                if (file.exists(paste(Active, "/frequencies.txt", sep="")))    
                  { frequencies<-rbind.fill(read.csv(paste(Active, "/frequencies.txt", sep="")), frequencies)}
                if (file.exists(paste(Active, "/routes.txt", sep="")))    
                  {routes<-rbind.fill(read.csv(paste(Active, "/routes.txt", sep="")), routes)}
                if (file.exists(paste(Active, "/shapes.txt", sep="")))    
                  {shapes<-rbind.fill(read.csv(paste(Active, "/shapes.txt", sep="")), shapes)}
                if (file.exists(paste(Active, "/stop_times.txt", sep="")))    
                  {stop_times<-rbind.fill(read.csv(paste(Active, "/stop_times.txt", sep="")), stop_times)}
                if (file.exists(paste(Active, "/stops.txt", sep="")))    
                  {stops<-rbind.fill(read.csv(paste(Active, "/stops.txt", sep="")), stops)}
                if (file.exists(paste(Active, "/transfers.txt", sep="")))    
                  {transfers<-rbind.fill(read.csv(paste(Active, "/transfers.txt", sep="")), transfers)}
                if (file.exists(paste(Active, "/trips.txt", sep="")))    
                  {trips<-rbind.fill(read.csv(paste(Active, "/trips.txt", sep="")), trips)}
                }

calendar<-unique(calendar)
calendar_dates<-unique(calendar_dates)
print(Sys.time())
routes<-unique(routes)
shapes<-unique(shapes)
print(Sys.time())
stop_times<-unique(stop_times)
stops<-unique(stops)
transfers<-unique(transfers)
trips<-unique(trips)
print(Sys.time())