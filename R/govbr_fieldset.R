#' Fieldset/legend wrapper for group inputs
#'
#' Wraps radio/checkbox groups in a semantic \code{fieldset} with a
#' \code{legend}, which is announced as a group label by screen readers
#' (idea ported from upstream shinyGovstyle PR #225). The container keeps
#' the native Shiny group binding class and the input id.
#'
#' @param inputId The input id (also used for the hint association).
#' @param group_class Native Shiny binding class for the group container.
#' @param label Group label shown in the legend.
#' @param hint Optional hint text associated via aria-describedby.
#' @param heading_level Optional HTML heading level ("2"-"6") wrapped
#'   inside the legend.
#' @param options UI elements for the options themselves.
#'
#' @noRd
govbr_fieldset <- function(inputId,
                           group_class,
                           label,
                           hint = NULL,
                           heading_level = NULL,
                           options = NULL) {

  if (!is.null(heading_level)) {
    heading_level <- match.arg(as.character(heading_level),
                               c("2", "3", "4", "5", "6"))
    legend_content <- shiny::tags[[paste0("h", heading_level)]](
      class = "label mb-0", label
    )
  } else {
    legend_content <- label
  }

  shiny::tags$fieldset(
    class = paste("br-fieldset", group_class),
    id = inputId,
    shiny::tags$legend(class = "label mb-0", legend_content),
    if (!is.null(hint)) {
      shiny::tags$p(id = paste0(inputId, "-hint"), class = "help-text", hint)
    },
    options
  )
}
