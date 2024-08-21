#' Adds the content of www to shinyGovBRstyle/
#'
#' @importFrom shiny addResourcePath
#'
#' @noRd
#'
.onLoad <- function(...) {
  shiny::addResourcePath('shinyGovBRstyle',
                         system.file('www', package = 'shinyGovBRstyle')
  )
}
