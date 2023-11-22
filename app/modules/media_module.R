ui_module_for_media <- function(id) {
  ns <- NS(id)
  tabPanel(
    "Media",
    fluidRow(
      column(),
      column(),
      column(),
    )
  )
}

server_module_for_media <- function(id) {
  moduleServer(id, function(input, output, session){
    
  })
}