get_session <- function() {
  session <- shiny::getDefaultReactiveDomain()
  if (is.null(session)) {
    stop("Could not find the Shiny session object. This usually happens ",
         "when shinynotyf is called from a context that wasn't set up by a ",
         "Shiny session.")
  }
  session
}
