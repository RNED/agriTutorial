#' @name agriTutorial
#' @title Tutorial Analysis of Agricultural Experiments
#' @aliases agritutorial
#' @docType package
#' @description
#' The \code{agri.tutorial} package provides software for the analysis of
#'  five agricultural data sets discussed in Piepho and Edmondson (in press).
#'  The package provides data sets and example R programs for each example data set
#'  and demonstrates the wide range of modern statistical methods available
#'  for the practical analysis of data from real experiments.
#'
#' @details
#'  The example analyses presented in this package are discussed in detail in
#'  Piepho & Edmondson (accepted). The experimental data is made available as
#'  a separate data frame for each example and the R analysis code is made available
#'  as a set of example analyses for each data set.
#'
#' Code\cr
#' The code for the example analyses can be executed on any suitable R console terminal window and
#' should reproduce the example analysis discussed in Piepho & Edmondson.
#' Textual output should appear in the gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in the gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' The example code demonstrates a basic analysis for each data set but the code can be copied
#' into a suitable file or coding environment and developed further for a more extended analysis of
#' the data sets, if required.
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
#' The \code{agri.tutorial} package provides software for
#'  the five example data sets discussed in Piepho and Edmondson (submitted).
#'  The package provides data sets and example code for the five examples
#'  and demonstrates  a range of modern statistical methods for the practical
#'  analysis of real data from real experiments.
#'
#' @details
#'  The examples in this package are discussed in detail in
#'  Piepho & Edmondson (in Press). The experimental data is made available as
#'  a separate data set for each example and R analysis code is made available
#'  for each example data set.
#'
#' Code\cr
#' The example code provides a basic analysis for each example in
#' Piepho & Edmondson (in Press) and each example can be further developed
#' by following the references in Piepho & Edmondson.
#' The example code can be run directly in any R console and the
#' textual output can be viewed directly in the terminal window
#' or can be diverted to a text file by a suitable sink file command (see ?sink).
#' Graphical output can be viewed either directly in a gui graphics
#' window or can be diverted to a suitable graphics device by, for example,
#' a pdf file command (see ?pdf and ?Devices). The data files can be exported to text
#' or spread sheet files by using the \code{write.table} or \code{write.xlsx} functions,
#' if required. The code for opening and closing .txt files and .pdf files or for exporting
#' data is shown but is commented-out by hashes in the example programs.
#' The "dontrun" tags are required only for package testing at CRAN and and can be ignored here.
#'
#' Polynomials\cr
#' The polynomials used in this tutorial are either raw polynomials or orthogonal polynomials.
#' Raw polynomials are just numeric data vectors raised to the required power
#' of a required polynomial whereas orthogonal polynomials are linear combinations
#' of raw polynomials chosen to ensure mutual orthogonality.
#' The coefficients of raw polynomials have a direct interpretation as
#' polynomial model coefficients but can be numerically unstable for high-degree models
#' whereas orthogonal polynomials are numerically stable but can be difficult to interpret.
#' Orthogonal polynomials can be useful, for example, when allowing for high-degree
#' polynomial nuisance effects in a series of repeated measures (see example 4) but for
#' most purposes raw polynomials will be the polynomials of choice.
#'
#' Functional marginality\cr
#' Any polynomial expansion of an unknown function must include all polynomial terms up to and including the degree
#' of the expansion.This is the property of functional marginality and applies to any response surface
#' design including designs with polynomial interaction effects (Nelder, 2000).
#' In this tutorial,
#' all polynomial models and response surface designs will be assumed to conform with the requirements of
#' functional marginality.
#'
#' Packages\cr
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the example code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2, all of which should install automatically. If, for any reason, packages need to be installed by hand,
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
