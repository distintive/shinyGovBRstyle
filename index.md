# shinyGovBRstyle

> Componentes Shiny com o Design System oficial do GovBR

## Visão geral

O `shinyGovBRstyle` fornece funções para construir aplicações Shiny com
o [Design System do Governo Federal (GovBR
DS)](https://www.gov.br/ds/home). Os componentes da família `br_*` usam
os assets oficiais (`core.min.css`/`core.min.js` v3.7.0, classes
`br-*`), servidos **localmente** — funcionam offline, sem CDN — e
integram-se aos bindings nativos do Shiny (radios/checkbox por `name`,
texto/data por `id`, botões como `action-button`).

> Histórico: este pacote começou como um fork do `shinyGovstyle`
> (GOV.UK). As funções herdadas do GOV.UK foram deprecadas na 0.2.0 e
> **removidas na 1.0.0**; o pacote agora contém apenas a família `br_*`.

## Instalação

``` r

# versão de desenvolvimento
remotes::install_github("DistintiveLab/shinyGovBRstyle")
```

## Uso

``` r

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

``` r

shinyGovBRstyle::run_example()
```

O mesmo app também está disponível online em
<https://shinygovbr.distintive.com.br/>.

## Componentes

### Estrutura

| Função | Componente GovBR | Observações |
|----|----|----|
| [`use_govbr()`](https://distintivelab.github.io/shinyGovBRstyle/reference/use_govbr.md) | — | CSS/JS/fontes, chame uma vez no UI |
| [`br_header()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_header.md) | Header | logo, assinatura, título, busca opcional |
| [`br_footer()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_footer.md) | Footer | categorias de links opcionais |
| [`br_layout()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_layout.md) | Grid | `container-lg/md/sm/fluid` |
| [`br_skiplink()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_skiplink.md) | Skiplink | acessibilidade (tecla Tab) |
| [`br_breadcrumb()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_breadcrumb.md) | Breadcrumb | trilha de navegação |

### Entradas

| Função | Valor em `input$` |
|----|----|
| [`br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_text_input.md) | texto |
| [`br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_textarea_input.md) | texto |
| [`br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_date_input.md) | `Date` |
| [`br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_select_input.md) | valor (simples) ou vetor (múltiplo) |
| [`br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_radio_input.md) | valor |
| [`br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_checkbox_input.md) | `TRUE/FALSE` (simples) ou vetor (grupo) |
| [`br_upload()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_upload.md) | data frame de arquivos (como `fileInput`) |

### Ações e feedback

| Função | Uso |
|----|----|
| [`br_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_button.md) | botão de ação (5 tipos, ícone, bloco, círculo) |
| [`br_magic_button()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_magic_button.md) | botão flutuante |
| [`br_signin()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_signin.md) | botão “Entrar” |
| [`br_message()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_message.md) | alerta info/success/warning/danger |
| [`br_notification()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_notification.md) | painel de notificações |
| [`br_loading()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_loading.md) | spinner ou barra de progresso |
| [`br_tooltip()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tooltip.md) | dica contextual |
| [`br_modal()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_modal.md) | diálogo modal |

### Conteúdo e navegação

| Função | Uso |
|----|----|
| [`br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tabs.md) | abas (índice ativo em `input$`, [`update_br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md)) |
| [`br_accordion()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_accordion.md) | acordeões expansíveis |
| [`br_card()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_card.md) | cartões com cabeçalho/rodapé opcionais |
| [`br_table()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_table.md) | tabelas a partir de data frame/matriz |
| [`br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_step.md) | indicador de etapas |
| [`br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_pagination.md) | paginação (página atual em `input$`) |
| [`br_tag()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_tag.md) | etiquetas |
| [`br_divider()`](https://distintivelab.github.io/shinyGovBRstyle/reference/br_divider.md) | separadores |

### Atualização server-side

[`update_br_text_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_textarea_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_radio_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_checkbox_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_select_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_date_input()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_tabs()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_pagination()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md),
[`update_br_step()`](https://distintivelab.github.io/shinyGovBRstyle/reference/update_br_inputs.md).

## Contribuindo

Sugestões e bugs: [abra uma
issue](https://github.com/DistintiveLab/shinyGovBRstyle/issues).
Detalhes de desenvolvimento em
[CONTRIBUTING.md](https://distintivelab.github.io/shinyGovBRstyle/CONTRIBUTING.md)
e no
[ROADMAP.md](https://distintivelab.github.io/shinyGovBRstyle/ROADMAP.md).
Código de Conduta do colaborador em
[CODE_OF_CONDUCT.md](https://distintivelab.github.io/shinyGovBRstyle/CODE_OF_CONDUCT.md).
