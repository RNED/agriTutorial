#' @name agriTutorial
#' @title Tutorial analysis of designed agricultural experiments
#' @aliases agritutorial
#' @docType package
#' @description
#' The \code{agri.tutorial} package
#' provides software support for the example analyses discussed in
#' Piepho and Edmondson (2017).
#' The package includes five real data sets from practical experiments and explores
#' the analysis of these data sets using modern statistical methodolgy.
#'
#' @details
#'
#' \strong{Code}
#' The code for the examples can be copied and pasted into any R console terminal window.
#' Textual output should appear in the gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in the gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' The code for opening and closing .txt files and .pdf files is shown commented-out by hashes in
#' the example programs but can copied and edited without the hashes, if required
#' (hashed code is ignored by R).
#'
#' The "dontrun" tags in the examples stops code executing during package testing and can be ignored in practise.
#'
#' \strong{Polynomials}
#' Polynomials in this tutorial are either raw or orthogonal polynomials. Raw polynomials are the actual powers of
#' a numeric vector whereas orthogonal polynomials are functions which account for the succesive powers of a numeric
#' vector but which are orthogonal to lower-degree powers. Raw polynomials are simpler to interpret than
#' orthogonal polynomials but can become numerically unstable for higher-degree powers of large vectors.
#'
#' \strong{Functional marginality}
#' Functional marginality requires that a polynomial term of given degree can be included in a model only if
#' all polynomial terms of lower degree are also included in the model. Functional marginality applies to
#' any response surface design including designs with polynomial interaction effects (Nelder, 2000) and in
#' this tutorial all polynomial models and response surface designs will obey the rules of functional marginality.
#'
#' \strong{Packages}
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the example code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2 and these should install automatically, if necessary. Packages can also be installed either from
#' a gui tools menu or from an install.packages() command.
#'
#' NB. It is important to keep packages updated using the update.packages() command.
#'
#' \strong{Examples}
#' \enumerate{
#' \item \code{\link[agriTutorial]{example1}} : split-plot design
#' with one quantitative and one qualitative treatment factor\cr
#' \item \code{\link[agriTutorial]{example2}} : block design
#' with one qualitative treatment factor\cr
#' \item \code{\link[agriTutorial]{example3}} : response surface design with
#' two quantitative treatment factors\cr
#' \item \code{\link[agriTutorial]{example4}} : repeated measures design with one
#' quantitative treatment factor\cr
#' \item \code{\link[agriTutorial]{example5}} : block design with transformed
#' quantitative treatment levels\cr
#' }
#'
#'
#' @references
#'
#' H.P. Piepho, R.N. Edmondson. (2017). A tutorial on the statistical analysis of factorial experiments with qualitative and quantitative
#' treatment factor levels.Journal of Agronomy and Crop Science. Submitted.
#'
#' Nelder, J. A. (2000). Functional marginality and response-surface fitting. Journal of Applied Statistics, 26, 109-122.
#'
#'
NULL
