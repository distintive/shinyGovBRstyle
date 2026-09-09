# Footer Function

This function create a gov style footer for your page

## Usage

``` r
footer(full = FALSE, links = NULL)
```

## Arguments

- full:

  Whenever you want to have blank footer or official gov version.
  Defaults to `FALSE`

- links:

  A vector of actionLinks to be added to the footer, inputIDs are
  auto-generated and are the snake case version of the link text, e.g.
  "Accessibility Statement" will have an inputID of
  accessibility_statement

## Value

a footer html shiny object

## Details

You can add actionLinks as links in the footer through using the
links_list argument.

Links in the footer should be used sparingly and are usually for
supporting information pages such as the accessibility statement,
privacy notice, cookies information or link to a statement of voluntary
adoption of the statistics code of practice.

Generally when using footer links you will be controlling a hidden
tabset so to the end user it looks like it is a new page.

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
      logo="shinyGovBRstyle/images/govbr-logo.png"),
    tags$br(),
    tags$br(),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}

# Add links
footer(links = c("Accessibility statement", "Cookies"))
#> Warning: 'footer()' is deprecated as of shinyGovBRstyle 0.2.0.
#> <footer class="govbr-footer " role="contentinfo">
#>   <div class="govbr-width-container ">
#>     <div class="govbr-footer__meta">
#>       <div class="govbr-footer__meta-item govbr-footer__meta-item--grow">
#>         <div>
#>           <h2 class="govbr-visually-hidden">Support links</h2>
#>           <ul class="govbr-footer__inline-list">
#>             <li class="govbr-footer__inline-list-item">
#>               <a class="action-button action-link govbr-link govbr-footer__link" href="#" id="accessibility_statement"><span class="action-label">Accessibility statement</span></a>
#>             </li>
#>             <li class="govbr-footer__inline-list-item">
#>               <a class="action-button action-link govbr-link govbr-footer__link" href="#" id="cookies"><span class="action-label">Cookies</span></a>
#>             </li>
#>           </ul>
#>         </div>
#>       </div>
#>     </div>
#>   </div>
#> </footer>

# Full app with link controlling a hidden tab
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo = "shinyGovBRstyle/images/govbr-logo.png"
    ),
    shiny::tabsetPanel(
      type = "hidden",
      id = "tabs",
      shiny::tabPanel(
        "Main content",
        value = "main",
        heading_text("Hello world!")
      ),
      shiny::tabPanel(
        "Cookies",
        value = "cookies",
        heading_text("Cookies")
      )
    ),
    shinyGovBRstyle::footer(
      full = TRUE,
      links = c("Accessibility statement", "Cookies")
    )
  )

  server <- function(input, output, session) {
    shiny::observeEvent(input$cookies, {
      shiny::updateTabsetPanel(session, "tabs", selected = "cookies")
    })
  }

  shinyApp(ui = ui, server = server)
}
```
