#' Page Layout Functions
#'
#' These function loads the page layout in a gov layout.  There is a selection
#' of components that can sit within each other.  The gov_main_layout is the
#' overarching layout.  The gov_row creates a each row and gov_box creates
#' a box within the row.  The gov_text is a container for text bodies.
#' @name layouts
#' @param inputID ID of the main div.  Defaults to "main"
#' @param size size of the box in the row.  Optional are full, one-half,
#' two-thirds, one-third and one-quarter.  Defaults to "full"
#' @param ... include the components of the UI that you want within the
#' main page.  These components are made to flow through each other.  See
#' example
#' @return a html shiny layout div
#' @keywords style
#' @examples
#' if (interactive()) {
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::gov_main_layout(
#'       shinyGovBRstyle::gov_row(
#'         shinyGovBRstyle::gov_box(
#'           size = "full",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-full")
#'         )
#'       ),
#'       shinyGovBRstyle::gov_row(
#'         shinyGovBRstyle::gov_box(
#'           size = "one-half",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-one-half")
#'         ),
#'         shinyGovBRstyle::gov_box(
#'           size = "one-half",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-one-half")
#'         )
#'       ),
#'       shinyGovBRstyle::gov_row(
#'         shinyGovBRstyle::gov_box(
#'           size = "one-third",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-one-third")
#'         ),
#'         shinyGovBRstyle::gov_box(
#'           size = "two-third",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-two-third")
#'         )
#'       ),
#'       shinyGovBRstyle::gov_row(
#'         shinyGovBRstyle::gov_box(
#'           size = "one-quarter",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-one-quarter")
#'         ),
#'         shinyGovBRstyle::gov_box(
#'           size = "three-quarters",
#'           shinyGovBRstyle::gov_text("govbr-grid-column-three-quarters")
#'         )
#'       )
#'     ),
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
NULL

#' @rdname layouts
#' @export
gov_main_layout <- function(..., inputID = "main") {
  govMain <- shiny::tags$div(
    id = inputID,
    class = "govbr-width-container",
    shiny::tags$main(
      class = "govbr-main-wrapper",
      ...
    )
  )
  attachDependency(govMain)
}

#' @rdname layouts
#' @export
gov_row <- function(...){
  govRow <- shiny::tags$div(
    class = "govbr-grid-row",
    ...
  )
  attachDependency(govRow)
}

#' @rdname layouts
#' @export
gov_box <- function(..., size = "full"){
  govBox <- shiny::tags$div(
    class = paste0("govbr-grid-column-", size),
    ...
  )
  attachDependency(govBox)
}

#' @rdname layouts
#' @export
gov_text <- function(...){
  govText <- shiny::tags$p(
    class = "govbr-body",
    ...
  )
}









