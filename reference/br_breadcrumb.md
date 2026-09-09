# GovBR breadcrumb

Creates a `br-breadcrumb` trail. The last link is rendered as the
current page.

## Usage

``` r
br_breadcrumb(links, home = TRUE, home_href = "#")
```

## Arguments

- links:

  Named character vector of link labels and destinations, e.g.
  `c("P\u00e1gina 1" = "pagina1.html", "Atual" = "#")`. The last element
  is marked as the current page.

- home:

  If `TRUE` (default), prepends a home link pointing to `home_href`.

- home_href:

  Destination of the home link.

## Value

A `shiny.tag` with the breadcrumb markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_breadcrumb(
        c("Relat\u00f3rios" = "#", "Anual" = "#")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
