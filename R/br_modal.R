#' GovBR modal
#'
#' Creates a \code{br-modal} dialog. The close button and any footer
#' button created with \code{data-dismiss = "br-modal"} close the modal
#' via the GovBR JavaScript.
#'
#' @param title Modal title.
#' @param ... Modal body content.
#' @param footer Optional UI element for the modal footer (e.g.
#'   \code{br_button()}).
#' @param size One of \code{"small"}, \code{"medium"} (default) or
#'   \code{"large"}.
#' @param id Optional id for the modal element.
#'
#' @return A \code{shiny.tag} with the modal markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_modal(
#'         title = "Confirmar a\u00e7\u00e3o",
#'         shiny::p("Deseja realmente continuar?"),
#'         footer = shinyGovBRstyle::br_button("ok", "Sim", type = "primary")
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_modal <- function(title,
                     ...,
                     footer = NULL,
                     size = c("medium", "small", "large"),
                     id = NULL) {
  size <- match.arg(size)

  modal_tag <- shiny::tags$div(
    class = paste("br-modal", size),
    id = id,
    `aria-modal` = "true",
    role = "dialog",
    `aria-labelledby` = paste0(id, "-title"),
    shiny::tags$div(
      class = "br-modal-header",
      shiny::tags$div(class = "modal-title", id = paste0(id, "-title"), title),
      shiny::tags$button(
        class = "br-button close circle",
        type = "button",
        `data-dismiss` = "br-modal",
        `aria-label` = "Fechar",
        shiny::tags$i(class = "fas fa-times", `aria-hidden` = "true")
      )
    ),
    shiny::tags$div(class = "br-modal-body", ...),
    if (!is.null(footer)) {
      shiny::tags$div(
        class = "br-modal-footer justify-content-end",
        footer
      )
    }
  )

  use_govbr(modal_tag)
}
