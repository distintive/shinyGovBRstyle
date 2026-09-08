test_that("br_footer creates govbr footer", {
  footer <- br_footer()
  expect_identical(footer$name, "footer")
  expect_identical(footer$attribs$class, "br-footer")
  expect_identical(footer$attribs$id, "footer")
})

test_that("br_footer renders categories", {
  footer <- br_footer(categories = list("Categoria" = c("Link 1", "Link 2")))
  html <- as.character(footer)
  expect_match(html, "text-uppercase\">Categoria</div>")
  expect_match(html, ">Link 1</div>")
  expect_match(html, ">Link 2</div>")
})
