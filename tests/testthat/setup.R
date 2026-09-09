# Silencia avisos de deprecação das funções legadas nos testes antigos;
# test-deprecation.R reseta o estado para suas próprias verificações e o
# restaura ao final (os arquivos rodam em ordem alfabética).
if (!exists(".warned", envir = govbr_deprecated_env, inherits = FALSE)) {
  assign(".warned", character(0), envir = govbr_deprecated_env)
}
govbr_test_legacy_names <- c(
  "accordion", "backlink_Input", "banner", "button_Input", "checkbox_Input",
  "contents_link", "cookieBanner", "date_Input", "details", "download_link",
  "error_off", "error_on", "error_summary", "error_summary_update",
  "external_link", "file_Input", "font", "footer", "govTable", "govTabs",
  "gov_box", "gov_layout", "gov_main_layout", "gov_row", "gov_summary",
  "gov_text", "header", "heading_text", "input_field", "insert_text",
  "label_hint", "noti_banner", "panel_output", "radio_button_Input",
  "select_Input", "skip_to_main", "tag_Input", "text_Input", "text_area_Input",
  "value_box", "warning_text", "word_count"
)
assign(".warned", govbr_test_legacy_names, envir = govbr_deprecated_env)
