library(shiny)

shinyUI(fluidPage(
  
   headerPanel("Urine Kidney Inflammatory Prediction Test using a panel of 11 expressed genes" ),

    sidebarPanel(
    # Selector for file upload
<<<<<<< HEAD
       h4("Choose All files option after clicking Choose File below", style= "color:red"),
       fileInput("datafile",'\n You can input a CSV file.Choose All files option to see the input file.  Input file is downloaded into local working directory', accept = c('text/csv', 'text/comma-separated-values, text/plain')),
       actionButton("button", "Input file can be found in working directory"),
       actionLink("button", "https://www.dropbox.com/s/hndqau1h64aq5ym/Input.csv?dl=0"),
       tableOutput("fileData"),
       tableOutput("fileData2"),
=======
       fileInput("datafile",'\n You can input a CSV file. File must be in local working directory as the app', accept = c('text/csv', 'text/comma-separated-values, text/plain')),
       actionButton("button", "Input file can be found in link below"),
       actionLink("button", "https://www.dropbox.com/s/hndqau1h64aq5ym/Input.csv?dl=0"),
       
>>>>>>> a808d7e0d10014a0d1f08d11abac96ee68bc2c3b
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
<<<<<<< HEAD
      h4("Input file is a .CSV file and must be saved in the same working directory as the server.R for Shiny app to run,", style= "color:blue"),
=======
      h4("The input file is a .CSV file and will be in the same directory as the application,", style= "color:blue"),
>>>>>>> a808d7e0d10014a0d1f08d11abac96ee68bc2c3b
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
<<<<<<< HEAD
        tabPanel("Documentation",
                 mainPanel(
                   h4("This is a shiny application that input 11 genes and predict kidney inflammation by calculating the geometric mean called CRM score.  Kidney inflammatory is determined by the geometric mean score.
                      Criteria: if score >= 2, then inflammation,
                      else score <= 2, noninflammation
                      The Input.csv file will be downloaded into their local working directory where the UI.R and server.R files are also located. The input file can be found here https://raw.githubusercontent.com/timt99/DataProduct/master/Input.csv
                      or it can be download here in box: https://www.dropbox.com/s/hndqau1h64aq5ym/Input.csv?dl=0
                      The Input.csv, the UI.R, and server.R files must all be in same working directory for the apps to work. 
                      The user then upload this input file using the Shiny app and the Shiny app will determine whether the patients has kidney inflammation or noninflammation. 
                      The apps predict if patient has kidny inflammation or not. The plot1 show the level of CRM scores among the patients.  Plot2 show histogram of the score among patients.
                      Plot3 shows the average fold change for each genes among all the patients. 
                      ", style= "color:blue")
=======
        tabPanel("About",
                 mainPanel(
                   includeMarkdown("documentation.md")
>>>>>>> a808d7e0d10014a0d1f08d11abac96ee68bc2c3b
            )
        )
      
     )
   )
  
)
)






