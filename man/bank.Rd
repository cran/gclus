\name{bank}
\alias{bank}
\docType{data}
\title{Swiss bank notes data}
\description{
Data from "Multivariate Statistics  A practical approach", by
Bernhard Flury and Hans Riedwyl, Chapman and Hall, 1988,
Tables 1.1 and 1.2 pp. 5-8.  Six measurements made on 100 genuine
Swiss banknotes and 100 counterfeit ones.
}
\format{This data frame contains the following columns:
 \describe{
 \item{Status:}{0 = genuine, 1 = counterfeit}
 \item{Length:}{Length of bill, mm}
 \item{Left:}{ Width of left edge, mm}
\item{Right:}{Width of right edge, mm}
\item{Bottom:}{Bottom margin width, mm }
\item{Top:}{Top margin width, mm}
\item{Diagonal:}{ Length of image diagonal, mm}    
 }
}
\usage{data(bank)}

\source{
Flury, B. and Riedwyl, H. (1988), 
\emph{Multivariate Statistics  A Practical Approach},
London: Chapman and Hall.
}
\keyword{datasets}
