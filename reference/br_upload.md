# GovBR upload input

Creates a `br-upload` file field. `input$<inputId>` works like a
standard Shiny file input (a data frame of uploaded files). The GovBR
JavaScript displays the list of selected files.

## Usage

``` r
br_upload(inputId, label, multiple = FALSE, accept = NULL, disabled = FALSE)
```

## Arguments

- inputId:

  The input slot that will be used to access the uploaded files.

- label:

  Field label.

- multiple:

  Whether multiple files can be selected.

- accept:

  Optional character vector of accepted MIME types or extensions.

- disabled:

  If `TRUE`, disables the input.

## Value

A `shiny.tag` with the upload markup and GovBR dependencies attached.

## Examples

``` r
if (interactive()) {
  ui <- shiny::fluidPage(
    use_govbr(),
    shinyGovBRstyle::br_layout(
      shinyGovBRstyle::br_upload(
        inputId = "arquivo",
        label = "Envio de arquivo"
      ),
      shiny::verbatimTextOutput("valor")
    )
  )
  server <- function(input, output, session) {
    output$valor <- shiny::renderPrint(input$arquivo$name)
  }
  shinyApp(ui = ui, server = server)
}
```
