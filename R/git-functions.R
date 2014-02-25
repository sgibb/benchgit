git_checkout <- function(branch) {
  stopifnot(is.character(branch) && nchar(branch) > 0)
  system(paste("git checkout", branch))
}

git_current_branch <- function() {
  return(system("git rev-parse --abbrev-ref HEAD", intern=TRUE))
}
