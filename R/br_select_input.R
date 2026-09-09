#' GovBR select input
#'
#' Creates a \code{br-select}, the GovBR dropdown list. For
#' \code{multiple = FALSE}, \code{input$<inputId>} returns the selected
#' value; for \code{multiple = TRUE} it returns a character vector of the
#' selected values. The filter text field is available as
#' \code{input$<inputId>_filter}.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Select label.
#' @param choices Vector of values. Use a named vector to display labels
#'   different from the values.
#' @param selected Initially selected value(s).
#' @param multiple Whether multiple items can be selected.
#' @param placeholder Placeholder text for the filter field.
#' @param hint Auxiliary help text shown below the select.
#'
#' @return A \code{shiny.tag} with the select markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_select_input(
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
br_select_input <- function(inputId,
                            label,
                            choices = NULL,
                            selected = NULL,
                            multiple = FALSE,
                            placeholder = "Selecione o item",
                            hint = NULL) {

  choice_data <- govbr_choices(choices)

  if (multiple) {
    container_class <- "br-select shiny-input-checkboxgroup"
    item_input_type <- "checkbox"
  } else {
    container_class <- "br-select shiny-input-radiogroup"
    item_input_type <- "radio"
  }

  select_tag <- shiny::tags$div(
    class = container_class,
    id = inputId,
    multiple = if (multiple) "multiple",
    shiny::tags$div(
      class = "br-input",
      shiny::tags$label(`for` = paste0(inputId, "-filter"), label),
      shiny::tags$input(
        id = paste0(inputId, "-filter"),
        type = "text",
        placeholder = placeholder,
        `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint")
      ),
      shiny::tags$button(
        class = "br-button", type = "button",
        `aria-label` = "Exibir lista", tabindex = "-1",
        `data-trigger` = "data-trigger",
        shiny::tags$i(class = "fas fa-angle-down", `aria-hidden` = "true")
      )
    ),
    shiny::tags$div(
      class = "br-list", tabindex = "0",
      purrr::pmap(
        list(
          choice_data$value,
          choice_data$label,
          seq_along(choice_data$value)
        ),
        function(value, choice_label, i) {
          shiny::tags$div(
            class = "br-item", tabindex = "-1",
            shiny::tags$div(
              class = paste0("br-", item_input_type),
              shiny::tags$input(
                id = paste0(inputId, "-", i),
                type = item_input_type,
                name = inputId,
                value = value,
                checked = if (!is.null(selected) && value %in% selected) NA
              ),
              shiny::tags$label(
                `for` = paste0(inputId, "-", i),
                choice_label
              )
            )
          )
        }
      )
    ),
    if (!is.null(hint)) {
      shiny::tags$span(
        id = paste0(inputId, "-hint"),
        class = "feedback warning",
        role = "alert",
        shiny::tags$i(
          class = "fas fa-exclamation-triangle",
          `aria-hidden` = "true"
        ),
        hint
      )
    }
  )

  use_govbr(select_tag)
}
