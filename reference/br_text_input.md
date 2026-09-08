# GovBR text input

Creates a `br-input` text field bound as a standard Shiny text input
(`input$<inputId>` returns the text).

## Usage

``` r
br_text_input(
  inputId,
  label,
  placeholder = NULL,
  value = "",
  hint = NULL,
  disabled = FALSE
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Input label.

- placeholder:

  Placeholder text.

- value:

  Initial value.

- hint:

  Auxiliary help text shown below the field.

- disabled:

  If `TRUE`, disables the input.

## Value

A `shiny.tag` with the input markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_text_input(
      inputId = "nome",
      label = "Nome",
      placeholder = "Digite seu nome",
      hint = "Texto auxiliar para prevenir erros"
    ),
    shiny::verbatimTextOutput("valor")
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$nome)
  }
  shinyApp(ui = ui, server = server)
}
```
