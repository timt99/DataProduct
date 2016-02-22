Data product project
========================================================
author: Tim Q. Tran
date: Sun Feb 21 16:19:21 2016
transition: rotate
font-family: 'Helvetica'

======================================================== 
## Kidney Inflammatory predictor

- This presentation is being created as part of the peer assessment for the coursera developing data product class. 
- This assignment is geard toward ensuring the following concepts were well understood by the students.
- This application uses shiny to build a data product that can predict kidney inflammmation through looking at 11 genes or biomarkers from each patient.


===========================================================

## The Application
- To display the understanding of using shiny to build an application called "Kidney Inflammation predictor".
- The application enables the user to:
       - Predict kidney inflammatory disease by using the 11 expression values from 11 genes by           quantitative real time PCR (Q-PCR).
       - This panels used a maximum of 11 genes(1) expression values from the real time PCR (Q-PCR) assay.
       - User upload an Input.CSV file containing 11 expression values for each gene for              maximum of 11 genes.
       - The app will calculate the score for each patients from the 11 genes and predict whether patient has inflammation or noninflammation.

==================================================================
## The Data
- This application is based on the 11 genes expression values in the .CSV file that user can upload. The expression values in Input.CSV file that is uploaded should contain values for 11 genes (CD6, BASP1, CXCL10, CXCL9, ISG20, INPP5D, NKG7, LCK, PSMB9, RUNX3 and TAP1).
- After the user upload Input.CSV file containing  all 11 expression values for each genes, a geometric mean is calculated for all the 11 genes.
- Criteria for the test are:  
       - geometric mean >= 2.00 give inflammation
       - geometric mean <= 2.00 give noninflammation
- Each expression values cannot be N/A or 0 or else the geometric score cannot be calculated.
- The source code for the project is available on the GitHub. 

=============================================================================

## Guidelines to reproduce locally

- Guidelines to reproduce this project locally on your PC.
- To run locally this App on your computer, you need the input .CSV file, the UI.R and server.R files in the local working directory. 
  - Install the necessary packages to run RStudio's Shiny Server locally. Please  view the well documented requirements in the getting started page:               http://shiny.rstudio.com/articles/shinyapps.html
  - Run the following command in the RStudio in your working directory to run shiny apps: runApp()
  - The shiny app is also deploy in this link https://timtranshiny.shinyapps.io/data/
  - The source code for the project is available on the GitHub via https://github.com/timt99/DataProduct
  


============================================================================

## Function to calculate the geometric mean or score of the 11 genes
      output$fileinput <- renderPrint( 
          { if(is.null(input$datafile)) return()
           inFile <- input$datafile
           RQdata <- read.csv(inFile$datapath)
            gm_mean <- function(x)
           {   
             x <- as.numeric(x)
             x <- x[!is.na(x)]
             prod(x)^(1/length(x))
           }
           RQdata$CRMscore <- apply(RQdata[, 2:12], 1, gm_mean)
          newdata2 <- select(RQdata, Sample, CD6:CRMscore)   
          
References:
1. http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3804941/
2. http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4569485/



