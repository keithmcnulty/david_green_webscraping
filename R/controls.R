# sidebar controls

shiny::mainPanel(
  shiny::textInput("url", "", placeholder = "https://some.url"),
  shiny::actionButton("go", "Go!"),
  shiny::uiOutput("dwButton")
)

output$dwButton <- shiny::renderUI({
  shiny::req(results())
  shiny::downloadButton("dwStart", "Download results in Excel")
})