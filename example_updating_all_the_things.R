#!/usr/local/bin/Rscript

# Depending on exactly how your libraries use ifelse, this may very well cause strange, unexpected problems.

source("library_on_which_you_depend.R")

source("ifelse_not_dumb.R")
ifelse <- ifelse_not_dumb

a <- c(1, 2, NA, 1)
print("ifelse_not_dumb:")
print(ifelse_not_dumb(a==1, 1, 2))
print("ifelse locally:")
print(ifelse(a==1, 1, 2))
print("ifelse in a library you consume:")
print(do_some_stuff(a==1, 1, 2))
