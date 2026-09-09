#' GovBR date input
#'
#' Creates a GovBR date picker (\code{br-datetimepicker}). The value is
#' available in \code{input$<inputId>} as a \code{Date} (or \code{NULL}
#' while empty/invalid). Use \code{update_br_date_input()} to change it
#' from the server.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Date field label.
#' @param placeholder Placeholder text. Defaults to the GovBR example.
#' @param hint Auxiliary help text shown below the field.
#'
#' @return A \code{shiny.tag} with the date picker markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_date_input(
#'       inputId = "data",
#'       label = "Data de nascimento"
#'     ),
#'     shiny::verbatimTextOutput("valor")
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$data)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_date_input <- function(inputId,
                          label,
                          placeholder = "exemplo: 02/02/2024",
                          hint = NULL) {

  date_tag <- shiny::tags$div(
    class = "br-datetimepicker",
    id = inputId,
    `data-mode` = "single",
    `data-type` = "text",
    shiny::tags$div(
      class = "br-input has-icon",
      shiny::tags$label(`for` = paste0(inputId, "-text"), label),
      shiny::tags$input(
        id = paste0(inputId, "-text"),
        type = "text",
        placeholder = placeholder,
        `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint"),
        `data-input` = "data-input"
      ),
      shiny::tags$button(
        class = "br-button circle small",
        type = "button",
        `aria-label` = "Abrir calend\u00e1rio",
        `data-toggle` = "data-toggle",
        id = paste0(inputId, "-btn"),
        tabindex = "-1",
        `aria-hidden` = "true",
        shiny::tags$i(class = "fas fa-calendar-alt", `aria-hidden` = "true")
      )
    ),
    if (!is.null(hint)) {
      shiny::tags$p(id = paste0(inputId, "-hint"), hint)
    }
  )

  use_govbr(date_tag)
}
