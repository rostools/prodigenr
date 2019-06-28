quiet_test <- function(func) {
    capture_output(func)
}

new_project <- fs::path_temp("testing")
capture_output(setup_project(new_project))
