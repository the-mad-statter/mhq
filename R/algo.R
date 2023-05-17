#' Michigan Hand Outcomes Questionnaire (MHQ)
#'
#' @inheritParams mhq_hand
#' @param scale the intended (sub)scale
#' @param reverse logical indicating if the standardized and normalized scores
#' are to be reversed
#'
#' @return a numeric vector of (sub)scale scores
mhq_scoring_algorithm <- function(
    data,
    scale = c("hand", "aodl", "work", "pain", "asth", "sfac"),
    reverse = TRUE,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m,
    norm_s) {
  scale <- match.arg(scale)
  score <- match.arg(score)
  n_items <- ncol(data)

  data %>%
    dplyr::rename_with(~ paste0("Q", 1:n_items)) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      Q1 = dplyr::if_else(scale == "asth", 6 - .data[["Q1"]], .data[["Q1"]]),
      Q2 = dplyr::if_else(scale == "pain", 6 - .data[["Q2"]], .data[["Q2"]]),
      r = -2 * reverse + 1,
      m = 4 * reverse + 1,
      dplyr::across(
        dplyr::matches("^[Qr]"),
        ~ dplyr::if_else(scale == "pain" && .data[["Q1"]] == 5, 0, .x)
      ),
      .n_missing = sum(is.na(dplyr::c_across(dplyr::starts_with("Q")))),
      .raw = sum(dplyr::c_across(dplyr::starts_with("Q")), na.rm = TRUE),
      .mean = mean(dplyr::c_across(dplyr::starts_with("Q")), na.rm = TRUE),
      raw = dplyr::if_else(
        .data[[".n_missing"]] / n_items < 0.50,
        .data[[".raw"]] + .data[[".n_missing"]] * .data[[".mean"]],
        NA_real_
      ),
      mean = .data[["raw"]] / n_items,
      stnd = .data[["r"]] * (.data[["raw"]] - (.data[["m"]] * n_items)) /
        (4 * n_items) * 100,
      norm = (.data[["stnd"]] - norm_m) / norm_s
    ) %>%
    dplyr::pull(!!score)
}
