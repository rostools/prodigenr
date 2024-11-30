# These are for admin tasks that really only need to be done once or twice

@_default:
  just --list --unsorted

# Run build recipes and install the package
build: style document install-package check

# Install the package and its dependencies
install-package:
  #!/usr/bin/Rscript
  devtools::install()

# Re-build Roxygen docs
document:
  #!/usr/bin/Rscript
  devtools::document()

# Run style formatter
style:
  #!/usr/bin/Rscript
  styler::style_pkg()

# Run CRAN check
check:
  #!/usr/bin/Rscript
  devtools::check()
