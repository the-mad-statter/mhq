test_that("mhq_over(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_hand(ia1:ib5, handinj = handinj, score = "raw") %>%
      mhq_aodl(iia1:iic7, handinj = handinj, score = "raw") %>%
      mhq_work(iii1:iii5, score = "raw") %>%
      mhq_pain(iva1:ivb5, handinj = handinj, score = "raw") %>%
      mhq_asth(va1:vb4, handinj = handinj, score = "raw") %>%
      mhq_sfac(via1:vib6, handinj = handinj, score = "raw") %>%
      mhq_over(handinj = handinj, score = "raw") %>%
      dplyr::select(starts_with("mhq_overall")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_overall_left_raw     = c(16.83, 23.17, 19.33, 7.33, 15.50),
      mhq_overall_right_raw    = c(16.00, 23.00, 16.33, 16.00, 23.17),
      mhq_overall_affected_raw = c(16.00, 23.00, 16.33, 7.33, 15.50),
      mhq_overall_normal_raw   = c(16.83, 23.17, 19.33, 16.00, 23.17)
    )
  )
})

test_that("mhq_over(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_hand(ia1:ib5, handinj = handinj, score = "stnd") %>%
      mhq_aodl(iia1:iic7, handinj = handinj, score = "stnd") %>%
      mhq_work(iii1:iii5, score = "stnd") %>%
      mhq_pain(iva1:ivb5, handinj = handinj, score = "stnd") %>%
      mhq_asth(va1:vb4, handinj = handinj, score = "stnd") %>%
      mhq_sfac(via1:vib6, handinj = handinj, score = "stnd") %>%
      mhq_over(handinj = handinj, score = "stnd") %>%
      dplyr::select(starts_with("mhq_overall")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_overall_left_stnd     = c(74.43, 100.00, 81.63, 46.22, 67.34),
      mhq_overall_right_stnd    = c(70.82, 99.17, 68.64, 79.97, 97.62),
      mhq_overall_affected_stnd = c(70.82, 99.17, 68.64, 46.22, 67.34),
      mhq_overall_normal_stnd   = c(74.43, 100.00, 81.63, 79.97, 97.62)
    )
  )
})
