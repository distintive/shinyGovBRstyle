test_that("backlink works", {
  backlink_check <- backlink_Input("backId")

  expect_identical(backlink_check$attribs$id, "backId")
  expect_match(as.character(backlink_check), "Voltar")
})
