\name{dmat.color}
\alias{dmat.color}
\alias{default.dmat.color}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Colors a matrix}
\description{
  Accepts a dissimilarity matrix or \code{dist} \code{m}, and
     returns a  matrix of colors.
     Values in \code{m} are \code{cut} into categories using \code{breaks} (ranked distances if 
     \code{byrank} is \code{TRUE}) and categories  are assigned the values 
     in \code{colors}. 
}
\usage{
dmat.color(m, colors = default.dmat.color, byrank = NULL, breaks = length(colors))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{m}{a dissimilarity matrix or the result of \code{dist}}
  \item{colors}{a vector of colors. The default is 
  \code{default.dmat.color}.}
  \item{byrank}{boolean, default \code{TRUE} is unless \code{breaks} 
has length > 1.}
  \item{breaks}{the number of break points. }
}

\details{\code{breaks} are passed to the  function\code{cut}.
If \code{byrank} is \code{TRUE}, values in \code{m} are 
  ranked before they are categorized. 
  If \code{byrank} is \code{TRUE} and \code{breaks} is an integer, then
there are \code{breaks} equal-sized categories.}
\value{
  Returns a matrix of colors. The matrix is symmetric, with NAs on the 
  diagonal.
}
%\references{ ~put references to the literature/web site here ~ }
\author{ Catherine B. Hurley}
%\note{ ~~further notes~~ }

% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{ \code{\link{cut}}, \code{\link{pairs.bg}}, \code{\link{parcoord.bg}}}
\examples{
data(longley)
longley.cor <- cor(longley)
# A matrix with equal (or nearly equal) number of entries of each color.
longley.color <- dmat.color(longley.cor)

# Plot the colors
plot.colors(longley.color,dlabels=rownames(longley.color))

# Try different color schemes

# A matrix where each color represents an equal-length interval.
longley.color <- dmat.color(longley.cor, byrank=FALSE)
# Specify colors and breaks

longley.color <- dmat.color(longley.cor, breaks=c(-1,0,.5,.8,1), 
cm.colors(4))


# Could also reorder variables prior to plotting:

longley.o <- order.single(longley.cor)
longley.color <- longley.color[longley.o,longley.o]

# The colors can be used in a scatterplot matrix or parallel
# coordinate display:

pairs.bg(longley, panel.color= longley.color)
parcoord.bg(longley, panel.color= longley.color)

}
\keyword{multivariate }
\keyword{color }
