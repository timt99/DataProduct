library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Kidney Inflammatory prediction using a panel of expressed genes.
               Kidney inflammatory is determined by geometric mean score.\n
               Criteria: if score >= 2, then inflammation,
                         else score <= 2, noninflammation\n"),
  sidebarPanel(
    
    fileInput("file",'\n You can input a CSV file', accept = c('text/csv', 'text/comma-separated-values, text/plain')),

    dateInput("date", "Date:")
  ),
  
  mainPanel(
    p("This is a test to predict kidney transplant inflammation using 11 gene expression values.", style="color:blue"),
    p("The user will enter a CSV file containing gene expression values above 0 and the application will calculate the score to predict kidney inflammation.
      ,", style= "color:blue"),
    p("The input file is a .CSV file and will be in the same directory as the application,", style= "color:blue"),
    h3('Results of prediction'),
    h4('Which resulted in prediction scores below:\n'),
    verbatimTextOutput("prediction"),
    verbatimTextOutput("fileinput"),
    h4('File is written to the working directory called newRQ.csv'),
    h4('Please go to working directory using getwd() and open it now.')
    
  )
))


