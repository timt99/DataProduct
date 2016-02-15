library(gdata)
library(shiny)


## Calculate geometric mean
inflammationRisk <- function(vec1)
{   
  vec1 <- as.numeric(vec1)
  vec1 <- vec1[!is.na(vec1)]
  prod(vec1)^(1/length(vec1))
  
}


shinyServer(function(input, output) 
{
  

      output$fileinput <- renderPrint(
        { if(is.null(input$file)) return()
          inFile <- input$file
          RQdata <- read.csv(inFile$datapath)
          
          #print(summary(RQdata))
          
          #Calculate geometric mean or score
          gm_mean <- function(x)
          {   
            x <- as.numeric(x)
            x <- x[!is.na(x)]
            prod(x)^(1/length(x))
            
          }
          
          
          # Calculate the mean
          meanRQ <- function(x)
          {  x <- as.numeric(x)
             x <- x[!is.na(x)]
             mean(x)
             
          }
          
          #Predict inflammation based on score
          predict <- function(n)
          {
             ifelse(n > 2, "inflame", "noninflame")
            
          }
          
          RQdata$CRMscore <- apply(RQdata[, 4:14], 1, gm_mean)
          pred <- predict(RQdata$CRMscore)
          RQmean <- apply(RQdata[, 4:14], 2, meanRQ)
          header <- c("ID", "Sample Name", "18s", "CD6", "BASP1", "CXCL10", "CXCL9", "INPP5D", "ISG20", "LCK", "NKG7", "PSMB9", "RUNX3", "TAP1")
          header2 <- c("CD6", "BASP1", "CXCL10", "CXCL9", "INPP5D", "ISG20", "LCK", "NKG7", "PSMB9", "RUNX3", "TAP1")
          
          indx <- sapply(RQdata, is.factor)
          RQdata[indx] <- lapply(RQdata[indx], as.character)
          DF1 <- rbind(header, RQdata)
          #report <- cbind(DF1, pred)
          DF1[] <- lapply(DF1, type.convert)
          write.csv(DF1, "newRQ.csv")
          print(RQdata$CRMscore)
          sample <- RQdata[,2]
          newdata <- rbind(sample, RQdata$CRMscore)
          newdata2 <- rbind(newdata, pred)
          print(newdata2)
          DF2 <- rbind(header2, RQmean)
          print(DF2)
          highRQ <- max(RQmean)
          print("Max Fold change:")
          print(highRQ)
          
          
          
        })
      
       
      
  }
)
