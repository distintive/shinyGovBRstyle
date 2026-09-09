test_that("br_pagination markup", {
  pag <- br_pagination("pag", total = 4, current = 2)
  expect_identical(pag$attribs$class, "br-pagination")
  expect_identical(pag$attribs$`data-total`, "4")
  expect_identical(pag$attribs$`data-current`, "2")
  expect_identical(pag$attribs$`data-govbr-pagination`, "pag")
  html <- as.character(pag)
  expect_match(html, 'aria-label="P\u00e1gina 3"')
  expect_match(html, "data-previous-page")
  expect_match(html, "data-next-page")
  expect_match(html, "page active")
})

test_that("br_pagination clamps current and validates total", {
  expect_identical(br_pagination("p", 5, current = 99)$attribs$`data-current`, "5")
  expect_error(br_pagination("p", 0))
})

test_that("br_step markup", {
  step <- br_step("etapas", c("A", "B"), initial = 2)
  expect_identical(step$attribs$class, "br-step")
  expect_identical(step$attribs$`data-initial`, "2")
  expect_identical(step$attribs$`data-govbr-step`, "etapas")
  html <- as.character(step)
  expect_match(html, "step-progress-btn active")
  expect_match(html, 'aria-setsize="2"')
  expect_match(html, ">B</span>")
})

test_that("br_signin markup", {
  signin <- br_signin("entrar", "Entrar", type = "primary")
  expect_match(signin$attribs$class, "br-sign-in")
  expect_match(signin$attribs$class, "action-button")
  expect_match(signin$attribs$class, "primary")
  html <- as.character(signin)
  expect_match(html, "fas fa-user")
  expect_match(html, "Entrar")
})
