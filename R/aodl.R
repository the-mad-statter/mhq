#' MHQ Activities of Daily Living
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with score columns:
#' 1. mhq_aodl_left_<score>
#'     - score from the left hand items
#' 2. mhq_aodl_right_<score>
#'     - score from the right hand items
#' 3. mhq_aodl_both_<score>
#'     - score from the two hand items
#' 4. mhq_aodl_overall_left_<score>
#'     - an average of the left and two hand scores
#' 5. mhq_aodl_overall_right_<score>
#'     - an average of the right and two hand scores
#' 6. mhq_aodl_overall_both_<score>
#'     - an average of the left, right, and two hand scores
#' 7. mhq_aodl_<score>
#'     - the requested activities of daily living score
#' @export
#'
#' @examples
#' mhq_aodl(mhq, iia1:iic7, handinj = handinj, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' II The following questions refer to the ability of your hand(s) to do
#' certain tasks during the past week.
#'
#' A How difficult was it for you to perform the following activities using
#' your right hand?
#' 1. Turn a door knob
#' 2. Pick up a coin
#' 3. Hold a glass of water
#' 4. Turn a key in a lock
#' 5. Hold a frying pan
#'
#' B How difficult was it for you to perform the following activities using
#' your left hand?
#' 6. Turn a door knob
#' 7. Pick up a coin
#' 8. Hold a glass of water
#' 9. Turn a key in a lock
#' 10. Hold a frying pan
#'
#' C How difficult was it for you to perform the following activities using
#' both of your hands?
#' 11. Open a jar
#' 12. Button a shirt/blouse
#' 13. Eat with a knife/fork
#' 14. Carry a grocery bag
#' 15. Wash dishes
#' 16. Wash your hair
#' 17. Tie shoelaces/knots
mhq_aodl <- function(
    data,
    ...,
    handinj,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  score <- match.arg(score)
  dots <- names(dplyr::select(data, ...))
  n_dots <- length(dots)

  if (n_dots != 17) {
    stop(sprintf("%i items were passed in ... which expected 17.", n_dots))
  }

  data %>%
    dplyr::mutate(
      !!sprintf("mhq_aodl_left_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[6:10])),
        "aodl", TRUE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_aodl_right_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[1:5])),
        "aodl", TRUE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_aodl_both_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[11:17])),
        "aodl", TRUE, score, norm_m, norm_s
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      !!sprintf("mhq_aodl_overall_left_%s", score) := mean(c(
        .data[[sprintf("mhq_aodl_left_%s", score)]],
        .data[[sprintf("mhq_aodl_both_%s", score)]]
      )),
      !!sprintf("mhq_aodl_overall_right_%s", score) := mean(c(
        .data[[sprintf("mhq_aodl_right_%s", score)]],
        .data[[sprintf("mhq_aodl_both_%s", score)]]
      )),
      !!sprintf("mhq_aodl_overall_both_%s", score) := mean(c(
        .data[[sprintf("mhq_aodl_left_%s", score)]],
        .data[[sprintf("mhq_aodl_right_%s", score)]],
        .data[[sprintf("mhq_aodl_both_%s", score)]]
      )),
      !!sprintf("mhq_aodl_%s", score) := dplyr::case_when(
        {{ handinj }} == "left" || {{ handinj }} == 2 ~
          .data[[sprintf("mhq_aodl_overall_left_%s", score)]],
        {{ handinj }} == "right" || {{ handinj }} == 1 ~
          .data[[sprintf("mhq_aodl_overall_right_%s", score)]],
        {{ handinj }} == "both" || {{ handinj }} == 3 ~
          .data[[sprintf("mhq_aodl_overall_both_%s", score)]],
        TRUE ~
          NA_real_
      )
    ) %>%
    dplyr::ungroup()
}
