#' GovBR button
#'
#' Creates a \code{br-button} that behaves like a Shiny action button: the
#' server can observe \code{input$<inputId>} to count clicks.
#'
#' @param inputId The input slot that will be used to access the click
#'   count.
#' @param label Button label.
#' @param type Button type: \code{"primary"} (default), \code{"secondary"},
#'   \code{"success"}, \code{"warning"} or \code{"danger"}.
#' @param block If \code{TRUE}, the button takes the full width of its
#'   container.
#' @param circle If \code{TRUE}, renders a circular icon button (label is
#'   used as the \code{aria-label}).
#' @param icon Optional Font Awesome icon class, e.g. \code{"fas fa-search"}
#'   (\url{https://fontawesome.com/v5/search}).
#' @param disabled If \code{TRUE}, disables the button.
#'
#' @return A \code{shiny.tag} with the button markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_button("btn1", "Primary"),
#'     shinyGovBRstyle::br_button("btn2", "Secondary", type = "secondary"),
#'     shinyGovBRstyle::br_button("btn3", "Warning", type = "warning"),
#'     shinyGovBRstyle::br_button("btn4", "Buscar", icon = "fas fa-search")
#'   )
#'   server <- function(input, output, session) {
#'     shiny::observeEvent(input$btn1, shiny::showNotification("Clicou!"))
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_button <- function(inputId,
                      label,
                      type = c("primary", "secondary", "success",
                               "warning", "danger"),
                      block = FALSE,
                      circle = FALSE,
                      icon = NULL,
                      disabled = FALSE) {
  type <- match.arg(type)

  class <- "br-button"
  if (!is.null(type)) class <- paste(class, type)
  if (block) class <- paste(class, "block")
  if (circle) class <- paste(class, "circle")
  class <- paste(class, "action-button")

  value <- shiny::restoreInput(id = inputId, default = NULL)

  button_tag <- shiny::tags$button(
    id = inputId,
    class = class,
    type = "button",
    `data-val` = value,
    disabled = if (isTRUE(disabled)) NA,
    if (!is.null(icon)) {
      shiny::tags$i(class = icon, `aria-hidden` = "true")
    },
    label
  )

  use_govbr(button_tag)
}
