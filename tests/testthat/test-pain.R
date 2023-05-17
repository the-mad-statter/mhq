test_that("mhq_pain(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_pain(iva1:ivb5, handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_pain_left_raw  = c(16.00, 0.00, 13.00, 24.00, 0.00),
      mhq_pain_right_raw = c(16.00, 0.00, 13.00, 24.00, 0.00),
      mhq_pain_both_raw  = c(16.00, 0.00, 13.00, 24.00, 0.00),
      mhq_pain_raw       = c(16.00, 0.00, 13.00, 24.00, 0.00)
    )
  )
})

test_that("mhq_pain(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_pain(iva1:ivb5, handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_pain_left_stnd  = c(45.00, 0.00, 60.00, 5.00, 0.00),
      mhq_pain_right_stnd = c(45.00, 0.00, 60.00, 5.00, 0.00),
      mhq_pain_both_stnd  = c(45.00, 0.00, 60.00, 5.00, 0.00),
      mhq_pain_stnd       = c(45.00, 0.00, 60.00, 5.00, 0.00)
    )
  )
})
