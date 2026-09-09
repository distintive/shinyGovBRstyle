# shinyGovBRstyle 0.4.0

* Removidas as funções herdadas do GOV.UK que não possuem transposição
  para o GovBR (24 funções, entre elas `banner()`, `error_on()`/`error_off()`,
  `cookieBanner()`, `contents_link()`, `word_count()`, `value_box()` e
  `font()`), junto de seus testes e da documentação. As 18 funções
  legadas com equivalente `br_*` permanecem disponíveis e depreciadas.
* Removidos assets órfãos do GOV.UK: `govbr-frontend-5.7.1.min.css`,
  `govbr-frontend-5.4.0.min.js`, `sr-only.css`, `contents_link.js`,
  logos (`moj_logo*`, `dev_logo*`, `govuk-*`) e as capturas de tela
  antigas usadas no site.
* `heading_text()` e `clean_heading_text()` deixam de ser exportadas:
  agora são auxiliares internos das funções legadas mantidas.
* Site (pkgdown/gh-pages) reestruturado: URL oficial, referência
  organizada por categoria (`br_*` e legados) e logo original mantido.

# shinyGovBRstyle 0.3.0

* Nova função `br_update_page_title()`: atualiza o título da aba do
  navegador a partir do servidor (ideia do upstream, cherry-pick).
* Acessibilidade: textos auxiliares (`hint`) agora associados aos
  inputs via `aria-describedby` em `br_text_input()`,
  `br_textarea_input()`, `br_date_input()`, `br_radio_input()`,
  `br_checkbox_input()` e `br_select_input()` (cherry-pick do
  upstream).
* Estratégia upstream definida: cherry-pick de ideias pontuais, sem
  merge (o core do pacote agora é o GovBR DS nativo).
* Novos componentes: `br_accordion()`, `br_tabs()`, `br_card()`,
  `br_table()`, `br_modal()`, `br_notification()`, `br_loading()`,
  `br_magic_button()`, `br_breadcrumb()`, `br_tooltip()`, `br_upload()`
  (input de arquivo com binding nativo do Shiny), `br_pagination()`,
  `br_step()` e `br_signin()`.
* `br_date_input()` agora retorna `Date` no servidor (binding próprio com
  tipo `shiny.date`); `br_tabs()` expõe o índice do tab ativo em
  `input$` e `br_pagination()`/`br_step()` também são inputs.
* Funções de atualização server-side: `update_br_text_input()`,
  `update_br_textarea_input()`, `update_br_radio_input()`,
  `update_br_checkbox_input()`, `update_br_select_input()`,
  `update_br_date_input()`, `update_br_tabs()`,
  `update_br_pagination()` e `update_br_step()`.
* Header corrigido para incluir o gatilho de menu exigido pelo
  JavaScript oficial do GovBR (`menuTrigger`); a inicialização JS é
  isolada por componente para que um markup incompleto não impeça os
  demais.
* Todas as 42 funções herdadas do GOV.UK foram marcadas como obsoletas:
  emitem aviso (uma vez por sessão) apontando para a família `br_*` e
  serão removidas em versão futura.
* App de exemplo (`run_example()`) reescrito usando exclusivamente a
  família `br_*`.
* Workflow de deploy do app de exemplo corrigido (instalava o pacote
  upstream) e CONTRIBUTING.md reescrito para o fluxo GovBR.
* README e DESCRIPTION reescritos para a família `br_*`; URLs
  atualizadas para a organização DistintiveLab.

# shinyGovBRstyle 0.2.0

* Nova família de componentes `br_*` construída com os assets oficiais do
  Design System GovBR v3.7.0 (`core.min.css`/`core.min.js`), classes reais
  `br-*` e bindings nativos do Shiny: `use_govbr()`, `br_header()`,
  `br_footer()`, `br_layout()`, `br_button()`, `br_text_input()`,
  `br_textarea_input()`, `br_date_input()`, `br_select_input()`,
  `br_checkbox_input()`, `br_radio_input()`, `br_message()`, `br_tag()`,
  `br_divider()` e `br_skiplink()`.
* Assets do GovBR DS e Font Awesome 5.11.2 agora são servidos localmente
  (funciona offline; sem dependência de CDN).
* Fonte Rawline registrada com caminhos corrigidos (`rawline.css`).
* Componentes JS do GovBR são re-inicializados automaticamente quando o
  Shiny renderiza UI dinâmica (`govbr-shiny.js`).
* As funções antigas herdadas do GOV.UK continuam disponíveis, mas devem
  ser consideradas obsoletas; a migração para a família `br_*` está
  documentada no ROADMAP.md.

# shinyGovBRstyle 0.1.0

* Update the css to v5.4.0 and made fixes associated with that.
* No longer requires rem remover step to update for future changes
* One of the major changes in the css is a change in look and functionality for the accordion. Show/hide all works as expected now.
* Another major change to how the radio buttons look and feel, in line with the v5.4.0 design examples.
* Added additional functions to the `run_example` for ease of testing
* Added the contents_links() function as a helper for getting the styling and behaviour for left navigation


# shinyGovBRstyle 0.0.8

* Update the css to v4.0.0 and made fixes associated with that.
* One of the major changes in the css is a change in look for the accordion.
* Added new functions `gov_main_layout`, `gov_row`, `gov_box` and `gov_text` to 
give better control over the layouts.
* Added tabs as a component using the `govTab` command
* Added summary list as a component using the `gov_summary` command
* Added error summary component (`error_summary`) and error summary 
update (`error_summary_update`)


# shinyGovBRstyle 0.0.7

* Improved the header so that you can adjust the logo size to suit
* Fix some errors that appeared in the footer
* Fix the word count function so that you only need to enter word count limit 
  on the `text_area` function.  You can change the limit on `word_count` if 
  needed.
* Change the `run_example` to a better versions that show more ways you can you
  the package.
* Change the `backlink_Input` to a button so that you can use server to move
  between panels etc.
* Added tags through the `tag_Input` function plus added to the `use_example`.
* Added cookie banner through the `cookieBanner` function.
* Added accordion through the `accordion` function.
* Added tables through the `govTable` function.

# shinyGovBRstyle 0.0.6

* Fix minor bugs from the issues list including data default and radio default
* Added units test
* Added an example function
* Added a `NEWS.md` file to track changes to the package.
* Added a notification banner function
* Got ready for CRAN release.
* Added output value to the documentation
