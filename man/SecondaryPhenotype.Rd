\name{SecondaryPhenotype}
\alias{SecondaryPhenotype}
\title{SecondaryPhenotype}
\description{
Use proportional odds logistic regression to test for the association between a SNP (i.e. x) and secondary phenotype (i.e. y) while accounting for the ascertainment bias due to case-control sampling (i.e. d).
}
\usage{
SecondaryPhenotype(x, y, d, z = null, covariates = FALSE, sigLevel = 0.05)
}
\arguments{
\item{x}{Let x be a vector of genotypes i.e. x=0,1,2}

\item{y}{Let y be a vector of the phenotype}

\item{d}{Let d be a vector of case control status}

\item{z}{Let z be a matrix of covariates}

\item{sigLevel}{Let sigLevel be the significance level, default to 0.05}

\item{covariates}{covariates=FALSE (default) then the models will not be adjusted for covariates, covariates=TRUE then the model will be adjusted for covariates.}
}
\value{
whether or not the SNP is associated with the secondary phenotype Y given case-control sampling d
}
\references{
 Lutz SM, Hokanson JE, Lange C. (2014) An Alternative Hypothesis Testing Strategy for Secondary Phenotype Data in Case-Control Genetic Association Studies. Frontiers in Genetics. 5 (188).
}
\author{
Sharon Lutz, Annie Thwing
}

\section{Warning}{ 
All covariates included in the model for adjustment must be entered as a matrix, not individually. For instance, variables age and gender should first be combined such that z=cbind(age,gender) and z is entered into the function instead of age and gender separately.}

\examples{
set.seed(1)
n<-1000
d<-c(rep(0,n/2),rep(1,n/2))
x<-rbinom(n,2,0.3)
z<-rnorm(n)
y<-rnorm(n,0.1*d+0.2*x+0.1*z)

SecondaryPhenotype(x,y,d,z,covariates=TRUE)
SecondaryPhenotype(x,y,d)
}
\keyword{ function }
