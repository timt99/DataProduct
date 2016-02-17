library(gdata)
library(shiny)
library(ggvis)
library(data.table)
library(markdown)
library(ggplot2)
library(dplyr)


## Calculate geometric mean
inflammationRisk <- function(vec1)
{   
  vec1 <- as.numeric(vec1)
  vec1 <- vec1[!is.na(vec1)]
  prod(vec1)^(1/length(vec1))
  
}


shinyServer(function(input, output) 
{
  
      #Loading the selected file
      filedata <- reactive({
        infile <- input$datafile
        if(is.null(infile)){
          return(NULL)
         }
        read.csv(infile$datapath)
      
      })
      
          
        # function populate the column selectors
       output$toCol <- renderUI({ 
         df <- filedata()
         if(is.null(df))
           return(NULL)
         items= names(df)
         names(items) = items
         selectInput("to", "To:", items)
         })
      
       output$fromCol <- renderUI({
         df <-filedata()
         if (is.null(df)) return(NULL)
         
         items=names(df)
         names(items)=items
         selectInput("from", "From:",items)
         
       })
       
       #The checkbox selector is used to determine whether we want an optional column
       output$amountflag <- renderUI({
         df <-filedata()
         if (is.null(df)) return(NULL)
         
         checkboxInput("amountflag", "Use values?", FALSE)
       })
       
       #If we do want the optional column, this is where it gets created
       output$amountCol <- renderUI({
         df <-filedata()
         if (is.null(df)) return(NULL)
         #Let's only show numeric columns
         nums <- sapply(df, is.numeric)
         items=names(nums[nums])
         names(items)=items
         selectInput("amount", "Amount:",items)
       })
       
       # This previews the CSV data file
       output$filetable <- renderTable({
        filedata()
          })
       
       # function triggered action when action button is pressed
       geodata <- reactive({
         if (input$getdata == 0) return(NULL)
         df=filedata()
         print(df)
         if (is.null(df)) return(NULL)
       })
       
       output$fileinput <- renderPrint( 
         { if(is.null(input$datafile)) return()
           inFile <- input$datafile
           RQdata <- read.csv(inFile$datapath)
             
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
            
            
                RQdata$CRMscore <- apply(RQdata[, 2:12], 1, gm_mean)
                
                newdata2 <- select(RQdata, Sample, CD6:CRMscore)
               # print(newdata2)
              
                prediction <- predict(newdata2$CRMscore)
                newdata3 <- cbind(newdata2, prediction)
                newdata4 <- select(newdata3, Sample, CRMscore, prediction)
                print(newdata4)
    
                df1 <- t(newdata2)
                df1 <- as.data.frame(df1)
                
                 
                 df1$Mean <- apply(df1[, 2:20], 1, meanRQ)
                 newdata5 <- select(df1, Mean)
                 
                 print(newdata5)
              
                highRQ <- sort(newdata5$Mean)
                print("Mean expression of Gene:")
                print(highRQ)
                write.csv(newdata3, "outputRQ.csv")
              
                 
                 output$Histogram <- renderPlot(
                   {
                 hist(RQdata$CRMscore)
                 }
                 )
                 
                 output$`Prediction Result` <- renderPlot(
                   { 
                     g <- ggplot(data= newdata3, aes(x=Sample, y=CRMscore))
                     p <- g + geom_bar(colour= "blue",stat= "identity")+ labs(title = "Prediction Results")
                     print(p)
                     
                      }
                 )
                 
                 output$Plot3 <- renderPlot(
                   {
                     hist(newdata5$Mean)
                   }
                 )
                 
      }
           
      
      )
       
       
  }
)
      
        
  
