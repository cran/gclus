\name{pclen}
\alias{pclen}
\alias{pcglen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Profile smoothness measures }
\description{
Computes measures of profile smoothness of 2-d data,
where \code{x} and  \code{y} give the object coordinates.

}
\usage{
pclen(x, y)
pcglen(x, y)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{x}{is a numeric vector. }
 \item{y}{is a numeric vector. }
}
\details{
\code{pclen} computes the total line length in a parallel coordinate plot
of x and y.

\code{pcglen} computes the average (per object) line length in a parallel coordinate plot
where all pairs of objects are connected.

Usually, the data is standardized prior to using these functions.
}
\value{The panel measure is returned.
}
\references{Hurley, Catherine B.  \dQuote{Clustering Visualisations of Multidimensional 
Data}, Journal of Computational and Graphical Statistics,
vol. 13, (4), pp 788-806, 2004. }
\author{ Catherine B. Hurley }
%\note{ ~~further notes~~ }

\seealso{\code{\link{cparcoord}}, 
\code{\link{colpairs}}, \code{\link{order.endlink}}.}

\examples{
x <- runif(20)
y <- runif(20)
pclen(x,y)


data(state)
mins <- apply(state.x77,2,min)
ranges <- apply(state.x77,2,max) - mins
state.m <- -colpairs(scale(state.x77,mins,ranges), pclen)
state.col <- dmat.color(state.m)
cparcoord(state.x77, panel.color= state.col)
# Get rid of the panels with long line segments (yellow) by reordering:
cparcoord(state.x77, order.endlink(state.m), state.col)

}
\keyword{hplot}
\keyword{multivariate}
