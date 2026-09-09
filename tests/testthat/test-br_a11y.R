test_that("hints are associated via aria-describedby", {
  expect_match(
    as.character(br_text_input("x", "L", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_textarea_input("x", "L", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_date_input("x", "L", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_radio_input("x", "L", choices = "a", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_checkbox_input("x", "L", choices = "a", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_checkbox_input("x", "L", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
  expect_match(
    as.character(br_select_input("x", "L", choices = "a", hint = "Dica")),
    'aria-describedby="x-hint"', fixed = TRUE
  )
})

test_that("hint ids are unique and present", {
  expect_match(
    as.character(br_text_input("x", "L", hint = "Dica")),
    'id="x-hint"', fixed = TRUE
  )
})

test_that("no aria-describedby without hint", {
  expect_false(grepl(
    "aria-describedby",
    as.character(br_text_input("x", "L")),
    fixed = TRUE
  ))
})

test_that("groups use semantic fieldset/legend", {
  r <- as.character(br_radio_input("x", "Estado", choices = c("A" = "a")))
  expect_match(r, "<fieldset", fixed = TRUE)
  expect_match(r, "br-fieldset shiny-input-radiogroup")
  expect_match(r, "<legend", fixed = TRUE)

  c <- as.character(br_checkbox_input("x", "Temas", choices = "a"))
  expect_match(c, "br-fieldset shiny-input-checkboxgroup")
  expect_match(c, "<legend", fixed = TRUE)

  h <- as.character(br_radio_input("x", "Estado", choices = "a",
                                   heading_level = "3"))
  expect_match(h, "<h3", fixed = TRUE)
})

test_that("labels accept tagList content", {
  html <- as.character(br_text_input(
    "x",
    label = shiny::tagList("Nome ", shiny::tags$strong("obrigat\u00f3rio"))
  ))
  expect_match(html, "<strong>obrigat")
})

test_that("br_update_page_title validates and sends message", {
  session <- list(sendCustomMessage = function(type, message) {
    .last <<- c(type, message)
  })
  expect_error(br_update_page_title(""), "non-empty")
  expect_error(br_update_page_title(c("a", "b")), "single")

  .last <- character(0)
  shiny:::withReactiveDomain(session, {
    br_update_page_title("Relat\u00f3rio", service_name = "Sistema")
    expect_identical(.last, c("govbrUpdatePageTitle", "Relat\u00f3rio | Sistema"))
    br_update_page_title("Simples")
    expect_identical(.last[[2]], "Simples")
  })
})
