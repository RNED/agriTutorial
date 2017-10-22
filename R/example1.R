#' @name example1
#' @title  EXAMPLE 1: SPLIT-PLOT DESIGN WITH ONE QUALITATIVE AND ONE QUANTITATIVE LEVEL TREATMENT FACTOR
#' @description
#'#' Gomez & Gomez (1984, p. 143) report a rice experiment with three management practices
#' (minimum, optimum, intensive), five different amounts of nitrogen (N) fertilizer
#' (0, 50, 80, 110, 140 kg/ha), and three varieties (V1, V2, V3). The experiment
#' involved variety and management as qualitative treatment factors and nitrogen
#' fertilizer as a quantitative treatment factor. Overall, there were 45 treatments.
#' The fertilizer treatments were applied to main plots, the management practices to
#' split-plots and the varieties to split-split plots.
#'
#' @details
#' Code
#'
#' The example code shown below can be copied and pasted into a console terminal window
#' and will provide a basic analysis of the rice experiment data (type rice to view the actual rice data).
#'
#' The example code depends on the three packages lmerTest, lsmeans and pbkrtest and these
#' must all be installed on the user machine before the code can be executed.
#' Packages can be installed either by using the commands
#' install.packages('lmerTest'), install.packages('lsmeans') and install.packages('pbkrtest')
#' or by using a tools option in a suitable gui such as RStudio. Sometimes a package depends on other
#' packages for proper installation and if there are warnings about not finding certain named
#' packages then these will need to be installed also.
#'
#' Graphical output should appear in the gui graphics window but, if required, it can be diverted to
#' a suitable pdf file by using a pdf file command. Opening pdf() and closing dev.off()
#' commands are shown hashed-out in the example code but can be copied and pasted without the hashes, if required.
#'
#' Similarly, textual output should appear in the gui terminal window but, if required, it can be diverted to
#' a suitable text file by using a sink file command. Opening and closing sink()
#' commands are shown hashed-out in the example code but can be copied and pasted without the hashes, if required.
#'
#' The ## Not run: and ## End(Not run) comments are irrelevant and can be ignored.
#'
#' Analysis
#'
#' The first step in the analysis is the calculation of polynomial powers of N using the poly() function.
#' As there are 5 levels of N, the maximum possible number of polynomials is four and these have been called
#' linear, quadratic, cubic and quartic polynomials corresponding to the 1st, 2nd, 3rd and 4th powers of N.
#' The powers of the high N in the original scale of measurement are large and the N rates have
#' been divided by 100 to provide improved numerical stability. Significance tests are unaffected by re-scaling
#' but the coefficients and standare errors of the polynomial coefficients will be multiplied by 100 raised to
#' the degree of the corresponding polynomial.
#'
#' The polynomials used in this analysis are 'raw' polynomials which means that they are the actual powers of the
#' actual N rate values. Raw polynomials are simple to use but it is important
#' to remember that raw polynomials are not mutually orthogonal and that the order of fitting of the model terms
#' is important. For polynomial models there is a natural order of fitting
#' of polynomial effects from the lowest to the highest degree so there can never any ambiguity
#' in the order of fitting of the polynomial terms.
#'
#' Table 1 shows a full analysis of variance and displays the sources of variation corresponding to the
#' different types of experimental units to which the treatment factor levels were applied
#' i.e. main plots (for nitrogen), split-plots (for management) and split-split plots (for variety).
#' Each different type of experimental unit (or "stratum") requires a separate error term in the model.
#'
#' Table 2 shows a summary of the treatment means for various marginal classifications of the treatment factors
#' averaged over all the other treatment factors, together with estimated se's for pairwise comparisons of
#' treatment means. The 'lsmeans' package was used for calculating the marginal tables of means and the standard errors.
#'
#' Table 3 shows a mixed model analysis of the full factorial model fitted by REML using the lmer function
#' of the lme4 package (lmerTest provides the same functionality but with the addition of
#' significance tests). Generally with mixed models, determination of the denominator degrees of freedom for
#' Wald-type F- and t-statistics becomes an issue, and here we use the method proposed by Kenward & Roger (1997).
#'
#' Table 7 shows a mixed model analysis similar to Table 3 but with the nitrogen treatment effects
#' decomposed into polynomial effects to provide precise information about the nitrogen treatment
#' comparisons. Normally, quantitative factor effects can be explained by low-degree polynomials
#' and in this analysis most of the nitrogen treatment effects are explained by linear and quadratic trend effects.
#' However, it is important to note that the Variety x Cubic N interaction effect is non-negligible and has a
#' significant Wald F-test. This indicates that not all the varieties responded in a similar way to
#' the N treatments and that some further analysis of the data may be required (see also the N plots for individual
#' varieties and replicates in Fig 1). Note that the management effects are assumed additive throughout this analysis.
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
#' ## adds raw N polynomials to data frame with the origin of the N rate shifted to the mid-point
#' N=poly((rice$nrate/100),4,raw=TRUE)
#' colnames(N)=c("Linear_N","Quadratic_N","Cubic_N","Quartic_N")
#' rice=cbind(rice,N)
#'
#' ## Table 1 Full analysis of rice data assuming qualitative nitrogen effects
#' rice.aov1 = aov(yield ~ Replicate + management*variety*nitrogen +
#' Error(Replicate/Main/Sub),rice)
#' summary(rice.aov1, ddf="Kenward-Roger",type = 1)
#'
#' ## Table 2 lsmeans and se's assuming additive management and qualitative nitrogen effects
#' rice.aov3 = aov(yield ~ Replicate + management + variety*nitrogen +
#' Error(Replicate/Main/Sub),rice)
#' model.tables(rice.aov3, "means", se = FALSE)
#' rice.lmer= lmer(yield ~ Replicate + management+ nitrogen*variety +
#' (1|Replicate:Main)+ (1|Replicate:Main:Sub), data=rice)
#' lsmeans::lsmeans(rice.lmer,~nitrogen)
#' lsmeans::lsmeans(rice.lmer,~variety)
#' lsmeans::lsmeans(rice.lmer,~nitrogen*variety)
#'
#' ## Table 2 lsmeans and se's for pairwise comparisons of treatment means
#' n.v= lsmeans::lsmeans(rice.lmer,~nitrogen|variety)
#' contrast(n.v, alpha=0.05, method="pairwise")
#' v.n= lsmeans::lsmeans(rice.lmer,~variety|nitrogen)
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
