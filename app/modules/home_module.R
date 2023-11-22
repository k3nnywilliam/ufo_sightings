ui_module_for_home <- function(id) {
  ns <- NS(id)
  tabPanel(
    title = "Home",
    fluid = TRUE,
    icon = icon("house"),
    id = ns("home-tab"),
    fluidRow(
      column(2),
      column(8,
            div(class = "home-div",
                br(),br(),
                h1(class = "main-home-text", 'Unidentified'),
                br(),br(),
                p("Recently, the U.S. Department of Defense had released several declassified videos showing encounters between military aircraft and unidentified aerial objects. These videos, recorded by U.S. Navy pilots, captured fast-moving objects exhibiting extraordinary flight characteristics that defied explanation."),
                p("Moreover, the New York Times published a series of articles in December 2017 that brought attention to the U.S. government's secret program investigating unidentified aerial phenomena (UAP) or unidentified flying objects (UFOs). These articles shed light on a secretive Pentagon program called the Advanced Aerospace Threat Identification Program (AATIP), which operated from 2007 to 2012."),
                p('One of the most notable incidents discussed in these articles was the encounter between Navy pilots and an unidentified object known as the "Tic Tac" UFO. In 2004, the USS Nimitz Carrier Strike Group encountered unknown objects off the coast of California. Pilots reported seeing a large, white, oblong-shaped object with no visible wings or exhaust, exhibiting advanced flight characteristics.'),
                p("Additionally, Congress had shown an increasing interest in understanding these phenomena and evaluating potential national security implications. In response to this interest, various hearings and briefings were held to address the sightings and encounters reported by military personnel and pilots.")
                )),
      column(2)
    )
  )
}


server_module_for_home <- function(id) {
  moduleServer(id, function(input, output, session){
    
  })
}