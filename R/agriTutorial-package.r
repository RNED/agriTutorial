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
#' \strong{Code}
#' The code shown in the examples listed below can be copied and pasted into any R console terminal window.
#' Graphical output should appear in the gui graphics window but, if required, it can be diverted to
#' a suitable pdf file by using a pdf file command. Similarly, textual output should appear in the gui
#'  terminal window but, if required, it can be diverted to a suitable text file by using a sink file command.
#'  Code for opening and closing .pdf files or .txt files are shown commented-out by hashes in
#'  the examples but can be copied, edited and pasted without the hashes, if required.
#'
#' \strong{Polynomials}
#' The polynomials used in this tutorial are 'raw' polynomials which means that they are powers of the actual
#' numeric factors. Raw polynomials are simple to use but they are not mutually orthogonal which means that the
#' order of fitting of raw polynomials is important. Functional marginality requires that polynomial
#' effects be fitted in degree order with effects of lower degree preceding effects of higher
#' degree and also that polynomial terms of a given degree can only be included in a model if all
#' polynomial terms of lower degree are already included in the model. In this tutorial, all polynomial
#' models obey functional marginality.
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
