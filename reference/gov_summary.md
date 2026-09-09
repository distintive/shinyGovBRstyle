# Tabs Function

This function creates a tabs based table. It requires a single dataframe
with a grouping variable

## Usage

``` r
gov_summary(inputId, headers, info, action = FALSE, border = TRUE)
```

## Arguments

- inputId:

  The id to access the summary list

- headers:

  input for the row headers value

- info:

  summary information values for the table

- action:

  whenever a change link is needed. sets input to the value of the
  headers using lowercase and with underscore to replace gaps. Default
  set to `FALSE`

- border:

  set if the table should have borders. Default set to `TRUE`

## Value

a summary list table html shiny object.

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {

  # Create an example dataset
  headers <- c("Name", "Date of birth", "Contact information", "Contact details")
  info <- c(
    "Sarah Philips",
    "5 January 1978",
    "72 Guild Street <br> London <br> SE23 6FH",
    "07700 900457 <br> sarah.phillips@example.com")

  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::gov_summary("sumID", headers, info, action = FALSE)),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
