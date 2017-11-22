#' BCI 50 ha plot taxonomy
#'
#' A matrix of similarities between species based on their taxonomy. If the
#' similarity is at a given level, and no higher, then this is the similarity:
#'
#' species_similarity <- 1
#' genus_similarity <- 0.75
#' family_similarity <- 0.5
#' subclass_similarity <- 0.25 # we use "order" instead of "subclass"
#' other_similarity <- 0
#'
#' @source
#' https://repository.si.edu/bitstream/handle/10088/20925/bci.full.Rdata31Aug2012.zip
#'
#' @format A matrix
#' @examples
#'   # Show the similarity matrix for the first 3 species
#'   bci_similarity[1:3, 1:3]
"bci_similarity"
