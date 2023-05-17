test_that("mhq_aodl(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_aodl(iia1:iic7, handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_aodl_left_raw          = c(7.00, 5.00, 6.00, 23.00, 21.00),
      mhq_aodl_right_raw         = c(7.00, 5.00, 9.00, 6.00, 5.00),
      mhq_aodl_both_raw          = c(11.00, 7.00, 9.00, 19.00, 15.00),
      mhq_aodl_overall_left_raw  = c(9.00, 6.00, 7.50, 21.00, 18.00),
      mhq_aodl_overall_right_raw = c(9.00, 6.00, 9.00, 12.50, 10.00),
      mhq_aodl_overall_both_raw  = c(8.33, 5.67, 8.00, 16.00, 13.67),
      mhq_aodl_raw               = c(9.00, 6.00, 9.00, 21.00, 18.00)
    )
  )
})

test_that("mhq_aodl(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_aodl(iia1:iic7, handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_aodl_left_stnd          = c(90.00, 100.00, 95.00, 10.00, 20.00),
      mhq_aodl_right_stnd         = c(90.00, 100.00, 80.00, 95.00, 100.00),
      mhq_aodl_both_stnd          = c(85.71, 100.00, 92.86, 57.14, 71.43),
      mhq_aodl_overall_left_stnd  = c(87.86, 100.00, 93.93, 33.57, 45.71),
      mhq_aodl_overall_right_stnd = c(87.86, 100.00, 86.43, 76.07, 85.71),
      mhq_aodl_overall_both_stnd  = c(88.57, 100.00, 89.29, 54.05, 63.81),
      mhq_aodl_stnd               = c(87.86, 100.00, 86.43, 33.57, 45.71)
    )
  )
})
