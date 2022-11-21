# MasterBayes Tutorial

## Purpose

This repository is part of a class project at Auburn University to develop a tutorial for the Bayesian pedigree reconstruction software MasterBayes **(HADFIELD CITATION)**.
We use simulated microsatellite data based on an empirical system and estimate several parameters of interest including euclidian distance from parents to offspring, the number of unsampled sires in the population, and the number of unsampled dams. 
This tutorial is by no means comprehensive, however, it does provide a gentle introduction to using Masterbayes.

## Installing MasterBayes

Before beginning with our tutorial you will need to install MasterBayes from CRAN.
To do so, simply run the following in your R terminal:

```r
install.packages("MasterBayes", dependencies = TRUE)
