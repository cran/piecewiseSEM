% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary.psem}
\alias{summary.psem}
\title{Summarizing piecewise structural equation models}
\usage{
\method{summary}{psem}(
  object,
  ...,
  basis.set = NULL,
  direction = NULL,
  interactions = FALSE,
  conserve = FALSE,
  conditioning = FALSE,
  add.claims = NULL,
  standardize = "scale",
  standardize.type = "latent.linear",
  test.statistic = "F",
  test.type = "II",
  intercepts = FALSE,
  AIC.type = "loglik",
  .progressBar = TRUE
)
}
\arguments{
\item{object}{a list of structural equations}

\item{...}{additional arguments to summary}

\item{basis.set}{an optional basis set}

\item{direction}{a vector of claims defining the specific directionality of any independence 
claim(s)}

\item{interactions}{whether interactions should be included in independence claims. 
Default is FALSE}

\item{conserve}{whether the most conservative P-value should be returned (See Details) 
Default is FALSE}

\item{conditioning}{whether all conditioning variables should be shown in the table
Default is FALSE}

\item{add.claims}{an optional vector of additional independence claims (P-values) 
to be added to the basis set}

\item{standardize}{whether standardized path coefficients should be reported 
Default is "scale"}

\item{standardize.type}{the type of standardized for non-Gaussian responses: 
\code{latent.linear} (default), \code{Mendard.OE}}

\item{test.statistic}{the type of test statistic generated by \code{\link{Anova}}}

\item{test.type}{the type of test ("II" or "III") for significance of categorical
variables (from \code{car::Anova})}

\item{intercepts}{whether intercepts should be included in the coefficient  table
Default is FALSE}

\item{AIC.type}{whether the log-likelihood \code{"loglik"} or d-sep \code{"dsep"} AIC score 
should be reported. Default is \code{"loglik"}}

\item{.progressBar}{an optional progress bar. Default is TRUE}
}
\value{
The function \code{summary.psem} returns a list of summary
statistics: \item{dTable}{ A summary table of the tests of directed
separation, from \code{\link{dSep}}.  } \item{CStat}{ Fisher's C statistic,
degrees of freedom, and significance value based on a Chi-square test.  }
\item{AIC}{ Information criterion (Akaike, corrected Akaike) as
well as degrees of freedom and sample size.  } \item{coefficients}{ A
summary table of the path coefficients, from \code{link{coefs}}.  }
\item{R2}{ (Pseudo)-R2 values, from \code{\link{rsquared}}.  }
}
\description{
Returns information necessary to interpret piecewise structural equation
models, including tests of directed separation, path coefficients,
information criterion values, and R-squared values of individual models.
}
\details{
The forthcoming argument \code{groups} splits the analysis based on an optional grouping
factor, conducts separate d-sep tests, and reports goodness-of-fit and path
coefficients for each submodel. The procedure is approximately similar to a
multigroup analysis in traditional variance-covariance SEM. Coming in version 2.1.

In cases involving non-normally distributed responses in the independence
claims that are modeled using generalized linear models, the significance of
the independence claim is not reversible (e.g., the P-value of Y ~ X is not
the same as X ~ Y). This is due to the transformation of the response via
the link function. In extreme cases, this can bias the goodness-of-fit
tests. \code{summary.psem} will issue a warning when this case is present
and provide guidance for solutions. One solution is to specify the
directionality of the relationship using the \code{direction} argument, e.g.
\code{direction = c("X <- Y")}. Another is to run both tests (Y ~ X, X ~ Y)
and return the most conservative (i.e., lowest) P-value, which can be
toggled using the \code{conserve = TRUE} argument.

In some cases, additional claims that were excluded from the basis set can
be added back in using the argument \code{add.claims}. These could be, for
instance, independence claims among exogenous variables. See Details in
\code{\link{basisSet}}.

Standardized path coefficients are scaled by standard deviations.
}
\references{
Shipley, Bill. "A new inferential test for path models based on
directed acyclic graphs." Structural Equation Modeling 7.2 (2000): 206-218.

Shipley, Bill. Cause and correlation in biology: a user's guide to path
analysis, structural equations and causal inference. Cambridge University
Press, 2002.

Shipley, Bill. "Confirmatory path analysis in a generalized multilevel
context." Ecology 90.2 (2009): 363-368.

Shipley, Bill. "The AIC model selection method applied to path analytic
models compared using a d-separation test." Ecology 94.3 (2013): 560-564.
}
\seealso{
The model fitting function \code{\link{psem}}.
}
\author{
Jon Lefcheck <lefcheckj@si.edu>
}
