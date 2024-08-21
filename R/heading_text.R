#' Heading Text Function
#'
#' This function create a heading text
#' @param text_input Text to display
#' @param size Text size using xl, l, m, s.  Defaults to xl.
#' @return a heading text html shiny object
#' @keywords heading
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'       shinyGovBRstyle::heading_text("This is great text", "m")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }

heading_text <- function(text_input, size = "xl"){
  govHeading <- shiny::tags$h1(shiny::HTML(text_input),
                               class=paste0("govbr-heading-", size))
  attachDependency(govHeading)
}
