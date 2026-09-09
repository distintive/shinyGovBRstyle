# Accordion Function

This function inserts a accordion

## Usage

``` r
accordion(inputId, titles, descriptions)
```

## Arguments

- inputId:

  Input id for the accordion

- titles:

  Add the titles for the accordion

- descriptions:

  Add the main text for the accordion

## Value

an accordion html shiny object

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
    accordion(
      "acc1",
      c("Writing well for the web",
        "Writing well for specialists",
        "Know your audience",
        "How people read"
       ),
      c("This is the content for Writing well for the web.",
        "This is the content for Writing well for specialists.",
        "This is the content for Know your audience.",
        "This is the content for How people read."
       ))),

    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
