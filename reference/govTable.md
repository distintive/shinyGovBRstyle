# Table Function

This function inserts a gov styled table. Format is with header looking
rows and columns

## Usage

``` r
govTable(
  inputId,
  df,
  caption,
  caption_size = "l",
  num_col = NULL,
  width_overwrite = NULL
)
```

## Arguments

- inputId:

  Input id for the table

- df:

  expects a dataframe to create a table

- caption:

  adds a caption to the table as a header

- caption_size:

  adjust the size of caption. Options are s, m, l, xl, with l as the
  default

- num_col:

  adds numeric class format to these columns.

- width_overwrite:

  change width. Need to include width for every column. Columns must add
  up to 1. Options are three-quarters, two-thirds, one-half, one-third,
  one-quarter. Default is `NULL`.

## Value

an table html shiny object

## Examples

``` r
if (interactive()) {

  Months <- c("January", "February", "March")
  Bikes <- c("£85", "£75", "£165")
  Cars <- c("£95", "£55", "£125")

  example_data <- data.frame(Months, Bikes, Cars)

  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::banner(
      inputId = "banner", type = "beta", 'This is a new service'),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
    shinyGovBRstyle::govTable(
      "tab1", example_data, "Test", "l", num_col = c(2,3),
      width_overwrite = c("one-half", "one-quarter", "one-quarter"))
    ),

    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
