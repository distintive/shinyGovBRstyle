# Font Function

This function adds rge nta fonts to the app. See
https://design-system.service.gov.uk/styles/typography/ for when they
are allowed.

## Usage

``` r
font()
```

## Value

no value returned. This loads the font css file

## Examples

``` r
if (interactive()) {

  ui <- fluidPage(
    font(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png")
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
