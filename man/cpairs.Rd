\name{cpairs}
\alias{cpairs}    
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Enhanced scatterplot matrix }
\description{
This function draws a scatterplot matrix of data. Variables
may be reordered and panels colored in the display.
}
\usage{
cpairs(data, order = NULL, panel.colors = NULL, border.color = "grey70", 
show.points = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{a numeric matrix }
  \item{order}{the order of variables. Default is the order in data.}
  \item{panel.colors}{a matrix of panel colors. If supplied, dimensions 
  should match those of the pairs plot. Diagonal entries are ignored. }
  \item{border.color}{used for panel border. }
  \item{show.points}{ If FALSE, no points are drawn. }
  \item{\dots}{graphical parameters passed to \code{pairs.default}. }
}
%\details{
%}
%\value{
%}
\references{Hurley, Catherine B.  ``Clustering Visualisations of Multidimensional 
Data'', to appear in JCGS. }
\author{ Catherine B. Hurley }
%\note{ ~~further notes~~ }
\seealso{\code{\link{pairs}}, \code{\link{cparcoord}}, 
\code{\link{dmat.color}},\code{\link{colpairs}}, \code{\link{order.single}}.}
\examples{

data(USJudgeRatings)
judge.cor <- cor(USJudgeRatings)
judge.color <- dmat.color(judge.cor)
# Colors variables by their correlation.
cpairs(USJudgeRatings,panel.colors=judge.color,pch=".",gap=.5)
judge.o <- order.single(judge.cor)
# Reorder variables so that those with highest correlation 
# are close to the  diagonal.
cpairs(USJudgeRatings,judge.o,judge.color,pch=".",gap=.5)

# Specify your own color scheme
judge.color <- dmat.color(judge.cor, breaks=c(-1,0,.5,.9,1), colors = 
cm.colors(4))

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

}
\keyword{multivariate }
\keyword{color }
\keyword{hplot }

