# MasterBayes Tutorial

## Purpose

This repository is part of a class project at Auburn University to develop a tutorial for the Bayesian pedigree reconstruction software MasterBayes **(HADFIELD CITATION)**.
We use simulated microsatellite data based on an empirical system and estimate several parameters of interest including euclidian distance from parents to offspring, the number of unsampled sires in the population, and the number of unsampled dams. 
This tutorial is by no means comprehensive, however, it does provide a gentle introduction to using Masterbayes.

## Viewing tutorials
The tutorials are written in R Markdown, then rendered on a personal computer (i.e., the models and analyses are run in R while the document is being rendered - so this cannot be done on GitHub) to produce an `.html` file. To view the output and not just html source code:
  - copy the following url to your clipboard (note the copy-to-clipboard button on the right of the code block
  ```
  https://htmlpreview.github.io/?
  ```
  
  - click on the link to the file for the tutorial you want to view
    - __TIP:__ you might want to open this into a new tab or window
  
  - In your browser's address bar, paste the copied url at the very beginning of the tutorial's url (i.e., pre-pend the tutorial url with the copied url) and go to this page
    - for example, go to the [`MasterBayes` tutorial](https://github.com/qgevoeco/pedigree_tutorial/blob/main/tutorial_masterbayes.html) then prepend so it looks like:
    ```
    https://htmlpreview.github.io/?https://github.com/qgevoeco/pedigree_tutorial/blob/main/tutorial_masterbayes.html
    ```
    
    
## Installing MasterBayes

Before beginning with our tutorial you will need to install MasterBayes from CRAN.
To do so, simply run the following in your R terminal:

```r
install.packages("MasterBayes", dependencies = TRUE)

```

There are several dependencies, so installation may take a minute or two. 
To confirm that installation was successful, run ``library(MasterBayes)`` in the R terminal. 
If everything worked several packages should load in and a few will throw errors about being obsolete, we will ignore those. 
