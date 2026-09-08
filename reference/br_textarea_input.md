# GovBR textarea input

Creates a `br-textarea` bound as a standard Shiny text area
(`input$<inputId>` returns the text).

## Usage

``` r
br_textarea_input(
  inputId,
  label,
  placeholder = NULL,
  value = "",
  hint = NULL,
  rows = 4
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Text area label.

- placeholder:

  Placeholder text.

- value:

  Initial value.

- hint:

  Auxiliary help text shown below the field.

- rows:

  Number of visible rows.

## Value

A `shiny.tag` with the textarea markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_textarea_input(
      inputId = "obs",
      label = "Observações",
      placeholder = "Digite suas observações"
    ),
    shiny::verbatimTextOutput("valor")
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$obs)
  }
  shinyApp(ui = ui, server = server)
}
```
