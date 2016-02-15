Data product project
========================================================
author: Tim Q. Tran
date: Sun Feb 07 00:16:12 2016

========================================================
## Kidney Inflammatory predictor

- This presentation is being created as part of the peer assessment for the coursera developing data product class. 
- This assignment is geard toward ensuring the following concepts were well understood by the students.
- This application uses shiny to build a data product.

===========================================================
## The Application
- To display the understanding of using shiny to build an application called       "Kidney Inflammation predictor".
- The application enables the user to:
       - Predict kidney inflammatory disease by using the expression values from           quantitative real time PCR (Q-PCR).
       - This panels used a maximum of 11 genes(1) expression values from the           real time PCR (Q-PCR).
       - User enters an arbitrary expression values( 1-30) for each gene for              maximum of 11 genes.
       
==================================================================
## The Data
- This application is based on the 11 or less expression values enter by the user. The expression values enter should be a string with comma delimited separating each values.

- After the user enters  all 11 expression values for each genes, a geometric mean is calculated for all the 11 genes.
- Criteria for the test are:  
       - geometric mean >= 2.00 give inflammation
       - geometric mean <= 2.00 give noninflammation
- Each expression values cannot be N/A or 0 or else the geometric score cannot be    calculated.
- The source code for the project is available on the GitHub. 


=============================================================================

## Guidelines to reproduce locally

- Guidelines to reproduce this project locally on your PC.
- To run locally this App on your computer, you do NOT need to fork this repo. 
- Please follow these instructions:
  - Install the necessary packages to run RStudio's Shiny Server locally. Please     view the well documented requirements in the getting started page:               http://shiny.rstudio.com/articles/shinyapps.html
  - Run the following command in the RStudio: runApp()
  


============================================================================

For more information

- For more information about RStudio Shinyapps.io.visit:http://shiny.rstudio.com/articles/shinyapps.html

- For more information about this application: go to reference:http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3804941/

References:

1. http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3804941/
2. http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4569485/

