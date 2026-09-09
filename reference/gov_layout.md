# Page Layout Function

This function loads the page layout, This doesn't work as well as the
\`gov_main_layout\` and associated functions. This is being kept for now
as a simpler version where grids are not needed.

## Usage

``` r
gov_layout(..., inputID = "main", size = "full")
```

## Arguments

- ...:

  include the components of the UI that you want within the main page.

- inputID:

  ID of the main div. Defaults to "main"

- size:

  Layout of the page. Optional are full, one-half, two-thirds, one-third
  and one-quarter. Defaults to "full"

## Value

a html shiny layout div

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
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "full",
      shinyGovBRstyle::panel_output(
        inputId = "panel1",
        main_text = "Application Complete",
        sub_text = "Thank you for submitting your application.
        Your reference is xvsiq")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
