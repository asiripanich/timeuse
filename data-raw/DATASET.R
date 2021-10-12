## code to prepare `DATASET` dataset goes here

# copied from https://unstats.un.org/unsd/demographic-social/time-use/icatus-2016/tableview
icatus_2016 <-
  read.csv(system.file("extdata", "UNSD - 2016 - Time Use Statistics.csv", package = "timeuse")) %>%
  tibble::as_tibble() %>%
  dplyr::group_by(PID, ID) %>%
  tidyr::fill(1:3) %>%
  dplyr::ungroup()
icatus_2016

usethis::use_data(icatus_2016, overwrite = TRUE)
