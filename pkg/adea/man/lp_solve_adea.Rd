% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lp_solve_adea.R, R/lp_solve_cadea.R
\name{lp_solve_adea}
\alias{lp_solve_adea}
\alias{lp_solve_cadea}
\title{Build adea problem}
\usage{
lp_solve_adea(
  input,
  output,
  eff = NULL,
  orientation = c("input", "output"),
  load.orientation = c("inoutput", "input", "output"),
  solve = FALSE,
  lp = NULL
)

lp_solve_cadea(
  input,
  output,
  eff = NULL,
  orientation = c("input", "output"),
  load.orientation = c("inoutput", "input", "output"),
  load.min,
  load.max,
  max.iterations = 25,
  solve = FALSE,
  lp = NULL
)
}
\arguments{
\item{input}{A matrix or a data frame with the inputs of units to be evaluated, one row for each DMU and one column for each input.}

\item{output}{A matrix or a data frame with the outputs of units to be evaluated, one row for each DMU and one column for each output.}

\item{eff}{The efficiency scores from dea analysis.}

\item{orientation}{Use "input" for input orientation or use "output" for output orientation in DEA model.}

\item{load.orientation}{It allows the selection of variables to be included in load analysis.
Its default value is "inoutput" which means that all input and all output variables will be included. Use "input" or "output" to include only input or output variables in load analysis.}

\item{solve}{If TRUE then solve dea model}

\item{lp}{The problem returned from lp_solve.dea or NULL}

\item{max.iterations}{Maximum number of iterations before stop}
}
\value{
lp adea problem for the given input, output and scores

lp adea problem for the given input, output and scores
}
\description{
For the given input and output build the lp_solve problem and return it.

For the given input and output build the lp_solve problem and return it.
}
\keyword{internal}
