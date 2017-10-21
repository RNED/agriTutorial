#' @name example1
#' @title  EXAMPLE 1: SPLIT-PLOT DESIGN WITH ONE QUALITATIVE AND ONE QUANTITATIVE LEVEL TREATMENT FACTOR
#' @description
#'#' Gomez & Gomez (1984, p. 143) report a rice experiment with three management practices
#' (minimum, optimum, intensive), five different amounts of nitrogen (N) fertilizer
#' (0, 50, 80, 110, 140 kg/ha), and three varieties (V1, V2, V3). The experiment
#' involved variety and management as qualitative treatment factors and nitrogen
#' fertilizer as a quantitative treatment factor. Overall, there were 45 treatments
#'
#' @details
#' The example code can be copied and pasted into a console terminal window
#' and will provide a basic analysis of the rice experiment data (type rice to view the actual rice data
#' file). The example code depends on three packages lmerTest, lsmeans and pbkrtest and these
#' must all be installed on the user machine. This can be done either by using the commands
#' install.packages('lmerTest'), install.packages('lsmeans') and install.packages('pbkrtest')
#' or by using the tools option of a suitable gui such as RStudio.
#'
#' Graphical output should appear in the gui graphics window but, alternatively, can be diverted to
#' a pdf file, if required, by using the pdf file command, which is currently hashed-out.
#'
#' Similarly, the output text should appear in the gui terminal window but, altenatively, can be
#' diverted to any suitable output file, if required, by using the sink() command,
#' which is currently hashed-out.
#'
#' Ignore the ## Not run: and ## End(Not run) comments which are irrelevant for these examples.
#'
#' @references
#'Gomez, K.A., & Gomez, A.A. (1984). Statistical procedures for agricultural
#'research, 2nd edn. New York: Wiley.
#'
#' @examples
#' ## Copy and paste the following code into a R console or GUI to run examples
#' ## Packages lmerTest, lsmeans and pbkrtest MUST be installed
#'
#' \dontrun{
#' require(lmerTest)
#' require(lsmeans)
#' require(pbkrtest)
#'
#' # sink("F:\\tutorial2\\OutputsR\\outExample1.txt") #sink file for outputs
#' ## loads rice data and adds Nitrogen polynomials
#' data(rice)
#' N=poly(rice$nrate,4,raw=FALSE)
#' colnames(N)=c("Linear_N","Quadratic_N","Cubic_N","Quartic_N")
#' rice=cbind(rice,N)
#'
#' ##  Full analysis of variance of rice data with a qualitative nitrogen factor
#' rice.aov1 = aov(yield ~ Replicate + management*variety*nitrogen +
#' Error(Replicate/Main/Sub),rice)
#' summary(rice.aov1, ddf="Kenward-Roger",type = 1)
#'
#' ## lsmeans and se's assuming additive management and qualitative nitrogen effects
#' rice.aov3 = aov(yield ~ Replicate + management + variety*nitrogen +
#' Error(Replicate/Main/Sub),rice)
#' model.tables(rice.aov3, "means", se = FALSE)
#' rice.lmer= lmer(yield ~ Replicate + management+ nitrogen*variety +
#' (1|Replicate:Main)+ (1|Replicate:Main:Sub), data=rice)
#' lsmeans::lsmeans(rice.lmer,~nitrogen)
#' lsmeans::lsmeans(rice.lmer,~variety)
#' lsmeans::lsmeans(rice.lmer,~nitrogen*variety)
#'
#' ##  lsmeans and se's for pairwise comparisons of treatment means
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
#' ## Table 7: Mixed model fitting orthogonal  polynomials for nitrogen effects
#' rice.lmer2= lmer(yield ~ Replicate + management + variety*(Linear_N + Quadratic_N +
#' Cubic_N + Quartic_N) +
#' (1|Replicate:Main)+ (1|Replicate:Main:Sub) , data=rice)
#' anova(rice.lmer2, ddf="Kenward-Roger",type = 1)
#'
#' ## Table 8 Coefficients for separate linear and common quadratic N with additive management
#' rice.lmer4= lmer(yield ~ Replicate + management + variety*nrate + I(nrate**2) +
#' (1|Replicate:Main) + (1|Replicate:Main:Sub), data=rice)
#' summary(rice.lmer4, ddf="Kenward-Roger")
#' # sink() #closes sink file
#'
#' # pdf("F:\\tutorial2\\OutputsR\\outExample1_Fig_S1.pdf") #opens a graphical pdf output file
#' ## Nitrogen response per variety per plot showing anomalous behaviour of Variety 1
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
