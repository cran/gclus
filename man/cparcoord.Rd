\name{cparcoord}
\alias{cparcoord}   

\title{Enhanced parallel coordinate plot }
\description{
This function draws a parallel coordinate plot of data. Variables
may be reordered and panels colored in the display. It is a modified
version of \code{parcoord {MASS}}.
}
\usage{
cparcoord(data, order = NULL, panel.colors = NULL, col = 1, lty = 1, 
horizontal = FALSE, mar = NULL, ...)
}

\arguments{
\item{data}{a numeric matrix }
  \item{order}{the order of variables. Default is the order in data.}
  \item{panel.colors}{either a vector or a matrix of panel colors. If a 
  vector is supplied, the ith color is used for the ith panel. If a matrix, dimensions 
  should match those of the variables. Diagonal entries are ignored. }
  \item{col}{ a vector of colours, recycled as necessary for each observation.  }
  \item{lty}{ a vector of line types, 
recycled as necessary for each observation.  }
  \item{horizontal}{ If TRUE, orientation is horizontal. }
  \item{mar}{ margin parameters, passed to \code{par}. }
  \item{\dots}{ graphics parameters which are passed to matplot.}
}
\details{
  If \code{panel.colors} is a matrix and \code{order} is supplied, \code{panel.colors} is 
  reordered.}

\references{Hurley, Catherine B.  \dQuote{Clustering Visualisations of Multidimensional 
  Data}, Journal of Computational and Graphical Statistics,
  vol. 13, (4), pp 788-806, 2004. }
\author{ Catherine B. Hurley }

\seealso{\code{\link{cpairs}}, \code{\link[MASS]{parcoord}},
\code{\link{dmat.color}}, \code{\link{colpairs}}, \code{\link{order.endlink}}.}
\examples{
data(state)
state.m <- colpairs(state.x77, 
function(x,y)  cor.test(x,y,"two.sided","kendall")$estimate, diag=1)
# OR, Works only in R1.8,  state.m <-cor(state.x77,method="kendall")  


state.col <- dmat.color(state.m)

cparcoord(state.x77, panel.color= state.col)
# Get rid of the panels with lots of line crossings (yellow) by reordering:
cparcoord(state.x77, order.endlink(state.m), state.col)

# To get rid of the panels with lots of long line segments:
#  use a different panel merit measure- pclen:

mins <- apply(state.x77,2,min)
ranges <- apply(state.x77,2,max) - mins
state.m <- -colpairs(scale(state.x77,mins,ranges), pclen)
cparcoord(state.x77, order.endlink(state.m), dmat.color(state.m))



}

\keyword{multivariate }
\keyword{color }
\keyword{hplot }
