#' MHQ Overall Hand Function
#'
#' @param data a [dplyr::tibble] containing the (sub)scale item responses to be
#' scored
#' @param ... <[dplyr::dplyr_tidy_select]> columns of the (sub)scale items in
#' order (See Note).
#' @param handinj <[dplyr::dplyr_tidy_select]> column specification of the
#' affected hand(s)
#' @param score desired score class
#' @param norm_m mean value to use when computing normative scores
#' @param norm_s standard deviation value to use when computing normative scores
#'
#' @return data augmented with score columns:
#' 1. mhq_hand_left_<score>
#'     - score from the left hand items
#' 2. mhq_hand_right_<score>
#'     - score from the right hand items
#' 3. mhq_hand_both_<score>
#'     - an average of the left and right hand scores
#' 4. mhq_hand_<score>
#'     - the requested overall hand function scale score
#' @export
#'
#' @examples
#' mhq_hand(mhq, ia1:ib5, handinj = handinj, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' I The following questions refer to the function of your hand(s)/wrist(s)
#' during the past week.
#'
#' A The following questions refer to your right hand/wrist.
#' 1. Overall, how well did your right hand work?
#' 2. How well did your right fingers move?
#' 3. How well did your right wrist move?
#' 4. How was the strength in your right hand?
#' 5. How was the sensation (feeling) in your right hand?
#'
#' B The following questions refer to your left hand/wrist.
#' 6. Overall, how well did your left hand work?
#' 7. How well did your left fingers move?
#' 8. How well did your left wrist move?
#' 9. How was the strength in your left hand?
#' 10. How was the sensation (feeling) in your left hand?
mhq_hand <- function(
    data,
    ...,
    handinj,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  score <- match.arg(score)
  dots <- names(dplyr::select(data, ...))
  n_dots <- length(dots)

  if (n_dots != 10) {
    stop(sprintf("%i items were passed in ... which expected 10.", n_dots))
  }

  data %>%
    dplyr::mutate(
      !!sprintf("mhq_hand_left_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[6:10])),
        "hand", TRUE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_hand_right_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[1:5])),
        "hand", TRUE, score, norm_m, norm_s
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      !!sprintf("mhq_hand_both_%s", score) := mean(c(
        .data[[sprintf("mhq_hand_left_%s", score)]],
        .data[[sprintf("mhq_hand_right_%s", score)]]
      )),
      !!sprintf("mhq_hand_%s", score) := dplyr::case_when(
        {{ handinj }} == "left" || {{ handinj }} == 2 ~
          .data[[sprintf("mhq_hand_left_%s", score)]],
        {{ handinj }} == "right" || {{ handinj }} == 1 ~
          .data[[sprintf("mhq_hand_right_%s", score)]],
        {{ handinj }} == "both" || {{ handinj }} == 3 ~
          .data[[sprintf("mhq_hand_both_%s", score)]],
        TRUE ~
          NA_real_
      )
    ) %>%
    dplyr::ungroup()
}
