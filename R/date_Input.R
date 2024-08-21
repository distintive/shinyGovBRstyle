#' Date Input Function
#'
#' This function create a date input that follows GDS component
#' @param inputId The input slot that will be used to access the value.
#' @param label Display label for the control, or \code{NULL} for no label.
#' @param hint_label Display hint label for the control, or \code{NULL} for no
#' hint label.
#' @param error Whenever to include error components.Defaults to \code{FALSE}.
#' @param error_message Error handling message? Defaults to \code{NULL}
#' @param day Select a default day on start up. Defaults to \code{NULL}
#' @param month Select a default month on start up. Defaults to \code{NULL}
#' @param year Select a default year on start up. Defaults to \code{NULL}
#' @return a data input html shiny object
#' @keywords date
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     # Required for error handling function.
#'     shinyjs::useShinyjs(),
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service'),
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'        # Simple date input
#'       shinyGovBRstyle::date_Input(
#'         inputId = "dob_input",
#'         label = "Please enter your birthday"),
#'        # Error date input
#'        shinyGovBRstyle::date_Input(
#'          inputId = "dob_input2",
#'          label = "Please enter your birthday",
#'          hint_label = "For example, 12 11 2007",
#'          error = TRUE),
#'        # Button to trigger error
#'        shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {
#'     #'Trigger error on blank submit of dob_input2
#'     observeEvent(input$submit, {
#'       if (input$dob_input2 == "//"){
#'         shinyGovBRstyle::error_on(inputId = "dob_input2")
#'       } else {
#'         shinyGovBRstyle::error_off(
#'           inputId = "dob_input2")
#'       }
#'     })
#'   }
#'   shinyApp(ui = ui, server = server)
#' }

date_Input <- function(inputId, label, hint_label = NULL,
                       error = FALSE, error_message = NULL,
                       day = NULL, month = NULL, year = NULL){
  value <- shiny::restoreInput(id = inputId, default = FALSE)
  govDate <- shiny::tags$div(class="govbr-form-group", id=paste0(inputId,"div"),
    shiny::tags$fieldset(class="govbr-fieldset",
      shiny::tags$label(shiny::HTML(label), class="govbr-label"),
      if (error == TRUE){
        shinyjs::hidden(
          shiny::tags$p(
            error_message,
            id = paste0(inputId,"error"),
            class = "govbr-error-message",
            shiny::tags$span("Error:", class = "govbr-visually-hidden")
          )
        )
      },
      shiny::tags$div(hint_label, class="govbr-hint"),
        shiny::tags$div(class="govbr-date-input", id = inputId,
          shiny::tags$div(class="govbr-date-input__item",
            shiny::tags$div(class="govbr-form-group",
              shiny::tags$label(
                "Day", class="govbr-label govbr-date-input__label"),
              shiny::tags$input(
                class=paste("govbr-input govbr-date-input__input", "
                            govbr-input--width-2"),
                id=paste0(inputId,"_day"), name=inputId,
                type="number", pattern="[0-9]*", value = day)
            )
          ),
        shiny::tags$div(class="govbr-date-input__item",
          shiny::tags$div(class="govbr-form-group",
            shiny::tags$label(
              "Month", class="govbr-label govbr-date-input__label"),
            shiny::tags$input(class=paste("govbr-input govbr-date-input__input",
                                          "govbr-input--width-2"),
                       id=paste0(inputId,"_month"), name=inputId,
                       type="number", pattern="[0-9]*", value = month)
            )
        ),
        shiny::tags$div(class="govbr-date-input__item",
          shiny::tags$div(class="govbr-form-group",
            shiny::tags$label(
              "Year", class="govbr-label govbr-date-input__label"),
            shiny::tags$input(class=paste("govbr-input govbr-date-input__input",
                                          "govbr-input--width-4"),
                       id=paste0(inputId,"_year"), name=inputId,
                       type="number", pattern="[0-9]*", value = year)
          )
        )
      )
    )
  )
  attachDependency(govDate, "date")
}
