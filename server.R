
## Calculate geometric mean
inflammationRisk <- function(vec1)
{   
  vec1 <- as.numeric(vec1)
  vec1 <- vec1[!is.na(vec1)]
  prod(vec1)^(1/length(vec1))
  
}


shinyServer(function(input, output) 
{
  
      output$oid1 <- renderText(
        { 
          input$goButton
          isolate(paste(input$vect))
          id1 <- input$vec1
          print('As string')
          print(id1)
        }
        )
        
           
        

  
      output$oid2<-renderPrint(
        {
          
          x <- as.numeric(unlist(strsplit(input$vec1,",")))
          cat("As atomic expression vector:\n")
          print(x)
      
        }
        )
      output$oid3 <-renderPrint(
        {
          
          x2 <- as.numeric(unlist(strsplit(input$vec1,",")))
          len <- length(x2)
          cat("Length of expression vector:\n")
          print(len)
        }
        )
      output$prediction <- renderPrint(
        { 
          pred <- inflammationRisk(as.numeric(unlist(strsplit(input$vec1,","))))
          if( pred > 2.00)
        { 
          print(pred)
          print("Kidney Inflammatory if score is >= 2.00")
        }
        else print("Kidney noninflammatory if score is <= 2.00")
      
        }
      )
  }
)
