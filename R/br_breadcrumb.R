#' GovBR breadcrumb
#'
#' Creates a \code{br-breadcrumb} trail. The last link is rendered as the
#' current page.
#'
#' @param links Named character vector of link labels and destinations,
#'   e.g. \code{c("P\u00e1gina 1" = "pagina1.html", "Atual" = "#")}. The last
#'   element is marked as the current page.
#' @param home If \code{TRUE} (default), prepends a home link pointing to
#'   \code{home_href}.
#' @param home_href Destination of the home link.
#'
#' @return A \code{shiny.tag} with the breadcrumb markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_breadcrumb(
#'         c("Relat\u00f3rios" = "#", "Anual" = "#")
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_breadcrumb <- function(links, home = TRUE, home_href = "#") {

  home_crumb <- NULL
  if (home) {
    home_crumb <- shiny::tags$li(
      class = "crumb home",
      shiny::tags$a(
        class = "br-button circle",
        href = home_href,
        shiny::tags$span(class = "sr-only", "P\u00e1gina inicial"),
        shiny::tags$i(class = "fas fa-home", `aria-hidden` = "true")
      )
    )
  }

  n <- length(links)
  breadcrumb_tag <- shiny::tags$nav(
    class = "br-breadcrumb",
    `aria-label` = "Breadcrumbs",
    shiny::tags$ol(
      class = "crumb-list",
      role = "list",
      home_crumb,
      purrr::map(seq_along(links), function(i) {
        href <- links[[i]]
        link_name <- names(links)[[i]]
        label <- if (is.null(link_name) || link_name == "") href else link_name
        is_current <- i == n
        shiny::tags$li(
          class = "crumb",
          `data-active` = if (is_current) "active",
          shiny::tags$i(class = "icon fas fa-chevron-right", `aria-hidden` = "true"),
          if (is_current) {
            shiny::tags$span(tabindex = "0", `aria-current` = "page", label)
          } else {
            shiny::tags$a(href = href, label)
          }
        )
      })
    )
  )

  use_govbr(breadcrumb_tag)
}
