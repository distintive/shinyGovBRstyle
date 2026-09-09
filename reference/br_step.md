# GovBR step

Creates a `br-step` progress indicator. `input$<inputId>` returns the
index (1-based) of the last clicked (or initial) step.

## Usage

``` r
br_step(inputId, labels, initial = 1)
```

## Arguments

- inputId:

  The input slot that will be used to access the step index.

- labels:

  Character vector of step labels.

- initial:

  Initially active step (1-based).

## Value

A `shiny.tag` with the step markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_step(
        "etapas", c("Identifica\u00e7\u00e3o", "Dados", "Confirma\u00e7\u00e3o")
      ),
      shiny::verbatimTextOutput("valor")
    )
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$etapas)
  }
  shinyApp(ui = ui, server = server)
}
```
