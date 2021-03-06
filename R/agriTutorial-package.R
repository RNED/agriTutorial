#' @name agriTutorial
#' @title Tutorial Analysis of Agricultural Experiments
#' @aliases agritutorial
#' @docType package
#'
#' @description
#'
#' The \code{agri.tutorial} package provides example software for the analysis of
#'  five agricultural example data sets in the paper:
#'  'A tutorial on the statistical analysis of factorial experiments with qualitative
#'   and quantitative treatment factor levels' by Piepho and Edmondson (in press).
#'
#' @details
#'
#' Code\cr
#'
#'  The example code reproduces the statistical analyses of the agricultural data sets
#'  discussed in Piepho and Edmondson and also produces some graphical methods
#'  of data analysis. The data for each analysis is provided as a data frame which is loaded
#'  automatically whenever the package is loaded. The example code for each analysis is provided
#'  as a set of examples which can be executed by pasting the example code into
#'  any suitable R console terminal window. Provided that all the required packages (including agriTutorial)
#'  have been loaded,the output should then reproduce the example analyses given by Piepho and Edmondson.
#'
#' All printed output should appear appear in the gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in the gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' Data and output can be exported directly to a text file or spread sheet file
#' by using the \code{write.table} or \code{write.xlsx} functions, if required.
#'
#' The lines of code for opening or closing .txt files or .pdf files or for exporting data sets are preceded
#' by a hash symbol to suppress the command but these lines can be activated by deleting the hash symbol.
#' The "dontrun" tags are required for package testing at CRAN and and can be ignored here.
#'
#' The example code demonstrates some basic modern methodology for the analysis of data from designed
#' experiments but there are many other packages available and it is straightforward to
#' extend the example code by adding functionality from other packages. One source of package information
#' is the set of package 'views' available at: https://cran.rstudio.com/web/views/.
#'
#' Polynomials\cr
#' The polynomials used in this tutorial are either raw polynomials or orthogonal polynomials.
#' A raw polynomial is a numeric vector raised to
#' the power of the required polynomial whereas an orthogonal polynomial is a linear combination
#' of raw polynomials of degree equal to or less than the degree of the required polynomial.
#' Raw polynomial coefficients are the actual required polynomial model coefficients whereas orthogonal
#' polynomial coefficients are linear combinations of the required polynomial model coefficients.
#' Raw polynomial coefficients have a direct interpretation as polynomial model coeffcients
#' but can be numerically unstable for higher-degree polynomials whereas orthogonal polynomial coefficients are
#' numerically stable but can be difficult to interpret. Raw polynomials are the polynomials of choice
#' for most analyses but sometimes orthogonal polynomials can be useful when, for example, fitting
#' higher-degree polynomials in a long series of repeated measures (see example 4).
#'
#' Functional marginality\cr
#' Any polynomial expansion of an unknown function must include all polynomial terms up to and including the degree
#' of the expansion.This is the property of functional marginality and applies to any response surface
#' design including designs with polynomial interaction effects (Nelder, 2000). In this tutorial,
#' all polynomial models and response surface designs will be assumed to conform with the requirements of
#' functional marginality.
#'
#' Packages\cr
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the example code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2, all of which should install automatically. If, for any reason, packages need to be installed by hand,
#' this can be done by using the install.packages(---package name---) command from an R interface.
#'
#' NB. It is important to keep packages updated using the update.packages() command.
#'
#' Examples:
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
#' @references
#'
#' Piepho, H. P, and Edmondson. R. N. (accepted). A tutorial on the statistical analysis of factorial experiments with qualitative and quantitative
#' treatment factor levels.Journal of Agronomy and Crop Science.
#'
#' Nelder, J. A. (2000). Functional marginality and response-surface fitting. Journal of Applied Statistics, 26, 109-122.
#'
#'
#'
NULL
