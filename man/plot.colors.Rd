\name{plot.colors}
\alias{plot.colors}
\alias{image.info}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plots a matrix of colors}
\description{
\code{plot.colors} plots a matrix of colors 
as an image or as points.

\code{image.info} is a utility that given a matrix of colors,
returns a structure useful for the \code{image} function.

}
\usage{
plot.colors(cmat, na.color = "white", dlabels = NULL, rlabels = FALSE, clabels = FALSE, 
ptype = "image", border.color = "grey70", pch = 15, cex = 3, label.cex = 0.6, ...)

image.info(cmat)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{cmat}{a matrix of numbers, nas are allowed.}
 \item{na.color}{used for NAs in \code{cmat}.}
 \item{dlabels}{vector of labels for the diagonals.}
 \item{rlabels}{vector of labels for the rows.}
 \item{clabels}{vector of labels for the columns.}
  \item{ptype}{should be "image" or "points"}
  \item{border.color}{color of border drawn around the plot.}
  \item{pch}{point type used when ptype="points".}
  \item{cex}{point cex used when ptype="points".}
  \item{label.cex}{cex parameter used for labels.}

 \item{\dots}{graphical parameters}
}

\value{
  \code{cmat} returns a list with components:
\item{x} vector of x coordinates.
\item{y} vector of y coordinates.
\item{z} a matrix containing values to be plotted.
\item{col} the colors to be used.
}

\author{ Catherine B. Hurley }

\seealso{\code{\link{plot}}, \code{\link{image}}}


\examples{

plot.colors(matrix(1:20,nrow=4,ncol=5))

plot.colors(matrix(1:20,nrow=4,ncol=5),ptype="points",cex=6)

plot.colors(matrix(1:20,nrow=4,ncol=5),rlabels = c("a","b","c","d"))


data(longley)
longley.cor <- cor(longley)
# A matrix with equal (or nearly equal) number of entries of each color.
longley.color <- dmat.color(longley.cor)


plot.colors(longley.color, dlabels=rownames(longley.color))

# Could also reorder variables prior to plotting:
longley.o <- order.single(longley.cor)
longley.color <- longley.color[longley.o,longley.o]

op <- par(mar=c(1,6,6,1))
plot.colors(longley.color,rlabels=rownames(longley.color),clabels=rownames(longley.color) )
par(op)

}
\keyword{color }
\keyword{hplot }
