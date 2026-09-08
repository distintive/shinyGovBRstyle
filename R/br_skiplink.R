#' GovBR skip link
#'
#' Creates a \code{br-skiplink} accessibility navigation bar. Links become
#' visible when the user presses the Tab key.
#'
#' @param links Named character vector of link destinations and labels,
#'   e.g. \code{c("main-content" = "Ir para o conteúdo")}. Names must match
#'   element ids in the page (built-in ids: \code{main-content} is created
#'   by \code{br_layout()}, \code{footer} by \code{br_footer()}).
#'
#' @return A \code{shiny.tag} with the skip link markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovBRstyle::br_skiplink(
#'       c("main-content" = "Ir para o conteúdo", "footer" = "Ir para o rodapé")
#'     ),
#'     shinyGovBRstyle::br_header(title = "Título"),
#'     shinyGovBRstyle::br_layout(shiny::h1("Conteúdo")),
#'     shinyGovBRstyle::br_footer()
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_skiplink <- function(links) {

  skiplink_el <- shiny::tags$nav(
    class = "br-skiplink",
    role = "menubar",
    purrr::imap(links, function(label, target) {
      shiny::tags$a(
        class = "br-item",
        href = paste0("#", target),
        role = "menuitem",
        label
      )
    })
  )

  use_govbr(skiplink_el)
}
