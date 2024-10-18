@_default:
    just --list --unsorted

# Run all recipes
run-all: install-package-dependencies document spell-check style lint test build-site check install-package

# Install package dependencies
install-package-dependencies:
  #!/usr/bin/Rscript
  pak::pak(ask = FALSE)

# Run document generators
document: 
  #!/usr/bin/Rscript
  devtools::document()

# Run tests
test: 
  #!/usr/bin/Rscript
  devtools::test()

# Check spelling
spell-check: 
  #!/usr/bin/Rscript
  devtools::spell_check()

# Style all R code
style: 
  #!/usr/bin/Rscript
  styler::style_pkg()

# Run linter
lint: 
  #!/usr/bin/Rscript
  devtools::lint(
  )

# Build pkgdown website
build-site: 
  #!/usr/bin/Rscript
  devtools::build_site()

# Run local CRAN checks
check:
  #!/usr/bin/Rscript
  devtools::check()

# Install prodigenr as a package
install-package: install-package-dependencies
  #!/usr/bin/Rscript
  devtools::install()