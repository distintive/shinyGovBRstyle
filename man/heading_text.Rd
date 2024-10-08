% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/heading_text.R
\name{heading_text}
\alias{heading_text}
\title{Heading Text Function}
\usage{
heading_text(text_input, size = "xl")
}
\arguments{
\item{text_input}{Text to display}

\item{size}{Text size using xl, l, m, s.  Defaults to xl.}
}
\value{
a heading text html shiny object
}
\description{
This function create a heading text
}
\examples{
if (interactive()) {
  ui <- fluidPage(
    shinyGovBRstyle::header(
      main_text = "Example",
      secondary_text = "User Examples",
      logo="shinyGovBRstyle/images/dev_logo.png"),
    shinyGovBRstyle::gov_layout(size = "two-thirds",
      shinyGovBRstyle::heading_text("This is great text", "m")
    ),
    shinyGovBRstyle::footer(full = TRUE)
  )

  server <- function(input, output, session) {}
  shinyApp(ui = ui, server = server)
}
}
\keyword{heading}
