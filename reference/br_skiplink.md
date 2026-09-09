# GovBR skip link

Creates a `br-skiplink` accessibility navigation bar. Links become
visible when the user presses the Tab key.

## Usage

``` r
br_skiplink(links)
```

## Arguments

- links:

  Named character vector of link destinations and labels, e.g.
  `c("main-content" = "Ir para o conteúdo")`. Names must match element
  ids in the page (built-in ids: `main-content` is created by
  [`br_layout()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_layout.md),
  `footer` by
  [`br_footer()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_footer.md)).

## Value

A `shiny.tag` with the skip link markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    shinyGovBRstyle::br_skiplink(
      c("main-content" = "Ir para o conteúdo", "footer" = "Ir para o rodapé")
    ),
    shinyGovBRstyle::br_header(title = "Título"),
    shinyGovBRstyle::br_layout(shiny::h1("Conteúdo")),
    shinyGovBRstyle::br_footer()
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
