#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
suppressPackageStartupMessages({
    library(AnVIL)
    library(DT)
    library(ggplot2)
})
avworkspace("use-strides/CMG Eye")  # declares until reset
subjtab = avtable("subject")

samptab = avtable("sample")

seqtab = avtable("sequencing")
# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("CMG Eye Data Slice"),

    # 
    sidebarLayout(
        sidebarPanel(
            helpText("A view of CMG Eye data")
        ),
        mainPanel(
           plotOutput("readn")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$readn = renderPlot({

    
    
    ## ----dohist----------------------------------------------------------------------------------------------
    
         ggplot(seqtab, aes(x=`pfb:total_reads`)) + geom_histogram()
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
