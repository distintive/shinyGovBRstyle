# Update GovBR inputs server-side

Change the value (and label where supported) of GovBR inputs from the
server. Works by delegating to the native Shiny input bindings used by
the `br_*` components.

## Usage

``` r
update_br_text_input(
  inputId,
  value = NULL,
  placeholder = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_textarea_input(
  inputId,
  value = NULL,
  placeholder = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_radio_input(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_checkbox_input(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_select_input(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_date_input(
  inputId,
  value = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_tabs(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_pagination(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)

update_br_step(
  inputId,
  selected = NULL,
  session = shiny::getDefaultReactiveDomain()
)
```

## Arguments

- inputId:

  The id of the input to modify.

- value:

  New value.

- placeholder:

  New placeholder (`update_br_text_input()` only).

- session:

  The shiny session object (defaults to the current one).

- selected:

  New selected value (single inputs) or vector of values (group/select
  inputs).

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_text_input("nome", "Nome"),
    shinyGovBRstyle::br_button("limpar", "Limpar")
  )
  server <- function(input, output, session) {
    shiny::observeEvent(input$limpar, {
      shinyGovBRstyle::update_br_text_input("nome", value = "")
    })
  }
  shinyApp(ui = ui, server = server)
}
```
