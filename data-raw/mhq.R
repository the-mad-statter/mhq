mhq <- "data-raw/mhq.csv" %>%
  read.csv() %>%
  dplyr::as_tibble()

usethis::use_data(mhq, overwrite = TRUE)
