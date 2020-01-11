library(shiny)
library(shinynotyf)

ui <- fluidPage(
  use_shinynotyf(),
  actionButton("preview", "Preview")
)

server <- function(input, output, session) {
  observeEvent(input$preview, {
    shinynotyf(
      message = "Hi there! This is a shinynotyf using the notyf project.",
      type = "custom",
      duration = 2500,
      color = "#1a94ff",
      ripple = TRUE,
      icon = "code"
    )
  })
}

shinyApp(ui, server)
