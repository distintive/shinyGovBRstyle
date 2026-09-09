test_that("br_date_input binds via container with Date type", {
  date_input <- br_date_input("data", "Data")
  expect_identical(date_input$attribs$id, "data")
  html <- as.character(date_input)
  # inner text input no longer takes the inputId
  expect_false(grepl('id="data" type="text"', html))
  expect_match(html, 'id="data-text"')
  expect_match(html, 'id="data-btn"')
})

make_recording_session <- function() {
  recorded <- new.env(parent = emptyenv())
  recorded$messages <- list()
  session <- list(sendInputMessage = function(id, message) {
    n <- length(recorded$messages)
    recorded$messages[[n + 1]] <- list(id = id, message = message)
  })
  list(session = session, recorded = recorded)
}

test_that("update functions delegate to native bindings", {
  rec <- make_recording_session()
  shiny:::withReactiveDomain(rec$session, {
    update_br_text_input("nome", value = "x", placeholder = "y")
    update_br_textarea_input("obs", value = "z")
    update_br_select_input("uf", selected = "DF")
    update_br_radio_input("tipo", selected = "pf")
    update_br_checkbox_input("aceite", selected = TRUE)
    update_br_checkbox_input("canais", selected = c("email"))
    update_br_date_input("data", value = as.Date("2024-02-02"))
    update_br_tabs("abas", selected = 2)
    update_br_pagination("pag", selected = 3)
    update_br_step("etapas", selected = 1)
  })

  msgs <- rec$recorded$messages
  expect_length(msgs, 10)

  ids <- vapply(msgs, function(m) m$id, character(1))
  expect_identical(
    sort(ids),
    sort(c("nome", "obs", "uf", "tipo", "aceite", "canais",
           "data", "abas", "pag", "etapas"))
  )

  by_id <- function(id) Filter(function(m) m$id == id, msgs)[[1]]$message
  expect_identical(by_id("nome")$value, "x")
  expect_identical(by_id("nome")$placeholder, "y")
  expect_identical(by_id("aceite")$value, TRUE)
  expect_identical(by_id("canais")$selected, "email")
  expect_identical(by_id("abas")$selected, 2)
  expect_identical(by_id("data")$value, as.Date("2024-02-02"))
})

test_that("br_tabs exposes active tab input", {
  tabs <- br_tabs(
    "abas", c("A", "B"),
    panels = list(shiny::p("1"), shiny::p("2"))
  )
  expect_identical(tabs$attribs$`data-govbr-tabs`, "abas")
})
