#' GovBR table
#'
#' Creates a \code{br-table} from a data frame or matrix, following the
#' official GovBR table markup: a header area with the table title and a
#' plain table whose cells carry \code{data-th} attributes (used by the
#' responsive/collapse behaviour).
#'
#' @param data A \code{data.frame} or \code{matrix}.
#' @param title Table title shown in the table header bar.
#' @param ... Additional UI elements to place inside the table wrapper.
#'
#' @return A \code{shiny.tag} with the table markup and GovBR dependencies
#'   attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_table(
#'         data = mtcars[1:5, ],
#'         title = "Tabela de carros"
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_table <- function(data, title = NULL, ...) {

  if (is.data.frame(data)) {
    headers <- colnames(data)
    rows <- unname(lapply(seq_len(nrow(data)), function(i) data[i, ]))
  } else if (is.matrix(data)) {
    headers <- colnames(data)
    if (is.null(headers)) headers <- paste0("V", seq_len(ncol(data)))
    rows <- unname(lapply(seq_len(nrow(data)), function(i) data[i, ]))
  } else {
    stop("`data` must be a data.frame or matrix.", call. = FALSE)
  }

  table_tag <- shiny::tags$div(
    class = "br-table",
    ...,
    if (!is.null(title)) {
      shiny::tags$div(
        class = "table-header",
        shiny::tags$div(
          class = "top-bar",
          shiny::tags$div(class = "table-title", title)
        )
      )
    },
    shiny::tags$table(
      if (!is.null(title)) shiny::tags$caption(title),
      shiny::tags$thead(
        shiny::tags$tr(
          purrr::map(headers, function(h) {
            shiny::tags$th(scope = "col", h)
          })
        )
      ),
      shiny::tags$tbody(
        purrr::map(rows, function(row) {
          cells <- purrr::map2(row, headers, function(value, header) {
            as_cell <- if (is.na(value)) "" else as.character(value)
            shiny::tags$td(`data-th` = header, as_cell)
          })
          shiny::tags$tr(cells)
        })
      )
    )
  )

  use_govbr(table_tag)
}
