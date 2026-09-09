# GovBR magic button

Creates a `br-magic-button`, a floating action button. Behaves like a
Shiny action button: the server observes `input$<inputId>` to count
clicks.

## Usage

``` r
br_magic_button(
  inputId,
  label,
  size = c("medium", "small", "large"),
  icon = NULL
)
```

## Arguments

- inputId:

  The input slot that will be used to access the click count.

- label:

  Button label (or `aria-label` when `icon` is used).

- size:

  One of `"small"`, `"medium"` (default) or `"large"`.

- icon:

  Optional Font Awesome icon class. When supplied, the button is
  rendered as a circle icon button.

## Value

A `shiny.tag` with the magic button markup and GovBR dependencies
attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_magic_button("novo", "Adicionar",
                                      icon = "fas fa-cart-plus")
    )
  )
  server <- function(input, output, session) {
    shiny::observeEvent(input$novo, shiny::showNotification("Clicou!"))
  }
  shinyApp(ui = ui, server = server)
}
```
