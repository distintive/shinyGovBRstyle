test_that("br_tabs markup", {
  tabs <- br_tabs(
    inputId = "abas",
    titles = c("Dados", "Gráficos"),
    panels = list(shiny::p("A"), shiny::p("B"))
  )
  expect_identical(tabs$attribs$class, "br-tab")
  html <- as.character(tabs)
  expect_match(html, 'data-panel="abas-panel-1"')
  expect_match(html, 'id="abas-panel-1"')
  expect_match(html, "tab-item active")
  expect_match(html, "tab-panel active")
  expect_match(html, ">Dados</span>")
})

test_that("br_tabs with icons", {
  html <- as.character(br_tabs(
    "t", c("A", "B"),
    panels = list("1", "2"),
    icons = c("fas fa-image", "fas fa-bell")
  ))
  expect_match(html, "fas fa-image")
  expect_match(html, "fas fa-bell")
})

test_that("br_tabs length mismatch errors", {
  expect_error(br_tabs("t", c("A", "B"), panels = list("1")))
})
