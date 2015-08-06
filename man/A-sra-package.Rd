\name{1. sra package}
\alias{sra-package}
\alias{sra}
\docType{package}
\title{
Selection Response Analysis: a \R package
}
\description{
This package (\code{sra}) provides a set of tools to analyse artificial-selection response datasets. The data typically feature for several generations the average value of a trait in a population, the variance of the trait, the population size and the average value of the parents that were chosen to breed. \code{sra} implements two families of models aiming at describing the dynamics of the genetic architecture of the trait during the selection response. The first family relies on purely descriptive (phenomenological) models, based on an autoregressive framework. The second family provides different mechanistic models, accounting e.g.\ for inbreeding, mutations, genetic and environmental canalization, or epistasis. The parameters underlying the dynamics of the time series are estimated by maximum likelihood. The \code{sra} package thus provides (i) a wrapper for the \R functions \code{\link{mle}} and \code{\link{optim}} aiming at fitting in a convenient way a predetermined set of models, and (ii) some functions to plot and analyze the output of the models. 
}
\details{
\tabular{ll}{
Package: \tab sra\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
License: \tab GPL-2\cr
}
\strong{Data set} The user must provide (i) a vector containing the mean phenotype for all generations, (ii) a vector containing the phenoypic variance, (iii) a vector for the population sizes, (iv) a vector for the mean phenotype of the breeders, (v) (if available) a vector of the phenotypic variances among breeders. Several time series (e.g.\ several lines submitted to similar or different selection pressures) can be analyzed. 

\strong{Phenomenological models} The function \code{\link{sraAutoreg}} fits an autoregressive model to the variance trends, and provides a description of the dynamics of the genetic architecture that is not based on \emph{a priori} biological mechanisms. The complexity of the model can be adjusted by adding extra autoregressive parameters.

\strong{Scaling} The relevant scale for genetic architecture models is not necessarily the original measurement scale. Autoregressive models can be run from data e.g.\ on a log scale, but the package also provides two additional 'scales' that are specific to genetic architecture properties. \code{\link{sraAutoregHerit}} fits the same models as \code{\link{sraAutoreg}}, but considering that the dynamics of environmental variance is constrained by the quantity known as "heritability" (ratio between additive and phenotypic variances). \code{\link{sraAutoregEvolv}} proposes that both genetic and environmental variances are constrained by the mean of the population ("mean-scaled evolvability"). 

\strong{Mechanistic models} Classical quantitative-genetics models are also provided. \code{\link{sraCstvar}} implements a "constant-variance" model, \code{\link{sraDrift}} considers the effects of inbreeding on the additive genetic variance, \code{\link{sraMutation}} introduces some mutational variance, \code{\link{sraCanalization}} illustrates the impact of a simple model of genetic and environmental canalization, \code{\link{sraDirepistasis}} considers directional epistasis, and \code{\link{sraSelection}} models the effect of unavoidable natural (stabilizing) selection competing with directional artificial selection. 

\strong{Plotting and analysis} All the models provide an objet of class \code{srafit} that can be plotted directly (see e.g.  \code{\link{plot.srafit}}). 
}
\author{
Arnaud Le Rouzic 

Maintainer: Arnaud Le Rouzic <a.p.s.lerouzic@bio.uio.no>
}
\references{
Le Rouzic, A., Houle, D., and Hansen, T.F. (2011) A modelling framework for the analysis of artificial selection-response time series. Genetics Research.
}
\keyword{ package }
\examples{
########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

# Autoregressive models
autor <- sraAutoreg(data)

# AIC of the model:
AIC(autor)

# Maximum-likelihood estimates
coef(autor)

autor.herit <- sraAutoregHerit(data)
autor.evolv <- sraAutoregEvolv(data)

# Mechanistic models

# Constant variance
cstvar <- sraCstvar(data)
# Inbreeding
drift <- sraDrift(data)

# Plotting
plot(drift)
plot(drift, var=TRUE)

}
