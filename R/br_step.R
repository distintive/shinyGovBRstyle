#' GovBR step
#'
#' Creates a \code{br-step} progress indicator.
#' \code{input$<inputId>} returns the index (1-based) of the last clicked
#' (or initial) step.
#'
#' @param inputId The input slot that will be used to access the step
#'   index.
#' @param labels Character vector of step labels.
#' @param initial Initially active step (1-based).
#'
#' @return A \code{shiny.tag} with the step markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_step(
#'         "etapas", c("Identifica\u00e7\u00e3o", "Dados", "Confirma\u00e7\u00e3o")
#'       ),
#'       shiny::verbatimTextOutput("valor")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$etapas)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_step <- function(inputId, labels, initial = 1) {
  initial <- max(1L, min(as.integer(initial), length(labels)))

  step_tag <- shiny::tags$nav(
    class = "br-step",
    `data-initial` = as.character(initial),
    `data-type` = "simple",
    role = "none",
    `data-govbr-step` = inputId,
    id = inputId,
    shiny::tags$div(
      class = "step-progress",
      role = "listbox",
      `aria-orientation` = "horizontal",
      `aria-label` = "Lista de Op\u00e7\u00f5es",
      purrr::imap(labels, function(label, i) {
        shiny::tags$button(
          class = paste(
            c("step-progress-btn", if (i == initial) "active"),
            collapse = " "
          ),
          role = "option",
          `aria-posinset` = as.character(i),
          `aria-setsize` = as.character(length(labels)),
          `aria-selected` = if (i == initial) "true" else "false",
          type = "button",
          `data-tooltip-text` = label,
          shiny::tags$span(class = "step-info", label)
        )
      })
    )
  )

  use_govbr(step_tag)
}
