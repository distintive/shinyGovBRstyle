#' GovBR textarea input
#'
#' Creates a \code{br-textarea} bound as a standard Shiny text area
#' (\code{input$<inputId>} returns the text).
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Text area label.
#' @param placeholder Placeholder text.
#' @param value Initial value.
#' @param hint Auxiliary help text shown below the field.
#' @param rows Number of visible rows.
#'
#' @return A \code{shiny.tag} with the textarea markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_textarea_input(
#'       inputId = "obs",
#'       label = "Observações",
#'       placeholder = "Digite suas observações"
#'     ),
#'     shiny::verbatimTextOutput("valor")
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$obs)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_textarea_input <- function(inputId,
                              label,
                              placeholder = NULL,
                              value = "",
                              hint = NULL,
                              rows = 4) {

  textarea_tag <- shiny::tags$div(
    class = "br-textarea",
    shiny::tags$label(`for` = inputId, label),
    shiny::tags$textarea(
      id = inputId,
      placeholder = placeholder,
      rows = rows,
      value
    ),
    if (!is.null(hint)) {
      shiny::tags$p(class = "text-base mt-1", hint)
    }
  )

  use_govbr(textarea_tag)
}
