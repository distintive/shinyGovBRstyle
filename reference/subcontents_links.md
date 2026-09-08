# Subcontents links function This function is used internally within contents_link to create links to headings within pages.

Subcontents links function This function is used internally within
contents_link to create links to headings within pages.

## Usage

``` r
subcontents_links(subcontents_text_list, subcontents_id_list)
```

## Arguments

- subcontents_text_list:

  vector of link text for subcontents

- subcontents_id_list:

  vector of link ids for subcontents. pass NAs for automatic matching to
  id in shinygovBRstyle::heading_text

## Value

a ol html shiny object

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo = "shinyGovBRstyle/images/moj_logo.png"
    ),
    shiny::column(
      width = 3,
      id = "nav",
      shiny::tags$div(
        shiny::tags$h2("Contents"),
        subcontents_links(
          c("radio_button_Input (inline)", "button_Input"),
          c(NA, NA)
        ),
        subcontents_links(
          c("date_Input", "button_Input"),
          c(NA, "button_input_text_types")
        )
      )
    )
  )

  server <- function(input, output, session) {
  }
  shiny::shinyApp(ui = ui, server = server)
}
```
