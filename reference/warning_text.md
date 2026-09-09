# Warning Text Function

This function create warning text

## Usage

``` r
warning_text(inputId, text)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- text:

  Text that goes in the main

## Value

a warning box html shiny object

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/govbr-logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::warning_text(
        inputId = "warn1",
        text = "You can be fined up to £5,000 if you do not register.")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
