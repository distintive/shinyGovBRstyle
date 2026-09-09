# GovBR card

Creates a `br-card` container with optional header, content and footer
areas.

## Usage

``` r
br_card(..., title = NULL, footer = NULL, hover = FALSE)
```

## Arguments

- ...:

  UI elements placed in the card content.

- title:

  Optional card header title.

- footer:

  Optional UI element placed in the card footer.

- hover:

  If `TRUE`, adds the hover emphasis effect.

## Value

A `shiny.tag` with the card markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_card(
        title = "Meu cart\u00e3o",
        shiny::p("Conte\u00fado do cart\u00e3o."),
        footer = shinyGovBRstyle::br_button("ok", "Confirmar")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
