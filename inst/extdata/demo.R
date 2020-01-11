library(shiny)
library(shinynotyf)

ui <- fluidPage(
  use_shinynotyf(),
  actionButton("custom", "Custom"),
  actionButton("error", "Error"),
  actionButton("success", "Success")
)

server <- function(input, output, session) {
  observeEvent(input$custom, {
    shinynotyf(
      message = "Hi there! This is a custom notification.",
      type = "custom",
      duration = 2500,
      color = "#1a94ff",
      ripple = TRUE,
      icon = "code"
    )
  })
  observeEvent(input$error, {
    shinynotyf(
      message = "Hi there! This is an error notification.",
      type = "error",
      duration = 2500
    )
  })
  observeEvent(input$success, {
    shinynotyf(
      message = "Hi there! This is a success notification!",
      type = "success",
      duration = 2500
    )
  })
}

shinyApp(ui, server)
