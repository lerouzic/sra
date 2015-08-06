\name{6. sraData}
\alias{sraData}

\title{ Generates an object of class "sradata", necessary to run the models provided by the sra package. }
\description{
  The data necessary to analyse selection response time series are, for each generation, (i) the mean phenotype of the population, (ii) the phenotypic variance, (iii) the mean of the breeders, and (iv) the population size. These data have to be grouped into an object of class "sradata", which can be provided to the sra analysis functions such as \code{\link{sraAutoreg}} or \code{\link{sraCstvar}}.
}

\usage{
sraData(phen.mean, phen.var, phen.sel, var.sel=NULL, N=NULL, 
  gen=NULL, rep=NULL)
}

\arguments{
  \item{phen.mean}{ The vector of phenotypic means. }
  \item{phen.var}{ The vector of phenotypic variances. }  
  \item{phen.sel}{ The vector of the mean phenotype of breeders. Can be \code{NA} for the last generations. } 
  \item{var.sel}{ The vector of the phenotypic variances if breeders. If not provided (\code{NULL}), the vector is estimated assuming truncation selection and normal distribution of phenotypes.}
  \item{N}{ The vector of population size for each generation (before selection). }
  \item{gen}{ The generation numbers. Useful when several times series are provided. }
  \item{rep}{ The repetition identification. Useful when several time series are provided. } 
}

\details{

If not provided, the default value for \code{N} is 100. Incorrect values for \code{N} will affect the likelihood value and the maximum-likelihood estimates.

\code{gen} will be assumed to vary from 1 to the maximum number of generations by default. 

If more than one time series are provided, it is dangerous not to specify \code{gen} or \code{rep}. \code{rep} can be any unique identifier. For instance, fro two times series of 3 generations each, \code{gen} can be \code{c(1,2,3,1,2,3)} and \code{rep} can be \code{c("up","up","up","down","down","down")}. 

}

\value{
  An object of class \code{sradata}.
}


\seealso{ \code{\link{sraAutoreg}}, \code{\link{sraCstvar}}, and other mechanistic models, \code{\link{sraAutoregTimeseries}}. }

\examples{
########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

}

\keyword{ datagen }

