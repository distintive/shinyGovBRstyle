# Attach GovBR Design System dependencies

Adds the official GovBR Design System assets (CSS, JavaScript, Rawline
font and Font Awesome) to a tag. Every `br_*` component calls this
internally, so using it explicitly is only needed for pages built
exclusively with other tags.

## Usage

``` r
use_govbr(tag = shiny::tags$div())
```

## Arguments

- tag:

  A tag to attach the dependencies to.

## Value

The tag with the GovBR dependencies attached (invisibly for
`use_govbr()`).

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_button("btn", "Clique aqui")
  )
  server <- function(input, output, session) {}
  shinyApp(ui, server)
}
```
