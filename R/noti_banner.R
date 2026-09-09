#' Notification Banner Function
#'
#' This function create a notification banner
#' @param inputId The input id for the banner
#' @param title_txt The wording that appears in the title
#' @param body_txt The wording that appears in the banner body
#' @param type The type of banner.  Options are standard and success.
#' Standard is default
#' @return a notification html shiny object
#' @keywords notification banner
#' @export
#' @section Deprecated:
#' Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards
#' compatibility and scheduled for removal. See the `br_*` family.
#' @examples
#' if (interactive()) {
#'
#'   ui <- fluidPage(
#'     shinyGovBRstyle::header(
#'       main_text = "Example",
#'       secondary_text = "User Examples",
#'       logo="shinyGovBRstyle/images/dev_logo.png"),
#'     shinyGovBRstyle::noti_banner(
#'       inputId = "banner", title_txt = "Important", body_txt = "Example text")
#'   )
#'
#'   server <- function(input, output, session) {}
#'
#'   shinyApp(ui = ui, server = server)
#' }
#'
noti_banner <- function(inputId, title_txt = "Important", body_txt = NULL,
                        type = "standard"){
  govbr_deprecated("noti_banner")

  if (type == "success") {
   type_class <- "govbr-notification-banner govbr-notification-banner--success"
   role_type <- "alert"
  } else {
    type_class <- "govbr-notification-banner"
    role_type = "region"
  }

  shiny::tags$div(class = type_class, role = role_type,
           `aria-labelledby` = "govbr-notification-banner-title",
           `data-module` = "govbr-notification-banner",
    shiny::tags$div(class = "govbr-notification-banner__header",
             shiny::tags$h2(class = "govbr-notification-banner__title",
                     id = inputId, title_txt)
    ),
    shiny::tags$div(class="govbr-notification-banner__content",
      shiny::tags$p(class="govbr-notification-banner__heading", shiny::HTML(body_txt))

    )
  )

}
