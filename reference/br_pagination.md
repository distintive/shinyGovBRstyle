# GovBR pagination

Creates a `br-pagination` control. `input$<inputId>` returns the current
page number.

## Usage

``` r
br_pagination(inputId, total, current = 1)
```

## Arguments

- inputId:

  The input slot that will be used to access the page number.

- total:

  Total number of pages.

- current:

  Initially selected page (1-based).

## Value

A `shiny.tag` with the pagination markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shiny::uiOutput("pagina"),
      shiny::verbatimTextOutput("valor")
    )
  )
  server <- function(input, output, session) {
    output$pagina <- shiny::renderUI(
      shinyGovBRstyle::br_pagination("pag", total = 5,
                                    current = input$pag %||% 1)
    )
    output$valor <- shiny::renderPrint(input$pag)
  }
  shinyApp(ui = ui, server = server)
}
```
