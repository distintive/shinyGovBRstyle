# Text Input Function

This function create a text area input

## Usage

``` r
text_Input(
  inputId,
  label,
  hint_label = NULL,
  type = "text",
  width = NULL,
  error = FALSE,
  error_message = NULL,
  prefix = NULL,
  suffix = NULL
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Display label for the control, or `NULL` for no label.

- hint_label:

  Display hint label for the control, or `NULL` for no hint label.

- type:

  Type of text input to accept. Defaults to text.

- width:

  control the size of the box based on number of characters required.
  Options are 30, 20, 10, 5, 4, 3, 2. NULL will not limit the size

- error:

  Whenever to include error handling Defaults to FALSE.

- error_message:

  Message to display on error. Defaults to NULL

- prefix:

  Add a prefix to the box. Defaults to NULL

- suffix:

  Add a suffix to the box. Defaults to NULL

## Value

a text input html shiny object

## Examples

``` r
## Only run examples in interactive R sessions
if (interactive()) {

  ui <- fluidPage(
    # Required for error handling function
    shinyjs::useShinyjs(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::banner(
      inputId = "banner", type = "beta", 'This is a new service'),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      # Simple text box
      shinyGovBRstyle::text_Input(inputId = "eventId", label = "Event Name"),
      # Error text box
      shinyGovBRstyle::text_Input(
        inputId = "eventId2",
        label = "Event Name",
        hint_label = "This can be found on the letter",
        error = TRUE),
      # Button to trigger error
      shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )


  server <- function(input, output, session) {
    #Trigger error on blank submit of eventId2
    observeEvent(input$submit, {
      if (input$eventId2 != ""){
        shinyGovBRstyle::error_off(inputId = "eventId2")
      } else {
        shinyGovBRstyle::error_on(
          inputId = "eventId2",
          error_message = "Please complete")
      }
    })
  }

  # Run the application
  shinyApp(ui = ui, server = server)
}
```
