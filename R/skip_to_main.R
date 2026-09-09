#' Skip to main content link
#'
#' This function generates an accessible 'Skip to main content' link, which is
#' typically used by keyboard-only users to bypass content and
#' navigate directly to the main content of a page.
#' Important: your main column will need an id of "main_col" for this to work
#' @return a skip button that skips to section with id of "main_col"
#' @export
#' @section Deprecated:
#' Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards
#' compatibility and scheduled for removal. See the `br_*` family.
#' @examples
#'  if (interactive()) {
#'   ui <- fluidPage(
#'     cookieBanner("Run Example"),
#'     skip_to_main(),
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"
#'     ),
#'     shinyjs::useShinyjs(),  # shinyjs is needed to manage visibility of elements
#'     gov_row(
#'     shiny::column(
#'     width = 3,
#'     id = "nav",
#'
#'    # Contents box
#'      shiny::tags$div(
#'        id = "govbr-contents-box", #DO NOT REMOVE ID
#'        class = "govbr-contents-box",  #DO NOT REMOVE CLASS
#'        shiny::tags$h2("Contents"),
#'        p("Your contents links go here"),
#'      )
#'     ),
#'
#'     shiny::column(
#'     width = 9,
#'     id = "main_col",
#'     shiny::tabsetPanel(
#'      type = "hidden",
#'      id = "tab-container", # DO NOT REMOVE ID
#'      shiny::tabPanel(
#'        "Your main content",
#'        value = "your_main_content",
#'          gov_layout(
#'            size = "two-thirds",
#'            heading_text("Your main content", size = "l"),
#'            heading_text("accordions", size = "s"),
#'            shinyGovBRstyle::  accordion(
#'              "acc1",
#'              c("Writing well for the web",
#'                "Writing well for specialists",
#'                "Know your audience",
#'                "How people read"
#'              ),
#'              c("This is the content for Writing well for the web.",
#'                "This is the content for Writing well for specialists.",
#'                "This is the content for Know your audience.",
#'                "This is the content for How people read."
#'              )),
#'
#'          )
#'        )
#'      )
#'    )
#'
#' )
#' )
#'   server <- function(input, output, session){
#'   }
#'   shinyApp(ui = ui, server = server)
#'
#' }
skip_to_main <- function(){
  govbr_deprecated("skip_to_main")
  shiny::tags$a(
    href = "#main_col",
    class = "govbr-skip govbr-link",
    "Skip to main content"
  )
}
