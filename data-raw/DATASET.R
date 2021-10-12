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

au_2006 <-
  readxl::read_xls(
    system.file("extdata", "41500 tus 2006 curf data items.xls", package = "timeuse"),
    sheet = "Activity",
    range = "B48:B272",
    skip = 47
  ) %>%
  tibble::as_tibble() %>%
  janitor::clean_names() %>%
  tidyr::separate(nature_of_activity, into = c("code", "description"), sep = "\\.") %>%
  mutate(across(.fns = ~ trimws(.x))) %>%
  mutate(
    code_level_1 = substr(code, 1, 1),
    code_level_2 = substr(code, 1, 2),
    code_level_3 = substr(code, 1, 3)
  ) %>%
  select(starts_with("code_"), description)

usethis::use_data(au_2006, overwrite = TRUE)
