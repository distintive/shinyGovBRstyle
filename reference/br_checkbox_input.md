# GovBR checkbox input

Creates a `br-checkbox`. For a single checkbox, `input$<inputId>`
returns `TRUE`/`FALSE`. When `choices` is supplied a checkbox group is
created instead and `input$<inputId>` returns a character vector of the
checked values.

## Usage

``` r
br_checkbox_input(
  inputId,
  label,
  choices = NULL,
  selected = NULL,
  hint = NULL,
  inline = FALSE
)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Checkbox label (single) or group label shown above the options
  (group).

- choices:

  Optional vector of values for a checkbox group. Use a named vector to
  display labels different from the values.

- selected:

  Initially checked values (group) or `TRUE`/FALSE (single).

- hint:

  Auxiliary help text shown below the label.

- inline:

  If `TRUE`, group options are laid out horizontally.

## Value

A `shiny.tag` with the checkbox markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_checkbox_input("aceite", "Aceito os termos"),
    shinyGovBRstyle::br_checkbox_input(
      inputId = "temas",
      label = "Temas de interesse",
      choices = c("tec" = "Tecnologia", "sau" = "Saúde"),
      selected = "tec"
    ),
    shiny::verbatimTextOutput("valor")
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(
      list(aceite = input$aceite, temas = input$temas)
    )
  }
  shinyApp(ui = ui, server = server)
}
```
