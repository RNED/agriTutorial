#' @name example2
#' @title  EXAMPLE 2 Lack-of-fit and marginality for a single quantitative treatment factor
#' @docType package
#'
#' @description
#' Petersen (1994, p. 125) describes an experiment conducted to assess the effects
#' of five different quantities of N-fertiliser (0, 35, 70, 105 and 140 kg N/ha) on root dry
#' matter yield of sugar beets (t/ha) with three complete replications laid out in three
#' randomized complete blocks. One objective of this experiment is to determine the amount
#' of fertilizer maximizing yield.
#'
#' @details
#' Code
#'
#' The example code shown below can be copied and pasted into any R console terminal window
#' and will provide a basic analysis of the beet experiment data (type beet to view the actual beet data).
#'
#' Graphical output should appear in the gui graphics window but, if required, it can be diverted to
#' a suitable pdf file by using a pdf file command. Opening pdf() and closing dev.off()
#' commands are shown hashed-out in the example code but can be copied and pasted without the hashes, if required.
#'
#' Similarly, textual output should appear in the gui terminal window but, if required, it can be diverted to
#' a suitable text file by using a sink file command. Opening and closing sink()
#' commands are shown hashed-out in the example code but can be copied and pasted without the hashes, if required
#' (hashed lines are ignored by R).
#'
#' Analysis
#'
#' The first stage of the analysis is the calculation of polynomial powers of N using the poly() function, as discussed
#' in Example 1 and again with the N rates re-scaled by division by 100.
#'
#' The next stage fits a full polynomial analysis of variance based on single polynomial
#' effects fitted in sequence from the lowest to the highest. This is equivalent to the analysis shown in Tables 4 and 5
#' of Piepho & Edmondson (2017) except that a complete partition into single degree of freedom polynomial contrasts is
#' shown rather than the 'lack of fit' terms shown in Tables 4 and 5.
#'
#' Next, a quadratic regression model with linear and quadratic terms only is fitted which provides the model coefficients
#' and standard errors and confidence intervals shown in Table 6 of Piepho & Edmondson (2017).
#'
#' Next, a fitted quadratic graph of the yield versus the N rate is plotted (using the original unscaled
#' N axis) to show the method of plotting Fig 3 in Piepho & Edmondson (2017).
#'
#' Finally, a set of diagnostic plots are shown for the quadratic nitrogen effects model. These plots can be
#' produced automatically as shown for ordinary linear models but are not available for general mixed models.
#'
#'
#' @references
#' Petersen, R.G. (1994). Agricultural field experiments. Design and analysis. New York: Marcel Dekker.
#'
#' Piepho, H. P. & Edmondson R. N. (2017). A tutorial on the statistical analysis of factorial experiments with qualitative and quantitative
#' treatment factor levels.Journal of Agronomy and Crop Science. Submitted
#'
#' @examples
#' ## Copy and paste the following code into a R console or GUI to run examples
#'
#' \dontrun{
#' require(ggplot2)
#'
#' ## Loads beet data and builds a data frame with re-scaled N rate raw polynomials
#' data(beet)
#' N=poly((beet$nrate/100), degree=4, raw=TRUE)
#' colnames(N)=c("Linear_N","Quadratic_N","Cubic_N","Quartic_N")
#' beet=cbind(beet,N)
#'
#' # sink("F:\\tutorial2\\OutputsR\\outExample2.txt") #sink file for outputs
#' ## Tables 4 & 5: Full polynomial analysis of variance based on raw polynomials
#' anova(lm(yield ~ Replicate +  Linear_N + Quadratic_N + Cubic_N + Quartic_N , data=beet))
#'
#' ##  Table 6: calculates quadratic model coefficients with standard errors and confidence intervals
#' quadratic = lm(yield ~ Replicate +  Linear_N + Quadratic_N, data=beet)
#' summary(quadratic)
#' confint(quadratic, level=0.95)
#' # sink() #closes sink file
#'
#' # pdf("F:\\tutorial2\\OutputsR\\outExample1_Fig_S2.pdf") #opens a graphical pdf output file
#' ## Diagnostic plots
#'
#' ## Fig 3: quadratic N rate plot using the ggplot2 package
#' par(mfrow=c(2,2),oma=c(0,0,2,0))
#' quadratic=lm(yield ~ Replicate + Linear_N + Quadratic_N, data=beet)
#' plot(quadratic,sub.caption=NA)
#' title(main="Diagnostic plots for quadratic nitrogen effects model", outer=TRUE)
#' ggplot(beet, aes(x=nrate, y=yield)) +
#' ggtitle("Fig 3 Yield versus N fertilizer for sugar beet trial with 95% confidence band")+
#' geom_point(shape=1)+stat_summary(fun.y = mean, geom="point")+
#' geom_smooth(method=lm, formula=y ~ poly(x, 2))+theme_bw()
#'
#' par(mfrow=c(2,2),oma=c(0,0,2,0))
#' quadratic=lm(yield ~ Replicate + Linear_N + Quadratic_N, data=beet)
#' plot(quadratic,sub.caption=NA)
#' title(main="Diagnostic plots for quadratic nitrogen effects model", outer=TRUE)
#'
#' #dev.off()
#'
#' }
#'
NULL

