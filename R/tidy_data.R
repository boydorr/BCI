#' @title Cast the BCI dataset so it is usable by the rdiversity package
#'
#' @description
#'
#' @param dataset The dataset to cast
#'
#' @return A tibble / dataframe with rows as species and columns as subcommunities
#'
#' @export
#'
#' @examples
#' library(magrittr)
#'
#' # Generate a data frame containing linear 100m-square subcommunities running along the y-axis
#' bci_100 %>% dplyr::filter(census==1, x==0) %>% tidy_data

tidy_data <- function(dataset)
{
  data <- dataset %>%
    dplyr::mutate(count = count / sum(dataset$count)) %>%
    reshape2::dcast(species ~ grid, value.var = "count") %>%
    as.data.frame

  rownames(data) <- data$species
  data %>% dplyr::select(-species)
}
