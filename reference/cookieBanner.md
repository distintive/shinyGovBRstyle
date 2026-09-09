# Cookie Banner Function

This function creates a cookie banner. You need to have
shinyjs::useShinyjs() enabled to work. All the ids are pre set. See
example for how to structure.

## Usage

``` r
cookieBanner(service_name)
```

## Arguments

- service_name:

  Name for this service to add to banner

## Value

a cookie banner html shiny object.

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
  #Needs shinyjs to work
  shinyjs::useShinyjs(),
  shinyGovBRstyle::cookieBanner("The best thing"),
  shinyGovBRstyle::gov_layout(size = "two-thirds"),
  shinyGovBRstyle::footer(full = TRUE)
)

server <- function(input, output, session) {

  #Need these set of observeEvent to create a path through the cookie banner
  observeEvent(input$cookieAccept, {
    shinyjs::show(id = "cookieAcceptDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$cookieReject, {
    shinyjs::show(id = "cookieRejectDiv")
    shinyjs::hide(id = "cookieMain")
  })

  observeEvent(input$hideAccept, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$hideReject, {
    shinyjs::toggle(id = "cookieDiv")
  })

  observeEvent(input$cookieLink, {
    #Need to link here to where further info is located.  You can use
    #updateTabsetPanel to have a cookie page for instance
  })

}
shinyApp(ui = ui, server = server)
}
```
