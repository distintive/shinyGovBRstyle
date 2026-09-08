#' GovBR divider
#'
#' Creates a \code{br-divider} horizontal rule.
#'
#' @param class Optional extra classes, e.g. \code{"vertical"},
#'   \code{"dashed"} or spacing utilities such as \code{"my-3"}.
#'
#' @return A \code{shiny.tag} with the divider markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shiny::tags$div("Conteúdo acima"),
#'     shinyGovBRstyle::br_divider(class = "my-3"),
#'     shiny::tags$div("Conteúdo abaixo")
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_divider <- function(class = NULL) {

  divider_classes <- "br-divider"
  if (!is.null(class)) divider_classes <- paste(divider_classes, class)

  divider_el <- shiny::tags$span(class = divider_classes)

  use_govbr(divider_el)
}
