# GovBR sign-in button

Creates a `br-sign-in` button that behaves like a Shiny action button:
the server observes `input$<inputId>` to count clicks.

## Usage

``` r
br_signin(inputId, label = "Entrar", type = c("secondary", "primary"))
```

## Arguments

- inputId:

  The input slot that will be used to access the click count.

- label:

  Button label.

- type:

  One of `"primary"` or `"secondary"` (default).

## Value

A `shiny.tag` with the sign-in markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_signin("entrar", "Entrar", type = "primary")
    )
  )
  server <- function(input, output, session) {
    shiny::observeEvent(input$entrar, shiny::showNotification("Entrar!"))
  }
  shinyApp(ui = ui, server = server)
}
```
