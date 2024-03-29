# For the given input and output compute dea (another than Benchmarking package) and return
#' @importFrom stats na.omit

### Auxiliary function to check if input and output are allowable object
.adea.check <- function(x)
  {
  n <- 0
  if (is.data.frame(x) && all(sapply(x[1,], FUN=is.numeric))) n <- nrow(x)
  if (is.matrix(x) && is.numeric(x[1,1])) n <- nrow(x)
  if (is.vector(x) && is.numeric(x)) n <- length(x)
  n
  }

### Function to check if adea parameters are consistent
### Return an string with error text or TRUE
### Check input and output for adea family function
adea.check <- function(input, output, ux = NULL, vy = NULL, eff = NULL)
{
    ## Check if input and output are a data.frame, a matrix or a vector
    if (!(.n <- .adea.check(input))) return(gettext('input should be a numeric vector, a numeric matrix or a numeric dataframe.'))
    if (!(.n.aux <- .adea.check(output))) return(gettext('output should be a numeric vector, a numeric matrix or a numeric dataframe.'))

    ## Check for NA values
    if (is.vector(input) && (length(na.omit(input)) != length(input))) return(gettext('NA values in input not allowed.'))
    if ((is.data.frame(input) || is.matrix(input)) && (nrow(na.omit(input)) != nrow(input))) return(gettext('NA values in input not allowed.'))
    if (is.vector(output) && (length(na.omit(output)) != length(output))) return(gettext('NA values in output not allowed.'))
    if ((is.data.frame(output) || is.matrix(output)) && (nrow(na.omit(output)) != nrow(output))) return(gettext('NA values in output not allowed.'))

    ## Check number of input and output rows
    if (.n != .n.aux) return(gettext('Unequal number of rows in input and output.'))

    ## Check if ux and vy are too provided or too missing
    if (!missing(ux) && !is.null(ux) && (missing(vy) || is.null(vy))) return(gettext('ux and vy should provided together.'))
    if (!missing(vy) && !is.null(vy) && (missing(ux) || is.null(ux))) return(gettext('ux and vy should provided together.'))

    ## Check ux
    if (!missing(ux) && !is.null(ux))
    {
        if (!(.n.aux <- .adea.check(ux))) return(gettext('ux should be NULL, a vector, a matrix or a dataframe.'))
        if (.n != .n.aux) return(gettext('Unequal number of rows in input and ux.'))
    }

    ## Check vy
    if (!missing(vy) && !is.null(vy))
    {
        if (!(.n.aux <- .adea.check(vy))) return(gettext('vy should be NULL, a numeric matrix or dataframe.'))
        if (.n != .n.aux) return(gettext('Unequal number of rows in input and vy.'))
    }

    ## Check eff
    if (!missing(eff) && !is.null(eff))
    {
        if (!is.vector(eff)) return(gettext('eff should be NULL or a numeric vector.'))
        if (!is.numeric(eff)) return(gettext('Non numeric values in eff.'))
        if (.n != length(eff)) return(gettext('Unequal number of rows in input and eff.'))
    }

    ## Return TRUE because all test have been passed
    return(TRUE)
}
