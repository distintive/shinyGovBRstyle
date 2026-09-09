# GovBR loading indicator

Creates a `br-loading` spinner or progress bar.

## Usage

``` r
br_loading(
  size = c("medium", "small", "large"),
  progress = NULL,
  label = "Carregando"
)
```

## Arguments

- size:

  Spinner size: `"medium"` (default), `"small"` or `"large"`.

- progress:

  Optional numeric value between 0 and 100. When supplied, renders a
  progress bar instead of a spinner.

- label:

  Accessible label for screen readers.

## Value

A `shiny.tag` with the loading markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_loading(),
      shinyGovBRstyle::br_loading(progress = 75)
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
