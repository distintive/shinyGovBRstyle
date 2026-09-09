# Radio Button Function

This function create radio buttons

## Usage

``` r
radio_button_Input(
  inputId,
  label,
  choices = NULL,
  selected = NULL,
  inline = FALSE,
  small = FALSE,
  choiceNames = NULL,
  choiceValues = NULL,
  hint_label = NULL,
  error = FALSE,
  error_message = NULL,
  custom_class = ""
)
```

## Arguments

- inputId:

  The `input` slot that will be used to access the value.

- label:

  Input label.

- choices:

  List of values to select from (if elements of the list are named then
  that name rather than the value is displayed to the user)

- selected:

  The initially selected value.

- inline:

  If you want the radio inline or not, Default is FALSE

- small:

  If you want the smaller versions of radio buttons, Default is FALSE

- choiceNames, choiceValues:

  Same as in
  [`checkboxGroupInput`](https://rdrr.io/pkg/shiny/man/checkboxGroupInput.html).
  List of names and values, respectively, that are displayed to the user
  in the app and correspond to the each choice (for this reason they
  must have the same length). If either of these arguments is provided,
  then the other must be provided and choices must not be provided. The
  advantage of using both of these over a named list for choices is that
  choiceNames allows any type of UI object to be passed through (tag
  objects, icons, HTML code, ...), instead of just simple text.

- hint_label:

  Additional hint text you may want to display below the label. Defaults
  to NULL

- error:

  Whenever you want to include error handle on the component.

- error_message:

  If you want a default error message.

- custom_class:

  If you want to add additional classes to the radio buttons

## Value

radio buttons html shiny object

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
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::banner(
      inputId = "banner", type = "beta", 'This is a new service'),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      #Simple radio
      shinyGovBRstyle::radio_button_Input(
        inputId = "radio1",
        choices = c("Yes", "No", "Maybe"),
        label = "Choice option"),
      # Error radio
      shinyGovBRstyle::radio_button_Input(
        inputId = "radio2",
        choices = c("Yes", "No", "Maybe"),
        label = "Choice option",
        hint_label = "Select the best fit",
        inline = TRUE,
        error = TRUE,
        error_message = "Select one"),
      # Button to trigger error
      shinyGovBRstyle::button_Input(inputId = "submit", label = "Submit")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {
    #Trigger error on blank submit of eventId2
    observeEvent(input$submit, {
      if (is.null(input$radio2)){
        shinyGovBRstyle::error_on(inputId = "radio2")
      } else {
        shinyGovBRstyle::error_off(
          inputId = "radio2")
      }
    })
  }
  shinyApp(ui = ui, server = server)
}
```
