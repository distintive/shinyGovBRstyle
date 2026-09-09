#' GovBR accordion
#'
#' Creates a \code{br-accordion} of expandable items. Requires the GovBR
#' JavaScript (initialised automatically by \code{use_govbr()}).
#'
#' @param inputId Id for the accordion container.
#' @param items Named list. Names become the item titles and values the
#'   item contents (can be any Shiny UI element).
#' @param single If \code{TRUE}, only one item can be open at a time.
#'
#' @return A \code{shiny.tag} with the accordion markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_accordion(
#'         inputId = "faq",
#'         items = list(
#'           "Assuntos" = shiny::p("Conte\u00fado de assuntos."),
#'           "Servi\u00e7os" = shiny::p("Conte\u00fado de servi\u00e7os.")
#'         )
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_accordion <- function(inputId, items, single = FALSE) {

  accordion_tag <- shiny::tags$div(
    class = "br-accordion",
    id = inputId,
    `data-single` = if (single) "data-single",
    purrr::imap(items, function(content, title) {
      content_id <- paste0(inputId, "-", govbr_slugify(title))
      list(
        shiny::tags$div(
          class = "item",
          shiny::tags$button(
            class = "header",
            type = "button",
            `aria-controls` = content_id,
            shiny::tags$span(
              class = "icon",
              shiny::tags$i(class = "fas fa-angle-down", `aria-hidden` = "true")
            ),
            shiny::tags$span(class = "title", title)
          )
        ),
        shiny::tags$div(class = "content", id = content_id, content)
      )
    })
  )

  use_govbr(accordion_tag)
}

#' @noRd
govbr_slugify <- function(x) {
  x <- tolower(as.character(x))
  x <- gsub("[^a-z0-9]+", "-", x)
  gsub("^-+|-+$", "", x)
}
