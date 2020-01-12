library(shiny)
library(shinynotyf)
library(colourpicker)

ui <- fluidPage(
  use_shinynotyf(),
  textInput(
    inputId = "message",
    label = h4("Text"),
    value = "Enter text..."
  ),
  selectInput(
    inputId = "type",
    label = h4("Type"),
    choices = c("custom", "success", "error"),
    selected = "custom",
    multiple = FALSE
  ),
  numericInput(
    inputId = "duration",
    label = h4("Duration (ms)"),
    value = 2000,
    min = 0,
    step = 500
  ),
  colourInput(
    inputId = "color",
    label = h4("Color"),
    value = "#0a84ff",
    showColour = "text"
  ),
  selectInput(
    inputId = "ripple",
    label = h4("Ripple"),
    choices = c("TRUE", "FALSE"),
    selected = "FALSE",
    multiple = FALSE
  ),
  selectInput(
    inputId = "icon",
    label = h4("Icon"),
    choices = unlist(unname(icons)),
    selected = "code",
    multiple = FALSE
  )
)

server <- function(input, output, session) {
  observe({
    shinynotyf(
      message = input$message,
      type = input$type,
      duration = input$duration,
      color = input$color,
      ripple = ifelse(input$ripple == "TRUE", TRUE, FALSE),
      icon = input$icon
    )
  })
}

shinyApp(ui, server)
