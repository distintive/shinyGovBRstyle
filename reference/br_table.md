# GovBR table

Creates a `br-table` from a data frame or matrix, following the official
GovBR table markup: a header area with the table title and a plain table
whose cells carry `data-th` attributes (used by the responsive/collapse
behaviour).

## Usage

``` r
br_table(data, title = NULL, ...)
```

## Arguments

- data:

  A `data.frame` or `matrix`.

- title:

  Table title shown in the table header bar.

- ...:

  Additional UI elements to place inside the table wrapper.

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
        title = "Tabela de carros"
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
