#!/usr/local/bin/Rscript

source("library_on_which_you_depend.R")

source("ifelse_not_dumb.R")

a <- c(1, 2, NA, 1)
print("ifelse_not_dumb:")
print(ifelse_not_dumb(a==1, 1, 2))
print("ifelse locally:")
print(ifelse(a==1, 1, 2))
print("ifelse in a library you consume:")
print(do_some_stuff(a==1, 1, 2))
