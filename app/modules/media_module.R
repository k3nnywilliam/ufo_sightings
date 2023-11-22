ui_module_for_media <- function(id) {
  ns <- NS(id)
  tabPanel(
    "Media",
    br(),br(),
    fluidRow(
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/auITEKd4sjA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
             ),
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/Wh-tCAY0u7I" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
             ),
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/2nSIKYlm2eE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
             ),
    ),
    br(), br(),
    fluidRow(
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/YxDYWh6FAfw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
      ),
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/SNgoul4vyDM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
      ),
      column(4,
             HTML('<iframe width="450" height="315" src="https://www.youtube.com/embed/w-xJATBctIA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
      ),
    )
  )
}

server_module_for_media <- function(id) {
  moduleServer(id, function(input, output, session){
    
  })
}