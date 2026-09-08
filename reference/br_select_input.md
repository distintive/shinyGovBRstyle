# GovBR select input

Creates a `br-select`, the GovBR dropdown list. For `multiple = FALSE`,
`input$<inputId>` returns the selected value; for `multiple = TRUE` it
returns a character vector of the selected values. The filter text field
is available as `input$<inputId>_filter`.

## Usage

``` r
br_select_input(
  inputId,
  label,
  choices = NULL,
  selected = NULL,
  multiple = FALSE,
  placeholder = "Selecione o item",
  hint = NULL
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Select label.

- choices:

  Vector of values. Use a named vector to display labels different from
  the values.

- selected:

  Initially selected value(s).

- multiple:

  Whether multiple items can be selected.

- placeholder:

  Placeholder text for the filter field.

- hint:

  Auxiliary help text shown below the select.

## Value

A `shiny.tag` with the select markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_select_input(
      inputId = "uf",
      label = "Estado",
      choices = c("Distrito Federal" = "DF", "São Paulo" = "SP")
    ),
    shiny::verbatimTextOutput("valor")
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$uf)
  }
  shinyApp(ui = ui, server = server)
}
```
