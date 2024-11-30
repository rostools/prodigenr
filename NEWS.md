# prodigenr (development version)

## Features and additions

-   When creating a new `.gitignore`, include `.quarto` and `.DS_Store`
    files (#141) as well as `.Rbuildignore` files (#143).
-   New projects have `.Rproj` set with same options as
    `usethis::use_blank_slate("project")` (#144).
-   New projects have Git added from the beginning, so don't need to use
    `setup_with_git()` (#148).
-   Move `gert` to imports, since it makes more sense that it should be
    a hard dependency as the project is an opinionated project creator
    (#145).

## Fixes and improvements

-   Rename `doc/` to `docs/` in the basic analysis project folder. This
    is to match the semantics that the `docs/` folder usually will have
    more than one document in it (#149).
-   The `title` field in the `DESCRIPTION` file is needed by many
    usethis functions, so it is added to the created `DESCRIPTION` file
    (#137).
-   It isn't always useful to have the report created when the project
    is setup, so adding the report via `create_report()` is removed from
    `project_setup()` (#142).

# prodigenr 0.6.2

## Minor changes and CRAN fixes

-   Removed Distill from imports and from created report, switching to
    using Quarto instead (e.g. with YAML metadata).
-   Removed AppVeyor.
-   Rearranged project creation to copy an internal folder (with
    necessary files) into the specified folder on the users computer.
    This hopefully will make it easier to add other templates later on.
-   Updated package aims to be clearer and more focused.
-   Fixes to CRAN notes about HTML5.

# prodigenr 0.6.1

## Bug fix

-   DESCRIPTION file actually needs a `Package` field (#127).

# prodigenr 0.6.0

## Major changes

-   Removed abstract and poster templates. Abstracts are so small it
    isn't an important addition and (I sense) posters will for a while
    be created with other software tools (e.g. PowerPoint). Plus there
    aren't many mature and well-established poster packages in R at this
    point in time.
-   Tidied up and trim down all the README files and include pointers to
    the prodigenr online documentation instead.
-   Removed R script template files. Projects might be too diverse for
    these template scripts to make sense.
-   Removed several dependencies, including the usethis package.
-   Moved Git initialization setup out into new function called
    `setup_with_git()`.

# prodigenr 0.5.0

## Major change

-   Switch to having only one argument for `setup_project()` called
    `path` (#102)

## Additions

-   Can now use RStudio's "New Project" interface for a GUI creation of
    the project (#109, #111)
-   Setup projects to be "blank slates" (i.e. don't save `.RData`)
    (#105)
-   Add TODO list to project to complete after project creation (#39)

## Hotfix

-   Fix NOTES in CRAN results check for unused dependencies (clipr,
    desc, devtools)

## Misc

-   Remove deprecated `prodigen()` function (#107)
-   Replace current interactive messaging with `usethis::ui_*` functions
-   Reduced opinionated content and moved over to
    [rostools](https://github.com/rostools/rostools) and its
    [manifesto](https://gitlab.com/rostools/manifesto) (#108)
-   Removed some dependencies by using functions from usethis
-   Incorporate `use_template()` instead of custom function (#101)

# prodigenr 0.4.0

## New feature

-   Use RMarkdown template files to draft the posters, slides,
    manuscripts, and abstract (#70, #75). See `create_*` type commands.
-   New function to setup a general project, but excluding the
    individual document types such manuscript, slides, etc (#72).
    `prodigen` function is deprecated.
-   READMEs in each folder and section to fill out in main README for
    the project description (#38, #80).

## Removals

-   Moved `include_*()` functions over into
    [rostools](https://github.com/rostools/rostools) (#96)

## Minor fixes

-   Added additional information to template README.md (#29, #30, #32)

## Misc additions

-   Todo items to created README
-   Added code coverage #65

# prodigenr 0.3.0

## New features/functionality

-   `prodigen()` now creates a new project structure that mimics R
    package development more, specifically `devtools` (since it is well
    documented and actively maintained) (#18, #15, #14). The old style
    has been removed.
-   Added a function to include a
    [STROBE](https://www.strobe-statement.org/) checklist for reporting
    guidelines (#21).
-   Added function to include an `rfigshare` script to send to
    [figshare](https://figshare.com/) (#19).
-   Added function to include a more complete MIT license (#20).

# prodigenr 0.2.7

-   Added a `NEWS.md` file to track changes to the package.
-   Fixed a bug that prevented an Rproj file and the Rprofile files from
    being installed and created.

