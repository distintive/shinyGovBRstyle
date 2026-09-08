# Banner Function

This function create a detail component that you can click for further
details.

## Usage

``` r
banner(inputId, type, label)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- type:

  Main type of label e.g. alpha or beta. Can be any word.

- label:

  test to display.

## Value

a banner html shiny object

## Examples

``` r
if (interactive()) {

  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::banner(
      inputId = "banner", type = "beta", 'Este é um novo serviço')
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
