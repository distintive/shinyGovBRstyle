# GovBR footer

Creates a `br-footer`, the official GovBR page footer.

## Usage

``` r
br_footer(
  categories = NULL,
  logo = "govbr",
  logo_alt = "Logotipo",
  licence_text = NULL
)
```

## Arguments

- categories:

  Optional named list of link categories. Each element is a character
  vector of link labels (links point to `"#"`). When `NULL` (default)
  only the logo and licence text are shown.

- logo:

  Path or URL for the footer logo. Use `"govbr"` for the logo bundled
  with the package.

- logo_alt:

  Alternative text for the logo.

- licence_text:

  Text shown in the licence information area.

## Value

A `shiny.tag` with the footer markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    shinyGovBRstyle::br_layout(shiny::h1("Conte\u00fado")),
    shinyGovBRstyle::br_footer(
      categories = list("Categoria" = c("Link 1", "Link 2"))
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
