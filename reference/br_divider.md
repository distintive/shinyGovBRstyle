# GovBR divider

Creates a `br-divider` horizontal rule.

## Usage

``` r
br_divider(class = NULL)
```

## Arguments

- class:

  Optional extra classes, e.g. `"vertical"`, `"dashed"` or spacing
  utilities such as `"my-3"`.

## Value

A `shiny.tag` with the divider markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shiny::tags$div("Conteúdo acima"),
    shinyGovBRstyle::br_divider(class = "my-3"),
    shiny::tags$div("Conteúdo abaixo")
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
