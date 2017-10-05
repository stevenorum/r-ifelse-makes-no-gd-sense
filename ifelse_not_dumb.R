#!/usr/local/bin/Rscript

ifelse_not_dumb <- function (test, yes, no)
{
    if(is.atomic(test)) { # do not lose attributes
        if (typeof(test) != "logical")
            storage.mode(test) <- "logical"
        ## quick return for cases where 'ifelse(a, x, y)' is used
        ## instead of 'if (a) x else y'
        if (length(test) == 1 && is.null(attributes(test))) {
            if (is.na(test)) return(no)
            else if (test) {
                if (length(yes) == 1) {
                    yat <- attributes(yes)
                    if (is.null(yat) || (is.function(yes) &&
                                         identical(names(yat), "srcref")))
                        return(yes)
                }
            }
            else if (length(no) == 1) {
                nat <- attributes(no)
                if (is.null(nat) || (is.function(no) &&
                                     identical(names(nat), "srcref")))
                    return(no)
            }
        }
    }
    else ## typically a "class"; storage.mode<-() typically fails
        test <- if(isS4(test)) methods::as(test, "logical") else as.logical(test)
    ans <- test
    ok <- !(nas <- is.na(test))
    if (any(test[ok]))
        ans[test & ok] <- rep(yes, length.out = length(ans))[test & ok]
    if (any(!test[ok]))
        ans[!test & ok] <- rep(no, length.out = length(ans))[!test & ok]
    ans[nas] <- no
    ans
}
