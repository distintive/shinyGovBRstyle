#' GovBR table
#'
#' Creates a \code{br-table} from a data frame or matrix. Column names
#' become the table headers.
#'
#' @param data A \code{data.frame} or \code{matrix}.
#' @param caption Optional table caption.
#' @param ... Additional UI elements to place inside the table wrapper
#'   (e.g. toolbar buttons).
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
#'         caption = "Tabela de carros"
#'       )
#'     )
#'   )
#'   server <- function(input, output, session) {}
#'   shinyApp(ui = ui, server = server)
#' }
br_table <- function(data, caption = NULL, ...) {

  if (is.data.frame(data)) {
    headers <- colnames(data)
    cells <- unname(lapply(seq_len(nrow(data)), function(i) as.character(data[i, ])))
  } else if (is.matrix(data)) {
    headers <- colnames(data)
    if (is.null(headers)) headers <- paste0("V", seq_len(ncol(data)))
    cells <- unname(lapply(seq_len(nrow(data)), function(i) as.character(data[i, ])))
  } else {
    stop("`data` must be a data.frame or matrix.", call. = FALSE)
  }
  cells[is.na(cells)] <- ""

  table_tag <- shiny::tags$div(
    class = "br-table",
    ...,
    shiny::tags$table(
      class = "table",
      if (!is.null(caption)) {
        shiny::tags$caption(caption)
      },
      shiny::tags$thead(
        shiny::tags$tr(
          purrr::map(headers, shiny::tags$th, scope = "col")
        )
      ),
      shiny::tags$tbody(
        purrr::map(cells, function(row) {
          shiny::tags$tr(purrr::map(row, shiny::tags$td))
        })
      )
    )
  )

  use_govbr(table_tag)
}
