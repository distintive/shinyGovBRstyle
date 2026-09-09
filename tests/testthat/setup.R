# Silencia avisos de deprecacao das funcoes legadas mantidas;
# test-deprecation.R reseta o estado para suas verificacoes e o
# restaura ao final (arquivos rodam em ordem alfabetica).
if (!exists(".warned", envir = govbr_deprecated_env, inherits = FALSE)) {
  assign(".warned", character(0), envir = govbr_deprecated_env)
}
govbr_test_legacy_names <- c(
  "accordion",
  "button_Input",
  "checkbox_Input",
  "date_Input",
  "file_Input",
  "footer",
  "govTable",
  "govTabs",
  "gov_layout",
  "header",
  "noti_banner",
  "radio_button_Input",
  "select_Input",
  "skip_to_main",
  "tag_Input",
  "text_Input",
  "text_area_Input",
  "warning_text"
)
assign(".warned", govbr_test_legacy_names, envir = govbr_deprecated_env)
