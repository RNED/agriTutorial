#' @name example3
#' @title  EXAMPLE 3: Polynomial regression model with two quantitative level treatment factors
#' @description
#' (Gomez & Gomez, 1984, p. 401): Nitrogen uptake (g/pot) of rice was studied in a two-factor
#' greenhouse experiment involving duration of water stress (W) and level of nitrogen application (N).
#' The experiment had four water-stress levels (0, 10, 20 and 40 days) as main-plot treatments and
#' four nitrogen rates (0, 90, 180 and 270 kg/ha) as sub-plot treatments with main plots
#' randomized within four complete blocks. In this analysis, all polynomial models are built by adding individual
#' polynomial effects in acccordance with the requirements of functional marginality.
#'
#' @details
#' The first stage of the analysis is the calculation of polynomial powers of N and W using the poly() function.
#' The N rates are re-scaled by division by 100 while the W rates are re-scaled by division by 10.
#'
#' The second stage compares (Pearson) a residual plot of the untransformed N uptake data versus a residual plot of
#' the log transformed N uptake data. Comparison of the two plots shows that the untransformed residuals
#' increase as the fitted values increase, which shows that the variance of the untransformed data is non-constant.
#' The log transformed N uptake residuals, however, are approximately constant over the full range of fitted values
#' and this shows that the log transformed N uptake data can be used to fit a simple unweighted analysis of
#' variance for the effects of the treatment factors.
#'
#' Sometimes the original scale of measurement is the proper scale of measurement for an analysis
#' eg actual measured crop yields, and then it can be appropriate to fit a weighted analysis of variance in the
#' original scale of measurement. However, in this example, a log transformation of the dependent variable
#' simply assumes a proportional rather than an additive model for nitrogen effects and this may well be a more natural
#' physiological model for the effects of N uptake on crop production than a simple additive model.
#'
#' The next stage compares the fit of a first-order linear model (Table 9) versus a second-order quadratic
#' model (Table 10). The first-order model shows significant lack-of-fit and is not adequate for the
#' data. The second-order model is also not fully adequate for the data as there is a significant Nitrogen lack of
#' fit term indicating a significant cubic effect. However, the magnitude of the cubic effect is
#' relatively small and it will be assumed here that a quadratic model is adequate for the data.
#'
#' The final stage fits regression coefficients for the quadratic response surface model on the
#' rescaled water stress and rescaled nitrogen rate treatments. The fitted coefficients are then used to
#' plot the fitted quadratic log uptake curves versus the nitrogen rate treatments and the
#' water stress treatments shown in Fig 4.
#'
#' \code{\link[agriTutorial]{agriTutorial-package}} : return to home page\cr
#'
#' @references
#' Gomez, K.A., & Gomez, A.A. (1984). Statistical procedures for agricultural research, 2nd edn. New York: Wiley.
#'
#' @examples
#'
#' \dontrun{
#'
#' ## *************************************************************************************
#' ##                            Preliminaries
#' ##**************************************************************************************
#'
#' ## sink("F:\\tutorial2\\OutputsR\\outExample3.txt") #sink file for outputs
#' ## pdf("F:\\tutorial2\\OutputsR\\outExample3_Fig_S2.pdf") #opens a graphical pdf output file
#' require(lmerTest)
#' require(lattice)
#' require(pbkrtest)
#' options(contrasts=c('contr.treatment','contr.poly'))
#' data(greenrice)
#' ## write.table(greenrice, "c:/greenrice.txt", sep="\t") # export data to a text file
#' ## write.xlsx(greenrice, "c:/greenrice.xlsx") # export data to a spread sheet
#'
#' ## *************************************************************************************
#' ##            Section 1: Polynomial powers of N and W
#' ##**************************************************************************************
#'
# '##  N and W rate raw polynomials for rice data
#' greenrice$loguptake=log(greenrice$uptake)
#' greenrice$Nitrogen=factor(greenrice$N)
#' greenrice$Water=factor(greenrice$W)
#' PolW=poly((greenrice$W/10), degree=2, raw=TRUE)
#' colnames(PolW)=c("Linear_W","Quadratic_W")
#' PolN=poly((greenrice$N/100), degree=2, raw=TRUE)
#' colnames(PolN)=c("Linear_N","Quadratic_N")
#' greenrice=cbind(greenrice,PolW,PolN)
#'
#' ## residual plots of untransformed versus log transformed uptake data
#' greenrice.uptake = lmer(uptake ~ Replicate + factor(N) * factor(W)
#'   + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.uptake,main="Example 3: untransformed",
#'  ylab="Residuals N uptake")
#'
#' greenrice.loguptake= lmer(loguptake ~ Replicate +
#' factor(N) * factor(W) + (1|Replicate:Main), data=greenrice)
#' plot(greenrice.loguptake,main="Example 3: transformed ",
#' ylab="Residuals log N uptake")
#'
#' ## Tables 9 first-order model of log uptake and Wald tests
#' greenrice.lmer1 = lmer(loguptake ~ Linear_N + Linear_W +
#' Nitrogen*Water + (1|Replicate) + (1|Replicate:Main),data=greenrice)
#' anova(greenrice.lmer1, ddf="Kenward-Roger",type = 1)
#'
#' ## Tables 10 second-order model of log uptake and Wald tests
#' greenrice.lmer2 = lmer(loguptake  ~Linear_N * Linear_W + Quadratic_N +
#' Quadratic_W +  Nitrogen*Water + (1|Replicate) + (1|Replicate:Main),
#' data=greenrice)
#' anova(greenrice.lmer2, ddf="Kenward-Roger",type = 1)
#'
#' ## *************************************************************************************
#' ##         Section 2 : Fitted regression models and quadratic log uptake curves
#' ##**************************************************************************************
#'
#' ## Regression coefficients of quadratic response model of W and N
#' greenrice.lmer0 = lmer(loguptake  ~Linear_N * Linear_W + Quadratic_N +
#' Quadratic_W + (1|Replicate) + (1|Replicate:Main),data=greenrice)
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
#'  strip = strip.custom(strip.names = TRUE,
#'  factor.levels = c("0","10","20","40")),
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
#'  strip = strip.custom(strip.names = TRUE,
#'  factor.levels = c("0","90","180","270")),
#' panel = panel.plot)
#'
#' ## *************************************************************************************
#' ##                                  Closure
#' ##**************************************************************************************
#'
#' ## dev.off()
#' ## sink() #closes sink file
#' }
#'
#' @importFrom lattice xyplot
#'
NULL

