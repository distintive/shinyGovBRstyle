test_that("br_table markup from data.frame", {
  tbl <- br_table(data = data.frame(a = 1:2, b = c("x", "y")))
  expect_identical(tbl$attribs$class, "br-table")
  html <- as.character(tbl)
  expect_match(html, "<th[^>]*>a</th>")
  expect_match(html, "<th[^>]*>b</th>")
  expect_match(html, "<td[^>]*>1</td>")
  expect_match(html, "<td[^>]*>y</td>")
})

test_that("br_table caption and matrix input", {
  m <- matrix(1:4, ncol = 2, dimnames = list(NULL, c("c1", "c2")))
  html <- as.character(br_table(m, title = "Legend"))
  expect_match(html, 'class="table-title">Legend</div>')
  expect_match(html, "<caption>Legend</caption>")
  expect_match(html, ">c1</th>")
})

test_that("br_table invalid input errors", {
  expect_error(br_table(1:10))
})
