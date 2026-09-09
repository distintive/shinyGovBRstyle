# shinyGovBRstyle <img src="man/figures/logo.png" align="right" height="139" style="padding-left: 1rem;" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/DistintiveLab/shinyGovBRstyle/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DistintiveLab/shinyGovBRstyle/actions/workflows/R-CMD-check.yaml)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

> Componentes Shiny com o Design System oficial do GovBR

## Visão geral

O `shinyGovBRstyle` fornece funções para construir aplicações Shiny com o
[Design System do Governo Federal (GovBR DS)](https://www.gov.br/ds/home).
Os componentes da família `br_*` usam os assets oficiais
(`core.min.css`/`core.min.js` v3.7.0, classes `br-*`), servidos
**localmente** — funcionam offline, sem CDN — e integram-se aos bindings
nativos do Shiny (radios/checkbox por `name`, texto/data por `id`,
botões como `action-button`).

> Histórico: este pacote começou como um fork do `shinyGovstyle`
> (GOV.UK). As funções herdadas do GOV.UK foram deprecadas na 0.2.0 e
> **removidas na 1.0.0**; o pacote agora contém apenas a família `br_*`.

## Instalação

```r
# versão de desenvolvimento
remotes::install_github("DistintiveLab/shinyGovBRstyle")
```

## Uso

```r
library(shiny)
library(shinyGovBRstyle)

ui <- fluidPage(
  use_govbr(),                          # CSS + JS + fontes do GovBR
  br_header(title = "Meu Sistema", subtitle = "Protótipo"),
  br_layout(
    br_text_input("nome", "Nome", hint = "Texto auxiliar"),
    br_select_input("uf", "Estado",
                    choices = c("Distrito Federal" = "DF", "São Paulo" = "SP")),
    br_checkbox_input("aceite", "Aceito os termos"),
    br_button("enviar", "Enviar", icon = "fas fa-paper-plane"),
    verbatimTextOutput("resumo")
  ),
  br_footer()
)

server <- function(input, output, session) {
  output$resumo <- renderPrint(
    list(nome = input$nome, uf = input$uf, aceite = input$aceite)
  )
}

shinyApp(ui, server)
```

App de demonstração com todos os componentes:

```r
shinyGovBRstyle::run_example()
```

O mesmo app também está disponível online em
<https://shinygovbr.distintive.com.br/>.

## Componentes

### Estrutura

| Função | Componente GovBR | Observações |
|---|---|---|
| `use_govbr()` | — | CSS/JS/fontes, chame uma vez no UI |
| `br_header()` | Header | logo, assinatura, título, busca opcional |
| `br_footer()` | Footer | categorias de links opcionais |
| `br_layout()` | Grid | `container-lg/md/sm/fluid` |
| `br_skiplink()` | Skiplink | acessibilidade (tecla Tab) |
| `br_breadcrumb()` | Breadcrumb | trilha de navegação |

### Entradas

| Função | Valor em `input$` |
|---|---|
| `br_text_input()` | texto |
| `br_textarea_input()` | texto |
| `br_date_input()` | `Date` |
| `br_select_input()` | valor (simples) ou vetor (múltiplo) |
| `br_radio_input()` | valor |
| `br_checkbox_input()` | `TRUE/FALSE` (simples) ou vetor (grupo) |
| `br_upload()` | data frame de arquivos (como `fileInput`) |

### Ações e feedback

| Função | Uso |
|---|---|
| `br_button()` | botão de ação (5 tipos, ícone, bloco, círculo) |
| `br_magic_button()` | botão flutuante |
| `br_signin()` | botão "Entrar" |
| `br_message()` | alerta info/success/warning/danger |
| `br_notification()` | painel de notificações |
| `br_loading()` | spinner ou barra de progresso |
| `br_tooltip()` | dica contextual |
| `br_modal()` | diálogo modal |

### Conteúdo e navegação

| Função | Uso |
|---|---|
| `br_tabs()` | abas (índice ativo em `input$`, `update_br_tabs()`) |
| `br_accordion()` | acordeões expansíveis |
| `br_card()` | cartões com cabeçalho/rodapé opcionais |
| `br_table()` | tabelas a partir de data frame/matriz |
| `br_step()` | indicador de etapas |
| `br_pagination()` | paginação (página atual em `input$`) |
| `br_tag()` | etiquetas |
| `br_divider()` | separadores |

### Atualização server-side

`update_br_text_input()`, `update_br_textarea_input()`,
`update_br_radio_input()`, `update_br_checkbox_input()`,
`update_br_select_input()`, `update_br_date_input()`,
`update_br_tabs()`, `update_br_pagination()`, `update_br_step()`.

## Contribuindo

Sugestões e bugs: [abra uma issue](https://github.com/DistintiveLab/shinyGovBRstyle/issues).
Detalhes de desenvolvimento em [CONTRIBUTING.md](.github/CONTRIBUTING.md)
e no [ROADMAP.md](ROADMAP.md). Código de Conduta do colaborador em
[CODE_OF_CONDUCT.md](.github/CODE_OF_CONDUCT.md).
