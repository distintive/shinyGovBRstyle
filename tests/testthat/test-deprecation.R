test_that("legacy components warn once per session", {
  govbr_deprecated_env$.warned <- character(0)

  expect_warning(button_Input("b", "x"), "deprecated")
  expect_no_warning(button_Input("b", "x"))

  # restaura o silenciamento para os demais arquivos de teste
  govbr_deprecated_env$.warned <- govbr_test_legacy_names
})

test_that("all legacy exports are deprecated", {
  pkg_root <- file.path("..", "..")
  ns_path <- file.path(pkg_root, "NAMESPACE")
  if (!file.exists(ns_path)) skip("NAMESPACE not available (installed package)")

  exports <- sub("^export\\(\"?", "", readLines(ns_path))
  exports <- sub("\"?\\)$", "", exports[grepl("^export", exports)])
  legacy <- exports[!grepl("^br_|^use_govbr$|^run_example$|^%>%$", exports)]

  sources <- paste(
    vapply(
      list.files(file.path(pkg_root, "R"), full.names = TRUE),
      function(f) paste(readLines(f), collapse = "\n"),
      character(1)
    ),
    collapse = "\n"
  )
  not_deprecated <- legacy[!vapply(legacy, function(f) {
    grepl(paste0('govbr_deprecated\\("', f, '"\\)'), sources)
  }, logical(1))]

  expect_length(not_deprecated, 0)
})
