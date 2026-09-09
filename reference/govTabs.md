# Tabs Function

This function creates a tabs based table. It requires a single dataframe
with a grouping variable

## Usage

``` r
govTabs(inputId, df, group_col)
```

## Arguments

- inputId:

  The id to access the tag

- df:

  A single dataframe with all data. See example for structure.

- group_col:

  The column name with the groups to be used as tabs

## Value

a tab table html shiny object.

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {

  # Create an example dataset
  tabs <- c(rep("Past Day", 3),
            rep("Past Week", 3),
            rep("Past Month", 3),
            rep("Past Year", 3))
  Case_manager <- rep(c("David Francis", "Paul Farmer", "Rita Patel"),4)
  Cases_open <- c(3, 1, 2, 24, 16, 24, 98, 122, 126, 1380, 1129, 1539)
  Cases_closed <- c(0, 0, 0, 18, 20, 27, 95, 131, 142, 1472, 1083, 1265)
  data <- data.frame(tabs, Case_manager, Cases_open, Cases_closed)

  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::govTabs(data, "tabs")),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
