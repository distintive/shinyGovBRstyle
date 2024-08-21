#' Input Field Function
#'
#' This function inserts number of text inputs. Useful for addresses.
#' @param legend Legend that goes above the fieldset
#' @param labels A list of labels for the text inputs
#' @param inputIds A list input slots that will be used to access the value.
#' @param widths control the size of the box based on number of characters
#' required.  Options are 30, 20, 10, 5, 4, 3, 2.  NULL will not limit the size
#' @param types text box types.  Will default to text.
#' @param error Whenever to icnlud error handling  Defaults to FALSE.
#' @param error_message Message to display on error.  Defaults to NULL
#' @return a input field of html as a shiny object
#' @keywords input field
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
#'       shinyGovBRstyle::input_field(
#'         legend ="List of three text boxes in a field",
#'         labels = c("Field 1", "Field 2", "Field 3"),
#'         inputIds = c("field1", "field2", "field3"),
#'         widths = c(30,20,10),
#'         error = TRUE),
#'      # Button to trigger error
#'      shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {
#'     # Trigger error on blank submit of field2
#'     observeEvent(input$submit, {
#'       if (input$field2 == ""){
#'         shinyGovBRstyle::error_on(inputId = "field2",
#'                                 error_message = "Please complete")
#'       } else {
#'         shinyGovBRstyle::error_off(
#'           inputId = "field2")
#'       }
#'     })
#'   }
#'   shinyApp(ui = ui, server = server)
#' }

input_field <- function(legend, labels, inputIds, widths=NULL, types = "text",
                        error = FALSE, error_message = NULL){
  if (is.null(widths)){
    widths <- rep_len(0,length(inputIds))
  }
  govInputField <- shiny::tags$fieldset(class="govbr-fieldset",
    shiny::tags$legend(
      legend, class="govbr-fieldset__legend govbr-fieldset__legend--xl"
    ),
    Map(function(x, y, z, a){
      if (z == 0){
        width_class <- "govbr-input"
      }
      else{
        width_class <- paste0("govbr-input govbr-input--width-", z)
      }
      shiny::tags$div(class="govbr-form-group", id=paste0(y,"div"),
        shiny::tags$label(shiny::HTML(x), class="govbr-label"),
        if (error){
          shinyjs::hidden(
            shiny::tags$p(error_message,
                      class="govbr-error-message",
                      id= paste0(y, "error"),
                      shiny::tags$span("Error:",
                                class="govbr-visually-hidden")
            )
          )
        },
        shiny::tags$input(id=y, class=width_class, type = a)
      )
    }, x = labels, y = inputIds, z = widths, a = types)
  )
  attachDependency(govInputField)
}
