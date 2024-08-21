#' Table Function
#'
#' This function inserts a gov styled table.  Format is with header looking
#' rows and columns
#' @param inputId Input id for the table
#' @param df expects a dataframe to create a table
#' @param caption adds a caption to the table as a header
#' @param caption_size adjust the size of caption.  Options are s, m, l, xl,
#' with l as the default
#' @param num_col adds numeric class format to these columns.
#' @param width_overwrite change width.  Need to include width for every column.
#' Options are three-quarters, two-thirds, one-half, one-third, one-quarter.
#' Default is \code{NULL}.
#' @return an table html shiny object
#' @keywords table
#' @export
#' @examples
#' if (interactive()) {
#'
#'   Months <- c("January", "February", "March")
#'   Bikes <- c("£85", "£75", "£165")
#'   Cars <- c("£95", "£55", "£125")
#'
#'   example_data <- data.frame(Months, Bikes, Cars)
#'
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service'),
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'     shinyGovBRstyle::govTable(
#'       "tab1", example_data, "Test", "l", num_col = c(2,3),
#'       width_overwrite = c("one-half", "one-quarter", "one-quarter"))
#'     ),
#'
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

govTable <- function(inputId, df, caption, caption_size = "l",
                     num_col = NULL, width_overwrite = NULL){

  #Create row by row the main bulk of table to insert later
  main_row_store <- NULL
  for(i in 1:nrow(df)) {
    temp_row_store <- createRows(df[i,], num_col)
    main_row_store <- shiny::tagList(temp_row_store, main_row_store)
  }

  #Create the actual table
  gov_table <- shiny::tags$table(
    id = inputId,
    class = "govbr-table",
    shiny::tags$caption(
      class = paste0(
        "govbr-table__caption govbr-table__caption--", caption_size),
      caption
    ),
    shiny::tags$thead(
      class = "govbr-table__head",
      shiny::tags$tr(
        class = "govbr-table__row",
        Map(function(x) {
          shiny::tags$th(scope = "col", class = "govbr-table__header", x)
        }, x = colnames(df))
      )
    ),
    shiny::tags$tbody(
      class = "govbr-table__body",
      main_row_store
    )
  )

  #Change class of headers to numeric if requested
  for(i in num_col) {
    if (i != 1) {
      gov_table$children[[2]]$children[[1]][[3]][[1]][[i]]$attribs$class <-
        "govbr-table__header govbr-table__header--numeric"
    }
  }

  #Change width of columns if requested
  for(i in 1:length(width_overwrite)) {
      gov_table$children[[2]]$children[[1]][[3]][[1]][[i]]$attribs$class <-
        paste0(
          gov_table$children[[2]]$children[[1]][[3]][[1]][[i]]$attribs$class,
          " govbr-!-width-", width_overwrite[i])
  }

  return(gov_table)
}


createRows <- function(df_row, num_col = NULL) {
  rowHTML <- shiny::tags$tr(
    class = "govbr-table__row",
    shiny::tags$th(scope="row", class="govbr-table__header", df_row[1,1]),
    Map(function(x) {
      shiny::tags$td(class = "govbr-table__cell", x)
    }, df_row[1,-1])
  )
  #Not sure I can think of better way to add numeric class then do it post
  #creating the table rows
  for(i in num_col) {
    if (i != 1) {
      rowHTML$children[[2]][[i-1]]$attribs$class <-
        "govbr-table__cell govbr-table__cell--numeric"
    }
  }
  return(rowHTML)
}
