# GovBR message

Creates a `br-message` alert.

## Usage

``` r
br_message(
  title,
  body = NULL,
  type = c("info", "success", "warning", "danger"),
  dismissible = TRUE
)
```

## Arguments

- title:

  Message title.

- body:

  Message body text.

- type:

  One of `"info"` (default), `"success"`, `"warning"` or `"danger"`.

- dismissible:

  If `TRUE`, adds a close button.

## Value

A `shiny.tag` with the message markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_message(
      title = "Sucesso.",
      body = "Seus dados foram alterados conforme preenchimento.",
      type = "success"
    ),
    shinyGovBRstyle::br_message(
      title = "Atenção.",
      body = "Não compartilhe sua senha com terceiros.",
      type = "warning"
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
