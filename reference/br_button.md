# GovBR button

Creates a `br-button` that behaves like a Shiny action button: the
server can observe `input$<inputId>` to count clicks.

## Usage

``` r
br_button(
  inputId,
  label,
  type = c("primary", "secondary", "success", "warning", "danger"),
  block = FALSE,
  circle = FALSE,
  icon = NULL,
  disabled = FALSE
)
```

## Arguments

- inputId:

  The input slot that will be used to access the click count.

- label:

  Button label.

- type:

  Button type: `"primary"` (default), `"secondary"`, `"success"`,
  `"warning"` or `"danger"`.

- block:

  If `TRUE`, the button takes the full width of its container.

- circle:

  If `TRUE`, renders a circular icon button (label is used as the
  `aria-label`).

- icon:

  Optional Font Awesome icon class, e.g. `"fas fa-search"`
  (<https://fontawesome.com/v5/search>).

- disabled:

  If `TRUE`, disables the button.

## Value

A `shiny.tag` with the button markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_button("btn1", "Primary"),
    shinyGovBRstyle::br_button("btn2", "Secondary", type = "secondary"),
    shinyGovBRstyle::br_button("btn3", "Warning", type = "warning"),
    shinyGovBRstyle::br_button("btn4", "Buscar", icon = "fas fa-search")
  )
  server <- function(input, output, session) {
    shiny::observeEvent(input$btn1, shiny::showNotification("Clicou!"))
  }
  shinyApp(ui = ui, server = server)
}
```
