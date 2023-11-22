server <- function(input, output, session) {
  cat("Server starting...", "\n")
  server_module_for_map("map")
  server_module_for_home("home")
  server_module_for_media("media")
  server_module_for_aboutme("about")
}