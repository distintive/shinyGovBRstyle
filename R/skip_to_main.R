#' Skip to main content link
#'
#' This function generates an accessible 'Skip to main content' link, which is
#' typically used by keyboard-only users to bypass content and
#' navigate directly to the main content of a page.
#' Important: your main column will need an id of "main_col" for this to work
#' @return a skip button that skips to section with id of "main_col"
#' @export
#' @section Deprecated:
#' Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards
#' compatibility and scheduled for removal. See the `br_*` family.
#' @examples
#'  if (interactive()) {
#'   ui <- fluidPage(
#'     skip_to_main(),
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/govbr-logo.png"
#'     ),
#'     shinyjs::useShinyjs(),  # shinyjs is needed to manage visibility of elements
#' )
#'   server <- function(input, output, session){
#'   }
#'   shinyApp(ui = ui, server = server)
#'
#' }
skip_to_main <- function(){
  govbr_deprecated("skip_to_main")
  shiny::tags$a(
    href = "#main_col",
    class = "govbr-skip govbr-link",
    "Skip to main content"
  )
}
