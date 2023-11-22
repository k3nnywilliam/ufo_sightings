ui <- tagList(
  useWaiter(), 
  waiterPreloader(html = tagList(
    p("WELCOME"),
    spin_3()
  ),
  color = "#000000",
  fadeout = TRUE),
  navbarPage(
    "UNIDENTIFIED",
    tags$head(
      tags$link(
        rel = "stylesheet",
        href = "styles.css"
      )
    ),
    theme = bslib::bs_theme(
      version = "5", 
      "navbar-bg" = "rgba(255,255,255,0)",
      "nav-link-font-size" = "20px",
      "nav-link-color" = "#464646 !important",
      "nav-link-hover-color" = "red !important",
      "navbar-light-active-color" = "red !important"
      #bootswatch = "darkly"),
    ),
    ui_module_for_home("home"),
    ui_module_for_map("map"),
    ui_module_for_media("media"),
    ui_module_for_aboutme("about"),
    footer = tags$footer(
      HTML(
        '
        <br>
        <br>
        <p class = "page-footer"> ',paste0("Website made by Kenny Anak William Nyallau © ", format(Sys.Date(), "%Y")),'</p>')
    )
  )
)
  
  
