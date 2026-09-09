#' Warn about deprecated legacy components
#'
#' Emits a deprecation warning (once per function per session) pointing
#' users to the replacement in the \code{br_*} family. Called by every
#' legacy component derived from the original GOV.UK implementation.
#'
#' @param old Name of the deprecated function.
#' @param new Name of the suggested \code{br_*} replacement (optional).
#'
#' @noRd
govbr_deprecated <- function(old, new = NULL) {
  if (!exists(".warned", envir = govbr_deprecated_env, inherits = FALSE)) {
    assign(".warned", character(0), envir = govbr_deprecated_env)
  }
  if (old %in% get(".warned", envir = govbr_deprecated_env)) {
    return(invisible(NULL))
  }
  assign(".warned",
    unique(c(get(".warned", envir = govbr_deprecated_env), old)),
    envir = govbr_deprecated_env
  )

  replacement <- if (!missing(new) && !is.null(new)) {
    sprintf(" Use '%s()' instead.", new)
  } else {
    ""
  }
  warning(
    sprintf(
      "'%s()' is deprecated as of shinyGovBRstyle 0.2.0.%s",
      old, replacement
    ),
    call. = FALSE
  )
}

#' @noRd
govbr_deprecated_env <- new.env(parent = emptyenv())
