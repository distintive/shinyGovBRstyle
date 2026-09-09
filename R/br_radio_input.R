#' GovBR radio input
#'
#' Creates a group of \code{br-radio} options bound as a standard Shiny
#' radio group: \code{input$<inputId>} returns the selected value.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Group label shown above the options.
#' @param choices Vector of values. Use a named vector to display labels
#'   different from the values.
#' @param selected Initially selected value (\code{NULL} for none).
#' @param hint Auxiliary help text shown below the label.
#' @param inline If \code{TRUE}, options are laid out horizontally.
#'
#' @return A \code{shiny.tag} with the radio group markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_radio_input(
#'       inputId = "uf",
#'       label = "Estado",
#'       choices = c("Distrito Federal" = "DF", "São Paulo" = "SP")
#'     ),
#'     shiny::verbatimTextOutput("valor")
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$uf)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_radio_input <- function(inputId,
                           label,
                           choices = NULL,
                           selected = NULL,
                           hint = NULL,
                           inline = FALSE) {

  choice_data <- govbr_choices(choices)
  option_class <- "br-radio"
  if (inline) option_class <- paste(option_class, "d-inline-block")

  radio_tag <- shiny::tags$div(
    class = "shiny-input-radiogroup",
    id = inputId,
    shiny::tags$p(class = "label mb-0", label),
    if (!is.null(hint)) {
      shiny::tags$p(id = paste0(inputId, "-hint"), class = "help-text", hint)
    },
    purrr::pmap(
      list(choice_data$value, choice_data$label, seq_along(choice_data$value)),
      function(value, choice_label, i) {
        shiny::tags$div(
          class = option_class,
          shiny::tags$input(
            id = paste0(inputId, "-", i),
            type = "radio",
            name = inputId,
            value = value,
            `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint"),
            checked = if (!is.null(selected) && value == selected) NA
          ),
          shiny::tags$label(`for` = paste0(inputId, "-", i), choice_label)
        )
      }
    )
  )

  use_govbr(radio_tag)
}

#' @noRd
govbr_choices <- function(choices) {
  values <- as.character(choices)
  if (is.null(names(choices))) {
    labels <- values
  } else {
    nms <- names(choices)
    labels <- ifelse(nms == "", values, nms)
  }
  list(value = unname(values), label = unname(labels))
}
