# Panel output

This function inserts a panel. Normally used for confirmation screens

## Usage

``` r
panel_output(inputId, main_text, sub_text)
```

## Arguments

- inputId:

  The input slot that will be used to access the value.

- main_text:

  Add the header for the panel

- sub_text:

  Add the main body of text for the panel

## Value

a panel html shiny object

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
    shinyGovBRstyle::gov_layout(size = "full",
      shinyGovBRstyle::panel_output(
        inputId = "panel1",
        main_text = "Application Complete",
        sub_text = "Thank you for submitting your application.
                    Your reference is xvsiq")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
