#' @name agriTutorial
#' @title Tutorial analysis of designed agricultural experiments
#' @aliases tutorial
#' @docType package
#'
#' @description
#' The \code{agri.tutorial} package
#' provides software support for the example analyses discussed in
#' Piepho and Edmondson (2017).
#' The package examines five real data sets from practical experiments and explores
#' the analysis of these data sets using modern statistical methodolgy.
#'
#' @details
#'
#' \strong{Packages}
#' The example code depends on a number of R packages and these must be
#' installed on the user machine before the code can be properly executed.
#' The required packages can be installed by copying the following commands into a
#' suitable R console or R shell window:
#'
#' install.packages('lmerTest')\cr
#' install.packages('lsmeans')\cr
#' install.packages('pbkrtest')\cr
#' install.packages('lattice')\cr
#' install.packages('nlme')\cr
#' install.packages('ggplot2')\cr
#'
#' Further information can be obtained from a
#' web search e.g.: \href{https://www.r-bloggers.com/installing-r-packages/}{R-bloggers}
#'
#' \strong{Polynomials}
#' The polynomials used in this tutorial are 'raw' polynomials which means they are the actual powers of
#' numeric factors. Raw polynomials are simple to use but it is important
#' to remember that they are not mutually orthogonal which means that the order of fitting of the polynomial terms in
#' a model is important. Functional marginality requires that all polynomial model effects must be ordered from
#' lowest to highest degree and this means that all polynomial terms in a model equation should be included
#' sequentially from the lowest to the highest degree.
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
#' treatment factor levels.Journal of Agronomy and Crop Science. Submitted
#'
NULL
