#' GovBR page layout container
#'
#' Wraps page content in one of the GovBR grid containers
#' (\code{container-lg}, \code{container-md}, \code{container-sm} or
#' \code{container-fluid}).
#'
#' @param ... UI elements to place inside the container.
#' @param size One of \code{"large"} (default), \code{"medium"},
#'   \code{"small"} or \code{"fluid"}.
#'
#' @return A \code{shiny.tag} with the container markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovBRstyle::br_header(title = "Título"),
#'     shinyGovBRstyle::br_layout(
#'       shiny::h1("Conteúdo"),
#'       shinyGovBRstyle::br_button("btn", "Enviar")
#'     ),
#'     shinyGovBRstyle::br_footer()
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_layout <- function(..., size = c("large", "medium", "small", "fluid")) {
  size <- match.arg(size)
  container_class <- switch(size,
    large = "container-lg",
    medium = "container-md",
    small = "container-sm",
    fluid = "container-fluid"
  )

  layout_tag <- shiny::tags$main(
    id = "main-content",
    class = container_class,
    ...
  )

  use_govbr(layout_tag)
}
