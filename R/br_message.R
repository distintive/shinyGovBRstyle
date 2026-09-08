#' GovBR message
#'
#' Creates a \code{br-message} alert.
#'
#' @param title Message title.
#' @param body Message body text.
#' @param type One of \code{"info"} (default), \code{"success"},
#'   \code{"warning"} or \code{"danger"}.
#' @param dismissible If \code{TRUE}, adds a close button.
#'
#' @return A \code{shiny.tag} with the message markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_message(
#'       title = "Sucesso.",
#'       body = "Seus dados foram alterados conforme preenchimento.",
#'       type = "success"
#'     ),
#'     shinyGovBRstyle::br_message(
#'       title = "Atenção.",
#'       body = "Não compartilhe sua senha com terceiros.",
#'       type = "warning"
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_message <- function(title,
                       body = NULL,
                       type = c("info", "success", "warning", "danger"),
                       dismissible = TRUE) {
  type <- match.arg(type)

  icon_class <- switch(type,
    info = "fas fa-info-circle",
    success = "fas fa-check-circle",
    warning = "fas fa-exclamation-triangle",
    danger = "fas fa-times-circle"
  )

  message_tag <- shiny::tags$div(
    class = paste("br-message", type),
    shiny::tags$div(
      class = "icon",
      shiny::tags$i(class = icon_class, `aria-hidden` = "true")
    ),
    shiny::tags$div(
      class = "content",
      role = "alert",
      `aria-label` = paste0(title, " ", body),
      shiny::tags$span(class = "message-title", title),
      if (!is.null(body)) {
        shiny::tags$span(class = "message-body", paste0(" ", body))
      }
    ),
    if (dismissible) {
      shiny::tags$div(
        class = "close",
        shiny::tags$button(
          class = "br-button circle small",
          type = "button",
          `aria-label` = "Fechar a mensagem alerta",
          shiny::tags$i(class = "fas fa-times", `aria-hidden` = "true")
        )
      )
    }
  )

  use_govbr(message_tag)
}
