# Update the browser tab title

Changes the browser tab title from server code, optionally composing it
with a service name (e.g. `"Relat\u00f3rio | Meu Sistema"`). Requires
the GovBR dependencies ([`use_govbr()`](use_govbr.md) or any `br_*`
component).

## Usage

``` r
br_update_page_title(
  page_title,
  service_name = NULL,
  session = shiny::getDefaultReactiveDomain()
)
```

## Arguments

- page_title:

  New page title (single non-empty string).

- service_name:

  Optional service name appended after the title, separated by `" | "`.

- session:

  The shiny session object (defaults to the current one).

## Value

Invisible `NULL`, called for its side effect.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_button("rel", "Gerar relat\u00f3rio")
  )
  server <- function(input, output, session) {
    shiny::observeEvent(input$rel, {
      shinyGovBRstyle::br_update_page_title(
        page_title = "Relat\u00f3rio gerado",
        service_name = "Meu Sistema"
      )
    })
  }
  shinyApp(ui = ui, server = server)
}
```
