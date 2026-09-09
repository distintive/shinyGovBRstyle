# Skip to main content link

This function generates an accessible 'Skip to main content' link, which
is typically used by keyboard-only users to bypass content and navigate
directly to the main content of a page. Important: your main column will
need an id of "main_col" for this to work

## Usage

``` r
skip_to_main()
```

## Value

a skip button that skips to section with id of "main_col"

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
 if (interactive()) {
  ui <- fluidPage(
    skip_to_main(),
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/govbr-logo.png"
    ),
    shinyjs::useShinyjs(),  # shinyjs is needed to manage visibility of elements
)
  server <- function(input, output, session){
  }
  shinyApp(ui = ui, server = server)

}
```
