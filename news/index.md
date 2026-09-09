# Changelog

## shinyGovBRstyle 1.0.0

- Todas as 18 funções herdadas do GOV.UK foram removidas (estavam
  deprecadas desde a 0.2.0); o pacote contém exclusivamente a família
  `br_*` sobre o Design System GovBR.
- Grupos de
  [`br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_radio_input.md)
  e
  [`br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_checkbox_input.md)
  agora usam `fieldset`/`legend` semânticos (com `heading_level`
  opcional), anunciados corretamente por leitores de tela (cherry-pick
  do PR
  [\#225](https://github.com/DistintiveLab/shinyGovBRstyle/issues/225)
  do upstream).
- Assets legados removidos: `govbr-frontend-test.css`, `font.css`,
  bindings JS antigos (`radio_button_input_binding.js`,
  `date_input_binding.js`, `accordion.js`, `govTab.js`) e
  `css_changes.md`.
- Dependências reduzidas para `htmltools`, `purrr` e `shiny`.

## shinyGovBRstyle 0.4.0

- Removidas as funções herdadas do GOV.UK que não possuem transposição
  para o GovBR (24 funções, entre elas `banner()`,
  `error_on()`/`error_off()`, `cookieBanner()`, `contents_link()`,
  `word_count()`, `value_box()` e `font()`), junto de seus testes e da
  documentação. As 18 funções legadas com equivalente `br_*` permanecem
  disponíveis e depreciadas.
- Removidos assets órfãos do GOV.UK: `govbr-frontend-5.7.1.min.css`,
  `govbr-frontend-5.4.0.min.js`, `sr-only.css`, `contents_link.js`,
  logos (`moj_logo*`, `dev_logo*`, `govuk-*`) e as capturas de tela
  antigas usadas no site.
- `heading_text()` e `clean_heading_text()` deixam de ser exportadas:
  agora são auxiliares internos das funções legadas mantidas.
- Site (pkgdown/gh-pages) reestruturado: URL oficial, referência
  organizada por categoria (`br_*` e legados) e logo original mantido.

## shinyGovBRstyle 0.3.0

- Nova função
  [`br_update_page_title()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_update_page_title.md):
  atualiza o título da aba do navegador a partir do servidor (ideia do
  upstream, cherry-pick).
- Acessibilidade: textos auxiliares (`hint`) agora associados aos inputs
  via `aria-describedby` em
  [`br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_text_input.md),
  [`br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_textarea_input.md),
  [`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md),
  [`br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_radio_input.md),
  [`br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_checkbox_input.md)
  e
  [`br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_select_input.md)
  (cherry-pick do upstream).
- Estratégia upstream definida: cherry-pick de ideias pontuais, sem
  merge (o core do pacote agora é o GovBR DS nativo).
- Novos componentes:
  [`br_accordion()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_accordion.md),
  [`br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tabs.md),
  [`br_card()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_card.md),
  [`br_table()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_table.md),
  [`br_modal()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_modal.md),
  [`br_notification()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_notification.md),
  [`br_loading()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_loading.md),
  [`br_magic_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_magic_button.md),
  [`br_breadcrumb()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_breadcrumb.md),
  [`br_tooltip()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tooltip.md),
  [`br_upload()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_upload.md)
  (input de arquivo com binding nativo do Shiny),
  [`br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_pagination.md),
  [`br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_step.md)
  e
  [`br_signin()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_signin.md).
- [`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md)
  agora retorna `Date` no servidor (binding próprio com tipo
  `shiny.date`);
  [`br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tabs.md)
  expõe o índice do tab ativo em `input$` e
  [`br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_pagination.md)/[`br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_step.md)
  também são inputs.
- Funções de atualização server-side:
  [`update_br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
  [`update_br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md)
  e
  [`update_br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md).
- Header corrigido para incluir o gatilho de menu exigido pelo
  JavaScript oficial do GovBR (`menuTrigger`); a inicialização JS é
  isolada por componente para que um markup incompleto não impeça os
  demais.
- Todas as 42 funções herdadas do GOV.UK foram marcadas como obsoletas:
  emitem aviso (uma vez por sessão) apontando para a família `br_*` e
  serão removidas em versão futura.
- App de exemplo
  ([`run_example()`](https://distintivelab.github.io/shinyGovBRstyle/reference/run_example.md))
  reescrito usando exclusivamente a família `br_*`.
- Workflow de deploy do app de exemplo corrigido (instalava o pacote
  upstream) e CONTRIBUTING.md reescrito para o fluxo GovBR.
- README e DESCRIPTION reescritos para a família `br_*`; URLs
  atualizadas para a organização DistintiveLab.

## shinyGovBRstyle 0.2.0

- Nova família de componentes `br_*` construída com os assets oficiais
  do Design System GovBR v3.7.0 (`core.min.css`/`core.min.js`), classes
  reais `br-*` e bindings nativos do Shiny:
  [`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md),
  [`br_header()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_header.md),
  [`br_footer()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_footer.md),
  [`br_layout()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_layout.md),
  [`br_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_button.md),
  [`br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_text_input.md),
  [`br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_textarea_input.md),
  [`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md),
  [`br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_select_input.md),
  [`br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_checkbox_input.md),
  [`br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_radio_input.md),
  [`br_message()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_message.md),
  [`br_tag()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tag.md),
  [`br_divider()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_divider.md)
  e
  [`br_skiplink()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_skiplink.md).
- Assets do GovBR DS e Font Awesome 5.11.2 agora são servidos localmente
  (funciona offline; sem dependência de CDN).
- Fonte Rawline registrada com caminhos corrigidos (`rawline.css`).
- Componentes JS do GovBR são re-inicializados automaticamente quando o
  Shiny renderiza UI dinâmica (`govbr-shiny.js`).
- As funções antigas herdadas do GOV.UK continuam disponíveis, mas devem
  ser consideradas obsoletas; a migração para a família `br_*` está
  documentada no ROADMAP.md.

## shinyGovBRstyle 0.1.0

- Update the css to v5.4.0 and made fixes associated with that.
- No longer requires rem remover step to update for future changes
- One of the major changes in the css is a change in look and
  functionality for the accordion. Show/hide all works as expected now.
- Another major change to how the radio buttons look and feel, in line
  with the v5.4.0 design examples.
- Added additional functions to the `run_example` for ease of testing
- Added the contents_links() function as a helper for getting the
  styling and behaviour for left navigation

## shinyGovBRstyle 0.0.8

- Update the css to v4.0.0 and made fixes associated with that.
- One of the major changes in the css is a change in look for the
  accordion.
- Added new functions `gov_main_layout`, `gov_row`, `gov_box` and
  `gov_text` to give better control over the layouts.
- Added tabs as a component using the `govTab` command
- Added summary list as a component using the `gov_summary` command
- Added error summary component (`error_summary`) and error summary
  update (`error_summary_update`)

## shinyGovBRstyle 0.0.7

- Improved the header so that you can adjust the logo size to suit
- Fix some errors that appeared in the footer
- Fix the word count function so that you only need to enter word count
  limit on the `text_area` function. You can change the limit on
  `word_count` if needed.
- Change the `run_example` to a better versions that show more ways you
  can you the package.
- Change the `backlink_Input` to a button so that you can use server to
  move between panels etc.
- Added tags through the `tag_Input` function plus added to the
  `use_example`.
- Added cookie banner through the `cookieBanner` function.
- Added accordion through the `accordion` function.
- Added tables through the `govTable` function.

## shinyGovBRstyle 0.0.6

- Fix minor bugs from the issues list including data default and radio
  default
- Added units test
- Added an example function
- Added a `NEWS.md` file to track changes to the package.
- Added a notification banner function
- Got ready for CRAN release.
- Added output value to the documentation
