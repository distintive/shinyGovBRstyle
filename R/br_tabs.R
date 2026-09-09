#' GovBR tabs
#'
#' Creates a \code{br-tab} navigation with content panels. The GovBR
#' JavaScript handles switching panels; the first tab is active initially.
#' \code{input$<inputId>} returns the index (1-based) of the active tab;
#' use \code{update_br_tabs()} to change it from the server.
#'
#' @param inputId Id for the tab container.
#' @param titles Character vector of tab titles.
#' @param ... One UI element per tab, in the same order as
#'   \code{titles} (or pass a list of elements to \code{panels}).
#' @param panels Alternative to \code{...}: list of UI elements.
#' @param icons Optional character vector of Font Awesome icon classes,
#'   one per tab.
#'
#' @return A \code{shiny.tag} with the tab markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_tabs(
#'         inputId = "abas",
#'         titles = c("Dados", "Gr\u00e1ficos"),
#'         panels = list(
#'           shiny::p("Conte\u00fado dos dados."),
#'           shiny::p("Conte\u00fado dos gr\u00e1ficos.")
#'         )
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_tabs <- function(inputId,
                    titles,
                    ...,
                    panels = list(...),
                    icons = NULL) {

  if (length(panels) != length(titles)) {
    stop("`panels` must have the same length as `titles`.", call. = FALSE)
  }

  panel_ids <- paste0(inputId, "-panel-", seq_along(titles))

  tabs_tag <- shiny::tags$div(
    class = "br-tab",
    id = inputId,
    `data-govbr-tabs` = inputId,
    shiny::tags$nav(
      class = "tab-nav",
      shiny::tags$ul(
        purrr::imap(titles, function(title, i) {
          name_children <- if (!is.null(icons)) {
            list(
              shiny::tags$span(
                class = "icon mb-1 mb-sm-0 mr-sm-1",
                shiny::tags$i(class = icons[[i]], `aria-hidden` = "true")
              ),
              shiny::tags$span(class = "name", title)
            )
          } else {
            list(shiny::tags$span(class = "name", title))
          }
          shiny::tags$li(
            class = paste(c("tab-item", if (i == 1) "active"), collapse = " "),
            shiny::tags$button(
              type = "button",
              `data-panel` = panel_ids[[i]],
              shiny::tags$span(
                class = "name",
                shiny::tags$span(
                  class = "d-flex flex-column flex-sm-row",
                  name_children
                )
              )
            )
          )
        })
      )
    ),
    shiny::tags$div(
      class = "tab-content",
      purrr::imap(panels, function(panel, i) {
        shiny::tags$div(
          class = paste(c("tab-panel", if (i == 1) "active"), collapse = " "),
          id = panel_ids[[i]],
          panel
        )
      })
    )
  )

  use_govbr(tabs_tag)
}
