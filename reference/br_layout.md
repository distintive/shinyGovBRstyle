# GovBR page layout container

Wraps page content in one of the GovBR grid containers (`container-lg`,
`container-md`, `container-sm` or `container-fluid`).

## Usage

``` r
br_layout(..., size = c("large", "medium", "small", "fluid"))
```

## Arguments

- ...:

  UI elements to place inside the container.

- size:

  One of `"large"` (default), `"medium"`, `"small"` or `"fluid"`.

## Value

A `shiny.tag` with the container markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    shinyGovBRstyle::br_header(title = "Título"),
    shinyGovBRstyle::br_layout(
      shiny::h1("Conteúdo"),
      shinyGovBRstyle::br_button("btn", "Enviar")
    ),
    shinyGovBRstyle::br_footer()
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
