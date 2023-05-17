test_that("mhq_asth(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_asth(va1:vb4, handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_asth_left_raw  = c(19.00, 20.00, 20.00, 17.00, 16.00),
      mhq_asth_right_raw = c(19.00, 20.00, 17.00, 19.00, 20.00),
      mhq_asth_both_raw  = c(19.00, 20.00, 18.50, 18.00, 18.00),
      mhq_asth_raw       = c(19.00, 20.00, 17.00, 17.00, 16.00)
    )
  )
})

test_that("mhq_asth(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_asth(va1:vb4, handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_asth_left_stnd  = c(93.75, 100.00, 100.00, 81.25, 75.00),
      mhq_asth_right_stnd = c(93.75, 100.00, 81.25, 93.75, 100.00),
      mhq_asth_both_stnd  = c(93.75, 100.00, 90.62, 87.50, 87.50),
      mhq_asth_stnd       = c(93.75, 100.00, 81.25, 81.25, 75.00)
    )
  )
})
