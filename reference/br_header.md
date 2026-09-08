# GovBR header

Creates a `br-header`, the official GovBR page header with logo,
signature, title, subtitle and an optional search box.

## Usage

``` r
br_header(
  title,
  subtitle = NULL,
  signature = "GovBR",
  logo = "govbr",
  logo_alt = "Logotipo",
  search_id = NULL,
  ...
)
```

## Arguments

- title:

  Main title displayed in the header.

- subtitle:

  Subtitle displayed below the title.

- signature:

  Organisation signature shown next to the logo.

- logo:

  Path or URL for the logo image. Use `"govbr"` for the official GovBR
  logo bundled with the package.

- logo_alt:

  Alternative text for the logo (recommended).

- search_id:

  Input id for the optional search box. When `NULL` (default) no search
  box is shown.

- ...:

  Named attributes passed to the header tag.

## Value

A `shiny.tag` with the header markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    shinyGovBRstyle::br_header(
      title = "Meu Sistema",
      subtitle = "Prot\u00f3tipo",
      signature = "Minist\u00e9rio",
      logo = "govbr",
      logo_alt = "Logo do GovBR"
    ),
    shinyGovBRstyle::br_layout(
      shiny::h1("Conte\u00fado")
    ),
    shinyGovBRstyle::br_footer()
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
