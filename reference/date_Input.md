# Date Input Function

This function create a date input that follows GDS component

## Usage

``` r
date_Input(
  inputId,
  label,
  hint_label = NULL,
  error = FALSE,
  error_message = NULL,
  day = NULL,
  month = NULL,
  year = NULL
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Display label for the control, or `NULL` for no label.

- hint_label:

  Display hint label for the control, or `NULL` for no hint label.

- error:

  Whenever to include error components.Defaults to `FALSE`.

- error_message:

  Error handling message? Defaults to `NULL`

- day:

  Select a default day on start up. Defaults to `NULL`

- month:

  Select a default month on start up. Defaults to `NULL`

- year:

  Select a default year on start up. Defaults to `NULL`

## Value

a data input html shiny object

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {

  ui <- fluidPage(
    # Required for error handling function.
    shinyjs::useShinyjs(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::banner(
      inputId = "banner", type = "beta", 'This is a new service'),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
       # Simple date input
      shinyGovBRstyle::date_Input(
        inputId = "dob_input",
        label = "Please enter your birthday"),
       # Error date input
       shinyGovBRstyle::date_Input(
         inputId = "dob_input2",
         label = "Please enter your birthday",
         hint_label = "For example, 12 11 2007",
         error = TRUE),
       # Button to trigger error
       shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {
    #'Trigger error on blank submit of dob_input2
    observeEvent(input$submit, {
      if (input$dob_input2 == "//"){
        shinyGovBRstyle::error_on(inputId = "dob_input2")
      } else {
        shinyGovBRstyle::error_off(
          inputId = "dob_input2")
      }
    })
  }
  shinyApp(ui = ui, server = server)
}
```
