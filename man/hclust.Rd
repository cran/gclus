\name{reorder.hclust}
\alias{reorder.hclust}
\title{Reorders object order of hclust, keeping objects within a cluster
contiguous to each other. }
\description{
Reorders objects so that  nearby object pairs are adjacent.
}
\usage{
reorder.hclust(x,dis,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{is the result of \code{hclust}.}
  \item{dis}{is a distance matrix or \code{dist}.}  
  \item{...}{additional arguments.}  
}
\details{ 
In hierarchical cluster displays, a decision is needed at 
each merge to specify which subtree should go on the left 
and which on the right. 
This algorithm uses the order suggested by Gruvaeus and Wainer (1972).
At a merge of clusters A and B, the new cluster is one of
(A,B), (A',B), (A,B'),(A',B'), where A' denotes A in reverse order.
The new cluster is chosen to minimize the distance between
the object in A placed adjacent to an object from B.
}
\value{A permutation of the objects represented by \code{dis} is returned.
}
\references{Hurley, Catherine B.  ``Clustering Visualisations of Multidimensional 
Data'', to appear in JCGS.

Gruvaeus, G. and Wainer, H. (1972),
``Two Additions to Hierarchical Cluster Analysis",
 British Journal of Mathematical and Statistical Psychology, 25, 200-206.
 }
\author{ Catherine B. Hurley }
%\note{ ~~further notes~~ }
\seealso{\code{\link{hclust}}, 
\code{\link{order.hclust}} .}
\examples{

data(eurodist)
dis <- as.dist(eurodist)
hc <- hclust(dis, "ave")


layout(matrix(1:2,nrow=2,ncol=1))
op <- par(mar=c(1,1,1,1))
plot(hc)
hc1 <- reorder.hclust(hc, dis)
plot(hc1)
par(op)
layout(matrix(1,1))

# Both dedrograms correspond to the same tree structure,
# but the second one shows that
# Paris is closer to Cherbourg than Munich, and
# Rome is closer to Gibralter than to Barcelona.


# We can also compare both orderings with an
# image plot of the colors.
# The second ordering seems to place nearby cities
# closer to each other.


layout(matrix(1:2,nrow=2,ncol=1))
op <- par(mar=c(1,6,1,1))
cmat <- dmat.color(eurodist, rev(cm.colors(5)))
plotcolors(cmat[hc$order,hc$order], rlabels=labels(eurodist)[hc$order])

plotcolors(cmat[hc1$order,hc1$order], rlabels=labels(eurodist)[hc1$order])

layout(matrix(1,1))
par(op)

}




}
\keyword{multivariate }
\keyword{cluster }
