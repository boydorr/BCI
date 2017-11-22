#' BCI 50 ha plot census data with 20m square quadrats
#'
#' A table with one record per tree species per grid square per census,
#' detailing the count of the species in that grid square for that census. In
#' this case we use 20m square quadrats.
#'
#' @source
#' https://repository.si.edu/bitstream/handle/10088/20925/bci.full.Rdata31Aug2012.zip
#'
#' @format A tbl data_frame
#' @examples
#'   library(tibble)
#'   library(magrittr)
#'   library(dplyr)
#'
#'   # How many trees in each census?
#'   bci_20 %>% group_by(census) %>% summarise(total=sum(count))
#'
#'   # Look at the first quadrat of the first census
#'   bci_20 %>% filter(x==0, y==0, census==1)
"bci_20"
