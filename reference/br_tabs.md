# GovBR tabs

Creates a `br-tab` navigation with content panels. The GovBR JavaScript
handles switching panels; the first tab is active initially.
`input$<inputId>` returns the index (1-based) of the active tab; use
[`update_br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md)
to change it from the server.

## Usage

``` r
br_tabs(inputId, titles, ..., panels = list(...), icons = NULL)
```

## Arguments

- inputId:

  Id for the tab container.

- titles:

  Character vector of tab titles.

- ...:

  One UI element per tab, in the same order as `titles` (or pass a list
  of elements to `panels`).

- panels:

  Alternative to `...`: list of UI elements.

- icons:

  Optional character vector of Font Awesome icon classes, one per tab.

## Value

A `shiny.tag` with the tab markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_tabs(
        inputId = "abas",
        titles = c("Dados", "Gr\u00e1ficos"),
        panels = list(
          shiny::p("Conte\u00fado dos dados."),
          shiny::p("Conte\u00fado dos gr\u00e1ficos.")
        )
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
