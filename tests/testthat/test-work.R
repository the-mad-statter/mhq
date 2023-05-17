test_that("mhq_work(score = 'raw') works", {
  expect_equal(
    mhq %>%
      mhq_work(iii1:iii5, score = "raw") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_work_raw = c(16.00, 25.00, 20.00, 13.00, 25.00)
    )
  )
})

test_that("mhq_work(score = 'stnd') works", {
  expect_equal(
    mhq %>%
      mhq_work(iii1:iii5, score = "stnd") %>%
      dplyr::select(starts_with("mhq")) %>%
      dplyr::mutate(across(everything(), ~ round(., 2))),
    dplyr::tibble(
      mhq_work_stnd = c(55.00, 100.00, 75.00, 40.00, 100.00)
    )
  )
})
