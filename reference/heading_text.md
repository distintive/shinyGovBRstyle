# Heading Text Function

This function create a heading text

## Usage

``` r
heading_text(text_input, size = "xl", id)
```

## Arguments

- text_input:

  Text to display

- size:

  Text size using xl, l, m, s. Defaults to xl.

- id:

  Custom header id

## Value

a heading text html shiny object

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
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::heading_text("This is great text", "m")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
