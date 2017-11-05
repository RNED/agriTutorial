#' @name agriTutorial
#' @title Tutorial analysis of designed agricultural experiments
#' @aliases agritutorial
#' @docType package
#' @description
#' The \code{agri.tutorial} package provides software support for the analysis of
#'  the five example data sets discussed in Piepho and Edmondson (2017).
#'  The package provides data sets for the five examples and also provides
#'  example code for the analysis of the example data sets using a range
#'   of modern statistical methods.
#'
#' @details
#'
#' \strong{Analysis}
#'  The five examples presented in this package are discussed in detail in
#'  Piepho & Edmondson (2017). The experimental data is made available as
#'  a separate data set for each example
#'	and the R analysis code is made available as a set of example analyses for each
#'	example data set.
#'
#' \strong{Code}
#' The code for the examples can be copied and pasted into any R console terminal window.
#' Textual output should appear in the gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in the gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' The code for opening and closing .txt files and .pdf files is shown commented-out by hashes in
#' the example programs. The "dontrun" tags in the example code are required for package testing
#' at CRAN and and can be ignored here.
#'
#' \strong{Polynomials}
#' The polynomials used in this tutorial are either raw polynomials or orthogonal polynomials.
#' Raw polynomials are the actual powers of numeric vectors whereas orthogonal polynomials are
#' functions which account for the succesive powers of a numeric
#' vector but which are mutually orthogonal. Raw polynomials fit the
#' actual coefficients of the assumed polynomial model but significance tests of the individual
#' polynomial effects must be based on
#' the added effect of each new effect after allowing for all lower-degree effects whereas orthogonal
#' polynomials provide independent significance tests for each individual model term However,
#' orthogonal polynomial terms are linear combinations of the raw polynomial coefficients
#' and can be very difficult to interpret.
#'
#' \strong{Functional marginality}
#' A polynomial expansion of an unknown function requires that if a polynomial term of any given degree
#' is included in the expansion, then all polynomial terms of lower degree must also be included. This
#' is the property of functional marginality and applies to any response surface design
#' including designs with polynomial interaction effects (Nelder, 2000). In this tutorial,
#' all polynomial models and response surface designs will be assumed to obey the requirements of
#' functional marginality.
#'
#' \strong{Packages}
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2 which should install automatically. If for any reason packages need to be installed by hand,
#' this can be done by using the install.packages() command from the an R interface.
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
