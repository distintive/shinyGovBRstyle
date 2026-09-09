# Notification Banner Function

This function create a notification banner

## Usage

``` r
noti_banner(
  inputId,
  title_txt = "Important",
  body_txt = NULL,
  type = "standard"
)
```

## Arguments

- inputId:

  The input id for the banner

- title_txt:

  The wording that appears in the title

- body_txt:

  The wording that appears in the banner body

- type:

  The type of banner. Options are standard and success. Standard is
  default

## Value

a notification html shiny object

## Deprecated

Deprecated as of shinyGovBRstyle 0.2.0; kept for backwards compatibility
and scheduled for removal. See the \`br\_\*\` family.

## Examples

``` r
if (interactive()) {

  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::noti_banner(
      inputId = "banner", title_txt = "Important", body_txt = "Example text")
  )

  server <- function(input, output, session) {}

  shinyApp(ui = ui, server = server)
}
```
