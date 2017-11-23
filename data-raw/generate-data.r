library(dplyr)
library(tibble)
library(magrittr)
library(reshape2)

# Collect folder information and move into the raw data folder
WD <- getwd()
devtools::wd(".", "data-raw")

# Census dates
dates <- data_frame(run=1:7,
                    date=c(1981, 1985, 1990, 1995, 2000, 2005, 2010))

# Read in BCI data for different sized quadrats
# 20m quadrats
bci_20 <- readRDS("20.rds") %>%
  left_join(dates) %>%
  rename(census=run) %>%
  select(-step) %>%
  as_data_frame
devtools::use_data(bci_20, overwrite = TRUE)

# 50m quadrats
bci_50 <- readRDS("50.rds") %>%
  left_join(dates) %>%
  rename(census=run) %>%
  select(-step) %>%
  as_data_frame
devtools::use_data(bci_50, overwrite = TRUE)

# 100m quadrats
bci_100 <- readRDS("100.rds") %>%
  left_join(dates) %>%
  rename(census=run) %>%
  select(-step) %>%
  as_data_frame
devtools::use_data(bci_100, overwrite = TRUE)

# 500m quadrats
bci_500 <- readRDS("500.rds") %>%
  left_join(dates) %>%
  rename(census=run) %>%
  select(-step) %>%
  as_data_frame
devtools::use_data(bci_500, overwrite = TRUE)

# Read in the taxonomy
bci_taxonomy <- readRDS("labels.rds") %>%
  rename(Order=SubSpeciesName) %>%
  as_data_frame
devtools::use_data(bci_taxonomy, overwrite = TRUE)

# We have an ready-generated Z matrix
bci_similarity <- readRDS("zmatrix.rds")
colnames(bci_similarity) <- bci_taxonomy$Fullname
rownames(bci_similarity) <- bci_taxonomy$Fullname
devtools::use_data(bci_similarity, overwrite = TRUE)

# Now move to the root of the package
devtools::wd(".")

devtools::use_package("tibble")
devtools::use_package("magrittr")
devtools::use_package("dplyr")
devtools::use_package("vegan")
devtools::use_package("iNEXT")
devtools::use_package("ggplot2")
devtools::use_package("reshape2")
devtools::use_package("rdiversity")

# And rerun the documentation
devtools::document()

# Go back to where you were
setwd(WD)
