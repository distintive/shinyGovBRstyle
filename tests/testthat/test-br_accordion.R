test_that("br_accordion markup", {
  acc <- br_accordion(
    inputId = "faq",
    items = list("Assuntos" = shiny::p("Conteúdo"))
  )
  expect_identical(acc$attribs$class, "br-accordion")
  expect_identical(acc$attribs$id, "faq")
  html <- as.character(acc)
  expect_match(html, "aria-controls=\"faq-assuntos\"")
  expect_match(html, "fa-angle-down")
  expect_match(html, ">Assuntos</span>")
})

test_that("br_accordion single mode", {
  acc <- br_accordion("x", list("A" = "a"), single = TRUE)
  expect_match(as.character(acc), 'data-single="data-single"')
  expect_false(grepl("data-single",
    as.character(br_accordion("x", list("A" = "a"))),
    fixed = TRUE
  ))
})
