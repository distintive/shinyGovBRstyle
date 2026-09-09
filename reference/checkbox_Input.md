# Checkbox Function

This function inserts a checkbox group

## Usage

``` r
checkbox_Input(
  inputId,
  cb_labels,
  checkboxIds,
  label,
  hint_label = NULL,
  small = FALSE,
  error = FALSE,
  error_message = NULL
)
```

## Arguments

- inputId:

  Input id for the group of checkboxes

- cb_labels:

  Add the names of the options that will appear

- checkboxIds:

  Add the values for each checkbox

- label:

  Insert the text for the checkbox group.

- hint_label:

  Insert optional hint/secondary text. Defaults to NULL

- small:

  change the sizing to a small version of the checkbox. Defaults to
  `FALSE`

- error:

  Whenever you want to include error handle on the component.

- error_message:

  If you want a default error message.

## Value

a checkbox html shiny object

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {

  ui <- fluidPage(
    # Required for error handling function
    shinyjs::useShinyjs(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/govbr-logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      # Simple checkbox
      shinyGovBRstyle::checkbox_Input(
        inputId = "check1",
        cb_labels = c("Option 1", "Option 2", "Option 3"),
        checkboxIds = c("op1", "op2", "op3"),
        label = "Choice option"),
       # Error checkbox
      shinyGovBRstyle::checkbox_Input(
        inputId = "check2",
        cb_labels = c("Option 1", "Option 2", "Option 3"),
        checkboxIds = c("op1", "op2", "op3"),
        label = "Choice option",
        hint_label = "Select the best fit",
        error = TRUE,
        error_message = "Select one"),
      # Button to trigger error
      shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {
    #'Trigger error on blank submit of eventId2
    observeEvent(input$submit, {
      if (is.null(input$check2)){
      } else {
      }
    })
  }

  shinyApp(ui = ui, server = server)
}
```
