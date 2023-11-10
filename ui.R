ui <- page_navbar(
  title = "UFO Sightings",
  nav_panel("Map", 
            mapUI2("map_server")
            ),
  nav_panel(
    "Statistics",
    fluidRow(
      column(
        width = 6,
        card(
          "card1"
        )
      ),
      column(
        width = 6,
        card(
          "card2"
        )
      ),
    )
    ),
  nav_panel(
    "Live Tweet",
   
  ),
  nav_panel(
    "Project Info",
    h3("I want to believe..."),
    p("Numerous sightings have been reported"),
    HTML('<iframe width="560" height="315" src="https://www.youtube.com/embed/auITEKd4sjA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
  )
)


