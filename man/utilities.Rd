\name{vec2distm}
\alias{vec2distm}
\alias{vec2dist}
\alias{lower2upper.tri.inds}
\alias{diag.off}
\alias{clus2memship}
\alias{memship2clus}

\title{ Various utility functions}
\description{
  \code{vec2distm} converts a vector to a distance matrix.

  \code{vec2dist} converts a vector to a \code{dist} structure.

  \code{lower2upper.tri.inds} is the same as \code{lower.to.upper.tri.inds}
  from package cluster. It computes an index vector for extracting or reordering a lower     
triangular matrix that is stored as a contiguous vectors. 

\code{diag.off}  returns a vector of off-diagonal elements of a matrix.
\code{off} specifies the distance above the main (0) diagonal.

\code{clus2memship} converts  a list whose ith element contains the indices
of objects in the ith cluster into a vector whose ith 
element gives the cluster number of the ith object.

\code{memship2clus} converts  a vector whose ith 
element gives the cluster number of the ith object into a list 
whose ith element contains the indices
of objects in the ith cluster.

}
\usage{
vec2distm(vec)
vec2dist(vec)
lower2upper.tri.inds(n)
diag.off(m,off=1)
clus2memship(clusters)
memship2clus(memship)
}
\arguments{
  \item{vec}{is a vector. }
  \item{n}{is an integer > 1. }
 \item{m} {is a matrix.}
 \item{clusters}{is a list whose ith element contains the indices of the 
 objects belonging to the ith cluster.}
\item{off}{is an integer specifying the distance above the main (0) diagonal.}
\item{memship}{is a vector whose ith element gives the cluster number of 
the ith object.}

}
\author{ Catherine B. Hurley}
%\note{ ~~further notes~~ }


\seealso{  \code{\link{dist}}, \code{\link{diag}}. }
\examples{
vec <- 1:15
vec2distm(vec)
vec2dist(vec)
diag.off(vec2distm(vec))
lower2upper.tri.inds(5)
clus2memship(list(c(1,3,5),c(2,6),4))
memship2clus(c(1,3,4,2,1,4,2,3,2,3))
}
\keyword{cluster}
