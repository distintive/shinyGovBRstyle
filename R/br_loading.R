#' GovBR loading indicator
#'
#' Creates a \code{br-loading} spinner or progress bar.
#'
#' @param size Spinner size: \code{"medium"} (default), \code{"small"} or
#'   \code{"large"}.
#' @param progress Optional numeric value between 0 and 100. When
#'   supplied, renders a progress bar instead of a spinner.
#' @param label Accessible label for screen readers.
#'
#' @return A \code{shiny.tag} with the loading markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_loading(),
#'       shinyGovBRstyle::br_loading(progress = 75)
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_loading <- function(size = c("medium", "small", "large"),
                       progress = NULL,
                       label = "Carregando") {
  size <- match.arg(size)

  if (!is.null(progress)) {
    progress <- round(progress)
    if (progress < 0 || progress > 100) {
      stop("`progress` must be between 0 and 100.", call. = FALSE)
    }
    loading_tag <- shiny::tags$div(
      class = "br-loading",
      role = "progressbar",
      `data-progress` = as.character(progress),
      `aria-label` = label,
      `aria-valuemin` = "0",
      `aria-valuenow` = as.character(progress),
      `aria-valuemax` = "100",
      shiny::tags$div(
        class = "br-loading-mask full",
        shiny::tags$div(class = "br-loading-fill")
      ),
      shiny::tags$div(
        class = "br-loading-mask",
        shiny::tags$div(class = "br-loading-fill")
      )
    )
  } else {
    loading_tag <- shiny::tags$div(
      class = paste("br-loading", size),
      role = "progressbar",
      `aria-label` = label
    )
  }

  use_govbr(loading_tag)
}
