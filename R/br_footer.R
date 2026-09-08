#' GovBR footer
#'
#' Creates a \code{br-footer}, the official GovBR page footer.
#'
#' @param categories Optional named list of link categories. Each element
#'   is a character vector of link labels (links point to \code{"#"}). When
#'   \code{NULL} (default) only the logo and licence text are shown.
#' @param logo Path or URL for the footer logo. Use \code{"govbr"} for the
#'   logo bundled with the package.
#' @param logo_alt Alternative text for the logo.
#' @param licence_text Text shown in the licence information area.
#'
#' @return A \code{shiny.tag} with the footer markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovBRstyle::br_layout(shiny::h1("Conte\u00fado")),
#'     shinyGovBRstyle::br_footer(
#'       categories = list("Categoria" = c("Link 1", "Link 2"))
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_footer <- function(categories = NULL,
                      logo = "govbr",
                      logo_alt = "Logotipo",
                      licence_text = NULL) {

  if (!is.null(logo) && logo == "govbr") {
    logo_src <- "shinyGovBRstyle/images/govbr-logo.png"
  } else {
    logo_src <- logo
  }

  categories_tag <- NULL
  if (!is.null(categories) && length(categories) > 0) {
    categories_tag <- shiny::tags$div(
      class = "br-list horizontal",
      `data-toggle` = "data-toggle",
      `data-sub` = "data-sub",
      purrr::map2(
        names(categories), categories,
        function(category_name, links) {
          shiny::tags$div(
            class = "col-2",
            shiny::tags$a(
              class = "br-item header", href = "#",
              shiny::tags$div(
                class = "content text-down-01 text-bold text-uppercase",
                category_name
              ),
              shiny::tags$div(
                class = "support",
                shiny::tags$i(
                  class = "fas fa-angle-down", `aria-hidden` = "true"
                )
              )
            ),
            shiny::tags$div(
              class = "br-list",
              shiny::tags$span(class = "br-divider d-md-none"),
              purrr::map(links, function(link) {
                shiny::tags$a(
                  class = "br-item", href = "#",
                  shiny::tags$div(class = "content", link)
                )
              })
            )
          )
        }
      )
    )
  }

  footer_tag <- shiny::tags$footer(
    id = "footer",
    class = "br-footer",
    shiny::tags$div(
      class = "container-lg",
      if (!is.null(logo_src)) {
        shiny::tags$div(
          class = "logo",
          shiny::tags$img(src = logo_src, alt = logo_alt)
        )
      },
      categories_tag
    ),
    shiny::tags$span(class = "br-divider my-3"),
    shiny::tags$div(
      class = "container-lg",
      shiny::tags$div(
        class = "info",
        shiny::tags$div(
          class = "text-down-01 text-medium pb-3",
          licence_text %||%
            paste0("Texto destinado a exibi\u00e7\u00e3o de informa\u00e7\u00f5es
                   relacionadas \u00e0 licen\u00e7a de uso.")
        )
      )
    )
  )

  use_govbr(footer_tag)
}

`%||%` <- function(x, y) if (is.null(x)) y else x
