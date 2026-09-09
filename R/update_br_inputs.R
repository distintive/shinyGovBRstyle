#' Update GovBR inputs server-side
#'
#' Change the value (and label where supported) of GovBR inputs from the
#' server. Works by delegating to the native Shiny input bindings used by
#' the \code{br_*} components.
#'
#' @name update_br_inputs
NULL

#' @rdname update_br_inputs
#' @export
#' @param session The shiny session object (defaults to the current one).
#' @param inputId The id of the input to modify.
#' @param value New value.
#' @param placeholder New placeholder (\code{update_br_text_input()} only).
#' @examples
#' if (interactive()) {
#'   ui <- shiny::fluidPage(
#'     use_govbr(),
#'     shinyGovBRstyle::br_text_input("nome", "Nome"),
#'     shinyGovBRstyle::br_button("limpar", "Limpar")
#'   )
#'   server <- function(input, output, session) {
#'     shiny::observeEvent(input$limpar, {
#'       shinyGovBRstyle::update_br_text_input("nome", value = "")
#'     })
#'   }
#'   shinyApp(ui = ui, server = server)
#' }
update_br_text_input <- function(inputId,
                                 value = NULL,
                                 placeholder = NULL,
                                 session = shiny::getDefaultReactiveDomain()) {
  message <- list(value = value, placeholder = placeholder)
  session$sendInputMessage(inputId, message)
}

#' @rdname update_br_inputs
#' @export
update_br_textarea_input <- function(inputId,
                                     value = NULL,
                                     placeholder = NULL,
                                     session = shiny::getDefaultReactiveDomain()) {
  message <- list(value = value, placeholder = placeholder)
  session$sendInputMessage(inputId, message)
}

#' @rdname update_br_inputs
#' @export
#' @param selected New selected value (single inputs) or vector of values
#'   (group/select inputs).
update_br_radio_input <- function(inputId,
                                   selected = NULL,
                                   session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(inputId, list(selected = selected))
}

#' @rdname update_br_inputs
#' @export
update_br_checkbox_input <- function(inputId,
                                     selected = NULL,
                                     session = shiny::getDefaultReactiveDomain()) {
  if (is.logical(selected)) {
    session$sendInputMessage(inputId, list(value = selected))
  } else {
    session$sendInputMessage(inputId, list(selected = selected))
  }
}

#' @rdname update_br_inputs
#' @export
update_br_select_input <- function(inputId,
                                   selected = NULL,
                                   session = shiny::getDefaultReactiveDomain()) {
  update_br_radio_input(inputId, selected = selected, session = session)
}

#' @rdname update_br_inputs
#' @export
update_br_date_input <- function(inputId,
                                 value = NULL,
                                 session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(inputId, list(value = value))
}

#' @rdname update_br_inputs
#' @export
update_br_tabs <- function(inputId,
                           selected = NULL,
                           session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(inputId, list(selected = selected))
}

#' @rdname update_br_inputs
#' @export
update_br_pagination <- function(inputId,
                                 selected = NULL,
                                 session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(inputId, list(selected = selected))
}

#' @rdname update_br_inputs
#' @export
update_br_step <- function(inputId,
                           selected = NULL,
                           session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(inputId, list(selected = selected))
}
