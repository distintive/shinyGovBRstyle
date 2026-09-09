#' Panel output
#'
#' This function inserts a panel.  Normally used for confirmation screens
#' @param inputId The input slot that will be used to access the value.
#' @param main_text Add the header for the panel
#' @param sub_text Add the main body of text for the panel
#' @return a panel html shiny object
#' @keywords panel
#' @export
#' @section Deprecated:
#' Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards
#' compatibility and scheduled for removal. See the `br_*` family.
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
#'                     Your reference is xvsiq")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

panel_output <- function(inputId, main_text, sub_text) {
  govbr_deprecated("panel_output")
  govPanel <- shiny::tags$div(
    class="govbr-panel govbr-panel--confirmation",
    id = inputId,
    shiny::tags$h1(main_text, class = "govbr-panel__title"),
    shiny::tags$div(shiny::HTML(sub_text), class = "govbr-panel__body")
  )
  attachDependency(govPanel)
}
