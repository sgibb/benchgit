#' Benchmarking different git branches
#'
#' This function allows the benchmarking of R functions in different
#' git branches.
#'
#' @param FUN \code{expression}, function to run.
#' @param packagePath \code{character}, path to the package dir (which have to
#' be git controlled)
#' @param branches \code{character}, name of the branches which should be
#' compared.
#' @param replications \code{numeric}, how many times the \code{FUN} should be
#' evaluated.
#'
#' @return an ordered \code{data.frame} where each row represents a branch.
#' @author Sebastian Gibb
#' @examples
#'
#' library("benchgit")
#'
#' \dontrun{
#'  x <- runif(100)
#'  benchgit(my_fun(x), packagePath="~/mypackage",
#'  branches=c("master", "foo", "bar"))
#' }
#'
#' @rdname benchgit
#' @export

benchgit <- function(FUN, packagePath=".", branches, replications=100) {
  fun <- match.call()[-1][["FUN"]]
  results <- sapply(branches, .benchbranch,
                    packagePath=packagePath,
                    fun=fun,
                    replications=replications)
  relative <- results/min(results)
  df <- data.frame(elapsed=results,
                   avg=results/replications,
                   relative=round(relative, 2), row.names=branches)
  df[order(relative),]
}

.benchbranch <- function(branch, packagePath, fun, replications) {
  wd <- getwd()
  setwd(packagePath)
  curBranch <- git_current_branch()
  git_checkout(branch)
  load_all()
  m <- .bench(fun, replications)
  unload(packagePath)
  git_checkout(curBranch)
  setwd(wd)
  m
}

.bench <- function(fun, replications=100) {
  system.time(replicate(replications, { eval(fun); NULL }))[3]
}

