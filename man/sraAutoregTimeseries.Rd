\name{Expected time series dynamics}
\alias{sraAutoregTimeseries}
\alias{sraAutoregHeritTimeseries}
\alias{sraAutoregEvolvTimeseries}
\alias{sraTimeseries}
\alias{sraEpiTimeseries}

\title{ Expected dynamics for different SRA models (internal functions). }
\description{
  Each genetic architecture model leads to an expected dynamics for the mean and the variance of the population, given a selection pressure. These functions provide the expectation of the models, which are used (i) to fit the model by maximum-likelihood, and (ii) to provide the theoretical dynamics of the best model. 
}
\usage{
sraAutoregTimeseries(beta, delta=rep(0, length(beta)), mu0=0, logvarA0=0, logvarE0=0, 
	relativekA0=0, kA1=1, kA2=0, kA3=0, 
	relativekE0=0, kE1=1, kE2=0, kE3=0, threshold=1e-10, 
	logrelativekA0=NULL, logrelativekE0=NULL, 
	logkA1=NULL, logkE1=NULL, logkA2=NULL, logkE2=NULL, logkA3=NULL, logkE3=NULL)
sraAutoregHeritTimeseries(beta, delta=rep(0, length(beta)), mu0=0, logith20=0, logvarP0=0,
	relativekA0=0, kA1=1, kA2=0, kA3=0, 
	relativekE0=0, kE1=1, kE2=0, kE3=0, threshold=1e-10, 
	logrelativekA0=NULL, logrelativekE0=NULL, 
	logkA1=NULL, logkE1=NULL, logkA2=NULL, logkE2=NULL, logkA3=NULL, logkE3=NULL)
sraAutoregEvolvTimeseries(beta, delta=rep(0, length(beta)), mu0=0, logIA0=0, logIE0=0, 
	relativekA0=0, kA1=1, kA2=0, kA3=0, 
	relativekE0=0, kE1=1, kE2=0, kE3=0, threshold=1e-10, 
	logrelativekA0=NULL, logrelativekE0=NULL, 
	logkA1=NULL, logkE1=NULL, logkA2=NULL, logkE2=NULL, logkA3=NULL, logkE3=NULL)
sraTimeseries(beta, delta=rep(0, length(beta)), mu0=0, logvarA0=0, logvarE0=0, 
	logNe=log(100), logn=log(1e+10), logvarM=log(1e-20), kc=0, kg=0, o=mu0, s=0)
sraEpiTimeseries(beta, delta=rep(0, length(beta)), mu0=0, logvarA0=0, logvarE0=0, 
	logNe=log(1000), logvarM=log(1.e-20), 
	logepsilon=0, logminusepsilon=NA, logvarepsilon=0)

}
\arguments{
  \item{beta}{ The vector of the selection gradients for all generations. }
  \item{delta}{ The vector of the relative selection strenght on variance. }
  \item{mu0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logvarA0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logvarE0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{relativekA0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kA1}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kA2}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kA3}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{relativekE0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kE1}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kE2}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{kE3}{See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logrelativekA0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkA1}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkA2}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkA3}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logrelativekE0}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkE1}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkE2}{ See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logkE3}{See \code{\link{sraAutoreg}} for the description of the model parameters. }
  \item{logNe}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logn}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logvarM}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{kc}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{kg}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{o}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logs2}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logepsilon}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logminusepsilon}{See \code{\link{sraCstvar}} for the description of the model parameters. }
  \item{logvarepsilon}{See \code{\link{sraCstvar}} for the description of the model parameters. }
}

\details{
  In \code{sraEpitimeseries}, the value of the directionality of epistasis (epsilon) should be provided either by \code{logepsilon} when epsilon is positive, or by \code{logminusepsilon} when epsilon is negative. One of them should therefore be \code{NA}. 
}

\value{
  The functions return a list of vectors: \code{means} for the phenotypic average, \code{varA}, \code{varE} and \code{varP} for the additive, residual, and phenotypic variances respectively. 
}

\note{ These functions are not designed to be called directly by the end user. The models implemented in the time series functions are described in \code{\link{sraAutoreg}} and \code{\link{sraCstvar}}. 
}
\seealso{ \code{\link{sraAutoreg}}, \code{\link{sraCstvar}} }

\keyword{ internal }
\keyword{ utilities }
\keyword{ ts }

