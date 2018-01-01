#' @name agriTutorial
#' @title Tutorial Analysis of Agricultural Experiments
#' @aliases agritutorial
#' @docType package
#'
#' @description
#'
#' The \code{agri.tutorial} package provides example software for the analysis of
#'  five agricultural data sets discussed in Piepho and Edmondson (in press).
#'  The package provides data and example R programs for each example and
#'  demonstrates the wide range of modern statistical methods currently available
#'  for the practical analysis of data from real experiments.
#'
#' @details
#' The package contains experimental data and example R
#'  analysis code for the five examples discussed in Piepho and Edmondson.
#'  The example R analyses code reproduces each analysis
#'  and shows the derivation of the numerical results reported by Piepho and Edmondson.
#'  The experimental data for each example is made available as a data frame and the R analysis code is provided
#'  as example code that can be copied and pasted for each example data set.
#'
#' Code\cr
#' Each example analyses can be executed by pasting the example code into any suitable R console terminal window and,
#' provided that all the required packages (including agriTutorial) have been loaded by suitable library(-package name-)
#' commands, the output should reproduce the example analysis given in Piepho and Edmondson.
#' Output should appear in the gui or terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required. Graphical output should appear in the gui graphics
#' window but can be diverted to a suitable pdf file by using a pdf file command, if required.
#' The example code contains a basic analysis for each data set but the code can be copied
#' and developed further for a more extended analysis, if required.
#' Data sets can be exported directly to a text file or spread sheet file
#' by using the \code{write.table} or \code{write.xlsx} functions, as required.
#' The lines of code for opening or closing .txt files or .pdf files or for exporting data sets are preceded
#' by a hash comment symbol to suppress the command but can be activated be deleting the hash symbol.
#' The "dontrun" tags are required for package testing at CRAN and and can be ignored here.
#'
#' Polynomials\cr
#' The polynomials used in this tutorial are either raw polynomials or orthogonal polynomials.
#' A raw polynomial is a numeric vector raised to
#' the power of the required degree whereas an orthogonal polynomial is a linear combination
#' of raw polynomials of degree equal to or less than the degree of the required polynomial
#' where the linear combination is chosen
#' to ensure orthogonality relative to all orthogonal polynomials of lesser degree. Raw polynomials fit the
#' actual coefficients of the required polynomial model whereas orthogonal
#' polynomials fit orthogonal linear combinations of the required coefficients. Raw polynomial coefficients
#' have a direct interpretation as polynomial model coefficients
#' but can be numerically unstable for higher-degree polynomials whereas orthogonal polynomial coefficients are
#' numerically stable but can be difficult to interpret. Raw polynomials will normally be the polynomials of choice
#' but sometimes orthogonal polynomials can be useful when, for example, fitting
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
NULL
