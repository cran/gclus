\name{colpairs}
\alias{colpairs}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Applies a function to all pairs of columns }
\description{
Given an nxp matrix \code{m} and a function \code{f},
returns the pxp matrix got by applying \code{f}  to all pairs of columns of \code{m} .

}
\usage{
colpairs(m, f, diag = 0, na.omit = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{m}{ a matrix }
  \item{f}{ a function of two vectors, which returns a single result. }
  \item{diag}{ if supplied, this value is placed on the diagonal of the
result. }
  \item{na.omit}{ If \code{TRUE}, rows with missing values are omitted for each pair
of columns. }
  \item{\dots}{ argments are passed to \code{f}. }
}

\value{
a matrix matrix got by applying \code{f}  to all pairs of columns of \code{m} .
}
%-\references{ ~put references to the literature/web site here ~ }
\author{Catherine B. Hurley }


\seealso{ \code{\link{gave}}, \code{\link{partition.crit}}, 
\code{\link{order.single}},\code{\link{order.endlink}}}
\examples{
data(state)
state.m <- colpairs(state.x77, 
function(x,y)  cor.test(x,y,"two.sided","kendall")$estimate, diag=1)
state.col <- dmat.color(state.m)
# This is equivalent to state.m <- cor(state.x77,method="kendall")


layout(matrix(1:2,nrow=1,ncol=2))
parcoord.bg(state.x77, panel.color= state.col)
# Get rid of the panels with lots of line crossings (yellow) by reorderings
parcoord.bg(state.x77, order.endlink(state.m), state.col)
layout(matrix(1,1))


# m is a homogeneity measure of each pairwise variable plot
m <- -colpairs(scale(state.x77), gave)

o<- order.single(m)
pcols = dmat.color(m)
# Color panels by level of m and reorder variables so that
# pairs with high m are near the diagonal.
pairs.bg(state.x77,order=o, panel.colors=pcols)

# In this case panels showing either of Area or Population
# exhibit the most clumpiness because these variables
# are skewed.

}
\keyword{multivariate}
