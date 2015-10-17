webdata <- read.csv("webdata.csv", stringsAsFactors=FALSE)
PCPath <- getwd()
list.files(PCPath)
dir.create("Zips")
dir.create("Unzips")

#Download One File
x <-1
webdata[x,1]
webPath<- webdata[x,1]
target<- file.path(PCPath, paste("Zips/", webdata[x,3], webdata[x,4], webdata[x,5], sep=""))
download.file(webdata[x,1], target)
unzip(target, exdir = file.path("Unzips/", paste(webdata[x,3], "_", webdata[x,4], "_", substr(webdata[x,5], 1, 4), sep="")))
     

#Download All Files
for (i in 1:nrow(webdata)) {
                            webdata[i,1]
                            webPath<- webdata[i,1]
                            target<- file.path(PCPath, paste("Zips/", webdata[i,3], webdata[i,4], webdata[i,5], sep=""))
                            download.file(webdata[i,1], target)
                            unzip(target, exdir = file.path(PCPath, paste("Unzips/", webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")))
                            }


