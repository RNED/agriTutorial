#' @name example5
#' @title  EXAMPLE 5
#' @docType package
#'
#' @description
#' Transformation of treatment levels to improve fit
#'
#' @details
#' Mead (1988, p. 323) describes an experiment on spacing effects with turnips,
#' which was laid out in three complete blocks. Five different seed rates
#' (0.5, 2, 8, 20, 32 lb/acre) were tested in combination with four row widths
#' (4, 8, 16, 32 inches), giving rise to a total of 20 treatments.
#' Turnip yields (in lb per plot) were logarithmically transformed for
#' analysis because this stabilized the variance (Mead, 1988; also see Figure 12).
#'
#' @references
#' Mead, R. (1988). The design of experiments. Statistical principles for practical application.
#' Cambridge: Cambridge University Press.
#'
#' @examples
#'
#' ## Loads turnip data
#' data(turnip)
#'
#' ## Untransformed raw spacing and density polynomials
#' RowSpacing=poly(turnip$rowspacing,3,raw=TRUE)
#' colnames(RowSpacing)=c("linSpacing","quadSpacing","cubSpacing")
#' Density=poly(turnip$density,4,raw=TRUE)
#' colnames(Density)=c("linDensity","quadDensity","cubDensity","quartDensity")
#' turnip=cbind(turnip,Density,RowSpacing)
#'
#' ## Log transformed raw spacing and density polynomials
#' logRowSpacing=poly(log(turnip$rowspacing),3,raw=TRUE)
#' colnames(logRowSpacing)=c("linlogSpacing","quadlogSpacing","cublogSpacing")
#' logDensity=poly(log(turnip$density),4,raw=TRUE)
#' colnames(logDensity)=c("linlogDensity","quadlogDensity","cublogDensity","quartlogDensity")
#' turnip=cbind(turnip,logDensity,logRowSpacing)
#'
#' ## Table 16 Quadratic response surface for untransformed planting density by row spacing model
#' quad.mod  = lm(log_yield ~ Replicate + linDensity * linSpacing + quadDensity + quadSpacing +
#' lack_of_fitDensity*lack_of_fitSpacing,turnip)
#' anova(quad.mod)
#'
#' ## Table 17 Quadratic response surface for transformed log planting density by log row spacing
#' log.quad.mod =
#' lm(log_yield ~ Replicate + linlogDensity*linlogSpacing + quadlogDensity  + quadlogSpacing +
#' lack_of_fitDensity*lack_of_fitSpacing  ,turnip)
#' anova(log.quad.mod)
#'
#' ## graphical plots of untransformed data
#' par(mfrow=c(2,2),oma=c(0,0,2,0))
#' fit.quad.mod = lm(log_yield ~ Replicate + linDensity * linSpacing + quadDensity + quadSpacing, turnip)
#' plot(fit.quad.mod,sub.caption=NA)
#' title(main="Fig 12a Quadratic response for untransformed density by row spacing", outer=TRUE)
#'
#' ## graphical plots of transformed data
#' par(mfrow=c(2,2),oma=c(0,0,2,0))
#' fit.log.quad.mod = lm(log_yield ~ Replicate + linlogDensity*linlogSpacing + quadlogDensity  +
#' quadlogSpacing, turnip)
#' plot(fit.log.quad.mod,sub.caption=NA)
#' title(main="Fig 12b Quadratic response for transformed log density by log row spacing", outer=TRUE)
NULL

