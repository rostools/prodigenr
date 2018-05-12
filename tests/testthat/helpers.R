
if (identical(usethis::use_git_config()$user.name, "") |
    is.null(usethis::use_git_config()$user.name)) {
    usethis::use_git_config(
        scope = "project",
        user.name = "travis",
        user.email = "example@fakeemail.com"
    )
}
