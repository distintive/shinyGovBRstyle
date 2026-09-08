test_that("br_text_input markup", {
  input <- br_text_input("nome", "Nome", placeholder = "Digite", hint = "Ajuda")
  expect_identical(input$attribs$class, "br-input")
  html <- as.character(input)
  expect_match(html, 'for="nome"')
  expect_match(html, 'id="nome"')
  expect_match(html, 'placeholder="Digite"')
  expect_match(html, ">Ajuda</p>")
})

test_that("br_textarea_input markup", {
  textarea <- br_textarea_input("obs", "Observações", hint = "Texto")
  expect_identical(textarea$attribs$class, "br-textarea")
  html <- as.character(textarea)
  expect_match(html, "<textarea[^>]*id=\"obs\"")
  expect_match(html, "text-base mt-1")
})

test_that("br_date_input markup", {
  date_input <- br_date_input("data", "Data")
  expect_identical(date_input$attribs$class, "br-datetimepicker")
  expect_identical(date_input$attribs$`data-mode`, "single")
  html <- as.character(date_input)
  expect_match(html, 'id="data"')
  expect_match(html, "fa-calendar-alt")
})
