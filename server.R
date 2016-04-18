library(shiny)
library(quantmod)
options("getSymbols.warning4.0"=FALSE)

shinyServer(function(input, output) {
    
    # Logic for stock chart plot
    sSymbol <- reactive({
        tryCatch({
            suppressWarnings(getSymbols(input$symbol, from=input$dtRange[1], to=input$dtRange[2],
                                        auto.assign = FALSE))
        }, error = function(err) {
            return(NULL)
        })
    })
    
    output$distPlot <- renderPlot({
        taStr<-"addVo()"
        if (!is.null(input$ta)) {
            for (ta in input$ta) {
                taStr<-paste(taStr, paste(";", ta))
            }
        }
        
        if(!is.null(sSymbol())) {
            chartSeries(sSymbol(), name=input$symbol, TA=taStr, theme='white.mono')
        }
    })
    
    output$dispPrint <- renderPrint({
        print(sSymbol())
    })
})