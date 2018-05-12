
include_readmes <- function() {
    copy_template_file('README.md')
    fs::dir_create("doc")
    copy_template_file('doc-README.md', file.path("doc", "README.md"))
    fs::dir_create("data")
    copy_template_file('data-README.md', file.path("data", "README.md"))
    copy_template_file("R-README.md", file.path("R", "README.md"))
    done('Adding several ', value('README.md'), ' files to the project.')
}

include_r_files <- function() {
    copy_template_file("setup.R", file.path("R", "setup.R"))
    copy_template_file("fetch_data.R", file.path("R", "fetch_data.R"))
    done('Adding some basic R functions to the ', value('R/'), ' folder.')
}
