projectInfoUI <- function(id) {
  ns <- NS(id)
  htmlOutput(ns("'iframe-out'"))
}

projectInfoServer <- function(id) {
  moduleServer(
    id, 
    function(input, output, session) {
    })
}