# Select Function

This function inserts a select box

## Usage

``` r
select_Input(inputId, label, select_text, select_value)
```

## Arguments

- inputId:

  Input id for the component

- label:

  Insert the text for the label.

- select_text:

  Add the text that will apply in the drop down as a list

- select_value:

  Add the value that will be used for each selection.

## Value

a select input html shiny object

## Examples

``` r
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "full",
      select_Input(
        inputId = "sorter",
        label = "Sort by",
        select_text = c("Recently published",
                        "Recently updated",
                        "Most views",
                        "Most comments"),
        select_value = c("published", "updated", "view", "comments")),
        tags$br()
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
```
