# Load application support files into testing environment
shinytest2::load_app_env()

# --no-sandbox permite rodar o Chrome headless em containers/CI
options(shiny.test2 = list(
  chrome_args = c("--no-sandbox", "--disable-gpu")
))
