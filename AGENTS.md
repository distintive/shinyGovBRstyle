# AGENTS.md

## What this repo is

R package `shinyGovBRstyle`: Shiny UI components for the official Brazilian gov.br design system (GovBR DS). It started as a fork of the UK `shinyGovstyle` package (GOV.UK Frontend). Two component families now coexist:

- **`br_*` family (current)**: built on the real GovBR DS v3.7.0 assets (`inst/www/govbr/core.min.css|js`, classes `br-*`), using native Shiny input bindings.
- **Legacy family (derived from GOV.UK, classes renamed `govbr-`)**: still exported, slated for deprecation/removal (see `ROADMAP.md`).

## Essential commands

This is a standard roxygen2/testthat package. There is no Makefile; run everything from R:

```r
devtools::load_all()    # iterate on package code
devtools::document()    # regenerate NAMESPACE and man/ after editing roxygen comments (RoxygenNote 7.3.2; man/ and NAMESPACE are checked in and generated)
devtools::test()        # run testthat suite (tests/testthat/)
devtools::check()       # full R CMD check (what CI runs)
run_example()           # after load_all(): runs the showcase app in inst/example_app/
```

CI (`.github/workflows/R-CMD-check.yaml`) checks a matrix of macOS/Windows/Ubuntu with release, devel, and oldrel-1 R. PRs should target `master`; squash-merge on merge.

## Architecture / how components work

**New `br_*` family** (one function per file in `R/br_*.R`, e.g. `br_header()`, `br_select_input()`):

- Each function builds `shiny::tags$*` markup per the GovBR DS templates (reference copies in `data-raw/govbr-templates/`, not shipped) and ends with `use_govbr(tag)`, which attaches all dependencies.
- Dependencies (`R/use_govbr.R`): `rawline.css` + Font Awesome 5.11.2 + `govbr/core.min.css`, then `govbr/core.min.js` + `govbr/govbr-shiny.js`. All served locally from `inst/www/` under the URL prefix `shinyGovBRstyle/...` (resource path registered in `R/zzz.R` `.onLoad`).
- `govbr-shiny.js` calls `new window.core.Globals().initInstanceAll()` on load and re-runs it on `shiny:value`/`shiny:bound` so JS-driven components work in dynamically rendered UI.
- Shiny integration uses native bindings: radios/checkbox groups inside containers with class `shiny-input-radiogroup`/`shiny-input-checkboxgroup` and `name = inputId`; text/textarea/date inputs and single checkboxes use `id = inputId`; buttons use `class = "action-button"`. Do not give the individual checkboxes a bare id-only form that duplicates inputs.
- CRITICAL htmltools gotcha: `c(list_of_deps, single_dep)` strips the S3 class of `htmlDependency` — always wrap in `list()` before `attachDependencies()`.
- CRITICAL CSS gotcha: GovBR checkbox/radio CSS uses sibling selectors (`input:checked+label`), so `<label for=...>` must immediately follow `<input>`; wrapping the input in the label breaks the visuals.

**Legacy family**: functions in `R/*.R` (e.g. `button_Input()`) finish with `attachDependency()` (`R/attachDependency.R`), which serves `css/govbr-frontend-test.css` (rawline font classes + CDN import) and optional per-widget JS from `inst/www/js/`.

## Gotchas

- **Stylesheet wiring is not obvious**: `attachDependency.R` serves `govbr-frontend-test.css`, which is currently a small file of rawline font classes plus a CDN `@import`. The large vendored stylesheet `inst/www/css/govbr-frontend-5.7.1.min.css` is *not referenced by any R code*. Do not assume editing the `.min.css` affects apps.
- **CSS overrides are logged, not versioned in code**: manual CSS tweaks needed when updating the vendored design-system CSS are recorded in `css_changes.md` (Rbuildignored) and must be reapplied by hand on each update. Always append changes there.
- **Upstream leftovers**: `.github/CONTRIBUTING.md` and `.github/workflows/example-app-deploy.yaml` still reference the upstream repos (`moj-analytical-services/shinyGovstyle`, `dfe-analytical-services/shinyGovstyle`) and the old `govuk-frontend-norem.css` filename. The deploy workflow currently deploys the *upstream* package's example app, not this one's.
- **Naming is inconsistent by design/history**: file names are lowercase snake_case (`R/checkbox_input.R`, `R/select_input.R`) but the functions inside use a capitalized `Input` suffix (`checkbox_Input()`, `select_Input()`, `button_Input()`, `text_area_Input()`). Test file names don't always match function names (e.g. `test-gov_button.R` tests `button_Input()`; `test-subcontents_links.R` tests `contents_link()`). Match the existing file you are editing rather than "fixing" naming globally.
- **`contents_link()` requires fixed DOM IDs** (`nav`, `govbr-contents-box` + class, `main-col`, `tab-container`) for its JS to work — documented with a template in README.md.
- The `%>%` pipe is re-exported (`R/utils-pipe.R`, `export("%>%")`); pipe chains are used in some helpers.

## Testing patterns

- Unit tests assert directly on tag structure: `button$attribs$id`, `button$attribs$class`, `button$children[[1]]` (see `tests/testthat/test-br_button.R`). Follow this style rather than snapshot tests.
- `tests/testthat/test-example_app.R` runs the example app's own shinytest2 `AppDriver` tests (in `inst/example_app/tests/`) with `skip_on_cran()`.
- New components should get a `tests/testthat/test-br_<component>.R` file; exported functions need roxygen `@export`, `@return` and an `if (interactive())` example.

## Docs / release

- README.md contains a per-component walkthrough with screenshots (`man/figures/`) — update it and `NEWS.md` when adding/changing components.
- pkgdown site built by CI from `_pkgdown.yml` (minimal config) and deployed to gh-pages.
- DESCRIPTION: R >= 3.5, GPL-3, version currently 0.1.0. `cran-comments.md` is Rbuildignored, kept for CRAN submissions.
