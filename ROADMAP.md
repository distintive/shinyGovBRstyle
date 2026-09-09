# Roadmap — shinyGovBRstyle

Objetivo: transformar o fork do pacote britânico `shinyGovstyle` em uma
implementação **nativa** do Design System do GovBR (https://www.gov.br/ds/home)
para Shiny, completa o suficiente para publicação no CRAN.

## Situação inicial (diagnóstico, set/2026)

- O pacote era o `shinyGovstyle` (GOV.UK Frontend) com classes renomeadas
  de `govuk-` para `govbr-`. **Não usava os assets reais do GovBR DS.**
- `attachDependency.R` apontava para `govbr-frontend-test.css` (apenas
  classes de fonte), e o `govbr-frontend-5.7.1.min.css` (na verdade GOV.UK
  5.7.1 renomeado) não era referenciado por código R algum.
- CI de deploy do app de exemplo apontava para o repositório upstream.
- Nomenclatura inconsistente (mistura `button_Input`/`checkbox_input`).

## Fase 1 — Fundação (concluída nesta iteração)

- [x] Baixar assets oficiais do GovBR DS v3.7.0 (`@govbr-ds/core`) para
      `inst/www/govbr/`: `core.min.css`, `core.min.js`.
- [x] Font Awesome 5.11.2 local (`inst/www/fontawesome/`) — exigido pelos
      ícones dos componentes.
- [x] `rawline.css` gerado apontando para as fontes locais
      (`inst/www/fonts/`) — o `font.css` antigo apontava para `../font/`
      (caminho inexistente).
- [x] `govbr-shiny.js`: inicializa componentes via `new core.Globals()
      .initInstanceAll()` no load e re-inicializa em `shiny:value`/
      `shiny:bound` (UI dinâmica). Inclui binding próprio para grupos de
      checkbox (`data-govbr-checkbox-group`).
- [x] `use_govbr()`: anexa todas as dependências de uma vez no UI.
- [x] Templates oficiais de referência salvos em
      `data-raw/govbr-templates/` (não entram no build).

## Fase 2 — Componentes essenciais (família `br_*`)

Nova família de funções com prefixo `br_`, marcado `snake_case`, usando as
classes reais (`br-header`, `br-input`, `br-button`, ...) e os bindings
nativos do Shiny sempre que possível (radio/checkbox por `name`, texto e
data por `id`, botão via `action-button`).

**Concluídos nesta iteração:**

- [x] `br_header()` — cabeçalho completo (logo, assinatura, título,
      subtítulo, busca opcional)
- [x] `br_footer()` — rodapé com categorias de links opcionais
- [x] `br_button()` — tipos primary/secondary/success/warning/danger,
      block, círculo, densidades
- [x] `br_text_input()`, `br_textarea_input()`, `br_date_input()`
- [x] `br_select_input()` — simples e múltiplo (br-select + br-list)
- [x] `br_checkbox_input()` — simples (TRUE/FALSE) e grupo (vetor)
- [x] `br_radio_input()`
- [x] `br_message()` — info/success/warning/danger
- [x] `br_tag()`, `br_divider()`, `br_skiplink()`
- [x] `br_layout()` — containers do GovBR (container-lg/md/sm/full)

**Pendentes (próximas iterações):**

- [x] `br_accordion()`, `br_tabs()`, `br_table()` ( GovBR Table com JS)
- [x] `br_breadcrumb()`, `br_card()`, `br_modal()`, `br_notification()`
- [x] `br_upload()`, `br_magic_button()`, `br_loading()`, `br_tooltip()`
- [x] `br_pagination()`, `br_step()`, `br_signin()`
- [x] Bindings mais ricos: `br_date_input()` retornando `Date`,
      `br_tabs()`/`br_pagination()`/`br_step()` como inputs e update
      functions (`update_br_*`)
- [x] App de exemplo (`run_example()`) migrado para a família `br_*`

## Fase 3 — Limpeza e deprecação

- [x] Marcar funções antigas (derivadas do GOV.UK) como obsoletas: aviso
      uma vez por sessão via `govbr_deprecated()` + nota nos `.Rd`.
- [x] Remover as 24 funções sem transposição para o GovBR (0.4.0) e os
      assets órfãos do GOV.UK (CSS/JS grandes, logos, capturas).
- [x] Remover as 18 funções legadas restantes e todos os assets UK
      (concluído na 1.0.0).
- [ ] Remover assets do GOV.UK (`govbr-frontend-5.7.1.min.css`,
      `govbr-frontend-5.4.0.min.js`, fontes GOV.UK, `govbr-frontend-test.css`)
      quando as funções antigas forem removidas (meta: v1.0.0).
- [x] Corrigir o workflow `example-app-deploy.yaml` (hoje publica o pacote
      upstream, não este).
- [x] Atualizar `CONTRIBUTING.md` (ainda descreve o fluxo do GOV.UK).

## Fase 4 — Publicação no CRAN

- [x] `DESCRIPTION`: bump para 0.2.0, descrição expandida,
      `URL`/`BugReports` apontando para a organização DistintiveLab.
- [x] Todos os `@export` com `@return` e exemplo `if (interactive())`.
- [x] `R CMD check --as-cran` sem ERROR/WARNING/NOTE.
- [x] `README.md` reescrito para a família `br_*`.
- [x] ~~Definir os segredos `SHINYAPPS_NAME/TOKEN/SECRET`~~ workflow de
      deploy removido: o app de demonstração será hospedado em
      instância Shiny própria (sem dependência de shinyapps.io).
- [x] Publicar o app de exemplo na instância Shiny própria e incluir o
      link no README (https://shinygovbr.distintive.com.br/).
- [x] Correções pós-deploy: `br_select_input()` múltiplo com
      `multiple="multiple"` (lista permanece aberta, seleção por clique
      simples); `br_table()` reescrito com a estrutura oficial
      (`.table-header`/`.table-title` + `data-th`) para sobreviver ao JS
      do componente; `govbr-compat.css` neutraliza conflitos de
      especificidade com o Bootstrap do `fluidPage()`.
- [x] Atualizar `cran-comments.md` (submissão via `devtools::release()`
      ainda pendente — ação do mantenedor).

## Convenções da nova família `br_*`

- Arquivo por função em `R/br_<componente>.R`, teste espelhado em
  `tests/testthat/test-br_<componente>.R`.
- Sempre terminar com `use_govbr()` implícito: cada componente anexa as
  dependências via `htmltools::attachDependencies()` (o usuário também
  pode chamar `use_govbr()` explicitamente no topo do UI).
- Shiny bindings nativos: radios/checkbox-group usam `name = inputId`;
      inputs de texto/data usam `id = inputId`; botões usam
      `class = "action-button"`.
- Referência de markup: `data-raw/govbr-templates/` e
      https://www.gov.br/ds/components
