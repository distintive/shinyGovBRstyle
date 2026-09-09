#' GovBR tooltip
#'
#' Wraps a UI element with a \code{br-tooltip}. Requires the GovBR
#' JavaScript (initialised automatically by \code{use_govbr()}).
#'
#' @param ... The trigger element (e.g. a \code{br_button()}).
#' @param text Tooltip main text.
#' @param subtext Optional tooltip secondary text.
#' @param place Placement relative to the trigger: \code{"top"},
#'   \code{"bottom"}, \code{"left"} (default) or \code{"right"}.
#' @param type Tooltip type: \code{"info"} (default), \code{"success"},
#'   \code{"warning"} or \code{"error"}.
#'
#' @return A \code{shiny.tag} wrapping the element with the tooltip markup
#'   and GovBR dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_tooltip(
#'         shinyGovBRstyle::br_button("btn", "Ajuda"),
#'         text = "Texto de ajuda",
#'         subtext = "Informa\u00e7\u00f5es adicionais",
#'         place = "bottom"
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_tooltip <- function(...,
                       text,
                       subtext = NULL,
                       place = c("left", "top", "bottom", "right"),
                       type = c("info", "success", "warning", "error")) {
  place <- match.arg(place)
  type <- match.arg(type)

  tooltip_tag <- shiny::tags$div(
    class = "mb-3 d-inline-block",
    ...,
    shiny::tags$div(
      class = "br-tooltip",
      role = "tooltip",
      info = "info",
      place = place,
      success = if (type == "success") "success",
      warning = if (type == "warning") "warning",
      error = if (type == "error") "error",
      shiny::tags$span(class = "text", role = "tooltip", text),
      if (!is.null(subtext)) {
        shiny::tags$span(class = "subtext", subtext)
      }
    )
  )

  use_govbr(tooltip_tag)
}
