ui_module_for_map <- function(id) {
  ns <- NS(id)
  tabPanel(
    title = "Global Sightings",
    fluid = TRUE,
    icon = icon("globe-americas"),
    leafletOutput(ns("ufo_map"), width = "100%", height = "100vh"),
    absolutePanel(
      top = 100, left = 70, draggable = FALSE, width = "20%", style = "z-index:500; min-width: 300px;",
      dateRangeInput(ns("date-range-input"), "Date", start = as.Date("2014-01-01"), end = as.Date("2014-06-01"), max = Sys.Date()),
      selectizeInput(ns("select-country"), "Country", choices = unique(data_dt$country), multiple = TRUE),
      selectizeInput(ns("select-state"), "State", choices = list(), multiple = TRUE),
      selectizeInput(ns("select-shape"), "UFO Shape", choices = unique(data_dt$shape), multiple = TRUE)
    )
  )
}

server_module_for_map <- function(id) {
  moduleServer(id, function(input, output, session){
    filtered_by_date <- reactiveValues(data = NULL)
    
    observe({
      req(data_dt)
      cat("Date changed", "\n")
      if(input$"date-range-input"[1] > input$"date-range-input"[2] ) {
        updateDateRangeInput(session, "date-range-input", "Date", start = as.Date("2013-01-01"), end = as.Date("2013-03-01"), max = Sys.Date())
        showModal(
          modalDialog(
            "Invalid date range! Start date cannot exceed end date!",
            fade = TRUE,
            easyClose = TRUE
          )
        )
      } else {
        filtered_by_date$data  <- filterByDate(data_dt, input$"date-range-input"[1], input$"date-range-input"[2])
      }
    }) %>% bindEvent(c(input$"date-range-input"), ignoreNULL = TRUE, ignoreInit = FALSE)
    
    
    filtered_by_country_input  <- eventReactive(input$'select-country', {
      print(input$"select-country")
      req(filtered_by_date$data)
      filtered <- filterByCountry(filtered_by_date$data, input$'select-country')
      return(filtered)
    })
    
    observe({
      req(filtered_by_country_input())
      updateSelectizeInput(session, "select-state", choices = unique(filtered_by_country_input()$state), selected = "", server = TRUE)
    })
    
    filtered_by_state_input  <- eventReactive(input$'select-state', {
      date_data <-  filtered_by_date$data
      filtered <- filterByState(date_data[date_data$country == input$'select-country'], input$'select-state')
      return(filtered)
    })
    
    
    observe({
      if(input$'select-state' == "" && !is.null(input$'select-state')) {
        cat("State selected", "\n")
        updateSelectizeInput(session, "select-shape", choices = unique(filtered_by_country_input()$shape), selected = "", server = TRUE)
      } else {
        cat("State not selected", "\n")
        updateSelectizeInput(session, "select-shape", choices = unique(filtered_by_state_input()$shape), selected = "", server = TRUE)
      }
    }) %>% bindEvent(input$'select-state')
    
    
    output$ufo_map <- renderLeaflet({
      if (nrow(filtered_by_country_input()) > 0 && !is.null(filtered_by_country_input()) && input$'select-country' != "") {
        if(input$'select-shape' != "" && !is.null(input$'select-shape') && length(input$'select-shape') > 0) {
          if (input$'select-state' != "" && length(input$'select-state') > 0 && !is.null(input$'select-state')) {
            filtered_datas <- filtered_by_state_input()[filtered_by_state_input()$shape %in% input$'select-shape']
          } else {
            filtered_datas <- filtered_by_country_input()[filtered_by_country_input()$shape %in% input$'select-shape']
          }
        } else {
          if (input$'select-state' != "" && length(input$'select-state') > 0 && !is.null(input$'select-state')) {
            filtered_datas <- filtered_by_state_input()
          } else {
            filtered_datas <- filtered_by_country_input()
          }
        }
        
        #Main render
        req(filtered_datas)
        rendered <- leaflet() %>%
          addTiles() %>% 
          addProviderTiles(providers$CartoDB.DarkMatter) %>%
          addCircles(
            data = filtered_datas,
            lng=~city_longitude,  weight = 10, radius = 100, 
            lat=~city_latitude, label = ~htmlEscape(summary),
            labelOptions = labelOptions(noHide = F, 
                                        direction = "bottom",
                                        style = list(
                                          "color" = "black",
                                          "font-family" = "serif",
                                          "font-size" = "15px"
                                        )))
        
      } else {
        #We render an empty map
        rendered <- leaflet() %>%
          addTiles()
      }
      return(rendered)
    })
    
  })
}