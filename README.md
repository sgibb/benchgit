# benchgit

## Description

This package allows to compare the running time of R functions in different git branches.

## Install 

```s
install.packages("devtools")
library("devtools")
install_github("benchgit", "sgibb")
```

## Example

```s
library("benchgit")

x <- runif(100)
benchgit(my_fun(x), packagePath="~/mypackage", 
         branches=c("master", "foo", "bar"), replications=2)

#        elapsed     avg relative
# master   1.722  0.8610     1.00
# bar      6.021  3.0105     3.50
# foo     26.477 13.2385    15.38
```

## Contact

You are welcome to:

* submit suggestions and bug-reports at: <https://github.com/sgibb/benchgit/issues>
* send a pull request on: <https://github.com/sgibb/benchgit/>
* compose an e-mail to: <mail@sebastiangibb.de>
