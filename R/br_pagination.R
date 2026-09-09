#' GovBR pagination
#'
#' Creates a \code{br-pagination} control. \code{input$<inputId>} returns
#' the current page number.
#'
#' @param inputId The input slot that will be used to access the page
#'   number.
#' @param total Total number of pages.
#' @param current Initially selected page (1-based).
#'
#' @return A \code{shiny.tag} with the pagination markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shiny::uiOutput("pagina"),
#'       shiny::verbatimTextOutput("valor")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     output$pagina <- shiny::renderUI(
#'       shinyGovBRstyle::br_pagination("pag", total = 5,
#'                                     current = input$pag %||% 1)
#'     )
#'     output$valor <- shiny::renderPrint(input$pag)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_pagination <- function(inputId, total, current = 1) {
  if (length(total) != 1 || is.na(total) || total < 1) {
    stop("`total` must be a single number >= 1.", call. = FALSE)
  }
  total <- as.integer(total)
  current <- max(1L, min(as.integer(current), total))

  pagination_tag <- shiny::tags$nav(
    class = "br-pagination",
    `aria-label` = "pagina\u00e7\u00e3o",
    `data-total` = as.character(total),
    `data-current` = as.character(current),
    `data-govbr-pagination` = inputId,
    id = inputId,
    shiny::tags$ul(
      shiny::tags$li(
        shiny::tags$button(
          class = "br-button circle",
          type = "button",
          `data-previous-page` = "data-previous-page",
          `aria-label` = "Voltar p\u00e1gina",
          shiny::tags$i(class = "fas fa-angle-left", `aria-hidden` = "true")
        )
      ),
      purrr::map(seq_len(total), function(page) {
        shiny::tags$li(
          shiny::tags$a(
            class = paste(c("page", if (page == current) "active"), collapse = " "),
            `aria-label` = paste("P\u00e1gina", page),
            href = "javascript:void(0)",
            as.character(page)
          )
        )
      }),
      shiny::tags$li(
        shiny::tags$button(
          class = "br-button circle",
          type = "button",
          `data-next-page` = "data-next-page",
          `aria-label` = "P\u00e1gina seguinte",
          shiny::tags$i(class = "fas fa-angle-right", `aria-hidden` = "true")
        )
      )
    )
  )

  use_govbr(pagination_tag)
}
