#' GovBR checkbox input
#'
#' Creates a \code{br-checkbox}. For a single checkbox,
#' \code{input$<inputId>} returns \code{TRUE}/\code{FALSE}. When
#' \code{choices} is supplied a checkbox group is created instead and
#' \code{input$<inputId>} returns a character vector of the checked values.
#'
#' @param inputId The input slot that will be used to access the value.
#' @param label Checkbox label (single) or group label shown above the
#'   options (group).
#' @param choices Optional vector of values for a checkbox group. Use a
#'   named vector to display labels different from the values.
#' @param selected Initially checked values (group) or \code{TRUE}/FALSE
#'   (single).
#' @param hint Auxiliary help text shown below the label.
#' @param inline If \code{TRUE}, group options are laid out horizontally.
#' @param heading_level Optional heading level ("2"-"6") for the group
#'   legend (screen readers announce it as the group label).
#'
#' @return A \code{shiny.tag} with the checkbox markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_checkbox_input("aceite", "Aceito os termos"),
#'     shinyGovBRstyle::br_checkbox_input(
#'       inputId = "temas",
#'       label = "Temas de interesse",
#'       choices = c("tec" = "Tecnologia", "sau" = "Saúde"),
#'       selected = "tec"
#'     ),
#'     shiny::verbatimTextOutput("valor")
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(
#'       list(aceite = input$aceite, temas = input$temas)
#'     )
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_checkbox_input <- function(inputId,
                              label,
                              choices = NULL,
                              selected = NULL,
                              hint = NULL,
                              inline = FALSE,
                              heading_level = NULL) {

  if (is.null(choices)) {
    return(govbr_checkbox_single(inputId, label, selected, hint))
  }

  choice_data <- govbr_choices(choices)
  option_class <- "br-checkbox"
  if (inline) option_class <- paste(option_class, "d-inline-block")

  checkbox_tag <- govbr_fieldset(
    inputId = inputId,
    group_class = "shiny-input-checkboxgroup",
    label = label,
    hint = hint,
    heading_level = heading_level,
    options = purrr::pmap(
      list(choice_data$value, choice_data$label, seq_along(choice_data$value)),
      function(value, choice_label, i) {
        shiny::tags$div(
          class = option_class,
          shiny::tags$input(
            id = paste0(inputId, "-", i),
            type = "checkbox",
            name = inputId,
            value = value,
            `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint"),
            checked = if (!is.null(selected) && value %in% selected) NA
          ),
          shiny::tags$label(`for` = paste0(inputId, "-", i), choice_label)
        )
      }
    )
  )

  use_govbr(checkbox_tag)
}

#' @noRd
govbr_checkbox_single <- function(inputId, label, value, hint) {
  checkbox_tag <- shiny::tags$div(
    class = "br-checkbox",
    shiny::tags$input(
      id = inputId,
      type = "checkbox",
      `aria-describedby` = if (!is.null(hint)) paste0(inputId, "-hint"),
      checked = if (isTRUE(value)) NA
    ),
    shiny::tags$label(`for` = inputId, label),
    if (!is.null(hint)) {
      shiny::tags$p(id = paste0(inputId, "-hint"), class = "help-text", hint)
    }
  )

  use_govbr(checkbox_tag)
}
