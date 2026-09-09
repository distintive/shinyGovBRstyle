#' Attach GovBR Design System dependencies
#'
#' Adds the official GovBR Design System assets (CSS, JavaScript, Rawline
#' font and Font Awesome) to a tag. Every \code{br_*} component calls this
#' internally, so using it explicitly is only needed for pages built
#' exclusively with other tags.
#'
#' @param tag A tag to attach the dependencies to.
#' @return The tag with the GovBR dependencies attached (invisibly for
#'   \code{use_govbr()}).
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_button("btn", "Clique aqui")
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui, server)
#' }
use_govbr <- function(tag = shiny::tags$div()) {
  htmltools::attachDependencies(
    tag,
    c(govbr_css_dependency(), list(govbr_js_dependency()))
  )
}

#' @noRd
#' @importFrom utils packageVersion
govbr_css_dependency <- function() {
  version <- as.character(packageVersion("shinyGovBRstyle"))
  list(
    htmltools::htmlDependency(
      name = "govbr-rawline",
      version = version,
      src = c(href = "shinyGovBRstyle/govbr"),
      stylesheet = "rawline.css"
    ),
    htmltools::htmlDependency(
      name = "font-awesome",
      version = "5.11.2",
      src = c(href = "shinyGovBRstyle/fontawesome"),
      stylesheet = "css/all.min.css"
    ),
    htmltools::htmlDependency(
      name = "govbr-core-css",
      version = "3.7.0",
      src = c(href = "shinyGovBRstyle/govbr"),
      stylesheet = c("core.min.css", "govbr-compat.css")
    )
  )
}

#' @noRd
govbr_js_dependency <- function() {
  htmltools::htmlDependency(
    name = "govbr-core-js",
    version = "3.7.0",
    src = c(href = "shinyGovBRstyle/govbr"),
    script = c("core.min.js", "govbr-shiny.js", "govbr-page-title.js")
  )
}
