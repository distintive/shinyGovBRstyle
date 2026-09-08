test_that("br_select_input single binds as radiogroup", {
  select <- br_select_input(
    inputId = "uf",
    label = "Estado",
    choices = c("DF" = "Distrito Federal")
  )

  expect_match(select$attribs$class, "br-select")
  expect_match(select$attribs$class, "shiny-input-radiogroup")

  html <- as.character(select)
  expect_match(html, 'id="uf-filter"')
  expect_match(html, 'name="uf"')
  expect_match(html, "br-list")
  expect_match(html, "fa-angle-down")
})

test_that("br_select_input multiple binds as checkboxgroup", {
  select <- br_select_input("uf", "Estado", choices = c("a", "b"), multiple = TRUE)
  expect_match(select$attribs$class, "shiny-input-checkboxgroup")
  html <- as.character(select)
  expect_match(html, 'type="checkbox"')
})

test_that("br_select_input selected marks option", {
  select <- br_select_input("uf", "Estado", choices = c("a", "b"), selected = "b")
  expect_match(as.character(select), "checked")
})

test_that("br_select_input hint renders feedback", {
  select <- br_select_input("uf", "Estado", choices = "a", hint = "Selecione um")
  html <- as.character(select)
  expect_match(html, "feedback warning")
  expect_match(html, "Selecione um")
})
