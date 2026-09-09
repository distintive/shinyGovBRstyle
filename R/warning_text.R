#' Warning Text Function
#'
#' This function create warning text
#' @param inputId The input slot that will be used to access the value.
#' @param text Text that goes in the main
#' @return a warning box html shiny object
#' @keywords warning
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
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'       shinyGovBRstyle::warning_text(
#'         inputId = "warn1",
#'         text = "You can be fined up to £5,000 if you do not register.")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

warning_text <- function(inputId, text){
  govbr_deprecated("warning_text")
  govWarning <- shiny::tags$div(class="govbr-warning-text", id = inputId,
    shiny::tags$span(
      "!", class="govbr-warning-text__icon", `aria-hidden`="true"
    ),
    shiny::tags$strong(text, class="govbr-warning-text__text",
      shiny::tags$span("Aviso", class="govbr-warning-text__assistive govbr-visually-hidden"),
      shiny::tags$span("Warning", class="govbr-visually-hidden")
    )
  )
  attachDependency(govWarning)
}
