#' Attach shinyGovBRstyle dependencies
#'
#' @param tag An object which has (or should have) HTML dependencies.
#' @param widget Name of a widget for particular dependencies
#'
#' @noRd
#' @importFrom utils packageVersion
#' @importFrom htmltools htmlDependency attachDependencies findDependencies

attachDependency <- function(tag, widget = NULL) {

  version <- as.character(packageVersion("shinyGovBRstyle")[[1]])

  dep <- htmltools::htmlDependency(
    name = "stylecss", version = version,
    src = c(href="shinyGovBRstyle/css"),
    stylesheet = "govbr-frontend-test.css"
  )

  if (!is.null(widget)) {
    if (widget == "radio") {
      dep <- list(
        dep,
        htmltools::htmlDependency(
          name = "radio_button_Input",
          version = version,
          src = c(href="shinyGovBRstyle/js"),
          script = "radio_button_input_binding.js"
        )
      )
    }
    else if (widget == "date") {
      dep <- list(
        dep,
        htmltools::htmlDependency(
          name = "date_Input",
          version = version,
          src = c(href="shinyGovBRstyle/js"),
          script = "date_input_binding.js"
        )
      )
    }
    else if (widget == "accordion") {
      dep <- list(
        dep,
        htmltools::htmlDependency(
          name = "accordion",
          version = version,
          src = c(href="shinyGovBRstyle/js"),
          script = "accordion.js"
        )
      )
    }
    else if (widget == "govTab") {
      dep <- list(
        dep,
        htmltools::htmlDependency(
          name = "govTab",
          version = version,
          src = c(href="shinyGovBRstyle/js"),
          script = "govTab.js"
        )
      )
    }

    }

  htmltools::attachDependencies(tag, dep, append = TRUE)
}
