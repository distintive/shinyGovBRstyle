test_that("example app loads and serves GovBR assets", {
  skip_on_cran()
  skip_if_not_installed("shinytest2")
  skip_if_not_installed("chromote")
  skip_if_not(
    length(chromote::find_chrome() %||% character(0)) > 0,
    "Chrome/Chromium not available"
  )

  app_dir <- system.file("example_app", package = "shinyGovBRstyle")

  options(shiny.test2 = list(
    chrome_args = c("--no-sandbox", "--disable-gpu")
  ))

  app <- shinytest2::AppDriver$new(
    app_dir,
    name = "example_app",
    timeout = 30000
  )
  on.exit(app$stop(), add = TRUE)

  app$wait_for_idle(5000)

  expect_equal(app$get_text("title"), "ShinyGovBRstyle")
  expect_true(app$get_js("!!window.core"))
})
