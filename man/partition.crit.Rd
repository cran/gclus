\name{partition.crit}
\alias{partition.crit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Combines the results of appplying an index to each group of 
observations }
\description{
Applies the function \code{gfun}  to each group of x and y values
and combines the results using the function \code{cfun}

}
\usage{
partition.crit(x, y, groups, gfun = gave, cfun = sum, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{x}{is a numeric vector. }
  \item{y}{is a numeric vector. }
  \item{groups}{ is a vector of group memberships. }
  \item{gfun}{ is applied to the \code{x}  and \code{y} data in each group. }
  \item{cfun}{ combines the values returned by \code{gfun}. }
  \item{\dots}{ arguements are passed to  \code{gfun}. }
}
\details{
 The function \code{gfun} is applied to each group of \code{x}  and \code{y}
values. The function \code{cfun} is applied to the vector or matrix of
\code{gfun} results.
}
\value{
  The result of applying \code{cfun}.
}
\references{ See Gordon, A. D. (1999). {\it Classification}. Second Edition. London:
     Chapman and Hall / CRC }
\author{ Catherine B. Hurley}

\seealso{ \code{\link{gave}}, \code{\link{colpairs}}, 
\code{\link{order.single}}}
\examples{
x <- runif(20)
y <- runif(20)
g <- rep(c("a","b"),10)

partition.crit(x,y,g)


data(bank)
# m is a homogeneity measure of each pairwise variable plot
m <- -colpairs(scale(bank[,-1]), partition.crit,gfun=gave,groups=bank[,1])

# Color panels by level of m and reorder variables so that
# pairs with high m are near the diagonal. Panels shown
# in pink have the highest amount of group homogeneity, as measured by 
# gave.
cpairs(bank[,-1],order=order.single(m), panel.colors=dmat.color(m),
gap=.3,col=c("purple","black")[bank[,"Status"]+1],
pch=c(5,3)[bank[,"Status"]+1])

# Try  a different measure
m <- -colpairs(scale(bank[,-1]), partition.crit,gfun=diameter,groups=bank[,1])

cpairs(bank[,-1],order=order.single(m), panel.colors=dmat.color(m),
gap=.3,col=c("purple","black")[bank[,"Status"]+1],
pch=c(5,3)[bank[,"Status"]+1])


# Result is the same, in this case.

}
\keyword{multivariate }
\keyword{cluster }
