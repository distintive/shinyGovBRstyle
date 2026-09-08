test_that("br_header creates govbr header", {
  header <- br_header(
    title = "Título",
    subtitle = "Subtítulo",
    logo = "govbr",
    logo_alt = "Logo"
  )

  expect_identical(header$name, "header")
  expect_identical(header$attribs$class, "br-header")

  html <- as.character(header)
  expect_match(html, "header-title\">Título</div>")
  expect_match(html, "header-subtitle\">Subtítulo</div>")
  expect_match(html, "govbr-logo\\.png")
})

test_that("br_header with search adds search box", {
  header <- br_header(title = "T", search_id = "busca")
  html <- as.character(header)
  expect_match(html, "header-search")
  expect_match(html, 'id="busca"')
})

test_that("br_header attaches govbr dependencies", {
  header <- br_header(title = "T")
  deps <- htmltools::findDependencies(header)
  expect_true(any(vapply(deps, function(d) d$name == "govbr-core-css", logical(1))))
  expect_true(any(vapply(deps, function(d) d$name == "govbr-core-js", logical(1))))
})
