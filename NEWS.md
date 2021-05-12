# prodigenr 0.6.0

## Major changes

- Removed abstract and poster templates. Abstracts are so small it isn't
an important addition and (I sense) posters will for a while be created
with other software tools (e.g. PowerPoint). Plus there aren't many 
mature and well-established poster packages in R at this point in time.
- Tidied up and trim down all the README files and include pointers to
the prodigenr online documentation instead.
- Removed R script template files. Projects might be too diverse for
these template scripts to make sense.
- Removed several dependencies, including the usethis package.
- Moved Git initialization setup out into new function called `setup_with_git()`.

# prodigenr 0.5.0

## Major change

- Switch to having only one argument for `setup_project()` called `path` (#102)

## Additions

- Can now use RStudio's "New Project" interface for a GUI creation of the project (#109, #111)
- Setup projects to be "blank slates" (i.e. don't save `.RData`) (#105)
- Add TODO list to project to complete after project creation (#39)

## Hotfix

- Fix NOTES in CRAN results check for unused dependencies (clipr, desc, devtools)

## Misc

- Remove deprecated `prodigen()` function (#107)
- Replace current interactive messaging with `usethis::ui_*` functions
- Reduced opinionated content and moved over to [rostools](https://github.com/rostools/rostools)
and its [manifesto](https://gitlab.com/rostools/manifesto) (#108)
- Removed some dependencies by using functions from usethis
- Incorporate `use_template()` instead of custom function (#101)

# prodigenr 0.4.0

## New feature

* Use RMarkdown template files to draft the posters, slides, manuscripts, and 
abstract (#70, #75). See `create_*` type commands.
* New function to setup a general project, but excluding the individual document 
types such manuscript, slides, etc (#72). `prodigen` function is deprecated.
* READMEs in each folder and section to fill out in main README for the project
description (#38, #80).

## Removals

* Moved `include_*()` functions over into [rostools](https://github.com/rostools/rostools) (#96)

## Minor fixes

* Added additional information to template README.md (#29, #30, #32)

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


