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
#' Textual output should appear in the gui terminal window but can be diverted to a suitable
#' text file by using a sink file command, if required.
#'
#' Graphical output should appear in the gui graphics window but can be diverted to
#' a suitable pdf file by using a pdf file command, if required.
#'
#'  The code for opening and closing .txt files and .pdf files is shown commented-out by hashes in
#'  the example programs. The code can be copied and edited without the hashes, if required
#'  (any line of code preceded by a hash is ignored by R).
#'
#' \strong{Polynomials}
#' The polynomials in this tutorial are either raw polynomials, which are actual powers of
#' numeric vectors, or orthogonal polynomials where the ith degree orthogonal polynomial accounts
#' for the effects of the ith degree raw polynomial independentally of the effects of all lower-degree polynomials.
#' Raw polynomials are simpler to interpret than orthogonal polynomials but must be fitted to a model in ascending
#' degree-order and analysed by a method that estimates the 'extra' variance explained by each added model term separately.
#' The disadvantage of raw polynomals is that they can become numerically unstable for high-powers of large vectors.
#'
#' \strong{Functional marginality}
#' Functional marginality requires that a polynomial term of given degree can be included in a model only if
#' all polynomial terms of lower degree are also be included in the model. Functional marginality applies to
#' any response surface design including designs with polynomial interaction effects (Nelder, 2000) and in
#' this tutorial all polynomial models and response surface designs will obey the rules of functional marginality.
#'
#' \strong{Packages}
#' The example code depends on a number of R packages which must be installed on the user machine before
#' the code can be properly executed. The required packages are lmerTest, lsmeans, pbkrtest, lattice, nlme and
#' ggplot2 and if necessary can be installed either from a gui tools menu or from the install.packages() command
#' (type ?install.packages at a r command prompt for further information).
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
#'
NULL
