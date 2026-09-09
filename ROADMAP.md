# Roadmap — shinyGovBRstyle

Objetivo: transformar o fork do pacote britânico `shinyGovstyle` em uma
implementação **nativa** do Design System do GovBR
(<https://www.gov.br/ds/home>) para Shiny, completa o suficiente para
publicação no CRAN.

## Situação inicial (diagnóstico, set/2026)

- O pacote era o `shinyGovstyle` (GOV.UK Frontend) com classes
  renomeadas de `govuk-` para `govbr-`. **Não usava os assets reais do
  GovBR DS.**
- `attachDependency.R` apontava para `govbr-frontend-test.css` (apenas
  classes de fonte), e o `govbr-frontend-5.7.1.min.css` (na verdade
  GOV.UK 5.7.1 renomeado) não era referenciado por código R algum.
- CI de deploy do app de exemplo apontava para o repositório upstream.
- Nomenclatura inconsistente (mistura `button_Input`/`checkbox_input`).

## Fase 1 — Fundação (concluída nesta iteração)

Baixar assets oficiais do GovBR DS v3.7.0 (`@govbr-ds/core`) para
`inst/www/govbr/`: `core.min.css`, `core.min.js`.

Font Awesome 5.11.2 local (`inst/www/fontawesome/`) — exigido pelos
ícones dos componentes.

`rawline.css` gerado apontando para as fontes locais (`inst/www/fonts/`)
— o `font.css` antigo apontava para `../font/` (caminho inexistente).

`govbr-shiny.js`: inicializa componentes via
`new core.Globals() .initInstanceAll()` no load e re-inicializa em
`shiny:value`/ `shiny:bound` (UI dinâmica). Inclui binding próprio para
grupos de checkbox (`data-govbr-checkbox-group`).

[`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md):
anexa todas as dependências de uma vez no UI.

Templates oficiais de referência salvos em `data-raw/govbr-templates/`
(não entram no build).

## Fase 2 — Componentes essenciais (família `br_*`)

Nova família de funções com prefixo `br_`, marcado `snake_case`, usando
as classes reais (`br-header`, `br-input`, `br-button`, …) e os bindings
nativos do Shiny sempre que possível (radio/checkbox por `name`, texto e
data por `id`, botão via `action-button`).

**Concluídos nesta iteração:**

[`br_header()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_header.md)
— cabeçalho completo (logo, assinatura, título, subtítulo, busca
opcional)

[`br_footer()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_footer.md)
— rodapé com categorias de links opcionais

[`br_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_button.md)
— tipos primary/secondary/success/warning/danger, block, círculo,
densidades

[`br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_text_input.md),
[`br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_textarea_input.md),
[`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md)

[`br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_select_input.md)
— simples e múltiplo (br-select + br-list)

[`br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_checkbox_input.md)
— simples (TRUE/FALSE) e grupo (vetor)

[`br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_radio_input.md)

[`br_message()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_message.md)
— info/success/warning/danger

[`br_tag()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tag.md),
[`br_divider()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_divider.md),
[`br_skiplink()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_skiplink.md)

[`br_layout()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_layout.md)
— containers do GovBR (container-lg/md/sm/full)

**Pendentes (próximas iterações):**

[`br_accordion()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_accordion.md),
[`br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tabs.md),
[`br_table()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_table.md)
( GovBR Table com JS)

[`br_breadcrumb()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_breadcrumb.md),
[`br_card()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_card.md),
[`br_modal()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_modal.md),
[`br_notification()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_notification.md)

[`br_upload()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_upload.md),
[`br_magic_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_magic_button.md),
[`br_loading()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_loading.md),
[`br_tooltip()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tooltip.md)

[`br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_pagination.md),
[`br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_step.md),
[`br_signin()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_signin.md)

Bindings mais ricos:
[`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md)
retornando `Date`,
[`br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tabs.md)/[`br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_pagination.md)/[`br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_step.md)
como inputs e update functions (`update_br_*`)

App de exemplo
([`run_example()`](https://distintivelab.github.io/shinyGovBRstyle/reference/run_example.md))
migrado para a família `br_*`

## Fase 3 — Limpeza e deprecação

Marcar funções antigas (derivadas do GOV.UK) como obsoletas: aviso uma
vez por sessão via `govbr_deprecated()` + nota nos `.Rd`.

Remover as 24 funções sem transposição para o GovBR (0.4.0) e os assets
órfãos do GOV.UK (CSS/JS grandes, logos, capturas).

Remover as 18 funções legadas restantes (têm equivalente `br_*`) e o
stylesheet legado `govbr-frontend-test.css` na v1.0.0.

Remover assets do GOV.UK (`govbr-frontend-5.7.1.min.css`,
`govbr-frontend-5.4.0.min.js`, fontes GOV.UK, `govbr-frontend-test.css`)
quando as funções antigas forem removidas (meta: v1.0.0).

Corrigir o workflow `example-app-deploy.yaml` (hoje publica o pacote
upstream, não este).

Atualizar `CONTRIBUTING.md` (ainda descreve o fluxo do GOV.UK).

## Fase 4 — Publicação no CRAN

`DESCRIPTION`: bump para 0.2.0, descrição expandida, `URL`/`BugReports`
apontando para a organização DistintiveLab.

Todos os `@export` com `@return` e exemplo `if (interactive())`.

`R CMD check --as-cran` sem ERROR/WARNING/NOTE.

`README.md` reescrito para a família `br_*`.

~~Definir os segredos `SHINYAPPS_NAME/TOKEN/SECRET`~~ workflow de deploy
removido: o app de demonstração será hospedado em instância Shiny
própria (sem dependência de shinyapps.io).

Publicar o app de exemplo na instância Shiny própria e incluir o link no
README (<https://shinygovbr.distintive.com.br/>).

Correções pós-deploy:
[`br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_select_input.md)
múltiplo com `multiple="multiple"` (lista permanece aberta, seleção por
clique simples);
[`br_table()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_table.md)
reescrito com a estrutura oficial (`.table-header`/`.table-title` +
`data-th`) para sobreviver ao JS do componente; `govbr-compat.css`
neutraliza conflitos de especificidade com o Bootstrap do `fluidPage()`.

Atualizar `cran-comments.md` (submissão via `devtools::release()` ainda
pendente — ação do mantenedor).

## Convenções da nova família `br_*`

- Arquivo por função em `R/br_<componente>.R`, teste espelhado em
  `tests/testthat/test-br_<componente>.R`.
- Sempre terminar com
  [`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md)
  implícito: cada componente anexa as dependências via
  [`htmltools::attachDependencies()`](https://rstudio.github.io/htmltools/reference/htmlDependencies.html)
  (o usuário também pode chamar
  [`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md)
  explicitamente no topo do UI).
- Shiny bindings nativos: radios/checkbox-group usam `name = inputId`;
  inputs de texto/data usam `id = inputId`; botões usam
  `class = "action-button"`.
- Referência de markup: `data-raw/govbr-templates/` e
  <https://www.gov.br/ds/components>
