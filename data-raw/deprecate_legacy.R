## Insert govbr_deprecated() call at the start of every legacy
## component function body, and a roxygen deprecation note.

files <- list.files("R", pattern = "\\.R$", full.names = TRUE)
files <- files[!grepl("br_|use_govbr|govbr_deprecated|zzz|utils-pipe|attachDependency|data-|run_example", basename(files))]

for (file in files) {
  lines <- readLines(file, warn = FALSE)

  # find the first top-level "<- function" definition
  fn_start <- grep("^[A-Za-z._][A-Za-z0-9._]* <- function\\(", lines)[1]
  if (is.na(fn_start)) next
  fn_name <- sub("\\s*<- function\\(.*", "", lines[fn_start])

  # function name must look like a component (not a helper)
  # find the opening brace line of the body
  body_start <- fn_start
  while (!grepl("\\{\\s*$", lines[body_start])) {
    body_start <- body_start + 1
    if (body_start > length(lines)) break
  }
  if (body_start > length(lines)) next

  already <- grepl("govbr_deprecated", paste(lines, collapse = ""))
  if (already) next

  # roxygen note after the #' @export line, if present
  export_line <- grep("^#' @export$", lines)[1]
  if (!is.na(export_line)) {
    lines <- append(
      lines,
      c(
        "#' @section Deprecated:",
        "#' Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards",
        "#' compatibility and scheduled for removal. See the `br_*` family."
      ),
      after = export_line
    )
    body_start <- body_start + 3
  }

  indent <- "  "
  lines <- append(
    lines,
    paste0(indent, "govbr_deprecated(\"", fn_name, "\")"),
    after = body_start
  )

  writeLines(lines, file)
  cat("patched:", basename(file), "->", fn_name, "\n")
}
