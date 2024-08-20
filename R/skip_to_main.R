


skip_to_main <- function() {
  shiny::tags$div(
    id = "skipToMainDiv",
    class = "govuk-yellow-banner",
    style = "background-color: yellow; padding: 10px; display: none;",
    shiny::tags$a(
      href = "#main-content",
      class = "govuk-skip-link__link",
      "Skip to main content"
    )
  )
}
