# Contribuindo com o shinyGovBRstyle

Ideias e correções devem primeiro ser registradas como uma [issue no
GitHub](https://github.com/DistintiveLab/shinyGovBRstyle/issues); em
seguida qualquer pessoa pode escrever o código e abrir um pull request
para revisão.

Para apoio sobre desenvolvimento de pacotes em R, recomendamos o guia [R
Packages (2e)](https://r-pkgs.org/).

## Estrutura do pacote

O pacote contém duas famílias de componentes:

- **Família `br_*` (atual)**: construída sobre os assets oficiais do
  Design System GovBR ([@govbr-ds/core](https://www.gov.br/ds/home)),
  servidos localmente de `inst/www/govbr/`. Use esta família em novos
  componentes — veja `ROADMAP.md` para as convenções.
- **Família legada (derivada do GOV.UK)**: depreciada desde a versão
  0.2.0 (emite aviso) e programada para remoção. Não adicione recursos a
  ela.

## Fluxo de trabalho

1.  Novas mudanças devem ser feitas em um branch a partir da versão mais
    recente de `master`.
2.  PRs devem apontar para `master`; ao merge, usar squash para manter o
    histórico enxuto.
3.  Rode `devtools::document()`, `devtools::test()` e
    `devtools::check()` antes de abrir o PR.
4.  Novos componentes `br_*` precisam de arquivo próprio em
    `R/br_<componente>.R`, teste espelhado em
    `tests/testthat/test-br_<componente>.R`, roxygen com `@export`,
    `@return` e exemplo `if (interactive())`.
5.  Atualize `NEWS.md` e, se o componente mudar visualmente, o
    `README.md`.

## Atualizando o Design System GovBR

Os assets são cópias estáticas da distribuição do `@govbr-ds/core`
(atualmente v3.7.0). Passos para atualizar:

1.  Localize a versão desejada no
    [jsDelivr](https://www.jsdelivr.com/package/npm/@govbr-ds/core).
2.  Baixe `core.min.css` e `core.min.js` para `inst/www/govbr/`,
    sobrescrevendo os existentes.
3.  Atualize a versão registrada em `R/use_govbr.R` (dependencies
    `govbr-core-css`/`govbr-core-js`).
4.  Confira os templates de referência em `data-raw/govbr-templates/`
    (baixe os novos se necessário) e valide os markups dos componentes.
5.  Rode `devtools::check()` e teste o app de exemplo com
    [`shinyGovBRstyle::run_example()`](reference/run_example.md).

Se inseguro sobre a aparência esperada, consulte a documentação oficial
dos componentes em <https://www.gov.br/ds/components>.

## Código de Conduta

Este projeto é distribuído com um [Código de Conduta do
Colaborador](CODE_OF_CONDUCT.md). Ao contribuir, você concorda com seus
termos.
