#' Checkbox Function
#'
#' This function inserts a checkbox group
#' @param inputId Input id for the group of checkboxes
#' @param cb_labels Add the names of the options that will appear
#' @param checkboxIds Add the values for each checkbox
#' @param label Insert the text for the checkbox group.
#' @param hint_label Insert optional hint/secondary text.  Defaults to NULL
#' @param small change the sizing to a small version of the checkbox.  Defaults
#' to \code{FALSE}
#' @param error  Whenever you want to include error handle on the component.
#' @param error_message  If you want a default error message.
#' @return a checkbox html shiny object
#' @keywords checkbox
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     # Required for error handling function
#'     shinyjs::useShinyjs(),
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service'),
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'       # Simple checkbox
#'       shinyGovBRstyle::checkbox_Input(
#'         inputId = "check1",
#'         cb_labels = c("Option 1", "Option 2", "Option 3"),
#'         checkboxIds = c("op1", "op2", "op3"),
#'         label = "Choice option"),
#'        # Error checkbox
#'       shinyGovBRstyle::checkbox_Input(
#'         inputId = "check2",
#'         cb_labels = c("Option 1", "Option 2", "Option 3"),
#'         checkboxIds = c("op1", "op2", "op3"),
#'         label = "Choice option",
#'         hint_label = "Select the best fit",
#'         error = TRUE,
#'         error_message = "Select one"),
#'       # Button to trigger error
#'       shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {
#'     #'Trigger error on blank submit of eventId2
#'     observeEvent(input$submit, {
#'       if (is.null(input$check2)){
#'         shinyGovBRstyle::error_on(inputId = "check2")
#'       } else {
#'         shinyGovBRstyle::error_off(inputId = "check2")
#'       }
#'     })
#'   }
#'
#'   shinyApp(ui = ui, server = server)
#' }

checkbox_Input <- function(inputId, cb_labels, checkboxIds, label,
                           hint_label = NULL, small = FALSE,
                           error = FALSE, error_message = NULL){
  if (small){
    class_build <- "govbr-checkboxes govbr-checkboxes--small"
  } else {
    class_build <- "govbr-checkboxes"
  }

  govCheckboxes <- shiny::tags$div(
    class="shiny-input-checkboxgroup",
    id = inputId,
    shiny::tags$div(class="govbr-form-group", id=paste0(inputId,"div"),
    shiny::tags$fieldset(class="govbr-fieldset",
      shiny::tags$label(label, class="govbr-label"),
      shiny::tags$div(hint_label, class="govbr-hint"),
      if (error == TRUE){
        shinyjs::hidden(
          shiny::tags$p(error_message,
                    class="govbr-error-message",
                    id= paste0(inputId, "error"),
                    shiny::tags$span("Error:",
                              class="govbr-visually-hidden")
          )
        )
      },
      shiny::tags$div(class=class_build,
        Map(function(x, y) {
          value <- shiny::restoreInput(id = y, default = FALSE)
          shiny::tags$div(class="govbr-checkboxes__item", id=paste0("div_", y),
          shiny::tags$input(class="govbr-checkboxes__input",
                     id=y,
                     name=inputId,
                     type="checkbox",
                     value=y),
          shiny::tags$label(x, class="govbr-label govbr-checkboxes__label"))
        },
        x=cb_labels, y = checkboxIds)
      )
    )
  ))
  attachDependency(govCheckboxes)
}

