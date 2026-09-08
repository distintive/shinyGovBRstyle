#' GovBR tag
#'
#' Creates a \code{br-tag} label/badge.
#'
#' @param text Tag text.
#' @param class Optional extra class, e.g. a GovBR background utility such
#'   as \code{"bg-mint-cool-vivid-70"} or \code{"text"}.
#' @param icon Optional Font Awesome icon class, e.g. \code{"fas fa-car"}.
#'
#' @return A \code{shiny.tag} with the tag markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_tag("Novo"),
#'     shinyGovBRstyle::br_tag("Publicado", class = "bg-mint-cool-vivid-70")
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_tag <- function(text, class = NULL, icon = NULL) {

  tag_classes <- "br-tag"
  if (!is.null(class)) tag_classes <- paste(tag_classes, class)

  tag_el <- shiny::tags$span(
    class = tag_classes,
    if (!is.null(icon)) {
      shiny::tags$i(class = icon, `aria-hidden` = "true")
    },
    shiny::tags$span(text)
  )

  use_govbr(tag_el)
}
