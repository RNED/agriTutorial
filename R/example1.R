#' @name example1
#'
#' @title  EXAMPLE 1: SPLIT-PLOT DESIGN WITH ONE QUALITATIVE AND ONE QUANTITATIVE LEVEL TREATMENT FACTOR
#'
#' @description
#' Gomez & Gomez (1984, p. 143) report a rice experiment with three management practices
#' (minimum, optimum, intensive), five different amounts of nitrogen (N) fertilizer
#' (0, 50, 80, 110, 140 kg/ha), and three varieties (V1, V2, V3). The experiment
#' involved variety and management as qualitative treatment factors and nitrogen
#' fertilizer as a quantitative treatment factor. Overall, there were 45 treatments.
#' The fertilizer treatments were applied to main plots, the management practices to
#' split-plots and the varieties to split-split plots.
#'
#' @details
#'
#' The first stage of the analysis calculates a full set of four raw polynomials for the 5-levels of N using
#' the poly() function. The N rates are re-scaled by division by 100 to improve numerical stability.
#'
#' The second stage calculates a full analysis of variance (Table 1) for main plots (nitrogen), split-plots
#' (management) and split-split plots (variety). Each type of experimental unit (or "stratum") requires
#'  a separate error term in the fitted analysis.
#'
#' The next stage (Table 2) uses REML mixed model analysis to find treatment means and SE's for each marginal
#' treatment classification averaged over all the other treatment factors, together with estimates of
#' pairwise contrasts of treatment means and the SE' of each pairwise treatment comaparison.
#'
#' The third stage (Table 3) shows a mixed model analysis of the full factorial model fitted by REML using the lmer function
#' of the lme4 package. Generally with mixed models, determination of the denominator degrees of freedom for
#' Wald-type F- and t-statistics becomes an issue, and here we use the method proposed by Kenward & Roger (1997).
#'
#' Table 7 shows a mixed model polynomial analysis of nitrogen effects assuming additive management effects.
#' In this analysis, most of the nitrogen treatment effect can be explained by linear and quadratic trend effects.
#' but it is important to note that there is a non-negligible Variety x Cubic N interaction effect. This suggests
#' that not all the varieties responded in a similar way to
#' the N treatments and that some further analysis of the data may be required (see the N plots for individual
#' varieties and replicates in Fig 1).
#'
#' Table 8 shows the fitted model for estimating the actual coefficients of the the nitrogen model. Models for estimating
#' effects should include only those terms that are significant for the fitted model therefore only the linear and
#' quadratic nitrogen trend terms are included in this model. The fitted model for the nitrogen effects fits the
#' actual actual nitrogen levels used in the experiment as these provide the simplest interpretation of the
#' nitrogen effects.
#'
#' Fig 1 shows individual plots of the nitrogen response for each variety in each block averaged over management effects.
#' Unlike the single plot shown in Piepho and Edmondson (2017), these plots show the nitrogen response of the individual
#' variety effects in each replicate block separately. These plots show some evidence of anomalous behaviour by variety 1
#' in blocks 1 and 2 compared with block 3 and, in practice, this anomaly would need to be investigated by further
#' discussions with research workers. Without such further discussions, there is little more that can be done to explain
#' this anomaly.
#'
#' The final graphical figure show a scatter plot of the residuals from the full fitted model. Checking model assumptions and
#' model fit is always vitally important for a reliable analysis and a scatter plot of fitted residuals should always be the
#' first test of any fitted model. Many more options for model testing are available and further methods for diagnostic testing
#' will be examined in the subsequent examples.
#'
#' @references
#'Gomez, K.A., & Gomez, A.A. (1984). Statistical procedures for agricultural
#'research, 2nd edn. New York: Wiley.
#'
#' Kenward, M.G., & Roger, J.H. (1997). Small sample inference for fixed effects from restricted maximum likelihood. Biometrics, 53, 983–997.
#'
#' Piepho, H. P. & Edmondson R. N. (2017). A tutorial on the statistical analysis of factorial experiments with qualitative and quantitative
#' treatment factor levels.Journal of Agronomy and Crop Science. Submitted
#'
#' @examples
#' ## Copy and paste the following code into a R console or GUI to run examples
#' ## Packages lmerTest, lsmeans and pbkrtest MUST be installed
#'
#' \dontrun{
#' require(lmerTest)
#' require(lsmeans)
#' require(pbkrtest)
#' ## loads rice data
#' data(rice)
#'
#' ## sink("F:\\tutorial2\\OutputsR\\outExample1.txt") #sink file for outputs
#' ## adds raw N polynomials to data frame: note that the nrate is re-scaled
#' N=poly((rice$nrate/100),4,raw=TRUE)
#' colnames(N)=c("Linear_N","Quadratic_N","Cubic_N","Quartic_N")
#' rice=cbind(rice,N)
#'
#' ## Table 1 Full analysis of rice data assuming qualitative nitrogen effects
#' rice.aov1 = aov(yield ~ Replicate + management*variety*nitrogen +
#' Error(Replicate/Main/Sub),rice)
#' summary(rice.aov1, ddf="Kenward-Roger",type = 1)
#'
#' ## Table 2 REML means and se's for additive management and qualitative nitrogen effects
#' rice.means= lmer(yield ~ Replicate + management+ nitrogen*variety +
#' (1|Replicate:Main)+ (1|Replicate:Main:Sub), data=rice)
#' lsmeans::lsmeans(rice.means,~nitrogen)
#' lsmeans::lsmeans(rice.means,~variety)
#' lsmeans::lsmeans(rice.means,~nitrogen*variety)
#' ## REML contrasts and sed's for additive management and qualitative nitrogen effects
#' n.v= lsmeans::lsmeans(rice.means,~nitrogen|variety)
#' contrast(n.v, alpha=0.05, method="pairwise")
#' v.n= lsmeans::lsmeans(rice.means,~variety|nitrogen)
#' contrast(v.n, alpha=0.05, method="pairwise")
#'
#' ## Table 3 Mixed model effects for rice data with significance tests
#' rice.lmer= lmer(yield ~ Replicate + nitrogen*management*variety + (1|Replicate:Main) +
#' (1|Replicate:Main:Sub), data=rice)
#' anova(rice.lmer, ddf="Kenward-Roger",type = 1)
#'
#' ## Table 7: Mixed model fitting raw polynomials for nitrogen effects
#' rice.lmer2= lmer(yield ~ Replicate + management + variety*(Linear_N + Quadratic_N +
#' Cubic_N + Quartic_N) + (1|Replicate:Main)+ (1|Replicate:Main:Sub) , data=rice)
#' anova(rice.lmer2, ddf="Kenward-Roger",type = 1)
#'
#' ## Table 8 Coefficients for separate linear and common quadratic N with additive management
#' rice.lmer4= lmer(yield ~ Replicate + management + variety*Linear_N + Quadratic_N +
#' (1|Replicate:Main) + (1|Replicate:Main:Sub), data=rice)
#' summary(rice.lmer4, ddf="Kenward-Roger")
#' # sink() #closes sink file
#'
#' # pdf("F:\\tutorial2\\OutputsR\\outExample1_Fig_S1.pdf") #opens a graphical pdf output file
#' ## Fig 1 Nitrogen response per variety per plot showing anomalous behaviour of Variety 1
#' Rice=aggregate(rice$yield, by=list(rice$Replicate, rice$nitrogen,rice$variety),
#' FUN=mean, na.rm=TRUE)
#' colnames(Rice)=c("Reps","Nlev","Vars","Yield")
#' wideRice <- reshape(Rice, timevar="Nlev",idvar=c("Vars","Reps"),direction="wide")
#' wideRice=wideRice[,-c(1,2)]
#' N=c(0,50,80,110,140)
#' par(mfrow=c(3,3),oma=c(0,0,2,0))
#' for (i in 1:3)
#'	for (j in 1:3)
#'		plot(N,wideRice[(i-1)*3+j,],type = "l",ylab="yield",main=paste("Variety",i,"Block",j),
#'		ylim=c(0, max(wideRice)))
#' title(main="Fig S1. Variety response to nitrogen in individual replicate blocks",
#' outer=TRUE)
#'
#' ## Residual plot assuming additive management and nitrogen x variety interaction effects
#' rice.lmer= lmer(yield ~ Replicate + management+ nitrogen*variety + (1|Replicate:Main) +
#' (1|Replicate:Main:Sub) , data=rice)
#' plot(rice.lmer,sub.caption=NA,ylab="Residuals",xlab="Fitted",
#' main="Full rice analysis with qualitative nitrogen factor")
#' #dev.off()
#'
#' }
#'
NULL
