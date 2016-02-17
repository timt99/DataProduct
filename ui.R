library(shiny)

shinyUI(pageWithSidebar(
  
   headerPanel("Kidney Inflammatory prediction using a panel of expressed genes.
               Kidney inflammatory is determined by geometric mean score.\n
               Criteria: if score >= 2, then inflammation,
                         else score <= 2, noninflammation,
                                              Input file"    ),
  sidebarPanel(
    # Selector for file upload
    fileInput("datafile",'\n You can input a CSV file', accept = c('text/csv', 'text/comma-separated-values, text/plain')),
    uiOutput("fromCol"),
    uiOutput("toCol"),
    uiOutput("amountFlag"),
    conditionalPanel(
      condition= "input.amountflag==true",
      uiOutput("amountCol")
      ),
    
    actionButton("getdata", "Get data")
  ),
  
  mainPanel(
    
      tableOutput("filetable"),
      tableOutput("dataTable"),
      p("This is a test to predict kidney transplant inflammation using 11 gene expression values.", style="color:blue"),
      p("The user will enter a CSV file containing gene expression values above 0 and the application will calculate the score to predict kidney inflammation.
        ,", style= "color:blue"),
      p("The input file is a .CSV file and will be in the same directory as the application,", style= "color:blue"),
      h3('Results of prediction'),
      h4('Which resulted in prediction scores below:\n'),
      verbatimTextOutput("prediction"),
      verbatimTextOutput("fileinput"),
      tabsetPanel(
        tabPanel("Plot1", plotOutput("Prediction Result")),
        tabPanel("Plot2", plotOutput("Histogram")),
        tabPanel("Plot3", plotOutput("Plot3"))
      )
      
     )
  )
  
)



