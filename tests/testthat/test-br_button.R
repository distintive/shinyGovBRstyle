test_that("br_button default", {
  button <- br_button("btn1", "Clique")
  expect_identical(button$attribs$id, "btn1")
  expect_identical(
    button$attribs$class,
    "br-button primary action-button"
  )
})

test_that("br_button types", {
  expect_identical(
    br_button("b", "x", type = "secondary")$attribs$class,
    "br-button secondary action-button"
  )
  expect_identical(
    br_button("b", "x", type = "danger")$attribs$class,
    "br-button danger action-button"
  )
})

test_that("br_button variants", {
  expect_match(br_button("b", "x", block = TRUE)$attribs$class, "block")
  expect_match(br_button("b", "x", circle = TRUE)$attribs$class, "circle")
  html <- as.character(br_button("b", "x", icon = "fas fa-search"))
  expect_match(html, "fas fa-search")
})

test_that("br_button can be disabled", {
  html <- as.character(br_button("b", "x", disabled = TRUE))
  expect_match(html, "disabled")
})

test_that("br_button invalid type errors", {
  expect_error(br_button("b", "x", type = "nope"))
})
