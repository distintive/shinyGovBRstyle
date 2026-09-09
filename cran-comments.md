## Release summary

Versão 0.2.0: nova família de componentes `br_*` construída sobre os
assets oficiais do Design System GovBR (v3.7.0), servidos localmente;
inputs com bindings nativos do Shiny; funções herdadas do GOV.UK
depreciadas.

## Test environments

- local: Ubuntu 24.04, R 4.5.2
- GitHub Actions (`.github/workflows/R-CMD-check.yaml`): macOS, Windows
  e Ubuntu (release, devel, oldrel-1)

## R CMD check results

0 errors | 0 warnings | 0 notes

O tamanho do pacote instalado é de aproximadamente 8.4 MB, devido aos
assets do GovBR DS (CSS/JS), Font Awesome e fonte Rawline (apenas
woff2/woff) servidos localmente. O pacote evita CDN de propósito para
que aplicações Shiny funcionem offline.

## revdepcheck results

Não há dependências reversas.
