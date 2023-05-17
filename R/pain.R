#' MHQ Pain
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with score columns:
#' 1. mhq_pain_left_<scale>
#'     - score from the left hand items
#' 2. mhq_pain_right_<scale>
#'     - score from the right hand items
#' 3. mhq_pain_both_<scale>
#'     - an average of the left and right scores
#' 4. mhq_pain_<scale>
#'     - the requested pain scale score
#' @export
#'
#' @examples
#' mhq_pain(mhq, iva1:ivb5, handinj = handinj, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' IV The following questions refer to how much pain you had in your
#' hand(s)/wrist(s) during the past week.
#'
#' A The following questions refer to pain in your right hand/wrist.
#' 1. How often did you have pain in your right hand/wrist?
#' 2. Please describe the pain you have in your right hand/wrist.
#' 3. How often did the pain in your right hand/wrist interfere with your sleep?
#' 4. How often did the pain in your right hand/wrist interfere with your daily
#' activities (such as eating or bathing)?
#' 5. How often did the pain in your right hand/wrist make you unhappy?
#'
#' B The following questions refer to pain in your left hand/wrist.
#' 6. How often did you have pain in your left hand/wrist?
#' 7. Please describe the pain you have in your left hand/wrist.
#' 8. How often did the pain in your left hand/wrist interfere with your sleep?
#' 9. How often did the pain in your left hand/wrist interfere with your daily
#' activities (such as eating or bathing)?
#' 10. How often did the pain in your left hand/wrist make you unhappy?
mhq_pain <- function(
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
      !!sprintf("mhq_pain_left_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[6:10])),
        "pain", TRUE, score, norm_m, norm_s
      ),
      !!sprintf("mhq_pain_right_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots[1:5])),
        "pain", TRUE, score, norm_m, norm_s
      )
    ) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      !!sprintf("mhq_pain_both_%s", score) := mean(c(
        .data[[sprintf("mhq_pain_left_%s", score)]],
        .data[[sprintf("mhq_pain_right_%s", score)]]
      )),
      !!sprintf("mhq_pain_%s", score) := dplyr::case_when(
        {{ handinj }} == "left" || {{ handinj }} == 2 ~
          .data[[sprintf("mhq_pain_left_%s", score)]],
        {{ handinj }} == "right" || {{ handinj }} == 1 ~
          .data[[sprintf("mhq_pain_right_%s", score)]],
        {{ handinj }} == "both" || {{ handinj }} == 3 ~
          .data[[sprintf("mhq_pain_both_%s", score)]],
        TRUE ~
          NA_real_
      )
    ) %>%
    dplyr::ungroup()
}
