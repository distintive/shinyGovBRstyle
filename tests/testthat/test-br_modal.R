test_that("br_modal markup", {
  modal <- br_modal(title = "Título", shiny::p("Corpo"), id = "m1")
  expect_match(modal$attribs$class, "br-modal medium")
  html <- as.character(modal)
  expect_match(html, "br-modal-header")
  expect_match(html, "br-modal-body")
  expect_match(html, 'data-dismiss="br-modal"')
  expect_match(html, 'aria-labelledby="m1-title"')
})

test_that("br_modal sizes and footer", {
  expect_match(br_modal("t", size = "small")$attribs$class, "small")
  html <- as.character(br_modal("t", footer = shiny::p("f")))
  expect_match(html, "br-modal-footer")
})
