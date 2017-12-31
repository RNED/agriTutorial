#' @name agriTutorial
#' @title Tutorial Analysis of Some Agricultural Experiments
#' @aliases agritutorial
#' @docType package
#' @description
#' The \code{agri.tutorial} package provides software for the analysis of
#'  the five agricultural data sets discussed in Piepho and Edmondson (accepted).
#'  The package provides the data and a set of R programs for each example
#'  and demonstrates the wide range of modern statistical methods now available
#'  for the practical analysis of real data from real experiments.
#'
#' @details
#'  The example analyses presented in this package are discussed in detail in
#'  Piepho & Edmondson (accepted). The experimental data is made available as
#'  a separate data frame for each example and the R analysis code is made available
#'  as a set of example analyses for each data set.
#'
#' Code\cr
#' The code for the examples can be executed from any suitable R console terminal window and
#' should reproduce the example analysis discussed in Piepho & Edmondson.
#' Textual output should appear in a gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in a gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' The example code demonstrates a basic analysis for each data set but a proper data analysis
#' should always explore data as fully as possibe and we recommend copying
#' the example code into a suitable file or coding environment and making a further analysis of
#' the data sets.
#' The data sets can be exported directly to a text file or spread sheet file
#'  by using the \code{write.table} or \code{write.xlsx} functions, as required.
#' The lines of code for opening or closing .txt files and .pdf files and for exporting data sets are preceded
#' by a hash synbol to suppress the command but the code can be activated be deleting the hash.
#' The "dontrun" tags are required for package testing at CRAN and and can be ignored here.
#'
#' Polynomials\cr
#' The polynomials used in this tutorial are either
#' raw polynomials or orthogonal polynomials.
#' A raw polynomial is a numeric vector raised to the power
#' of the required polynomial whereas an orthogonal polynomial is a combination
#' of raw polynomials of powers equal to or less than the power of the required polynomial.
#' Raw polynomials fit the
#' actual coefficients of the required polynomial model whereas orthogonal
#' polynomials fit orthogonal linear combinations of the actual coefficients. Raw polynomials
#' have a direct interpretation as polynomial model coefficients
#' but can be numerically unstable for higher-degree polynomials whereas orthogonal polynomials are
#' numerically stable but can be difficult to interpret.
#'  Orthogonal polynomials can be useful, for example, when allowing for
#'  higher-degree polynomial nuisance effects in a series of repeated measures (see example 4).
#'
#' Functional marginality\cr
#' Any polynomial expansion of an unknown function must include all polynomial terms up to and including the degree
#' of the expansion.This is the property of functional marginality and applies to any response surface
#' design including designs with polynomial interaction effects (Nelder, 2000).
#' In this tutorial,
#' all polynomial models and response surface designs will be assumed to obey the requirements of
#' functional marginality.
#'
#' Packages\cr
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2 which should install automatically. If for any reason packages need to be installed by hand,
#' this can be done by using the install.packages() command from an R interface.
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
NULL
