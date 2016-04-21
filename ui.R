library(shiny)

shinyUI(    
 navbarPage("Demonstration of an R Package", inverse=FALSE,
             
	tabPanel("Documentation",
            fluidPage(
              verticalLayout(
                h2("How to use this Application", align="center"),
                hr(),
                h3("Directions"),
                p("To get started using this application, you'll need to look at the banner line above titled \"Demonstration of an R Package\" and click \"Application\".  This will take you to the application itself.  You can click \"Documentation\" to return to this screen."),
                p("The application begins by displaying the stock symbol \"^DJI\" which represents the Dow Jones Industrial Average.  You can enter whatever stock symbol you would like (without the caret \"^\") and the graph will update accordingly.  If your stock symbol is not valid - no graph will display"),
                p("There are other areas you can play with to change the current display for the selected stock:"),
                tags$ol(tags$li("Date Range - you can change the date range selected for the price display"),
                        tags$li("Add Optional Technical Analysis Overlays - you can add additional chart items that will calculate some industry analytics and overlay them on the existing chart.")),

                p("The graph will immediately respond to any changes you make.  Feel free to experiment and explore this application based on R, Shiny, and the quantmod package for R!"),
                br(),
                h3("About the Application"),
                p("The app starts by providing a user interface that collects a stock symbol, date range, and optional analytics to perform on the provided stock symbol.  When anything changes in the user interface, the application reacts to the changes by updating the graphs calculated by the server code."),
                tags$ol(tags$li("Input"), tags$ul(tags$li("Stock Symbol - textInput()"), tags$li("Date Range - dateRangeInput()"), tags$li("Technical Analysis - checkBoxGroupInput()")),
                        tags$li("Operation/Calculation", tags$ul(tags$li("Call to getSymbols() to retrieve data"), tags$li("preparation of variables for graphic display"))), 
                        tags$li("Reactive Output"), tags$ul(tags$li("Call to render graph calculations within the quantmod libraries"), tags$li("Display of the rendered graph"))),
                hr()
                )
            )
   ),
    tabPanel("Application",
				fluidPage(		
					# Sidebar for inputting values
					sidebarLayout(
						sidebarPanel(
							textInput("symbol", "Please provide stock symbol here", value = "^DJI", width = "30%"),
							br(),
							dateRangeInput("dtRange", "Date", start = Sys.Date()-90, end = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = "month", weekstart = 0, language = "en", separator = " to ", width = NULL),
							hr(),
							flowLayout(
									   checkboxGroupInput("ta", "Options for technical analysis",
														  c("Directional Movement Index" = "addADX()",
															"Average True Range" = "addATR()",
															"Contract Expiration Bars" = "addExpiry()",
															"Simple Moving Average" = "addSMA()",
															"Expotential Moving Average" = "addEMA()",
															"Weighted Moving Average" = "addWMA()",
															"Price Envelope" = "addEnvelope()",
															"Relative Strength Index" = "addRSI()",
															"Stochastic Momemtum Indicator" = "addSMI()"
														  ))
									   
							)
						),
						# Demo plot
						mainPanel(
							plotOutput("distPlot", height="885px")
						)
					)
				)
			)
	)
               
    
)