library(shiny)

shinyUI(fluidPage(
  
   headerPanel("Urine Kidney Inflammatory Prediction Test using a panel of 11 expressed genes" ),

    sidebarPanel(
    # Selector for file upload
       fileInput("datafile",'\n You can input a CSV file. File must be in local working directory as the app', accept = c('text/csv', 'text/comma-separated-values, text/plain')),
       actionButton("button", "Input file can be found in link below"),
       actionLink("button", "https://www.dropbox.com/s/hndqau1h64aq5ym/Input.csv?dl=0"),
       
       uiOutput("amountFlag"),
       fileInput("outfile", 'Open Output file.'),
      conditionalPanel(
       condition= "input.amountflag==true",
       uiOutput("amountCol")
          ),
             dateInput("date", "Date:")
      
        ),
   
  
  mainPanel(
    
      tableOutput("filetable"),
      tableOutput("dataTable"),
      h3("This is a test to predict kidney transplant inflammation using 11 gene expression values.", style="color:blue"),
      h4("The user will enter a CSV file containing gene expression values above 0 and the application will calculate the score to predict kidney inflammation.
        ,", style= "color:blue"),
      h4("The input file is a .CSV file and will be in the same directory as the application,", style= "color:blue"),
      h3('Results of prediction'),
      h4('Which resulted in prediction scores below:\n'),
      verbatimTextOutput("prediction"),
      verbatimTextOutput("fileinput"),
      h4('File is written to the working directory called newRQ.csv', style= "color:blue"),
      h4('Please go to working directory using getwd() and open it now.', style="color:blue"),
      tabsetPanel(
        tabPanel("Plot1", plotOutput("Prediction Result")),
        tabPanel("Plot2", plotOutput("Histogram")),
        tabPanel("Plot3", plotOutput("Plot3")),
        tabPanel("About",
                 mainPanel(
                   includeMarkdown("documentation.md")
            )
        )
      
     )
   )
  
)
)






