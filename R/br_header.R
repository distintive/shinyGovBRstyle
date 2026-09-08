#' GovBR header
#'
#' Creates a \code{br-header}, the official GovBR page header with logo,
#' signature, title, subtitle and an optional search box.
#'
#' @param title Main title displayed in the header.
#' @param subtitle Subtitle displayed below the title.
#' @param signature Organisation signature shown next to the logo.
#' @param logo Path or URL for the logo image. Use \code{"govbr"} for the
#'   official GovBR logo bundled with the package.
#' @param logo_alt Alternative text for the logo (recommended).
#' @param search_id Input id for the optional search box. When \code{NULL}
#'   (default) no search box is shown.
#' @param ... Named attributes passed to the header tag.
#'
#' @return A \code{shiny.tag} with the header markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     shinyGovBRstyle::br_header(
#'       title = "Meu Sistema",
#'       subtitle = "Prot\u00f3tipo",
#'       signature = "Minist\u00e9rio",
#'       logo = "govbr",
#'       logo_alt = "Logo do GovBR"
#'     ),
#'     shinyGovBRstyle::br_layout(
#'       shiny::h1("Conte\u00fado")
#'     ),
#'     shinyGovBRstyle::br_footer()
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_header <- function(title,
                      subtitle = NULL,
                      signature = "GovBR",
                      logo = "govbr",
                      logo_alt = "Logotipo",
                      search_id = NULL,
                      ...) {

  if (!is.null(logo) && logo == "govbr") {
    logo_src <- "shinyGovBRstyle/images/govbr-logo.png"
  } else {
    logo_src <- logo
  }

  search_box <- NULL
  if (!is.null(search_id)) {
    search_box <- shiny::tags$div(
      class = "header-search",
      shiny::tags$div(
        class = "br-input has-icon",
        shiny::tags$label(`for` = search_id, "Texto da pesquisa"),
        shiny::tags$input(
          id = search_id,
          type = "text",
          placeholder = "O que voc\u00ea procura?"
        ),
        shiny::tags$button(
          class = "br-button circle small", type = "button",
          `aria-label` = "Pesquisar",
          shiny::tags$i(class = "fas fa-search", `aria-hidden` = "true")
        )
      ),
      shiny::tags$button(
        class = "br-button circle search-close ml-1", type = "button",
        `aria-label` = "Fechar busca", `data-dismiss` = "search",
        shiny::tags$i(class = "fas fa-times", `aria-hidden` = "true")
      )
    )
  }

  header_tag <- shiny::tags$header(
    class = "br-header",
    ...,
    shiny::tags$div(
      class = "container-lg",
      shiny::tags$div(
        class = "header-top",
        shiny::tags$div(
          class = "header-logo",
          if (!is.null(logo_src)) {
            shiny::tags$img(src = logo_src, alt = logo_alt)
          },
          shiny::tags$div(class = "header-sign", signature)
        )
      ),
      shiny::tags$div(
        class = "header-bottom",
        shiny::tags$div(
          class = "header-menu",
          shiny::tags$div(
            class = "header-info",
            shiny::tags$div(class = "header-title", title),
            if (!is.null(subtitle)) {
              shiny::tags$div(class = "header-subtitle", subtitle)
            }
          )
        ),
        search_box
      )
    )
  )

  use_govbr(header_tag)
}
