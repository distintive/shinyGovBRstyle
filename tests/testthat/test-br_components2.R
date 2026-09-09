test_that("br_notification markup", {
  notif <- br_notification(
    title = "Fulano",
    subtitle = "a@b.gov",
    items = c("Um", "Dois"),
    icons = c("fas fa-bell", "fas fa-envelope")
  )
  expect_identical(notif$attribs$class, "br-notification")
  html <- as.character(notif)
  expect_match(html, "notification-header")
  expect_match(html, "notification-body")
  expect_match(html, "fas fa-bell")
  expect_match(html, "Um\\s*</button>")
})

test_that("br_loading spinner", {
  loading <- br_loading()
  expect_match(loading$attribs$class, "br-loading medium")
  expect_identical(loading$attribs$role, "progressbar")
  expect_match(br_loading(size = "small")$attribs$class, "small")
})

test_that("br_loading progress bar", {
  loading <- br_loading(progress = 75)
  html <- as.character(loading)
  expect_match(html, 'data-progress="75"')
  expect_match(html, 'aria-valuenow="75"')
  expect_match(html, "br-loading-fill")
  expect_error(br_loading(progress = 150))
})

test_that("br_magic_button markup", {
  magic <- br_magic_button("novo", "Adicionar", icon = "fas fa-cart-plus")
  html <- as.character(magic)
  expect_match(html, "br-magic-button medium")
  expect_match(html, "br-button action-button circle")
  expect_match(html, 'aria-label="Adicionar"')
  expect_match(html, "fas fa-cart-plus")
  expect_identical(magic$attribs$class, "br-magic-button medium")
})
