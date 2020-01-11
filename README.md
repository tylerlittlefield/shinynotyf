
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinynotyf

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/shinynotyf.svg?branch=master)](https://travis-ci.org/tyluRp/shinynotyf)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/shinynotyf?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/shinynotyf)
<!-- badges: end -->

The goal of shinynotyf is to wrap
[Notyf](https://github.com/caroso1222/notyf) in R to provide
notifications in shiny.

<img src="inst/extdata/notyf3.gif" width="100%" />

## Installation

Install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("tylurp/shinynotyf")
```

## Usage

You can use `shinynotyf` in a shiny app like so:

``` r
library(shiny)
library(shinynotyf)

ui <- fluidPage(
  use_shinynotyf(),
  actionButton("preview", "Preview")
)

server <- function(input, output, session) {
  observeEvent(input$preview, {
    shinynotyf(
      message = "Hi there!",
      type = "success"
    )
  })
}

shinyApp(ui, server)
```

## Acknowledgements

  - [Carlos Roso](https://github.com/caroso1222), the creator of
    [Notyf](https://github.com/caroso1222/notyf)
