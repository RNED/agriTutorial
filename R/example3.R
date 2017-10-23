#' @name example3
#' @title  EXAMPLE 3 Polynomial regression model for an experiment with two quantitative level treatment factors
#' @docType package
#'
#' @description
#' (Gomez & Gomez, 1984, p. 401): Nitrogen uptake (g/pot) of rice was studied in a two-factor
#' greenhouse experiment involving duration of water stress (W) and level of nitrogen application (N).
#' The experiment had four water-stress levels (0, 10, 20 and 40 days) as main-plot treatments and
#' four nitrogen rates (0, 90, 180 and 270 kg/ha) as sub-plot treatments with main plots
#' randomized within four complete blocks. In this analysis Ppolynomial models are built by adding individual
#' treatment effects in a strict order of importance where the lower-degree effects of a
#' factorial combination must be added first before the higher-degree effects for that factorial combination.
#'
#' @details
#'
#' The first stage of the analysis is the calculation of polynomial powers of N and W using the poly() function, as discussed
#' in Example 1. The N rates are re-scaled by division by 100 while the W rates are re-scaled by division by 10.
#'
#' The second stage compares (Pearson) residual plots for the untransformed N uptake data versus the log transformed N uptake
#' data. The untransformed N uptake residuals increase as the fitted values increase whereas the log transformed N uptake
#' residuals are approximately constant over the full range of fitted values. Therefore the log transformed N uptake is
#' the most appropriate variable for analysis.
#'
#' @references
#' Gomez, K.A., & Gomez, A.A. (1984). Statistical procedures for agricultural research, 2nd edn. New York: Wiley.
#'
#' @examples
#' \dontrun{
#' require(lmerTest)
#' require(lattice)
#' require(pbkrtest)
#'
# '## Loads greenhouse greenrice data and builds a data frame with N and W rate orthogonal polynomials
#' data(greenrice)
#' greenrice$loguptake=log(greenrice$uptake)
#' PolW=poly((greenrice$W/10), degree=2, raw=TRUE)
#' colnames(PolW)=c("Linear_W","Quadratic_W")
#' PolN=poly((greenrice$N/100), degree=2, raw=TRUE)
#' colnames(PolN)=c("Linear_N","Quadratic_N")
#' greenrice=cbind(greenrice,PolW,PolN)
#'
#' ## shows residuals from untransformed versus log transformed uptake data assuming full model
#' greenrice.uptake = lmer(uptake ~ Replicate + factor(N) * factor(W)
#'   + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.uptake,main="Example 3: untransformed", ylab="Residuals N uptake ")
#' greenrice.loguptake= lmer(loguptake ~ Replicate + factor(N) * factor(W)
#'  + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.loguptake,main="Example 3: transformed ", ylab="Residuals log N uptake")
#'
#' ## log transformed uptake data stratified anova
#' greenrice.loguptake = aov(loguptake ~ Replicate +Linear_W * Linear_N +
#' Quadratic_N + Quadratic_W + Error(Replicate/Main),greenrice)
#' summary(greenrice.loguptake, ddf="Kenward-Roger",type = 1)
#'
#' ## lme4 analysis of log uptake assuming a quadratic response surface model for water and nitrogen
#' greenrice.lmer0 = lmer(loguptake  ~Linear_N * Linear_W + Quadratic_N + Quadratic_W +
#' (1|Replicate) + (1|Replicate:Main),data=greenrice)
#' anova(greenrice.lmer0, ddf="Kenward-Roger",type = 1)
#' summary(greenrice.lmer0, ddf="Kenward-Roger",type = 1)
#'
#' ## fitted quadratic loguptake curve versus nitrogen rate treatments
#' panel.plot <- function(x, y) {
#' panel.xyplot(x, y) # show points
#' Linear_W=c(0,1.0,2.0,4.0)[panel.number()]
#' panel.curve(-1.16+0.17603 * Linear_W - 0.11599 * Linear_W * Linear_W +
#' 0.68 * x - 0.0938 * x * x - 0.09072 * Linear_W * x,
#' from = 0, to = 2.70, type="l", lwd=2)
#' }
#' xyplot(loguptake ~ Linear_N|factor(Linear_W),data=greenrice,
#'	 main="Fig 4: Marginal model for nitrogen rate",
#'	 xlab = " Nitrogen (1 unit = 100kg/ha)", ylab = "Log nitrogen uptake (g/pot)",
#'	 strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
#'	panel = panel.plot)
#'
#' ## fitted quadratic loguptake curve versus water stress treatments
#' panel.plot <- function(x, y) {
#' panel.xyplot(x, y) # show points
#' Linear_N=c(0,.90,1.80,2.70)[panel.number()]
#' panel.curve(-1.16 + 0.17603 * x - 0.11599 * x * x + 0.68 * Linear_N -
#' 0.0938 * Linear_N * Linear_N - 0.09072 * x * Linear_N,
#' from = 0, to = 4.0, type="l", lwd=2)
#' }
#' xyplot(loguptake ~ Linear_W|factor(Linear_N),data=greenrice,
#'	 main="Fig 4: Marginal model for water stress",
#'	 xlab = " Water stress (1 unit = 10 days)", ylab = "Log nitrogen uptake (g/pot)",
#'	 strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
#'	panel = panel.plot)
#'

#'
#' }
#'
NULL

