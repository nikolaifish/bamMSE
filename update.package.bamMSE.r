rm(list=ls())

# install.packages("devtools")
# install.packages("rlang")
# install.packages("roxygen2")
# install.packages(Rtools)

# You may need to restart R to avoid errors with help file
# .rs.restartR()

library(devtools)
library(pkgdown)
library(rlang)

library(roxygen2)
library(stringr)
# library(Rtools)


# Set working directory
# wd <- getwd()

# Create package3
# create("bamMSE") # I think you only need to do this once

# Create vignette (only run to create vignette)
#usethis::use_vignette("intro")
#usethis::use_vignette("workWithopenMSE")

# Add dependencies
#usethis::use_package("stringr","Suggests")

# Install package
devtools::document(file.path(dirname(getwd()),"bamMSE")) # Important for updating package
devtools::install(file.path(dirname(getwd()),"bamMSE"),build_vignettes = FALSE)
