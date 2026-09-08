# Error Summary Function

This function loads the error summary component to display error text.
This replicates the gov style error boxes linked below:
https://design-system.service.gov.uk/components/error-summary/

## Usage

``` r
error_summary(inputId, error_title, error_list)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- error_title:

  The title for the error summary.

- error_list:

  A list of text values to be displayed in the error body.

## Value

an error_summary html shiny object

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyjs::useShinyjs(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo = "shinyGovBRstyle/images/dev_logo.png"
    ),
    shinyGovBRstyle::gov_layout(
      size = "two-thirds",
      error_summary(
        inputId = "errorId",
        error_title = "Error title",
        error_list = c("error item1", "error item2")
      )
    ),
    shinyGovBRstyle::button_Input("btn1", "Change error summary"),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {

    shiny::observeEvent(input$btn1, {
      error_summary_update(
        "errorId",
        c("error item1", "error item2", "error item3")
      )},
      ignoreInit = TRUE
    )
  }
  shinyApp(ui = ui, server = server)
}
```
