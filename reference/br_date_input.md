# GovBR date input

Creates a GovBR date picker (`br-datetimepicker`). The value is
available in `input$<inputId>` as a `Date` (or `NULL` while
empty/invalid). Use [`update_br_date_input()`](update_br_inputs.md) to
change it from the server.

## Usage

``` r
br_date_input(inputId, label, placeholder = "exemplo: 02/02/2024", hint = NULL)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Date field label.

- placeholder:

  Placeholder text. Defaults to the GovBR example.

- hint:

  Auxiliary help text shown below the field.

## Value

A `shiny.tag` with the date picker markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_date_input(
      inputId = "data",
      label = "Data de nascimento"
    ),
    shiny::verbatimTextOutput("valor")
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$data)
  }
  shinyApp(ui = ui, server = server)
}
```
