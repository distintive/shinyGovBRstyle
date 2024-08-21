#' Header Function
#'
#' This function create a header banner.  For use at top of the screen
#' @param main_text Main text that goes in the header
#' @param secondary_text Secondary header to supplement the main text
#' @param logo Add a link to a logo which will apply in the header. Use crown to
#' use the crown svg version on gov uk.
#' @param main_link Add a link for clicking on main text
#' @param secondary_link Add a link for clicking on secondary header.
#' @param logo_width Change the logo size width css to improve fit
#' @param logo_height Change the logo size height css to improve fit
#' @return a header html shiny object
#' @keywords header
#' @export
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png")
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }

header <- function(main_text, secondary_text, logo = img(src("data:image/png;base64,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")),
                   main_link = "#", secondary_link = "#",
                   logo_width = 36, logo_height = 32){

  if (is.null(logo)) {
    logo_src <- "null"
  } else {
    logo_src <- logo
  }

  govHeader <- shiny::tags$header(class = "govbr-header", role = "banner",
    shinyjs::inlineCSS(paste0(
      ".govbr-header__logotype-crown-fallback-image {width: ", logo_width, "px;
      height: ", logo_height, "px;}")),
    shiny::tags$div(class = "govbr-header__container govbr-width-container",
      shiny::tags$div(class = "govbr-header__logo",
        shiny::tags$a(href = main_link,
                      class="govbr-header__link govbr-header__link--homepage",
          shiny::tags$span(class = "govbr-header__logotype",

          if (logo_src == "crown"){
            shiny::tags$svg(`aria-hidden`="true", focusable="false",
                            class="govbr-header__logotype-crown",
                            xmlns="http://www.w3.org/2000/svg",
                            viewBox="0 0 132 97", height="30", width="36",
              shiny::tags$path(fill="currentColor",
                               `fill-rule`="evenodd",
                               d="M25 30.2c3.5 1.5 7.7-.2 9.1-3.7 1.5-3.6-.2-7.8-3.9-9.2-3.6-1.4-7.6.3-9.1 3.9-1.4 3.5.3 7.5 3.9 9zM9 39.5c3.6 1.5 7.8-.2 9.2-3.7 1.5-3.6-.2-7.8-3.9-9.1-3.6-1.5-7.6.2-9.1 3.8-1.4 3.5.3 7.5 3.8 9zM4.4 57.2c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.5-1.5-7.6.3-9.1 3.8-1.4 3.5.3 7.6 3.9 9.1zm38.3-21.4c3.5 1.5 7.7-.2 9.1-3.8 1.5-3.6-.2-7.7-3.9-9.1-3.6-1.5-7.6.3-9.1 3.8-1.3 3.6.4 7.7 3.9 9.1zm64.4-5.6c-3.6 1.5-7.8-.2-9.1-3.7-1.5-3.6.2-7.8 3.8-9.2 3.6-1.4 7.7.3 9.2 3.9 1.3 3.5-.4 7.5-3.9 9zm15.9 9.3c-3.6 1.5-7.7-.2-9.1-3.7-1.5-3.6.2-7.8 3.7-9.1 3.6-1.5 7.7.2 9.2 3.8 1.5 3.5-.3 7.5-3.8 9zm4.7 17.7c-3.6 1.5-7.8-.2-9.2-3.8-1.5-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.3 3.5-.4 7.6-3.9 9.1zM89.3 35.8c-3.6 1.5-7.8-.2-9.2-3.8-1.4-3.6.2-7.7 3.9-9.1 3.6-1.5 7.7.3 9.2 3.8 1.4 3.6-.3 7.7-3.9 9.1zM69.7 17.7l8.9 4.7V9.3l-8.9 2.8c-.2-.3-.5-.6-.9-.9L72.4 0H59.6l3.5 11.2c-.3.3-.6.5-.9.9l-8.8-2.8v13.1l8.8-4.7c.3.3.6.7.9.9l-5 15.4v.1c-.2.8-.4 1.6-.4 2.4 0 4.1 3.1 7.5 7 8.1h.2c.3 0 .7.1 1 .1.4 0 .7 0 1-.1h.2c4-.6 7.1-4.1 7.1-8.1 0-.8-.1-1.7-.4-2.4V34l-5.1-15.4c.4-.2.7-.6 1-.9zM66 92.8c16.9 0 32.8 1.1 47.1 3.2 4-16.9 8.9-26.7 14-33.5l-9.6-3.4c1 4.9 1.1 7.2 0 10.2-1.5-1.4-3-4.3-4.2-8.7L108.6 76c2.8-2 5-3.2 7.5-3.3-4.4 9.4-10 11.9-13.6 11.2-4.3-.8-6.3-4.6-5.6-7.9 1-4.7 5.7-5.9 8-.5 4.3-8.7-3-11.4-7.6-8.8 7.1-7.2 7.9-13.5 2.1-21.1-8 6.1-8.1 12.3-4.5 20.8-4.7-5.4-12.1-2.5-9.5 6.2 3.4-5.2 7.9-2 7.2 3.1-.6 4.3-6.4 7.8-13.5 7.2-10.3-.9-10.9-8-11.2-13.8 2.5-.5 7.1 1.8 11 7.3L80.2 60c-4.1 4.4-8 5.3-12.3 5.4 1.4-4.4 8-11.6 8-11.6H55.5s6.4 7.2 7.9 11.6c-4.2-.1-8-1-12.3-5.4l1.4 16.4c3.9-5.5 8.5-7.7 10.9-7.3-.3 5.8-.9 12.8-11.1 13.8-7.2.6-12.9-2.9-13.5-7.2-.7-5 3.8-8.3 7.1-3.1 2.7-8.7-4.6-11.6-9.4-6.2 3.7-8.5 3.6-14.7-4.6-20.8-5.8 7.6-5 13.9 2.2 21.1-4.7-2.6-11.9.1-7.7 8.8 2.3-5.5 7.1-4.2 8.1.5.7 3.3-1.3 7.1-5.7 7.9-3.5.7-9-1.8-13.5-11.2 2.5.1 4.7 1.3 7.5 3.3l-4.7-15.4c-1.2 4.4-2.7 7.2-4.3 8.7-1.1-3-.9-5.3 0-10.2l-9.5 3.4c5 6.9 9.9 16.7 14 33.5 14.8-2.1 30.8-3.2 47.7-3.2z"))
          } else {
            shiny::tags$img(
              src = logo,
              class = "govbr-header__logotype-crown-fallback-image"
            )
          },


            shiny::tags$span(main_text, class = "govbr-header__logotype-text")
          )
        )
      ),
      shiny::tags$div(class = "govbr-header__content",
        shiny::tags$a(
          href = secondary_link, secondary_text,
          class = "govbr-header__link govbr-header__link--service-name"
        )
      )
    )
  )
  attachDependency(govHeader)
}
