\name{4. Methods for srafit objects }
\alias{AIC.srafit}
\alias{coef.srafit}
\alias{logLik.srafit}
\alias{confint.srafit}
\alias{vcov.srafit}
\title{ Overloaded functions for "srafit" objects }
\description{
  The functions return the output expected from the corresponding \R functions, applied to an object of class \code{srafit}.
}
\usage{
\method{logLik}{srafit}(object, ...)
\method{AIC}{srafit}(object, ...)
\method{coef}{srafit}(object, ...)
\method{confint}{srafit}(object, ...)
\method{vcov}{srafit}(object, ...)
}
\arguments{
  \item{object}{ An object of class \code{srafit}. }
  \item{\dots}{ Any additional parameters to the corresponding functions. }
}
\details{
  The confidence intervals are calculated from the estimate standard errors, and are thus different (less precise) from what would be calculated from the profile likelihood. 
}

\seealso{ \code{\link{sraAutoreg}}, \code{\link{sraCstvar}} and other mechanistic models, \code{\link{AIC}}, \code{\link{coef}}, \code{\link{logLik}}, \code{\link{confint}}, \code{\link{vcov}}.}
\examples{
########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

cstvar <- sraCstvar(data)

AIC(cstvar)
logLik(cstvar)
coef(cstvar)
confint(cstvar)
vcov(cstvar)
}

\keyword{ methods }

