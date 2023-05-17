#' MHQ Aesthetics
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with score columns:
#' 1. mhq_asth_left_<scale>
#'     - score from the left hand items
#' 2. mhq_asth_right_<scale>
#'     - score from the right hand items
#' 3. mhq_asth_both_<scale>
#'     - an average of the left and right scores
#' 4. mhq_asth_<scale>
#'     - the requested aesthetics scale score
#' @export
#'
#' @examples
#' mhq_asth(mhq, va1:vb4, handinj = handinj, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' V The following questions refer to the appearance (look) of your hands
#' during the past week.
#'
#' A The following questions refer to the appearance (look) of your right hand.
#' 1. I was satisfied with the appearance (look) of my right hand.
#' 2. The appearance (look) of my right hand sometimes made me uncomfortable in
#' public.
#' 3. The appearance (look) of my right hand made me depressed.
#' 4. The appearance (look) of my right hand interfered with my normal social
#' activities.
#'
#' B The following questions refer to the appearance (look) of your left hand.
#' 5. I was satisfied with the appearance (look) of my left hand.
#' 6. The appearance (look) of my left hand sometimes made me uncomfortable in
#' public.
#' 7. The appearance (look) of my left hand made me depressed.
#' 8. The appearance (look) of my left hand interfered with my normal social
#' activities.
mhq_asth <- function(
    data,
    ...,
    handinj,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  score <- match.arg(score)
  dots <- names(dplyr::select(data, ...))
  n_dots <- length(dots)

  if (n_dots != 8) {
    stop(sprintf("%i items were passed in ... which expected 8.", n_dots))
  }

  data %>%
    dplyr::mutate(
      !!sprintf("mhq_asth_left_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[5:8])),
        "asth", FALSE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_asth_right_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[1:4])),
        "asth", FALSE, score, norm_m, norm_s
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      !!sprintf("mhq_asth_both_%s", score) := mean(c(
        .data[[sprintf("mhq_asth_left_%s", score)]],
        .data[[sprintf("mhq_asth_right_%s", score)]]
      )),
      !!sprintf("mhq_asth_%s", score) := dplyr::case_when(
        {{ handinj }} == "left" || {{ handinj }} == 2 ~
          .data[[sprintf("mhq_asth_left_%s", score)]],
        {{ handinj }} == "right" || {{ handinj }} == 1 ~
          .data[[sprintf("mhq_asth_right_%s", score)]],
        {{ handinj }} == "both" || {{ handinj }} == 3 ~
          .data[[sprintf("mhq_asth_both_%s", score)]],
        TRUE ~
          NA_real_
      )
    ) %>%
    dplyr::ungroup()
}
