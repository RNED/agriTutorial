#' @name agriTutorial
#' @title Tutorial analysis of designed agricultural experiments
#' @aliases agritutorial
#' @docType package
#' @description
#' The \code{agri.tutorial} package
#' provides software support for some example analyses discussed by
#' Piepho and Edmondson (2017).
#' The package includes five real data sets from practical experiments and explores
#' the analysis of these data sets using modern statistical methodolgy.
#'
#' @details
#'
#' \strong{Code}
#' The code shown in the examples can be copied and pasted into any R console terminal window.
#' Graphical output should appear in the gui graphics window but can be diverted to
#' a suitable pdf file by using a pdf file command, if required. Similarly, textual output should appear in the gui
#'  terminal window but can be diverted to a suitable text file by using a sink file command, if required.
#'  Code for opening and closing .pdf files or .txt files is shown commented-out by hashes in
#'  the examples but can be copied, edited and pasted without the hashes, if required. Any line of code preceded by a hash
#'  is ignored by R when pasted into a console terminal window.
#'
#' \strong{Polynomials}
#' The polynomials in this tutorial are either raw polynomials, which are the actual powers of a
#' numeric vector, or orthogonal polynomials, which are ordered sets of mutually orthogonal functions
#' where each function accounts for the effects of a polynomial of corresponding degree independentally of the effects
#' of all polynomials of lower degree. Raw polynomials are simpler to interpret
#' than orthogonal polynomials but are not mutually orthogonal and therefore must be fitted to a
#' model in ascending degree-order and analysed by a method that estimates the 'extra' variance explained by
#' each added model term so that the effects of each
#' higher-degree polynomial can be assessed clear of the effects of all lower-degree polynomials.
#'
#' \strong{Functional marginality}
#' Functional marginality requires that if a polynomial term of given degree is included in a model, then
#' all polynomial terms of lower degree must also be included in the model. Functional marginality applies to
#' any response surface design including designs with polynomial interaction effects (Nelder, 2000) and in
#' this tutorial all polynomial models and response surface designs will obey the rules of functional marginality.
#'
#' \strong{Packages}
#' The example code depends on a number of R packages and these must be installed on the user machine before
#' the code can be properly executed. The required packages can be installed by copying the following commands
#' into a suitable R console or R shell window:
#'
#' install.packages('lmerTest')\cr
#' install.packages('lsmeans')\cr
#' install.packages('pbkrtest')\cr
#' install.packages('lattice')\cr
#' install.packages('nlme')\cr
#' install.packages('ggplot2')\cr
#'
#' Further information and documentation is available from the \href{https://cran.r-project.org/}{CRAN} website.
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
NULL
