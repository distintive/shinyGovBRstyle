# GovBR tooltip

Wraps a UI element with a `br-tooltip`. Requires the GovBR JavaScript
(initialised automatically by
[`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md)).

## Usage

``` r
br_tooltip(
  ...,
  text,
  subtext = NULL,
  place = c("left", "top", "bottom", "right"),
  type = c("info", "success", "warning", "error")
)
```

## Arguments

- ...:

  The trigger element (e.g. a
  [`br_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_button.md)).

- text:

  Tooltip main text.

- subtext:

  Optional tooltip secondary text.

- place:

  Placement relative to the trigger: `"top"`, `"bottom"`, `"left"`
  (default) or `"right"`.

- type:

  Tooltip type: `"info"` (default), `"success"`, `"warning"` or
  `"error"`.

## Value

A `shiny.tag` wrapping the element with the tooltip markup and GovBR
dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_tooltip(
        shinyGovBRstyle::br_button("btn", "Ajuda"),
        text = "Texto de ajuda",
        subtext = "Informa\u00e7\u00f5es adicionais",
        place = "bottom"
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
