# prodigenr 0.4.0

## New feature

* Added an RStudio addin (`render_docs()`) for rendering all the `doc/.Rmd`
files (#31).
* Use RMarkdown template files to draft the posters, slides, manuscripts, and 
abstract (#70, #75). See `create_*` type commands.
* New function to setup a general project, but excluding the individual document 
types such manuscript, slides, etc (#72). `prodigen` function is deprecated.
* READMEs in each folder and section to fill out in main README for the project
description (#38, #80).

## Minor fixes

* Added additional information to template README.md (#29, #30, #32)
* Moved `include_*()` functions over into [rostools](https://github.com/lwjohnst86/rostools) (#96)

## Misc additions

* Todo items to created README
* Added code coverage #65

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


