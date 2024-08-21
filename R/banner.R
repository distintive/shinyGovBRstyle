#' Banner Function
#'
#' This function create a detail component that you can click for further
#' details.
#' @param inputId The input slot that will be used to access the value.
#' @param type Main type of label e.g. alpha or beta.  Can be any word.
#' @param label test to display.
#' @return a banner html shiny object
#' @keywords banner
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service')
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

banner <-function(inputId, type, label){
  govBanner <- shiny::tags$div(
    class="govbr-phase-banner govbr-width-container govbr-main-wrapper",
    id = inputId,
    shiny::tags$p(class="govbr-phase-banner__content",
      shiny::tags$strong(
        class="govbr-tag govbr-phase-banner__content__tag ", type
      ),
      shiny::tags$span(class="govbr-phase-banner__text", shiny::HTML(label))
    )
  )
  attachDependency(govBanner)
}
