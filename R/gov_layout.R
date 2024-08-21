#' Page Layout Function
#'
#' This function loads the page layout, This doesn't work as well as
#' the `gov_main_layout` and associated functions.  This is being kept for now
#' as a simpler version where grids are not needed.
#' @param inputID ID of the main div.  Defaults to "main"
#' @param size Layout of the page.  Optional are full, one-half, two-thirds,
#' one-third and one-quarter.  Defaults to "full"
#' @param ... include the components of the UI that you want within the
#' main page.
#' @return a html shiny layout div
#' @keywords style
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::gov_layout(size = "full",
#'       shinyGovBRstyle::panel_output(
#'         inputId = "panel1",
#'         main_text = "Application Complete",
#'         sub_text = "Thank you for submitting your application.
#'         Your reference is xvsiq")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

gov_layout <- function(..., inputID = "main", size="full"){
  govLayout <- shiny::tags$div(
    id = inputID,
    class="govbr-width-container  govbr-main-wrapper",
    shiny::tags$div(
      id = paste0(inputID,"_sub"),
      class=paste0("govbr-grid-column-",size), ...)
  )
  attachDependency(govLayout)
}
