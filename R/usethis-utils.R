# Code in this file was taken and modified from the usethis package.
# Below is the license statement from usethis.
#
# # MIT License
#
# Copyright (c) 2020 usethis authors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
#     The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Taken from usethis package and slightly modified
update_template <- function(template,
                            save_as = template,
                            data = list()) {
    template_contents <-
        base::strsplit(whisker::whisker.render(read_utf8(template_path),
                                               data), "\n")[[1]]
    new <- base::writeLines(template_contents, save_as)
    invisible(new)
}

# Taken from usethis package and modified to this package.
find_template <- function(...) {
    fs::path_package(package = "prodigenr", "templates", ...)
}

# Taken from usethis package
read_utf8 <- function(path, n = -1L) {
    base::readLines(path, n = n, encoding = "UTF-8", warn = FALSE)
}

# Taken from usethis:::uses_git
has_git <- function(project_path = ".") {
    repo <- tryCatch(gert::git_find(project_path), error = function(e) NULL)
    !is.null(repo)
}
