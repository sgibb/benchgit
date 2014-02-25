\name{benchgit}
\alias{benchgit}
\title{Benchmarking different git branches}
\usage{
benchgit(FUN, packagePath = ".", branches, replications = 100)
}
\arguments{
  \item{FUN}{\code{expression}, function to run.}

  \item{packagePath}{\code{character}, path to the package
  dir (which have to be git controlled)}

  \item{branches}{\code{character}, name of the branches
  which should be compared.}

  \item{replications}{\code{numeric}, how many times the
  \code{FUN} should be evaluated.}
}
\value{
an ordered \code{data.frame} where each row represents a
branch.
}
\description{
This function allows the benchmarking of R functions in
different git branches.
}
\examples{
library("benchgit")

\dontrun{
 x <- runif(100)
 benchgit(my_fun(x), packagePath="~/mypackage",
 branches=c("master", "foo", "bar"))
}
}
\author{
Sebastian Gibb
}

