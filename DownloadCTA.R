install.packages("plyr")
library(plyr)
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

#Load Files in R
for (i in 1:nrow(webdata)) {
#for (i in 1:1) {
                folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
                folder #tells you what file working on
                Active <- file.path(getwd(), "Unzips", folder)

                ifelse(exists("agency"), 
                       (agency<-rbind.fill(read.csv(paste(Active, "/agency.txt", sep="")), agency)),
                       (agency<-read.csv(paste(Active, "/agency.txt", sep=""))))

                ifelse(exists("calendar"), 
                       (calendar<-rbind.fill(read.csv(paste(Active, "/calendar.txt", sep="")), calendar)),
                       (calendar<-read.csv(paste(Active, "/calendar.txt", sep=""))))
                
                ifelse(exists("calendar_dates"), 
                       (calendar_dates<-rbind.fill(read.csv(paste(Active, "/calendar_dates.txt", sep="")), calendar_dates)),
                       (calendar_dates<-read.csv(paste(Active, "/calendar_dates.txt", sep=""))))
                
                ifelse(exists("frequencies"), 
                       (frequencies<-rbind.fill(read.csv(paste(Active, "/frequencies.txt", sep="")), frequencies)),
                       (frequencies<-read.csv(paste(Active, "/frequencies.txt", sep=""))))
                
                ifelse(exists("routes"), 
                       (routes<-rbind.fill(read.csv(paste(Active, "/routes.txt", sep="")), routes)),
                       (routes<-read.csv(paste(Active, "/routes.txt", sep=""))))
                
                ifelse(exists("shapes"), 
                       (shapes<-rbind.fill(read.csv(paste(Active, "/shapes.txt", sep="")), shapes)),
                       (shapes<-read.csv(paste(Active, "/shapes.txt", sep=""))))
                
                ifelse(exists("stop_times"), 
                       (stop_times<-rbind.fill(read.csv(paste(Active, "/stop_times.txt", sep="")), stop_times)),
                       (stop_times<-read.csv(paste(Active, "/stop_times.txt", sep=""))))
                
                ifelse(exists("stops"), 
                       (stops<-rbind.fill(read.csv(paste(Active, "/stops.txt", sep="")), stops)),
                       (stops<-read.csv(paste(Active, "/stops.txt", sep=""))))
                
                ifelse(exists("transfers"), 
                       (transfers<-rbind.fill(read.csv(paste(Active, "/transfers.txt", sep="")), transfers)),
                       (transfers<-read.csv(paste(Active, "/transfers.txt", sep=""))))
                
                ifelse(exists("trips"), 
                       (trips<-rbind.fill(read.csv(paste(Active, "/trips.txt", sep="")), trips)),
                       (trips<-read.csv(paste(Active, "/trips.txt", sep=""))))
                }
