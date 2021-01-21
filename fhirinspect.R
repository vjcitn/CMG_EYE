library(shiny)

allproj = dir()
#x = readLines("AnVIL_CMG_Broad_Eye_Pierce_WGS/Observation.json")
#dem = jsonlite::fromJSON(x[1])

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("AnVIL FHIR inspector"),
   selectInput("project", "Projects", choices=allproj,
     selected="AnVIL_CMG_Broad_Eye_Pierce_WGS"),
   helpText("Available data:"),
   uiOutput("found"), width=3
   ),
  mainPanel(
   tabsetPanel(
    tabPanel("jsonedit",
      verbatimTextOutput("mfile"),
      jsoneditOutput("myjs2")
      )
    )
   )
  )
 )

server = function(input, output) {
 output$found = renderUI({
  ans = dir(input$project, full=TRUE)
  names(ans) = basename(ans)
  radioButtons("file", "Selection", ans)
  })
 output$mfile = renderPrint({
  input$file
  })
 output$myjs2 = renderJsonedit({
  validate(need(length(input$file)>0, "waiting for selection"))
  allrec = try(readLines(input$file))
  validate(need(!inherits(allrec, "try-error"), "pick another file"))
  alljs = lapply(allrec, function(x) jsonlite::fromJSON(txt=x))
  jsonedit(alljs)
  })
}

runApp(list(ui=ui, server=server))
   
 
