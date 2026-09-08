# Label with Hint Function

This function inserts a label and optional hint

## Usage

``` r
label_hint(inputId, label, hint_input = NULL)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- label:

  Display label for the control, or `NULL` for no label.

- hint_input:

  Display hint label for the control, or `NULL` for no hint label.

## Value

a label hint html shiny object

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      label_hint(
        inputId = "label1",
        label = "This is a label",
        hint_input = "This is a hint")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
