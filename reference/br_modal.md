# GovBR modal

Creates a `br-modal` dialog. The close button and any footer button
created with `data-dismiss = "br-modal"` close the modal via the GovBR
JavaScript.

## Usage

``` r
br_modal(
  title,
  ...,
  footer = NULL,
  size = c("medium", "small", "large"),
  id = NULL
)
```

## Arguments

- title:

  Modal title.

- ...:

  Modal body content.

- footer:

  Optional UI element for the modal footer (e.g.
  [`br_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_button.md)).

- size:

  One of `"small"`, `"medium"` (default) or `"large"`.

- id:

  Optional id for the modal element.

## Value

A `shiny.tag` with the modal markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_modal(
        title = "Confirmar a\u00e7\u00e3o",
        shiny::p("Deseja realmente continuar?"),
        footer = shinyGovBRstyle::br_button("ok", "Sim", type = "primary")
      )
    )
  )
  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
