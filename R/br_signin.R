#' GovBR sign-in button
#'
#' Creates a \code{br-sign-in} button that behaves like a Shiny action
#' button: the server observes \code{input$<inputId>} to count clicks.
#'
#' @param inputId The input slot that will be used to access the click
#'   count.
#' @param label Button label.
#' @param type One of \code{"primary"} or \code{"secondary"} (default).
#'
#' @return A \code{shiny.tag} with the sign-in markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_signin("entrar", "Entrar", type = "primary")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     shiny::observeEvent(input$entrar, shiny::showNotification("Entrar!"))
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_signin <- function(inputId,
                      label = "Entrar",
                      type = c("secondary", "primary")) {
  type <- match.arg(type)

  value <- shiny::restoreInput(id = inputId, default = NULL)

  signin_tag <- shiny::tags$button(
    id = inputId,
    class = paste("br-sign-in action-button", type),
    type = "button",
    `data-val` = value,
    shiny::tags$i(class = "fas fa-user", `aria-hidden` = "true"),
    label
  )

  use_govbr(signin_tag)
}
