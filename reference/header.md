# Header Function

This function create a header banner. For use at top of the screen

## Usage

``` r
header(
  main_text,
  secondary_text,
  logo = NULL,
  main_link = "#",
  secondary_link = "#",
  logo_alt_text = NULL,
  main_alt_text = NULL,
  secondary_alt_text = NULL,
  logo_width = 36,
  logo_height = 32
)
```

## Arguments

- main_text:

  Main text that goes in the header.

- secondary_text:

  Secondary header to supplement the main text.

- logo:

  Add a link to a logo which will apply in the header. Use govfederal to
  use the govfederal svg version on gov uk.

- main_link:

  Add a link for clicking on main text.

- secondary_link:

  Add a link for clicking on secondary header.

- logo_alt_text:

  Add alternative text for the logo. Should be used when a logo is used.

- main_alt_text:

  Add alternative text for the main link. Should be used when a main
  link is used.

- secondary_alt_text:

  Add alternative text for the secondary link. Should be used when a
  secondary link is used.

- logo_width:

  Change the logo size width CSS to improve fit.

- logo_height:

  Change the logo size height CSS to improve fit.

## Value

a header HTML shiny object

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
      logo="shinyGovBRstyle/images/govbr-logo.png",
      logo_alt_text = "Logo do MIDR"
    )
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
