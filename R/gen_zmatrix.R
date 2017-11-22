#' @title Generate similarity matrix for a given taxonomy
#'
#' @description
#'
#' @param tax The taxonomy to use
#' @param species The similarity value if two rows are the same species
#' @param genus The similarity value if two rows are the same genus but not species
#' @param family The similarity value if two rows are the same family but not genus
#' @param order The similarity value if two rows are the same order but not family
#' @param other The similarity value if two rows are not the same order
#'
#' @return A matrix of similarities between species based on their taxonomy.
#'
#' @export
#'
#' @examples
#'
#' # Generate the similarity matrix for the BCI dataset
#' gen_zmatrix()

gen_zmatrix <- function(tax = BCI::bci_taxonomy,
                        species = 1,
                        genus = 0.75,
                        family = 0.5,
                        order = 0.25,
                        other = 0)
{
  num <- nrow(tax)
  z <- matrix(data = other, nrow = num, ncol = num,
              dimnames = list(tax$Fullname, tax$Fullname))

  for (i in 1:num)
    for (j in 1:num)
      {
      if (tax$Fullname[i] == tax$Fullname[j])
        z[i,j] <- species
      else if (tax$Genus[i] == tax$Genus[j])
        z[i,j] <- genus
      else if (tax$Family[i] == tax$Family[j])
        z[i,j] <- family
      else if (tax$Order[i] == tax$Order[j])
        z[i,j] <- order
    }
  z
}
