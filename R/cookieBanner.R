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
#'     #Need to link here to where further info is located.  You can you
#'     #updateTabsetPanel to have a cookie page for instance
#'   })
#'
#' }
#' shinyApp(ui = ui, server = server)
#' }

cookieBanner <- function(service_name) {

  value <- shiny::restoreInput(id = "cookieLink", default = NULL)
  govCookieLink <- shiny::tags$button(
    "View cookies",
    id = "cookieLink",
    class = paste0("govbr-link", " action-button"),
    `data-val` = value)

  attachDependency(govCookieLink)

  cookieBanner_Input <-
    shiny::tags$div(
      id = "cookieDiv",
      class = "govbr-cookie-banner",
      `data-nosnippet role` = "region",
      `aria-label` = paste("Cookies on", service_name),
      shiny::tags$div(
        id = "cookieMain",
        class= "govbr-cookie-banner__message govbr-width-container",
        shiny::tags$div(
          class = "govbr-grid-row",
          shiny::tags$div(
            class = "govbr-grid-column-two-thirds",
            shiny::tags$h2(
              class = "govbr-cookie-banner__heading govbr-heading-m",
              paste("Cookies on", service_name)
            ),
            shiny::tags$div(
              class="govbr-cookie-banner__content",
              shiny::tags$p(
                class = "govbr-body",
                "We use some essential cookies to make this service work."
              ),
              shiny::tags$p(
                class = "govbr-body",
                "We\u0027d also like to use analytics cookies so we can understand
                how you use the service and make improvements."
              )
            )
        )
      ),
      shiny::tags$div(
        class="govbr-button-group",
        button_Input("cookieAccept", "Accept analytics cookies"),
        button_Input("cookieReject", "Reject analytics cookies"),
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
                "You\u0027ve accepted additional cookies. You can change your
                cookie settings at any time."
              )
            )
          )
        ),
        shiny::tags$div(
          class = "govbr-button-group",
          button_Input("hideAccept", "Hide this message")
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
                "You\u0027ve rejected additional cookies. You can change your
                cookie settings at any time."
              )
            )
          )
        ),
        shiny::tags$div(
          class = "govbr-button-group",
          button_Input("hideReject", "Hide this message")
        )
      )
    )
  )

  attachDependency(cookieBanner_Input)
}
