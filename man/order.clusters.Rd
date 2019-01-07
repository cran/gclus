\name{order.clusters}
\alias{order.clusters}
\title{Orders clustered objects using hierarchical clustering}
\description{
Reorders objects so that  similar (or high-merit) object pairs are adjacent.
The clusters argument specifies (possibly ordered) groups, and objects
within a group are kept together.
}
\usage{
order.clusters(merit,clusters,within.order = order.single, 
    between.order= order.single,...) 
}
\arguments{
  \item{merit}{is either a symmetric matrix of merit or similarity score, 
  or a \code{dist}.}
  \item{clusters}{specifies a partial grouping. It should either be a list whose 
ith element contains 
the indices of the  objects in the ith cluster, or a vector of integers whose ith element 
gives the cluster membership of the ith object. Either representation may 
be used to specify grouping, the first is preferrable to specify 
adjacencies.}
\item{within.order}{is a function used to order the objects within each 
cluster.}
\item{between.order}{is a function used to order the clusters.}
\item{...}{arguments are passed to \code{within.order}.}
  
}
\details{\code{within.order} may be NULL, in which case objects within a 
cluster are assumed to be in order. Otherwise, \code{within.order}
should be one of the ordering functions 
\code{order.single},\code{order.endlink} or \code{order.hclust}.

\code{between.order} may be NULL, in which case cluster order
is preserved. 
Otherwise, \code{betweem.order}
should be one of the ordering functions that uses a partial ordering,
\code{order.single} or \code{order.endlink}.
}
\value{A permutation of the objects represented by \code{merit} is returned.
}

\author{ Catherine B. Hurley }
%\note{ ~~further notes~~ }
\seealso{\link{order.single},\link{order.endlink},\link{order.hclust}.}
\examples{
data(state)
state.d <- dist(state.x77)


# Order the states, keeping states in a division together.
state.o <- order.clusters(-state.d, as.numeric(state.division))
cmat <- dmat.color(as.matrix(state.d), rev(cm.colors(5)))


op <- par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)
par(op)


# Alternatively, use kmeans to place the  states into 6 clusters
state.km <- kmeans(state.d,6)$cluster

# An ordering obtained from the kmeans clustering...
state.o <- unlist(memship2clus(state.km))


layout(matrix(1:2,nrow=1,ncol=2),widths=c(0.1,1))
op <- par(mar=c(1,1,1,.2))
state.colors <- cbind(state.km,state.km)
plotcolors(state.colors[state.o,])

par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)

par(op)
layout(matrix(1,1))



# In the ordering above, the ordering of clusters and the
# ordering of objects within the clusters is arbitrary.
# order.clusters gives an improved order but preserves the kmeans clusters.

state.o <- order.clusters(-state.d, state.km)

# and replot
layout(matrix(1:2,nrow=1,ncol=2),widths=c(0.1,1))
op <- par(mar=c(1,1,1,.2))
state.colors <- cbind(state.km,state.km)
plotcolors(state.colors[state.o,])

par(mar=c(1,6,1,1))
rlabels <- state.name[state.o]
plotcolors(cmat[state.o,state.o], rlabels=rlabels)

par(op)
layout(matrix(1,1))

}
\keyword{multivariate }
\keyword{cluster }
