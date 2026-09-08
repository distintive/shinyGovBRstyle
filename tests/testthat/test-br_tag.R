test_that("br_tag markup", {
  tag_el <- br_tag("Novo")
  html <- as.character(tag_el)
  expect_match(html, "br-tag")
  expect_match(html, "<span>Novo</span>")
})

test_that("br_tag with class and icon", {
  html <- as.character(br_tag(
    "Ok",
    class = "bg-mint-cool-vivid-70",
    icon = "fas fa-check"
  ))
  expect_match(html, "bg-mint-cool-vivid-70")
  expect_match(html, "fas fa-check")
})
