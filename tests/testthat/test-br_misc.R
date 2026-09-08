test_that("br_divider markup", {
  divider <- br_divider(class = "my-3 dashed")
  html <- as.character(divider)
  expect_match(html, "br-divider my-3 dashed")
})

test_that("br_layout containers", {
  expect_match(br_layout()$attribs$class, "container-lg")
  expect_match(br_layout(size = "medium")$attribs$class, "container-md")
  expect_match(br_layout(size = "small")$attribs$class, "container-sm")
  expect_match(br_layout(size = "fluid")$attribs$class, "container-fluid")
  expect_identical(br_layout()$attribs$id, "main-content")
  expect_error(br_layout(size = "nope"))
})

test_that("br_skiplink markup", {
  skip <- br_skiplink(c("main-content" = "Ir para o conteúdo"))
  html <- as.character(skip)
  expect_match(html, "br-skiplink")
  expect_match(html, 'href="#main-content"')
  expect_match(html, "Ir para o conteúdo")
})

test_that("use_govbr attaches dependencies", {
  deps <- htmltools::findDependencies(use_govbr())
  dep_names <- vapply(deps, function(d) d$name, character(1))
  expect_true("govbr-rawline" %in% dep_names)
  expect_true("font-awesome" %in% dep_names)
  expect_true("govbr-core-css" %in% dep_names)
  expect_true("govbr-core-js" %in% dep_names)
})
