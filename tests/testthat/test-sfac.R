test_that("mhq_sfac(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_sfac(via1:vib6, handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_sfac_left_raw  = c(12.00, 6.00, 7.00, 27.00, 22.00),
      mhq_sfac_right_raw = c(16.00, 6.00, 17.00, 6.00, 6.00),
      mhq_sfac_both_raw  = c(14.00, 6.00, 12.00, 16.50, 14.00),
      mhq_sfac_raw       = c(16.00, 6.00, 17.00, 27.00, 22.00)
    )
  )
})

test_that("mhq_sfac(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_sfac(via1:vib6, handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_sfac_left_stnd  = c(75.00, 100.00, 95.83, 12.50, 33.33),
      mhq_sfac_right_stnd = c(58.33, 100.00, 54.17, 100.00, 100.00),
      mhq_sfac_both_stnd  = c(66.67, 100.00, 75.00, 56.25, 66.67),
      mhq_sfac_stnd       = c(58.33, 100.00, 54.17, 12.50, 33.33)
    )
  )
})
