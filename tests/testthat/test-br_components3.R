test_that("br_breadcrumb markup", {
  crumb <- br_breadcrumb(c("Relatórios" = "#", "Anual" = "#"))
  expect_identical(crumb$attribs$class, "br-breadcrumb")
  html <- as.character(crumb)
  expect_match(html, "crumb-list")
  expect_match(html, 'href="#"')
  expect_match(html, ">Relat\u00f3rios</a>")
  expect_match(html, 'data-active="active"')
  expect_match(html, 'aria-current="page">Anual')
})

test_that("br_breadcrumb home link", {
  expect_match(as.character(br_breadcrumb(c("A" = "#"))), "crumb home")
  expect_false(grepl(
    "crumb home",
    as.character(br_breadcrumb(c("A" = "#"), home = FALSE))
  ))
})

test_that("br_tooltip markup", {
  tip <- br_tooltip(
    shiny::tags$button("Alvo"),
    text = "Texto",
    subtext = "Sub",
    place = "bottom",
    type = "success"
  )
  html <- as.character(tip)
  expect_match(html, "br-tooltip")
  expect_match(html, 'place="bottom"')
  expect_match(html, 'success="success"')
  expect_match(html, '>Texto</span>')
  expect_match(html, 'class="subtext">Sub')
})

test_that("br_upload markup", {
  up <- br_upload("arquivo", "Envio", multiple = TRUE, accept = "text/csv")
  expect_identical(up$attribs$class, "br-upload")
  html <- as.character(up)
  expect_match(html, 'name="arquivo"')
  expect_match(html, 'id="arquivo"')
  expect_match(html, "multiple")
  expect_match(html, 'accept="text/csv"')
  expect_match(html, "upload-list")
})
