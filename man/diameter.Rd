\name{diameter}
\alias{diameter}
\alias{star}
\alias{km2}
\alias{gtot}
\alias{gave}

\title{ Cluster heterogeneity of 2-d data }
\description{
Computes measures of cluster heterogeneity of 2-d data,
where \code{x} and  \code{y} give the object coordinates.
}
\usage{
diameter(x, y, ...)
star(x, y, ...)
km2(x,y)
gtot(x,y, ...)
gave(x,y, ...)
}
\arguments{
  \item{x}{is a numeric vector. }
  \item{y}{is a numeric vector. }
  \item{\dots}{are passed to \code{dist}. }
}
\details{
\code{diameter} computes the cluster diameter- the maximum distance
between objects. 

\code{star} computes the cluster star distance- the smallest
total distance from one object to another.

\code{km2} computes the kmeans distance.

\code{gtot} computes the sum of all inter-object distances.

\code{gave} computes the per-object average of all 
inter-object distances.

}
\value{The cluster measure is returned.
}
\references{ See Gordon, A. D. (1999).``Classification''. Second Edition. London:
     Chapman and Hall / CRC }
\author{ Catherine B. Hurley}


\seealso{ \code{\link{colpairs}}, \code{\link{cpairs}}, \code{\link{order.single}}}
\examples{
x <- runif(20)
y <- runif(20)
diameter(x,y)
}

\keyword{cluster}
