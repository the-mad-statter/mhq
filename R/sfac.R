#' MHQ Satisfaction
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with score columns:
#' 1. mhq_sfac_left_<scale>
#'     - score from the left hand items
#' 2. mhq_sfac_right_<scale>
#'     - score from the right hand items
#' 3. mhq_sfac_both_<scale>
#'     - an average of the left and right scores
#' 4. mhq_sfac_<scale>
#'     - the requested satisfaction scale score
#' @export
#'
#' @examples
#' mhq_sfac(mhq, via1:vib6, handinj = handinj, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' VI The following questions refer to your satisfaction with your
#' hand(s)/wrist(s) during the past week.
#'
#' A The following questions refer to your satisfaction with your right
#' hand/wrist.
#' 1. Overall function of your right hand
#' 2. Motion of the fingers in your right hand
#' 3. Motion of your right wrist
#' 4. Strength of your right hand
#' 5. Pain level of your right hand
#' 6. Sensation (feeling) of your right hand
#'
#' B The following questions refer to your satisfaction with your left
#' hand/wrist.
#' 7. Overall function of your left hand
#' 8. Motion of the fingers in your left hand
#' 9. Motion of your left wrist
#' 10. Strength of your left hand
#' 11. Pain level of your left hand
#' 12. Sensation (feeling) of your left hand
mhq_sfac <- function(
    data,
    ...,
    handinj,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  score <- match.arg(score)
  dots <- names(dplyr::select(data, ...))
  n_dots <- length(dots)

  if (n_dots != 12) {
    stop(sprintf("%i items were passed in ... which expected 12.", n_dots))
  }

  data %>%
    dplyr::mutate(
      !!sprintf("mhq_sfac_left_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[7:12])),
        "sfac", TRUE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_sfac_right_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[1:6])),
        "sfac", TRUE, score, norm_m, norm_s
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      !!sprintf("mhq_sfac_both_%s", score) := mean(c(
        .data[[sprintf("mhq_sfac_left_%s", score)]],
        .data[[sprintf("mhq_sfac_right_%s", score)]]
      )),
      !!sprintf("mhq_sfac_%s", score) := dplyr::case_when(
        {{ handinj }} == "left" || {{ handinj }} == 2 ~
          .data[[sprintf("mhq_sfac_left_%s", score)]],
        {{ handinj }} == "right" || {{ handinj }} == 1 ~
          .data[[sprintf("mhq_sfac_right_%s", score)]],
        {{ handinj }} == "both" || {{ handinj }} == 3 ~
          .data[[sprintf("mhq_sfac_both_%s", score)]],
        TRUE ~
          NA_real_
      )
    ) %>%
    dplyr::ungroup()
}
