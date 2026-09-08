# Word Count Function

This function create tracks the word count and should be used with the
text area function

## Usage

``` r
word_count(inputId, input, word_limit = NULL)
```

## Arguments

- inputId:

  The input slot of the text area that you want to affect

- input:

  The text input that is associated with the box.

- word_limit:

  Change the word limit if needed. Default will keep as what was used in
  text area component

## Value

no value returned. Updates the word count in a shiny app

## Examples

``` r
if (interactive()) {

  ui <- shiny::fluidPage(
  shinyjs::useShinyjs(),
  shinyGovBRstyle::header(
    "Justice", "", logo="shinyGovBRstyle/images/dev_logo.png"),
  gov_layout(size = "full",
           text_area_Input(
             inputId = "text_area",
             label = "Can you provide more detail?",
             hint_label =  "Do not include personal or financial information
                            , like your National Insurance number or credit
                            card details.",
             word_limit = 300)
  ),
  footer(TRUE)
  )

  server <- function(input, output, session) {
  shiny::observeEvent(input$text_area,
               word_count(inputId = "text_area",
                          input = input$text_area
               )
  )
  }
  shinyApp(ui = ui, server = server)
}
```
