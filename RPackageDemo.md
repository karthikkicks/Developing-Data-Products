R Package Demonstration
========================================================
author: Lakshmanan Arasakumar
date: 04/21/2016
transition: rotate
css: customPres.css

Project Moto
========================================================
incremental: true

Requirements of the project:

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the text box below
4. Share your server.R and ui.R code on github


Solution
========================================================
incremental: true

This project is a demonstration of an R package called Quantmod.

It is a package to work with stock market information in an easy to use way.  It also has a number of options that drive what analysis occurs when looking at certain stock information.

Use of the app:
* Demonstrates the capabilities of this package
* Learn more about Shiny, Slidify, and the quantmod package all at the same time


Quantmod
========================================================

So here's how easy quantmod is to work with.  In the R quantmod package, the following code:



```r
library(quantmod)
getSymbols("^DJI", from=Sys.Date()-90, to=Sys.Date())
chartSeries(DJI, theme=chartTheme("beige"))
```



Produces a nice detailed graph like this:
![plot of chunk unnamed-chunk-4](RPackageDemo-figure/unnamed-chunk-4-1.png)


Project Functionalities
========================================================

The final version of the project hast the following functionalities:

* Enter whatever stock you want to analyze
* Choose your own date ranges to look at
* Overlay many of the available analysis options for the graph
* Play with many of the available options interactivly and get feedback immediately

You can run the demo at <a href="https://karthikkicks.shinyapps.io/PackageDemo">https://karthikkicks.shinyapps.io/PackageDemo/</a>
