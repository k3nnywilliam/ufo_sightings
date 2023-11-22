ui_module_for_aboutme <- function(id) {
  ns <- NS(id)
  tabPanel(
    "About",
    fluidRow(
      column(1),
      column(4,
             br(), br(),
             div(class = "my-image", 
                 style = "display: flex; justify-content: center; align-items: center;",
               tags$image(src = "https://avatars.githubusercontent.com/u/14914320?v=4", 
                          alt = "It's me!",
                          style = "border: 2px solid #333; border-radius: 50%;")
             )
             ),
      column(5,
             br(), br(), br(),
             p("Hi My name is Kenny and I'm a software engineer/data analyst from Malaysia."),
             p("I've been following the UFO topic for a number of years now and I am dedicating this website to both the UFO community and the general public."),
             p("This website is for educational purposes and should not be miscontrued as an official portal for UFO findings."),
             p("If you would like to collaborate with me in website development, UFO data analytics or any data in particular, just drop me an email!"),
             p(),
             div(
               class = "email-icon",
               tagList(
                 tags$a(href="mailto:k3nnywilliam@gmail.com",
                 tags$i(class = "fas fa-envelope fa-3x")),
                 p("Email", style = "margin-top: 10px;"),
                 tags$a(href="https://github.com/k3nnywilliam",
                        tags$i(class = "fab fa-github fa-3x")),
                 p("GitHub", style = "margin-top: 10px;")
               ),
              
             ),
             tags$head(
               tags$link(rel = "stylesheet", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"),
               tags$style(
                 HTML("
        /* Style for the email icon */
        .email-icon {
          text-align: center;
        }
        .email-icon i {
          color: #000000;
        }
      ")
               )
             )
             ),
      column(2)
    ) #End of fluid Row
  )
}

server_module_for_aboutme <- function(id) {
  moduleServer(id, function(input, output, session){
    
  })
}