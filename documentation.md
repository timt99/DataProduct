---
title: "Kidney Inflammation"
author: "Tim Tran"
date: "February 15, 2016"
output: html_document
---

This is a shiny application that input 11 genes and predict kidney inflammation by calculating the geometric mean called CRM score.  Kidney inflammatory is determined by the geometric mean score.
Criteria: if score >= 2, then inflammation,
          else score <= 2, noninflammation
The user must dowload the Input.csv file to their local directory where the UI.R and server.R files are located. The input file can be found here https://github.com/timt99/DataProduct/blob/master/Input.csv
or it can be download here in box: https://www.dropbox.com/s/hndqau1h64aq5ym/Input.csv?dl=0
The user must download this Input.csv file to their working directory where the UI.R and server.R are also located for the apps to work. 
The user then upload this file using the Shiny app and the Shiny app will determine whether the patients has kidney inflammation or noninflammation. A CRM score of greater than 2 indicate kidney inflammation. A CRM score of less than 2 indicate noninflammation. The graph show the level of CRM scores among the patients. 


