test_that("mhq_handinj(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_hand(ia1:ib5, handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_hand_left_raw  = c(9.00, 5.00, 8.00, 22.00, 15.00),
      mhq_hand_right_raw = c(10.00, 6.00, 10.00, 10.00, 5.00),
      mhq_hand_both_raw  = c(9.50, 5.50, 9.00, 16.00, 10.00),
      mhq_hand_raw       = c(10.00, 6.00, 10.00, 22.00, 15.00)
    )
  )
})

test_that("mhq_handinj(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_hand(ia1:ib5, handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_hand_left_stnd  = c(80.00, 100.00, 85.00, 15.00, 50.00),
      mhq_hand_right_stnd = c(75.00, 95.00, 75.00, 75.00, 100.00),
      mhq_hand_both_stnd  = c(77.50, 97.50, 80.00, 45.00, 75.00),
      mhq_hand_stnd       = c(75.00, 95.00, 75.00, 15.00, 50.00)
    )
  )
})
