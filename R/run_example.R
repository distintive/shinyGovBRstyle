#' Run examples
#'
#' This function runs an example R Shiny app showcasing different parts of the package.
#' Code for the app can be found in the inst/example_app folder in the source code.
#' A hosted version of the same app is available at
#' https://shinygovbr.distintive.com.br/
#'
#' @return runs an R Shiny app with examples in
#' @keywords example
#' @export
#' @examples
#' if (interactive()) {
#' run_example()
#'}
run_example <- function(){
  appdir <- system.file(package = "shinyGovBRstyle", "example_app")
  shiny::runApp(appdir)
}
