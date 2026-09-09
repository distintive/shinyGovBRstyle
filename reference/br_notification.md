# GovBR notification

Creates a `br-notification` panel with a header and a list of
notification items.

## Usage

``` r
br_notification(title, subtitle = NULL, items = NULL, icons = NULL)
```

## Arguments

- title:

  Header title.

- subtitle:

  Optional header subtitle (e.g. an e-mail).

- items:

  Character vector or list of UI elements shown as notification items.

- icons:

  Optional character vector of Font Awesome icon classes, one per item.

## Value

A `shiny.tag` with the notification markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_notification(
        title = "Fulano da Silva",
        subtitle = "nome.sobrenome@dominio.gov",
        items = c("Alerta um", "Alerta dois"),
        icons = c("fas fa-bell", "fas fa-envelope")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
