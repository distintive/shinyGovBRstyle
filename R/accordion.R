#' Accordion Function
#'
#' This function inserts a accordion
#' @param inputId Input id for the accordion
#' @param titles Add the titles for the accordion
#' @param descriptions Add the main text for the accordion
#' @return an accordion html shiny object
#' @keywords accordion
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::banner(
#'       inputId = "banner", type = "beta", 'This is a new service'),
#'     shinyGovBRstyle::gov_layout(size = "two-thirds",
#'     accordion(
#'       "acc1",
#'       c("Writing well for the web",
#'         "Writing well for specialists",
#'         "Know your audience",
#'         "How people read"
#'        ),
#'       c("This is the content for Writing well for the web.",
#'         "This is the content for Writing well for specialists.",
#'         "This is the content for Know your audience.",
#'         "This is the content for How people read."
#'        ))),
#'
#'     shinyGovBRstyle::footer(full = TRUE)
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

accordion <- function(inputId, titles, descriptions){

  count_array <- seq(length(titles))

  accordion_div <-
    shiny::tags$div(
      class = "govbr-accordion js-enabled",
      `data-module` = "govbr-accordion",
      id = inputId,
      shiny::tags$div(
        class = "govbr-accordion__controls",
        shiny::tags$button(
          class = "govbr-accordion__show-all",
          `aria-expanded` = "false",
          shiny::tags$span(
            class=paste(
              "govbr-accordion-nav__chevron",
              "govbr-accordion-nav__chevron--down"),
          ),
          shiny::tags$span(
            class = "govbr-accordion__show-all-text",
            "Show all sections"
          )
        )
      ),
      Map(function(x, y, z) {
        shiny::tags$div(
          class="govbr-accordion__section",
          shiny::tags$div(
            class="govbr-accordion__section-header",
            shiny::tags$h2(
              class="govbr-accordion__section-header",
              shiny::tags$button(
                class = "govbr-accordion__section-button",
                id = paste0("accordion-default-heading-", z),
                name = paste0("accordion-default-heading-", z),
                shiny::tags$span(
                  class = "govbr-accordion__section-heading-text",
                  shiny::tags$span(
                    class = "govbr-accordion__section-heading-text-focus",
                    x
                  )
                ),
                shiny::tags$span(
                  class = paste(
                    "govbr-visually-hidden",
                    "govbr-accordion__section-heading-divider")
                ),
                shiny::tags$span(
                  class = "govbr-accordion__section-toggle",
                  shiny::tags$span(
                    class = "govbr-accordion__section-toggle-focus",
                    shiny::tags$span(
                      class = paste(
                        "govbr-accordion-nav__chevron",
                        "govbr-accordion-nav__chevron--down")
                    ),
                    shiny::tags$span(
                      class = "govbr-accordion__section-toggle-text",
                      "Show",
                      shiny::tags$span(
                        class = "govbr-visually-hidden",
                        "this section"
                      )
                    )
                  )
                )
              )
            )
          ),
          shiny::tags$div(
            id = "accordion-default-content-1",
            class="govbr-accordion__section-content",
            `aria-labelledby` = paste0("accordion-default-heading-", z),
            shiny::tags$p(
              class = "govbr-body",
              y
            )
          )
        )}, x = titles, y = descriptions, z = count_array
    )
  )
  attachDependency(accordion_div, "accordion")
}


