# GovBR tag

Creates a `br-tag` label/badge.

## Usage

``` r
br_tag(text, class = NULL, icon = NULL)
```

## Arguments

- text:

  Tag text.

- class:

  Optional extra class, e.g. a GovBR background utility such as
  `"bg-mint-cool-vivid-70"` or `"text"`.

- icon:

  Optional Font Awesome icon class, e.g. `"fas fa-car"`.

## Value

A `shiny.tag` with the tag markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_tag("Novo"),
    shinyGovBRstyle::br_tag("Publicado", class = "bg-mint-cool-vivid-70")
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
