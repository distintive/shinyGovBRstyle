#' Cookie Banner Function
#'
#' This function creates a cookie banner. You need to have shinyjs::useShinyjs()
#' enabled to work.  All the ids are pre set.  See example for how to
#' structure.
#' @param service_name Name for this service to add to banner
#' @return a cookie banner html shiny object.
#' @keywords cookie banner
#' @export
#' @examples
#' if (interactive()) {
#' ui <- fluidPage(
#'   shinyGovBRstyle::header(
#'     main_text = "Example",
#'     secondary_text = "User Examples",
#'     logo="shinyGovBRstyle/images/dev_logo.png"),
#'   #Needs shinyjs to work
#'   shinyjs::useShinyjs(),
#'   shinyGovBRstyle::cookieBanner("The best thing"),
#'   shinyGovBRstyle::gov_layout(size = "two-thirds"),
#'   shinyGovBRstyle::footer(full = TRUE)
#' )
#'
#' server <- function(input, output, session) {
#'
#'   #Need these set of observeEvent to create a path through the cookie banner
#'   observeEvent(input$cookieAccept, {
#'     shinyjs::show(id = "cookieAcceptDiv")
#'     shinyjs::hide(id = "cookieMain")
#'   })
#'
#'   observeEvent(input$cookieReject, {
#'     shinyjs::show(id = "cookieRejectDiv")
#'     shinyjs::hide(id = "cookieMain")
#'   })
#'
#'   observeEvent(input$hideAccept, {
#'     shinyjs::toggle(id = "cookieDiv")
#'   })
#'
#'   observeEvent(input$hideReject, {
#'     shinyjs::toggle(id = "cookieDiv")
#'   })
#'
#'   observeEvent(input$cookieLink, {
#'     #Need to link here to where further info is located.  You can use
#'     #updateTabsetPanel to have a cookie page for instance
#'   })
#'
#' }
#' shinyApp(ui = ui, server = server)
#' }

cookieBanner <- function(service_name) {

  value <- shiny::restoreInput(id = "cookieLink", default = NULL)
  govCookieLink <- shiny::actionLink(
    label = "View cookies",
    inputId = value,
    class = "govbr-link",
    `data-val` = value)

  attachDependency(govCookieLink)

  cookieBanner_Input <-
    shiny::tags$div(
      id = "cookieDiv",
      class = "govbr-cookie-banner",
      `data-nosnippet role` = "region",
      `aria-label` = paste("Cookies ligados", service_name),
      shiny::tags$div(
        id = "cookieMain",
        class= "govbr-cookie-banner__message govbr-width-container",
        shiny::tags$div(
          class = "govbr-grid-row",
          shiny::tags$div(
            class = "govbr-grid-column-two-thirds",
            shiny::tags$h2(
              class = "govbr-cookie-banner__heading govbr-heading-m",
              paste("Cookies ligados", service_name)
            ),
            shiny::tags$div(
              class="govbr-cookie-banner__content",
              shiny::tags$p(
                class = "govbr-body",
                "Para fazer o servi\\u00e7o funcionar, utilizamos alguns cookies essenciais."
              ),
              shiny::tags$p(
                class = "govbr-body",
                "Tamb\u00e9m gostar\u00edamos de utilizar alguns cookies
                anal\u00edticos para\n entender como voc\u00ea usa o servi\u00e7o e\n
                 melhor\u00e1-lo."
              )
            )
        )
      ),
      shiny::tags$div(
        class="govbr-button-group",
        button_Input("cookieAccept", "Aceitar cookies anal\u00edticos"),
        button_Input("cookieReject", "Rejeitar cookies anal\u00edticos"),
        govCookieLink
      )
    ),
    shinyjs::hidden(
      shiny::tags$div(
        id = "cookieAcceptDiv",
        class = "govbr-cookie-banner__message govbr-width-container",
        shiny::tags$div(
          class = "govbr-grid-row",
          shiny::tags$div(
            class = "govbr-grid-column-two-thirds",
            shiny::tags$div(
              class = "govbr-cookie-banner__content",
              shiny::tags$p(
                class = "govbr-body",
                "Voc\u00ea aceitou cookies adicionais. Pode trocar suas
                configura\u00e7\u00f5es de cookies quando quiser."
              )
            )
          )
        ),
        shiny::tags$div(
          class = "govbr-button-group",
          button_Input("hideAccept", "Esconder mensagem")
        )
      )
    ),
    shinyjs::hidden(
      shiny::tags$div(
        id = "cookieRejectDiv",
        class = "govbr-cookie-banner__message govbr-width-container",
        shiny::tags$div(
          class = "govbr-grid-row",
          shiny::tags$div(
            class = "govbr-grid-column-two-thirds",
            shiny::tags$div(
              class = "govbr-cookie-banner__content",
              shiny::tags$p(
                class = "govbr-body",
                "Voc\u00ea rejeitou cookies adicionais. Pode trocar suas
                configura\u00e7\u00f5es de cookies quando quiser."
              )
            )
          )
        ),
        shiny::tags$div(
          class = "govbr-button-group",
          button_Input("hideReject", "Esconder mensagem")
        )
      )
    )
  )

  attachDependency(cookieBanner_Input)
}
