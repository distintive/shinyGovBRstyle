#' GovBR notification
#'
#' Creates a \code{br-notification} panel with a header and a list of
#' notification items.
#'
#' @param title Header title.
#' @param subtitle Optional header subtitle (e.g. an e-mail).
#' @param items Character vector or list of UI elements shown as
#'   notification items.
#' @param icons Optional character vector of Font Awesome icon classes,
#'   one per item.
#'
#' @return A \code{shiny.tag} with the notification markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_notification(
#'         title = "Fulano da Silva",
#'         subtitle = "nome.sobrenome@dominio.gov",
#'         items = c("Alerta um", "Alerta dois"),
#'         icons = c("fas fa-bell", "fas fa-envelope")
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_notification <- function(title, subtitle = NULL, items = NULL, icons = NULL) {

  notification_tag <- shiny::tags$div(
    class = "br-notification",
    shiny::tags$div(
      class = "notification-header",
      shiny::tags$div(
        class = "row",
        shiny::tags$div(
          class = "col-10",
          shiny::tags$span(class = "text-bold", title),
          shiny::tags$br(),
          if (!is.null(subtitle)) shiny::tags$small(subtitle)
        ),
        shiny::tags$div(
          class = "col-2",
          shiny::tags$div(
            class = "close text-right",
            shiny::tags$button(
              class = "br-button circle small",
              type = "button",
              `aria-label` = "Fechar",
              shiny::tags$i(class = "fas fa-times", `aria-hidden` = "true")
            )
          )
        )
      )
    ),
    shiny::tags$div(
      class = "notification-body",
      shiny::tags$div(
        class = "br-list",
        purrr::imap(items, function(item, i) {
          shiny::tags$button(
            class = "br-item",
            type = "button",
            if (!is.null(icons)) {
              shiny::tags$i(
                class = paste(icons[[i]], "mr-2"),
                `aria-hidden` = "true"
              )
            },
            item
          )
        })
      )
    )
  )

  use_govbr(notification_tag)
}
