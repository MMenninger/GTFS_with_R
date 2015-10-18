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

#Load FIles in R
#for (i in 1:nrow(webdata)) {
for (i in 1:1) {
                folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
                folder #tells you what file working on
                Active <- file.path(getwd(), "Unzips", folder)
  
                }

list.files("Unzips")

list.files(Active)
agency<-read.csv(paste(Active, "/agency.txt", sep=""))
agency<-rbind(read.csv(paste(Active, "/agency.txt", sep="")), agency)
