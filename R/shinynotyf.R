#' Display a notification message (notyf) in Shiny
#'
#' A notyf is a simple notification that contains a message and an icon. The
#' message, icon, duration, color, and ripple effect can all be modified. There
#' is an additional parameter \emph{type} that can be used as a shortcut to
#' display a custom, success, or error notification.
#'
#' @param message Message to display in the notification.
#' @param type Type of notification to display, one of custom, success, or
#' error. Defaults to custom.
#' @param duration Duration of the notification.
#' @param color Backgroun color of the notification.
#' @param ripple Enables ripple animation, defaults to FALSE.
#' @param icon Material icon to be used, defaults to 'face'.
#' @export
shinynotyf <- function(message, type = "custom", duration = NULL,
                       color = "#0a84ff", ripple = FALSE, icon = "face") {
  session <- get_session()
  session$sendCustomMessage(
    'shinynotyf',
    message = list(
      message = message,
      type = type,
      duration = duration,
      color = color,
      ripple = ripple,
      icon = icon
    )
  )
}

#' Set up a Shiny app to use shinynotyf
#'
#' This function must be called from a Shiny app's UI in order for the
#' \code{\link[shinynotyf]{shinynotyf}} function to work.\cr\cr
#' You can call \code{use_shinynotyf()} from anywhere inside the UI.
#'
#' @return Scripts that \code{shinynotyf} requires that are automatically
#' inserted to the app's \code{<head>} tag.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shinynotyf)
#'
#'   shinyApp(
#'     ui = fluidPage(
#'       # Set up shinynotyf
#'       use_shinynotyf(),
#'       actionButton("btn", "Click me")
#'     ),
#'     server = function(input, output) {
#'       observeEvent(input$btn, {
#'         # Show a simple notification
#'         shinynotyf(message = "You did it!", type = "success")
#'       })
#'     }
#'   )
#' }
#' @seealso \code{\link[shinynotyf]{shinynotyf}}
#' @export
use_shinynotyf <- function() {
  shiny::addResourcePath(
    prefix = "resources",
    directoryPath = system.file("www", package = "shinynotyf")
  )

  shiny::singleton(
    shiny::tags$head(
      shiny::tags$script(
        src = file.path("resources", "notyf", "notyf.min.js")
      ),
      shiny::tags$link(
        rel = "stylesheet",
        href = file.path("resources", "notyf", "notyf.min.css")
      ),
      shiny::tags$script(
        src = file.path("resources", "notyf", "shinynotyf.js")
      ),
      shiny::tags$link(
        rel = "stylesheet",
        href = file.path("resources", "notyf", "icons", "material-icons.css")
      ),
      shiny::tags$link(
        rel = "stylesheet",
        href = file.path("resources", "notyf", "fonts", "notyf-font.css")
      )
    )
  )
}

#' Material Icon Names.
#'
#' A listing containing the names of many (if not all) material icon names.
#'
#' @format A list with 932 elements.
"icons"
