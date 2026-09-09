library(shiny)
library(shinyGovBRstyle)

dados_frota <- data.frame(
  Veiculo = c("Fiat Strada", "VW Polo", "Chevrolet Onix", "Hyundai HB20",
              "Toyota Corolla", "Jeep Renegade", "Renault Kwid", "Peugeot 208"),
  Ano = c(2021, 2022, 2020, 2023, 2019, 2022, 2021, 2020),
  Consumo = c(13.5, 14.2, 13.9, 14.0, 11.8, 11.2, 15.7, 13.1),
  Quilometragem = c(38200, 21400, 56700, 12800, 78300, 27500, 44100, 61900)
)

shiny::shinyApp(
  ui = shiny::fluidPage(
    title = "ShinyGovBRstyle",
    shiny::tags$head(
      shiny::tags$link(
        rel = "icon",
        type = "image/x-icon",
        href = "shinyGovBRstyle/govbr/favicon.ico"
      )
    ),
    shinyGovBRstyle::use_govbr(),
    shinyGovBRstyle::br_skiplink(c(
      "main-content" = "Ir para o conte\u00fado",
      "footer" = "Ir para o rodap\u00e9"
    )),
    shinyGovBRstyle::br_header(
      title = "shinyGovBRstyle",
      subtitle = "Demonstra\u00e7\u00e3o dos componentes GovBR",
      signature = "GovBR",
      logo = "govbr",
      logo_alt = "Logotipo GovBR",
      search_id = "busca"
    ),
    shinyGovBRstyle::br_layout(
      size = "medium",

      # Mensagens ------------------------------------------------------
      shinyGovBRstyle::br_message(
        title = "Informa\u00e7\u00e3o.",
        body = "Este app demonstra os componentes da fam\u00edlia br_*.",
        type = "info"
      ),
      shiny::tags$br(),

      # Navega\u00e7\u00e3o b\u00e1sica ----------------------------------------------
      shinyGovBRstyle::br_breadcrumb(
        c("In\u00edcio" = "#", "Demonstra\u00e7\u00e3o" = "#")
      ),
      shiny::tags$hr(),

      # Abas -----------------------------------------------------------
      shinyGovBRstyle::br_tabs(
        inputId = "abas",
        titles = c("Entradas", "Componentes", "Tabelas"),
        icons = c("fas fa-keyboard", "fas fa-puzzle-piece", "fas fa-table"),
        panels = list(

          # --- Painel 1: entradas ------------------------------------
          shiny::tags$div(
            class = "row",
            shiny::tags$div(
              class = "col-md-6",
              shinyGovBRstyle::br_text_input(
                "nome", "Nome",
                placeholder = "Digite seu nome",
                hint = "Texto auxiliar para prevenir erros"
              ),
              shinyGovBRstyle::br_textarea_input(
                "obs", "Observa\u00e7\u00f5es",
                placeholder = "Digite suas observa\u00e7\u00f5es"
              ),
              shinyGovBRstyle::br_date_input("data", "Data de nascimento"),
              shinyGovBRstyle::br_select_input(
                "uf", "Estado",
                choices = c(
                  "Distrito Federal" = "DF",
                  "S\u00e3o Paulo" = "SP",
                  "Minas Gerais" = "MG"
                )
              ),
              shinyGovBRstyle::br_select_input(
                "temas", "Temas (m\u00faltipla escolha)",
                choices = c("Tecnologia" = "tec", "Sa\u00fade" = "sau"),
                multiple = TRUE,
                hint = "Segure Ctrl para escolher v\u00e1rios"
              )
            ),
            shiny::tags$div(
              class = "col-md-6",
              shinyGovBRstyle::br_radio_input(
                "tipo", "Tipo de usu\u00e1rio",
                choices = c("Pessoa f\u00edsica" = "pf", "Pessoa jur\u00eddica" = "pj")
              ),
              shinyGovBRstyle::br_checkbox_input("aceite", "Aceito os termos"),
              shinyGovBRstyle::br_checkbox_input(
                "canais", "Canais de contato",
                choices = c("E-mail" = "email", "Telefone" = "tel")
              ),
              shinyGovBRstyle::br_upload("arquivo", "Envio de arquivo"),
              shinyGovBRstyle::br_button(
                "enviar", "Enviar",
                icon = "fas fa-paper-plane"
              ),
              shinyGovBRstyle::br_magic_button(
                "novo", "Adicionar",
                icon = "fas fa-cart-plus",
                size = "small"
              ),
              shinyGovBRstyle::br_signin("entrar", "Entrar")
            )
          ),

          # --- Painel 2: componentes ----------------------------------
          shiny::tags$div(
            shinyGovBRstyle::br_loading(progress = 60),
            shiny::tags$hr(),
            shinyGovBRstyle::br_accordion(
              "faq",
              list(
                "Assuntos" = shiny::p("Conte\u00fado do acorde\u00e3o de assuntos."),
                "Servi\u00e7os" = shiny::p("Conte\u00fado do acorde\u00e3o de servi\u00e7os.")
              )
            ),
            shiny::tags$hr(),
            shinyGovBRstyle::br_step(
              "etapas",
              c("Identifica\u00e7\u00e3o", "Dados", "Confirma\u00e7\u00e3o"),
              initial = 2
            ),
            shiny::tags$hr(),
            shinyGovBRstyle::br_notification(
              title = "Avisos",
              items = c("Alerta um", "Alerta dois"),
              icons = c("fas fa-bell", "fas fa-envelope")
            ),
            shiny::tags$hr(),
            shinyGovBRstyle::br_tooltip(
              shinyGovBRstyle::br_button("dica", "Passo o mouse"),
              text = "Texto de ajuda",
              subtext = "Informa\u00e7\u00f5es adicionais",
              place = "right"
            ),
            shiny::tags$hr(),
            shinyGovBRstyle::br_modal(
              title = "Confirmar a\u00e7\u00e3o",
              shiny::p("Deseja realmente enviar os dados?"),
              footer = shinyGovBRstyle::br_button("okmodal", "Sim")
            )
          ),

          # --- Painel 3: tabelas --------------------------------------
          shiny::tags$div(
            shinyGovBRstyle::br_card(
              title = "Frota de ve\u00edculos",
              shinyGovBRstyle::br_table(
                data = dados_frota,
                title = "Quilometragem e consumo por ve\u00edculo"
              )
            ),
            shiny::tags$hr(),
            shinyGovBRstyle::br_pagination("pag", total = 4, current = 1)
          )
        )
      ),

      # Valores das entradas ------------------------------------------
      shiny::tags$h2("Valores das entradas"),
      shiny::verbatimTextOutput("valores")
    ),
    shinyGovBRstyle::br_footer(
      categories = list(
        "Ajuda" = c("Documenta\u00e7\u00e3o", "Suporte"),
        "Sobre" = c("GovBR DS", "Licen\u00e7a")
      )
    )
  ),

  server = function(input, output, session) {
    output$valores <- shiny::renderPrint({
      list(
        busca = input$busca,
        aba_ativa = input$abas,
        nome = input$nome,
        data = input$data,
        uf = input$uf,
        temas = input$temas,
        tipo = input$tipo,
        aceite = input$aceite,
        canais = input$canais,
        arquivo = if (!is.null(input$arquivo)) input$arquivo$name,
        etapa = input$etapas,
        pagina = input$pag,
        cliques_enviar = input$enviar
      )
    })

    shiny::observeEvent(input$novo, {
      shiny::showNotification("Bot\u00e3o m\u00e1gico clicado!")
    })
  }
)
