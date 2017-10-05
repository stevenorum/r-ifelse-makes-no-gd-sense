#!/usr/local/bin/Rscript

# There's almost certainly a cleaner way to do this using environments or something like that, but this works.
# Alternately, the lazy route is to not rename ifelse_not_dumb to ifelse, and instead use find&replace to just update all of your code.

source("library_on_which_you_depend.R")

do_all_the_things <- function()
{
    source("ifelse_not_dumb.R")
    ifelse <- ifelse_not_dumb

    a <- c(1, 2, NA, 1)
    print("ifelse_not_dumb:")
    print(ifelse_not_dumb(a==1, 1, 2))
    print("ifelse locally:")
    print(ifelse(a==1, 1, 2))
    print("ifelse in a library you consume:")
    print(do_some_stuff(a==1, 1, 2))
}

do_all_the_things()
