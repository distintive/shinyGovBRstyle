test_that("footer links add correctly", {
  footer_with_links <- footer(links = c("Accessibility Statement", "Cookies"))

  html <- as.character(footer_with_links)
  expect_match(html, 'id="accessibility_statement"', fixed = TRUE)
  expect_match(html, 'id="cookies"', fixed = TRUE)
  expect_match(html, "Accessibility Statement</a>")
  expect_match(html, "Cookies</a>")
  expect_match(html, "govbr-footer__link", fixed = TRUE)
  expect_match(html, "govbr-visually-hidden", fixed = TRUE)
  expect_match(html, "govbr-footer__inline-list", fixed = TRUE)

  full_footer_with_links <- footer(TRUE, c("Privacy Notice", "Cookies"))

  html_full <- as.character(full_footer_with_links)
  expect_match(html_full, 'id="privacy_notice"', fixed = TRUE)
  expect_match(html_full, 'id="cookies"', fixed = TRUE)
  expect_match(html_full, "Privacy Notice</a>")
  expect_match(html_full, "govbr-footer__inline-list", fixed = TRUE)
})
