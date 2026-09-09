# Page Layout Functions

These function loads the page layout in a gov layout. There is a
selection of components that can sit within each other. The
gov_main_layout is the overarching layout. The gov_row creates a each
row and gov_box creates a box within the row. The gov_text is a
container for text bodies.

## Usage

``` r
gov_main_layout(..., inputID = "main")

gov_row(...)

gov_box(..., size = "full")

gov_text(...)
```

## Arguments

- ...:

  include the components of the UI that you want within the main page.
  These components are made to flow through each other. See example

- inputID:

  ID of the main div. Defaults to "main"

- size:

  size of the box in the row. Optional are full, one-half, two-thirds,
  one-third and one-quarter. Defaults to "full"

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
    shinyGovBRstyle::gov_main_layout(
      shinyGovBRstyle::gov_row(
        shinyGovBRstyle::gov_box(
          size = "full",
          shinyGovBRstyle::gov_text("govbr-grid-column-full")
        )
      ),
      shinyGovBRstyle::gov_row(
        shinyGovBRstyle::gov_box(
          size = "one-half",
          shinyGovBRstyle::gov_text("govbr-grid-column-one-half")
        ),
        shinyGovBRstyle::gov_box(
          size = "one-half",
          shinyGovBRstyle::gov_text("govbr-grid-column-one-half")
        )
      ),
      shinyGovBRstyle::gov_row(
        shinyGovBRstyle::gov_box(
          size = "one-third",
          shinyGovBRstyle::gov_text("govbr-grid-column-one-third")
        ),
        shinyGovBRstyle::gov_box(
          size = "two-third",
          shinyGovBRstyle::gov_text("govbr-grid-column-two-third")
        )
      ),
      shinyGovBRstyle::gov_row(
        shinyGovBRstyle::gov_box(
          size = "one-quarter",
          shinyGovBRstyle::gov_text("govbr-grid-column-one-quarter")
        ),
        shinyGovBRstyle::gov_box(
          size = "three-quarters",
          shinyGovBRstyle::gov_text("govbr-grid-column-three-quarters")
        )
      )
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
