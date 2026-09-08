# Error Summary Update Function

This function changes the text that displays in the error summary box.
Requires shinyjs::useShinyjs() to work.

## Usage

``` r
error_summary_update(inputId, error_list)
```

## Arguments

- inputId:

  The inputid of the error summary you want to update

- error_list:

  An updated list of text values to be displayed in the error body.

## Value

an update error summary box

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
