\name{5. plot.srafit}
\alias{plot.srafit}
\alias{sraPlotMean}
\alias{sraPlotMeanResid}
\alias{sraPlotVar}
\alias{sraPlotVarResid}
\alias{sraPlotlegend}
\alias{sraFormatlegend}

\title{ Plotting "srafit" objects }
\description{
These functions plot in a nice way the content of objects of class \code{srafit}, the result of \code{sra} model fitting. 
}
\usage{
\method{plot}{srafit} (x, series = levels(x$data$rep), resid = FALSE, 
			variance = FALSE, ...)
sraPlotMean(srafit, series=levels(srafit$data$rep), legend=TRUE, 
               		xlim=NULL, ylim=NULL, xlab=NULL, ylab=NULL, pch=1, ...)
sraPlotMeanResid(srafit, series=levels(srafit$data$rep))
sraPlotVar (srafit, series=levels(srafit$data$rep), legend=TRUE, 
            		xlim=NULL, ylim=NULL, xlab=NULL, ylab=NULL, pch=1, ...)
sraPlotVarResid (srafit, series=levels(srafit$data$rep))
sraPlotlegend(labels, estimates, AIC=NULL, confint=NULL, 
                       	location="topleft")
sraFormatlegend(names, values, AIC=NULL, ...)
}
\arguments{
  \item{x}{ An object of class \code{srafit} }
  \item{srafit}{ An object of class \code{srafit} }
  \item{series}{ The identifier (\code{rep}) of the time series that should be plotted. By default, all series are displayed. }
  \item{resid}{ Whether or not the residuals (data - model expectation) should be displayed. }
  \item{variance}{ If \code{TRUE}, the phenotypic variance is displayed. If \code{FALSE} (default), the phenotypic mean is displayed. }
  \item{legend}{ If \code{TRUE}, a legend with the parameter estimates is displayed. }
  \item{xlim}{ Same meaning as in \code{\link{plot}}. If \code{NULL}, a (hopefully) nice range is calculated. }
  \item{ylim}{ Same meaning as in \code{\link{plot}}. If \code{NULL}, a (hopefully) nice range is calculated.}
  \item{xlab}{ Same meaning as in \code{\link{plot}}. If \code{NULL}, a default label is provided. }
  \item{ylab}{ Same meaning as in \code{\link{plot}}. If \code{NULL}, a default label is provided. }
  \item{pch}{ Same meaning as in \code{\link{par}}. }
  \item{labels}{ Formatted labels of the names of the estimates in the legend. }
  \item{estimates}{ Values of the parameter estimates. }
  \item{AIC}{ Value of the AIC. If \code{NULL}, the AIC is not added to the legend. }
  \item{confint}{ Confidence intervals of the parameters. If \code{NULL} (default), they are not displayed in the legend. }
  \item{location}{ Location of the legend, corresponding to \code{x} in \code{\link{legend}}. }
  \item{names}{ Names of the parameters (as defined in the models). }
  \item{values}{ Values of the parameter estimates (as defined in the models). }
  \item{\dots}{ For \code{plot.srafit}, \code{sraPlotMean}, \code{sraPlotVar}: Additional parameters for the function \code{\link{plot}}. For \code{sraFormatlegend}: Additional parameters to \code{\link{format}}. }
}
\details{
  The only function that should be used by the end user is \code{plot.srafit}. 
}
\author{ Arnaud Le Rouzic }

\seealso{ \code{\link{sraAutoreg}}, \code{\link{sraCstvar}}. }
\examples{
########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

cstvar <- sraCstvar(data)


plot(cstvar)
plot(cstvar, xlim=c(3,9))
plot(cstvar, var=TRUE, ylab="This is a custom Y axis label")
plot(cstvar, resid=TRUE, legend=FALSE, main="Constant variance model fit")
}

\keyword{ hplot }
\keyword{ models }

