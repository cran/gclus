\name{order.single}
\alias{order.single}
\alias{order.endlink}
\alias{order.hclust}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Orders objects using hierarchical clustering}
\description{
Reorders objects so that  similar (or high-merit) object pairs are adjacent.
A permutation vector is returned.
}
\usage{
order.single(merit,clusters=NULL)
order.endlink(merit,clusters=NULL)
order.hclust(merit, reorder=TRUE,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{merit}{is either a symmetric matrix of merit or similarity score, 
  or a \code{dist}.}
  \item{clusters}{if non-null, specifies a partial ordering. It should be a list whose 
ith element contains 
the indices the  objects in the ith ordered cluster.}
  \item{reorder}{if TRUE, reorders the default ordering from \code{hclust}.}
   \item{...}{arguments are passed to \code{hclust}.}
  
}
\details{ \code{order.single} performs a variation on single-link cluster analysis,
devised by Gruvaeus and Wainer (1972).
When two ordered clusters are merged, the new cluster is formed by placing the
most similar endpoints of the joining clusters adjacent to each other.
When applied to variables, the resulting order is useful for scatterplot 
matrices.

\code{order.endlink} is another variation on single-link cluster analysis,
where the similarity between two ordered clusters is defined as the minimum distance
between their endpoints. When two ordered clusters are merged, the new cluster is formed by placing the
most similar endpoints of the joining clusters adjacent to each other.
When applied to variables, the resulting order is useful for parallel 
coordinate displays.

\code{order.hclust} returns the order of objects from \code{hclust} if
\code{reorder} is \code{FALSE}. Otherwise, it reorders the objects using
\code{hclust.reorder}
so that
when two ordered clusters are merged, the new cluster is formed by placing the
most similar endpoints of the joining clusters adjacent to each other.
\code{order.hclust(m,method="single")} is equivalent to 
\code{order.single} when \code{clusters} is \code{NULL}.
The default method of \code{hclust} is "complete", see \code{\link{hclust}} for other 
possibilities.

}
\value{A permutation of the objects represented by \code{merit} is returned.
}
\references{Hurley, Catherine B.  \dQuote{Clustering Visualisations of Multidimensional 
Data}, Journal of Computational and Graphical Statistics,
vol. 13, (4), pp 788-806, 2004. 

Gruvaeus, G. and Wainer, H. (1972),
\dQuote{Two Additions to Hierarchical Cluster Analysis},
 British Journal of Mathematical and Statistical Psychology, 25, 200-206.
 }
\author{ Catherine B. Hurley }
%\note{ ~~further notes~~ }
\seealso{\code{\link{cpairs}}, 
\code{\link{cparcoord}},\code{\link{plotcolors}}, 
\code{\link{reorder.hclust}},\code{\link{order.clusters}}, \code{\link{hclust}}.}
\examples{
data(state)
state.cor <- cor(state.x77)
order.single(state.cor)
order.endlink(state.cor)
order.hclust(state.cor,method="average")

# Use for plotting...

cpairs(state.x77, panel.colors=dmat.color(state.cor), order.single(state.cor),pch=".",gap=.4)
cparcoord(state.x77, order.endlink(state.cor),panel.colors=dmat.color(state.cor))


# Order the states instead of the variables...

state.d <- dist(state.x77)
state.o <- order.single(-state.d)

op <- par(mar=c(1,6,1,1))
cmat <- dmat.color(as.matrix(state.d), rev(cm.colors(5)))
plotcolors(cmat[state.o,state.o], rlabels=state.name[state.o])
par(op)


}
\keyword{multivariate }
\keyword{cluster }
