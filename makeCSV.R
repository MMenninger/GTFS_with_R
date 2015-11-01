library('stringr')

#Reset the variables
row<-0
i <-0
w= 0

for (i in 1:nrow(webdata)) {
#Select the folder
webdata[i,1]
folder <- paste(webdata[i,3], "_", webdata[i,4], "_", substr(webdata[i,5], 1, 4), sep="")
Active <- file.path(getwd(), "Unzips", folder)
print(Active)

#Select the file
t<- length(list.files(Active))
  
for (w in 1:t) {  
print(list.files(Active) [w])

ifelse (list.files(Active) [w] == "license_terms.txt", k<-"license",
        k<-str_c(paste(colnames(read.csv(paste(Active, "/", list.files(Active) [w], sep=""), nrows = 1))), collapse=','))

#Output
row<-row+1
output [row,1]<- Active
output [row,2]<- file_path_sans_ext(list.files(Active) [w])
output [row,3]<- k
}}


