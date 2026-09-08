# Tag Function

This function creates a tag

## Usage

``` r
tag_Input(inputId, text, colour = "navy")
```

## Arguments

- inputId:

  The id to access the tag

- text:

  The text in the tag

- colour:

  The colour of the tag. Default is navy. Other options are grey, green,
  turquoise, blue, purple, pink, red, orange and yellow

## Value

a tag html shiny object.

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::tag_Input("tag1", "Complete"),
      shinyGovBRstyle::tag_Input("tag2", "Incomplete", "red")),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
