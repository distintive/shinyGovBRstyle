# Details Function

This function create a detail component that you can click for further
details.

## Usage

``` r
details(inputId, label, help_text)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Main label text

- help_text:

  Additional help information in the component.

## Value

a details box html shiny object

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::details(
        inputId = "help_div",
        label = "Help with form",
        help_text = "To complete the form you need to fill it in...")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
