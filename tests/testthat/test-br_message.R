test_that("br_message types and markup", {
  msg <- br_message(title = "Sucesso.", body = "Salvo.", type = "success")
  html <- as.character(msg)
  expect_match(html, "br-message success")
  expect_match(html, "fa-check-circle")
  expect_match(html, "message-title\">Sucesso\\.</span>")
  expect_match(html, "message-body\"> Salvo\\.</span>")
})

test_that("br_message all types have distinct icons", {
  expect_match(as.character(br_message("a", type = "info")), "fa-info-circle")
  expect_match(as.character(br_message("a", type = "warning")), "fa-exclamation-triangle")
  expect_match(as.character(br_message("a", type = "danger")), "fa-times-circle")
})

test_that("br_message dismissible option", {
  expect_match(as.character(br_message("a")), "Fechar a mensagem")
  expect_false(grepl(
    "Fechar a mensagem",
    as.character(br_message("a", dismissible = FALSE))
  ))
})
