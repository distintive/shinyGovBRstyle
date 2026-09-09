#' GovBR card
#'
#' Creates a \code{br-card} container with optional header, content and
#' footer areas.
#'
#' @param ... UI elements placed in the card content.
#' @param title Optional card header title.
#' @param footer Optional UI element placed in the card footer.
#' @param hover If \code{TRUE}, adds the hover emphasis effect.
#'
#' @return A \code{shiny.tag} with the card markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_card(
#'         title = "Meu cart\u00e3o",
#'         shiny::p("Conte\u00fado do cart\u00e3o."),
#'         footer = shinyGovBRstyle::br_button("ok", "Confirmar")
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_card <- function(..., title = NULL, footer = NULL, hover = FALSE) {

  card_classes <- "br-card"
  if (hover) card_classes <- paste(card_classes, "hover")

  card_tag <- shiny::tags$div(
    class = card_classes,
    if (!is.null(title)) {
      shiny::tags$div(
        class = "card-header",
        shiny::tags$div(class = "text-weight-semi-bold text-up-02", title)
      )
    },
    shiny::tags$div(class = "card-content", ...),
    if (!is.null(footer)) {
      shiny::tags$div(class = "card-footer footer", footer)
    }
  )

  use_govbr(card_tag)
}
