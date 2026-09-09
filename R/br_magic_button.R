#' GovBR magic button
#'
#' Creates a \code{br-magic-button}, a floating action button. Behaves
#' like a Shiny action button: the server observes \code{input$<inputId>}
#' to count clicks.
#'
#' @param inputId The input slot that will be used to access the click
#'   count.
#' @param label Button label (or \code{aria-label} when \code{icon} is
#'   used).
#' @param size One of \code{"small"}, \code{"medium"} (default) or
#'   \code{"large"}.
#' @param icon Optional Font Awesome icon class. When supplied, the button
#'   is rendered as a circle icon button.
#'
#' @return A \code{shiny.tag} with the magic button markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_magic_button("novo", "Adicionar",
#'                                       icon = "fas fa-cart-plus")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     shiny::observeEvent(input$novo, shiny::showNotification("Clicou!"))
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_magic_button <- function(inputId,
                            label,
                            size = c("medium", "small", "large"),
                            icon = NULL) {
  size <- match.arg(size)

  button_classes <- "br-button action-button"
  if (!is.null(icon)) button_classes <- paste(button_classes, "circle")

  value <- shiny::restoreInput(id = inputId, default = NULL)

  magic_tag <- shiny::tags$div(
    class = paste("br-magic-button", size),
    shiny::tags$button(
      id = inputId,
      class = button_classes,
      type = "button",
      `data-val` = value,
      `aria-label` = if (!is.null(icon)) label,
      if (!is.null(icon)) {
        shiny::tags$i(class = icon, `aria-hidden` = "true")
      } else {
        label
      }
    )
  )

  use_govbr(magic_tag)
}
