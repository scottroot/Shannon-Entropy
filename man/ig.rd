\name{shannon.entropy}
\alias{shannon.entropy}
\title{Shannon Entropy & Information Gain}
\usage{
ig()
}
\description{
Gives you the entropy of variables and parent nodes in a dataset
}
\examples{
ig(root = "age", df = bank, ignore = c("id", "sex"))
}
