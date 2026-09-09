#' GovBR upload input
#'
#' Creates a \code{br-upload} file field. \code{input$<inputId>} works
#' like a standard Shiny file input (a data frame of uploaded files). The
#' GovBR JavaScript displays the list of selected files.
#'
#' @param inputId The input slot that will be used to access the uploaded
#'   files.
#' @param label Field label.
#' @param multiple Whether multiple files can be selected.
#' @param accept Optional character vector of accepted MIME types or
#'   extensions.
#' @param disabled If \code{TRUE}, disables the input.
#'
#' @return A \code{shiny.tag} with the upload markup and GovBR
#'   dependencies attached.
#' @export
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_layout(
#'       shinyGovBRstyle::br_upload(
#'         inputId = "arquivo",
#'         label = "Envio de arquivo"
#'       ),
#'       shiny::verbatimTextOutput("valor")
#'     )
#'   )
#'   server <- function(input, output, session) {
#'     output$valor <- shiny::renderPrint(input$arquivo$name)
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
br_upload <- function(inputId,
                      label,
                      multiple = FALSE,
                      accept = NULL,
                      disabled = FALSE) {

  upload_tag <- shiny::tags$div(
    class = "br-upload",
    shiny::tags$label(
      class = "upload-label",
      `for` = inputId,
      shiny::tags$span(label)
    ),
    shiny::tags$input(
      class = "upload-input",
      id = inputId,
      name = inputId,
      type = "file",
      `aria-label` = "enviar arquivo",
      multiple = if (multiple) NA,
      accept = if (!is.null(accept)) paste(accept, collapse = ","),
      disabled = if (isTRUE(disabled)) NA
    ),
    shiny::tags$div(class = "upload-list")
  )

  use_govbr(upload_tag)
}
