# Button Function

This function create a gov style button

## Usage

``` r
button_Input(inputId, label, type = "default")
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Display label for the control, or `NULL` for no label.

- type:

  The type of button. Options are default, start, secondary and warning.
  Defaults to default.

## Value

a html button shiny object

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::button_Input(
        inputId = "btn1",
        label = "Continue",
        type = "default")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
