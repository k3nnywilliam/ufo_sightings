
processData <- function(data) {
  preprocessed <- data[, Code := gsub("Usausa", "Usa", country)]
  preprocessed <- preprocessed[, country := gsub("Untied States of America", "Usa", country)]
  preprocessed <- preprocessed[, country := gsub("China Also?", "Usa", country)]
  preprocessed <- preprocessed[, country := tolower(country)]
  preprocessed <- preprocessed[, summary := tolower(summary)]
  preprocessed <- preprocessed[complete.cases(preprocessed)]
  preprocessed <- preprocessed[!grepl("1 sec", duration)]
  preprocessed <- preprocessed[!grepl("madar", summary)]
  preprocessed <- preprocessed[!(preprocessed$shape %in% c("unknown", "other", "changing", "diamond", "delta", "cross", "star", "cone", "teardrop"))]
  preprocessed <- preprocessed[!(preprocessed$country %in% c("none", "no"))]
  preprocessed <- preprocessed[!grepl('"{2,}', summary)]
  preprocessed <- preprocessed[!grepl('meteor|asteroid|comet|meteors|metor|no detailed information|no information|hoax|halo', summary)]
  preprocessed <- preprocessed[!is.null(summary)]
  preprocessed <- preprocessed[!(preprocessed$summary == "")]
  preprocessed <- preprocessed[!(preprocessed$shape == "")]
  preprocessed <- preprocessed[, country := tools::toTitleCase(country)]
  return(preprocessed)
}


filterByCountry <- function(data, input_select) {
  filtered_dt <- data[data$country %in% input_select]
  return(filtered_dt)
}

filterByDate <- function(data, start_date, end_date) {
  filtered_data <- data[, c("Date", "Time") := tstrsplit(date_time, "T")]
  filtered_dt <- filtered_data[Date >= start_date & Date <= end_date]
  return(filtered_dt)
}

filterByState <- function(data, input_select) {
  filtered_dt <- data[data$state %in% input_select]
  return(filtered_dt)
}

filterByUFOShape <- function(data, input_select) {
  filtered_dt <- data[data$shape %in% input_select]
  return(filtered_dt)
}