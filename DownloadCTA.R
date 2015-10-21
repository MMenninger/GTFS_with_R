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

agency <-data.frame() #May be a better way to make all of these??
calendar <-data.frame()
calendar_dates<-data.frame()
frequencies<-data.frame()
routes<-data.frame()
shapes<-data.frame()
stop_times<-data.frame()
stops<-data.frame()
transfers<-data.frame()
trips<-data.frame()

#Load Files in R
#for (i in 1:nrow(webdata)) {
for (i in 1:1) {
                folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
                folder #tells you what file working on
                Active <- file.path(getwd(), "Unzips", folder)
                
                list.files(Active) [i] #For testing
                file_path_sans_ext(list.files(Active) [i]) # For testing
                
                agency<-read.csv(paste(Active, "/agency.txt", sep=""))
                calendar<-read.csv(paste(Active, "/calendar.txt", sep=""))
                calendar_dates<-read.csv(paste(Active, "/calendar_dates.txt", sep=""))
                frequencies<-read.csv(paste(Active, "/frequencies.txt", sep=""))
                routes<-read.csv(paste(Active, "/routes.txt", sep=""))
                shapes<-read.csv(paste(Active, "/shapes.txt", sep=""))
                stop_times<-read.csv(paste(Active, "/stop_times.txt", sep=""))
                stops<-read.csv(paste(Active, "/stops.txt", sep=""))
                transfers<-read.csv(paste(Active, "/transfers.txt", sep=""))
                trips<-read.csv(paste(Active, "/trips.txt", sep=""))
               }

shapes<-unique(shapes)
stop_times<-unique(stop_times)
