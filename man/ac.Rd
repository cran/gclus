\name{ac}
\alias{ac}
\alias{sil}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Clustering coefficients from package cluster.}
\description{
  Computes clustering coefficients from \code{cluster},
where \code{x} and  \code{y} give the object coordinates.
}
\usage{
ac(x, y, ...)
sil(x, y, groups, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{is a numeric vector. }
  \item{y}{is a numeric vector. }
  \item{groups}{is a vector of group memberships, used by \code{sil} only.}
   
  \item{\dots}{are passed to \code{agnes} in \code{ac} and to \code{dist} 
  in \code{sil}.}
}
\details{
\code{ac} - Computes clustering coefficient from \code{agnes{cluster}}.

\code{sil} - Computes the silhouette coefficient from from package 
\code{cluster}.
}
\value{
  The clustering coefficient is returned.
}
\references{ Kaufman, L. and Rousseeuw, P.J. (1990). Finding Groups in Data: An Introduction to Cluster Analysis . Wiley, New York.  }
\author{ Catherine B. Hurley}
\seealso{ \code{\link[cluster]{agnes}}, \code{\link[cluster]{silhouette}}, \code{\link[stats]{dist}} }
\examples{
x <- runif(20)
y <- runif(20)
g <- rep(c("a","b"),10)

ac(x,y)
sil(x,y,g)
}
\keyword{cluster}
