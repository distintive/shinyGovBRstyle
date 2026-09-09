# GovBR table

Creates a `br-table` from a data frame or matrix. Column names become
the table headers.

## Usage

``` r
br_table(data, caption = NULL, ...)
```

## Arguments

- data:

  A `data.frame` or `matrix`.

- caption:

  Optional table caption.

- ...:

  Additional UI elements to place inside the table wrapper (e.g. toolbar
  buttons).

## Value

A `shiny.tag` with the table markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_table(
        data = mtcars[1:5, ],
        caption = "Tabela de carros"
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
