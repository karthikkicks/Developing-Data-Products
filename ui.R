library(shiny)

# Define UI for application demonstrates R package quantmod graph capabilities
shinyUI(    
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