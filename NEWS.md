# prodigenr 0.3.0.9000

## New feature

* Added an RStudio addin (`render_docs()`) for rendering all the `doc/.Rmd`
files (#31).
* Use RMarkdown template files to draft the posters, slides, manuscripts, and 
abstract (#70, #77, #75).

## Minor fixes

* Moved all functions commonly loaded in each Rmd file into the `.onLoad`
functionality (#26, #28, #33).
* Added additional information to template README.md (#29, #30, #32)

# prodigenr 0.3.0

## New features/functionality

* `prodigen()` now creates a new project structure that mimics R package development
more, specifically `devtools` (since it is well documented and actively
maintained) (#18, #15, #14). The old style has been removed.
* Added a function to include a [STROBE](http://www.strobe-statement.org/index.php?id=strobe-home) 
checklist for  reporting guidelines (#21).
* Added function to include an `rfigshare` script to send to [figshare](https://figshare.com/) (#19).
* Added function to include a more complete MIT license (#20).

# prodigenr 0.2.7

* Added a `NEWS.md` file to track changes to the package.
* Fixed a bug that prevented an Rproj file and the Rprofile files from being
installed and created.


