# Getting-and-Cleaning-Data-Course-Project
getwd()
complete<- function(directory,  id= 1:332){
        mylist <- list.files(path = directory, pattern = ".txt" )
        nobs <- numeric()
        for (i in id) {
                mydata<- read.txt(mylist[i])
               mysum<- sum(complete.cases(mydata))
                nobs<- c(nobs, mysum)
          }
        data.frame(id, nobs)
    }
 
