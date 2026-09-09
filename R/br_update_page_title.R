#' Update the browser tab title
#'
#' Changes the browser tab title from server code, optionally composing it
#' with a service name (e.g. \code{"Relat\u00f3rio | Meu Sistema"}).
#' Requires the GovBR dependencies (\code{use_govbr()} or any
#' \code{br_*} component).
#'
#' @param page_title New page title (single non-empty string).
#' @param service_name Optional service name appended after the title,
#'   separated by \code{" | "}.
#' @param session The shiny session object (defaults to the current one).
#'
#' @return Invisible \code{NULL}, called for its side effect.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_button("rel", "Gerar relat\u00f3rio")
#'   )
#'   server <- function(input, output, session) {
#'     shiny::observeEvent(input$rel, {
#'       shinyGovBRstyle::br_update_page_title(
#'         page_title = "Relat\u00f3rio gerado",
#'         service_name = "Meu Sistema"
#'       )
#'     })
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_update_page_title <- function(page_title,
                                 service_name = NULL,
                                 session = shiny::getDefaultReactiveDomain()) {
  if (!is.character(page_title) || length(page_title) != 1 || !nzchar(page_title)) {
    stop("`page_title` must be a single non-empty string.", call. = FALSE)
  }

  title <- if (is.null(service_name) || !nzchar(service_name)) {
    page_title
  } else {
    paste(page_title, service_name, sep = " | ")
  }

  session$sendCustomMessage("govbrUpdatePageTitle", title)
  invisible(NULL)
}
