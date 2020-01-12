get_session <- function() {
  session <- shiny::getDefaultReactiveDomain()
  if (is.null(session)) {
    stop("Could not find the Shiny session object. This usually happens ",
         "when shinynotyf is called from a context that wasn't set up by a ",
         "Shiny session.")
  }
  session
}

handle_type <- function(type) {
  if (!type %in% c("custom", "error", "success"))
    stop("The type parameter accepts one of 'custom', 'error', or 'success'. You gave '", type, "'.")
}

handle_duration <- function(duration) {
  if (duration <= 0)
    stop("The duration parameter should be greater than 0. You gave '", duration, "'.")
}

handle_ripple <- function(ripple) {
  if (!is.logical(ripple))
    stop("The ripple parameter should accepts logical TRUE or FALSE. You gave '", ripple, "'.")
}
