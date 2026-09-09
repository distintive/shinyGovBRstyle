#' GovBR text input
#'
#' Creates a \code{br-input} text field bound as a standard Shiny text
#' input (\code{input$<inputId>} returns the text).
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Input label.
#' @param placeholder Placeholder text.
#' @param value Initial value.
#' @param hint Auxiliary help text shown below the field.
#' @param disabled If \code{TRUE}, disables the input.
#'
#' @return A \code{shiny.tag} with the input markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_text_input(
#'       inputId = "nome",
#'       label = "Nome",
#'       placeholder = "Digite seu nome",
#'       hint = "Texto auxiliar para prevenir erros"
#'     ),
#'     shiny::verbatimTextOutput("valor")
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$nome)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_text_input <- function(inputId,
                          label,
                          placeholder = NULL,
                          value = "",
                          hint = NULL,
                          disabled = FALSE) {

  input_tag <- shiny::tags$div(
    class = "br-input",
    shiny::tags$label(`for` = inputId, label),
    shiny::tags$input(
      id = inputId,
      type = "text",
      placeholder = placeholder,
      value = value,
      `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint"),
      disabled = if (isTRUE(disabled)) NA
    ),
    if (!is.null(hint)) {
      shiny::tags$p(id = paste0(inputId, "-hint"), hint)
    }
  )

  use_govbr(input_tag)
}
