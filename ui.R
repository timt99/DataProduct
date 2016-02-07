library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Kidney Inflammatory prediction using a panel of expressed genes.\n
               Kidney inflammatory is determined by geometric mean score.
               \n Criteria: score >= 2 means inflammatory\n
                            score <= 2 means noninflammatory\n"),
  sidebarPanel(
    textInput('vec1', 'Enter a vector of gene expressions(comma delimited), min= 3, max= 11)', "12,10,14"),
    actionButton('goButton', 'Go!'),
    dateInput("date", "Date:")
  ),
  
  mainPanel(
    h3('Results of prediction'),
    h4('You entered as string'),
    verbatimTextOutput("oid1"),
    verbatimTextOutput("oid2"),
    h4('Length of expression vector\n'),
    verbatimTextOutput("oid3"),
    h4('Which resulted in a prediction of:\n'),
    verbatimTextOutput("prediction")
  )
))


