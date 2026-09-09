# GovBR accordion

Creates a `br-accordion` of expandable items. Requires the GovBR
JavaScript (initialised automatically by
[`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md)).

## Usage

``` r
br_accordion(inputId, items, single = FALSE)
```

## Arguments

- inputId:

  Id for the accordion container.

- items:

  Named list. Names become the item titles and values the item contents
  (can be any Shiny UI element).

- single:

  If `TRUE`, only one item can be open at a time.

## Value

A `shiny.tag` with the accordion markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_accordion(
        inputId = "faq",
        items = list(
          "Assuntos" = shiny::p("Conte\u00fado de assuntos."),
          "Servi\u00e7os" = shiny::p("Conte\u00fado de servi\u00e7os.")
        )
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
