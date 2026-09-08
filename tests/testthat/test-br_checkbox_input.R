test_that("br_checkbox_input single returns standalone checkbox", {
  checkbox <- br_checkbox_input("aceite", "Aceito os termos")
  expect_identical(checkbox$attribs$class, "br-checkbox")
  html <- as.character(checkbox)
  expect_match(html, 'id="aceite"')
  expect_match(html, 'type="checkbox"')
  expect_false(grepl('name="aceite"', html))
})

test_that("br_checkbox_input single can be checked", {
  checkbox <- br_checkbox_input("aceite", "Aceito", selected = TRUE)
  expect_match(as.character(checkbox), "checked")
})

test_that("br_checkbox_input group binds as shiny checkboxgroup", {
  checkbox <- br_checkbox_input(
    inputId = "temas",
    label = "Temas",
    choices = c("Tecnologia" = "tec", "Saúde" = "sau"),
    selected = "tec"
  )

  expect_identical(checkbox$attribs$class, "shiny-input-checkboxgroup")
  expect_identical(checkbox$attribs$id, "temas")

  html <- as.character(checkbox)
  expect_match(html, 'name="temas"')
  expect_match(html, 'value="tec"')
  expect_match(html, ">Tecnologia</label>")
  expect_match(html, "checked")
})
