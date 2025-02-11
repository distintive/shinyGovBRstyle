
test_that("default works", {
  layout_test <- gov_layout()

  expect_identical(
    layout_test$attribs$id,
    "main"
  )

  expect_identical(
    layout_test$attribs$class,
    "govbr-width-container  govbr-main-wrapper"
  )

  expect_identical(
    layout_test$children[[1]]$attribs$class,
    "govbr-grid-column-full"
  )

})
