test_that("br_card markup", {
  card <- br_card(title = "Título", shiny::p("Conteúdo"))
  expect_identical(card$attribs$class, "br-card")
  html <- as.character(card)
  expect_match(html, "card-header")
  expect_match(html, "card-content")
  expect_match(html, ">Conteúdo</p>")
})

test_that("br_card footer and hover", {
  card <- br_card("x", footer = shiny::p("rodapé"), hover = TRUE)
  html <- as.character(card)
  expect_match(html, "card-footer")
  expect_match(html, "br-card hover")
})
