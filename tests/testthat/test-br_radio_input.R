test_that("br_radio_input binds as shiny radiogroup", {
  radio <- br_radio_input(
    inputId = "uf",
    label = "Estado",
    choices = c("Distrito Federal" = "DF", "São Paulo" = "SP"),
    selected = "SP"
  )

  expect_identical(radio$attribs$class, "shiny-input-radiogroup")
  expect_identical(radio$attribs$id, "uf")

  html <- as.character(radio)
  expect_match(html, 'name="uf"')
  expect_match(html, 'value="DF"')
  expect_match(html, ">Distrito Federal</label>")
  expect_match(html, "checked")
})

test_that("br_radio_input unnamed choices use values as labels", {
  radio <- br_radio_input("x", "Label", choices = c("a", "b"))
  html <- as.character(radio)
  expect_match(html, ">a</label>")
  expect_match(html, ">b</label>")
})

test_that("br_radio_input hint and label", {
  radio <- br_radio_input("x", "Título", choices = "a", hint = "Dica")
  html <- as.character(radio)
  expect_match(html, 'class="label mb-0">Título')
  expect_match(html, 'class="help-text">Dica')
})
