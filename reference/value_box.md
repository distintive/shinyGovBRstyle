# Create a value text box with optional description and colour

This function generates a value text box with an optional description
and customisable colour. The text box can be used in Shiny applications
to display highlighted information, such as statistics or key metrics.

## Usage

``` r
value_box(inputId, value = "your value goes here", text = NA, colour = "blue")
```

## Arguments

- inputId:

  Character. A unique identifier for the value box element.

- value:

  Character. The primary value to display in the value box. Defaults to
  "your value goes here".

- text:

  Character or NA. An optional description to appear below the value. If
  not provided (default is NA), the description will not be displayed..

- colour:

  Character. A colour to apply to the value box. Defaults to "blue".
  Choose from the following: "grey", "purple", "turquoise", "blue",
  "light-blue", "yellow", "orange", "red", "pink", or "green".

## Value

A Shiny \`div\` tag representing the value box, styled according to the
specified parameters.

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    value_box(
      inputId = "value1",
      value = "1,000,000",
      text = "This is the latest value for the selected inputs.",
      colour = "purple"
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
