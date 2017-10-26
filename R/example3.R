#' @name example3
#' @title  EXAMPLE 3: Polynomial regression model with two quantitative level treatment factors
#' @description
#' (Gomez & Gomez, 1984, p. 401): Nitrogen uptake (g/pot) of rice was studied in a two-factor
#' greenhouse experiment involving duration of water stress (W) and level of nitrogen application (N).
#' The experiment had four water-stress levels (0, 10, 20 and 40 days) as main-plot treatments and
#' four nitrogen rates (0, 90, 180 and 270 kg/ha) as sub-plot treatments with main plots
#' randomized within four complete blocks. In this analysis Ppolynomial models are built by adding individual
#' treatment effects in a strict order of importance where the lower-degree effects of a
#' factorial combination must be added first before the higher-degree effects for that factorial combination.
#' @details
#' The first stage of the analysis is the calculation of polynomial powers of N and W using the poly() function.
#'  The N rates are re-scaled by division by 100 while the W rates are re-scaled by division by 10.
#'
#' The second stage compares (Pearson) residual plots for the untransformed N uptake data versus the
#' log transformed N uptake data. The plots show that the untransformed residuals increase as the fitted values
#' increase showing that the variance of the untransformed data is non-constant. The log transformed N uptake
#' residuals, however, are approximately constant over the full range of fitted values indicating that the
#' variance of the transformed data is approximately constant. Therefore the log transformed data is
#' the most appropriate data for a simple unweighted analysis of variance.
#'
#' The next stage compares the fit of a first-order linear model (Table 9) versus a second-order quadratic
#' model (Table 10). The first-order model shows significant lack-of-fit and is not adequate for the
#' data. The second-order model is not fully adequate for the data because there is a significant Nitrogen lack of
#' fit term indicating a significant cubic effect in the model. However, the magnitude of the effect is quite
#' small and it will be assumed here that the quadratic model is adequate for the data.
#'
#' The final stage calculates the regression coefficients for quadratic response surface model for the
#' (rescaled) water and (rescaled) nitrogen treatments and these coefficients are then used to
#' plot the fitted quadratic loguptake curves versus the nitrogen rate treatments and the
#' water stress treatments shown in Fig 4.
#'
#' @references
#' Gomez, K.A., & Gomez, A.A. (1984). Statistical procedures for agricultural research, 2nd edn. New York: Wiley.
#'
#' @examples
#' \dontrun{
#' require(lmerTest)
#' require(lattice)
#' require(pbkrtest)
#' options(contrasts=c('contr.treatment','contr.poly'))
# '## Loads greenhouse greenrice data and builds a data frame with N and W rate orthogonal polynomials
#' data(greenrice)
#' greenrice$loguptake=log(greenrice$uptake)
#' greenrice$Nitrogen=factor(greenrice$N)
#' greenrice$Water=factor(greenrice$W)
#' PolW=poly((greenrice$W/10), degree=2, raw=TRUE)
#' colnames(PolW)=c("Linear_W","Quadratic_W")
#' PolN=poly((greenrice$N/100), degree=2, raw=TRUE)
#' colnames(PolN)=c("Linear_N","Quadratic_N")
#' greenrice=cbind(greenrice,PolW,PolN)
#'
#' ## residuals from untransformed versus log transformed uptake data assuming full model
#' greenrice.uptake = lmer(uptake ~ Replicate + factor(N) * factor(W)
#'   + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.uptake,main="Example 3: untransformed", ylab="Residuals N uptake ")
#' greenrice.loguptake= lmer(loguptake ~ Replicate + factor(N) * factor(W)
#'  + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.loguptake,main="Example 3: transformed ", ylab="Residuals log N uptake")
#'
#' ## Tables 9 first-order model of log uptake showing Wald F-tests and lack of fit
#' greenrice.lmer1 = lmer(loguptake ~ Linear_N + Linear_W + Nitrogen*Water +
#' (1|Replicate) + (1|Replicate:Main),data=greenrice)
#' anova(greenrice.lmer1, ddf="Kenward-Roger",type = 1)
#'
#' ## Tables 10 second-order model of log uptake showing Wald F-tests and lack of fit
#' greenrice.lmer2 = lmer(loguptake  ~Linear_N * Linear_W + Quadratic_N + Quadratic_W +
#' Nitrogen*Water + (1|Replicate) + (1|Replicate:Main),data=greenrice)
#' anova(greenrice.lmer2, ddf="Kenward-Roger",type = 1)
#'
#' ## Regression coefficients for quadratic response surface model for water and nitrogen
#' greenrice.lmer0 = lmer(loguptake  ~Linear_N * Linear_W + Quadratic_N + Quadratic_W +
#' (1|Replicate) + (1|Replicate:Main),data=greenrice)
#' summary(greenrice.lmer0, ddf="Kenward-Roger",type = 1)
#'
## Fig 4 fitted quadratic loguptake curve versus nitrogen rate treatments
#' panel.plot <- function(x, y) {
#' panel.xyplot(x, y) # show points
#' Water=c(0,1.0,2.0,4.0)[panel.number()]
#' panel.curve(-1.16+0.17603 * Water- 0.11599 * Water * Water +
#' 0.68 * x - 0.0938 * x * x - 0.09072 * Water * x,
#' from = 0, to = 2.70, type="l", lwd=2)
#' }
#' xyplot(loguptake ~ Linear_N|factor(Linear_W),data=greenrice,
#'  scales=list(x=list(at=c(0,.9,1.8,2.7), labels=c(0,90,180,270))),
#'  main="Fig 4: Marginal model for nitrogen rate",
#'  xlab = " Nitrogen (kg/ha)", ylab = "Log nitrogen uptake (g/pot)",
#'  strip = strip.custom(strip.names = TRUE, factor.levels = c("0","10","20","40")),
#' panel = panel.plot)
#'
## Fig 4 fitted quadratic loguptake curve versus water stress treatments
#' panel.plot <- function(x, y) {
#' panel.xyplot(x, y) # show points
#' Nitrogen=c(0,.90,1.80,2.70)[panel.number()]
#' panel.curve(-1.16 + 0.17603 * x - 0.11599 * x * x + 0.68 * Nitrogen -
#' 0.0938 * Nitrogen * Nitrogen - 0.09072 * x * Nitrogen,
#' from = 0, to = 4.0, type="l", lwd=2)
#' }
#' xyplot(loguptake ~ Linear_W|factor(Linear_N),data=greenrice,
#'  scales=list(x=list(at=c(0,1,2,4), labels=c(0,10,20,40))),
#'  main="Fig 4: Marginal model for water stress",
#'  xlab = " Water stress (days)", ylab = "Log nitrogen uptake (g/pot)",
#'  strip = strip.custom(strip.names = TRUE, factor.levels = c("0","90","180","270")),
#' panel = panel.plot)
#'
#' }
#'
NULL

