# GovBR radio input

Creates a group of `br-radio` options bound as a standard Shiny radio
group: `input$<inputId>` returns the selected value.

## Usage

``` r
br_radio_input(
  inputId,
  label,
  choices = NULL,
  selected = NULL,
  hint = NULL,
  inline = FALSE
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Group label shown above the options.

- choices:

  Vector of values. Use a named vector to display labels different from
  the values.

- selected:

  Initially selected value (`NULL` for none).

- hint:

  Auxiliary help text shown below the label.

- inline:

  If `TRUE`, options are laid out horizontally.

## Value

A `shiny.tag` with the radio group markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_radio_input(
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
