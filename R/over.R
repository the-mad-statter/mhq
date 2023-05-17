#' MHQ Overall
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with score columns:
#' 1. mhq_overall_left_<score>
#'     - overall score for the left hand
#' 2. mhq_overall_right_<score>
#'     - overall score for the right hand
#' 3. mhq_overall_affected_<score>
#'     - overall score for the affected hand(s)
#' 4. mhq_overall_normal_<score>
#'     - overall score for the unaffected hand
#' @export
#'
#' @examples
#' mhq %>%
#'   mhq_hand(ia1:ib5, handinj = handinj, score = "stnd") %>%
#'   mhq_aodl(iia1:iic7, handinj = handinj, score = "stnd") %>%
#'   mhq_work(iii1:iii5, score = "stnd") %>%
#'   mhq_pain(iva1:ivb5, handinj = handinj, score = "stnd") %>%
#'   mhq_asth(va1:vb4, handinj = handinj, score = "stnd") %>%
#'   mhq_sfac(via1:vib6, handinj = handinj, score = "stnd") %>%
#'   mhq_over(handinj = handinj, score = "stnd")
#'
#' @references
#' Nolte, M. T., Shauver, M. J., & Chung, K. C. (2017). Normative values of the
#' Michigan Hand Outcomes Questionnaire for patients with and without hand
#' conditions. Plastic and reconstructive surgery, 140(3), 425e-433e, DOI:
#' 10.1097/PRS.0000000000003581
mhq_over <- function(
    data,
    handinj,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  if (score %in% c("raw", "mean")) {
    data <- data %>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        !!sprintf("mhq_overall_left_%s", score) := mean(c(
          25 - .data[[sprintf("mhq_hand_left_%s", score)]],
          30 - .data[[sprintf("mhq_aodl_left_%s", score)]],
          .data[[sprintf("mhq_work_%s", score)]],
          25 - .data[[sprintf("mhq_pain_left_%s", score)]],
          .data[[sprintf("mhq_asth_left_%s", score)]],
          30 - .data[[sprintf("mhq_sfac_left_%s", score)]]
        )),
        !!sprintf("mhq_overall_right_%s", score) := mean(c(
          25 - .data[[sprintf("mhq_hand_right_%s", score)]],
          30 - .data[[sprintf("mhq_aodl_right_%s", score)]],
          .data[[sprintf("mhq_work_%s", score)]],
          25 - .data[[sprintf("mhq_pain_right_%s", score)]],
          .data[[sprintf("mhq_asth_right_%s", score)]],
          30 - .data[[sprintf("mhq_sfac_right_%s", score)]]
        )),
        !!sprintf("mhq_overall_affected_%s", score) := dplyr::case_when(
          {{ handinj }} == "left" || {{ handinj }} == 2 ~
            .data[[sprintf("mhq_overall_left_%s", score)]],
          {{ handinj }} == "right" || {{ handinj }} == 1 ~
            .data[[sprintf("mhq_overall_right_%s", score)]],
          {{ handinj }} == "both" || {{ handinj }} == 3 ~ mean(c(
            .data[[sprintf("mhq_overall_left_%s", score)]],
            .data[[sprintf("mhq_overall_right_%s", score)]]
          )),
          TRUE ~
            NA_real_
        ),
        !!sprintf("mhq_overall_normal_%s", score) := dplyr::case_when(
          {{ handinj }} == "left" || {{ handinj }} == 2 ~
            .data[[sprintf("mhq_overall_right_%s", score)]],
          {{ handinj }} == "right" || {{ handinj }} == 1 ~
            .data[[sprintf("mhq_overall_left_%s", score)]],
          TRUE ~
            NA_real_
        )
      )
  }

  if (score %in% c("stnd", "norm")) {
    data <- data %>%
      dplyr::rowwise() %>%
      dplyr::mutate(
        !!sprintf("mhq_overall_left_%s", score) := mean(c(
          .data[[sprintf("mhq_hand_left_%s", score)]],
          .data[[sprintf("mhq_aodl_overall_left_%s", score)]],
          .data[[sprintf("mhq_work_%s", score)]],
          100 - .data[[sprintf("mhq_pain_left_%s", score)]],
          .data[[sprintf("mhq_asth_left_%s", score)]],
          .data[[sprintf("mhq_sfac_left_%s", score)]]
        )),
        !!sprintf("mhq_overall_right_%s", score) := mean(c(
          .data[[sprintf("mhq_hand_right_%s", score)]],
          .data[[sprintf("mhq_aodl_overall_right_%s", score)]],
          .data[[sprintf("mhq_work_%s", score)]],
          100 - .data[[sprintf("mhq_pain_right_%s", score)]],
          .data[[sprintf("mhq_asth_right_%s", score)]],
          .data[[sprintf("mhq_sfac_right_%s", score)]]
        )),
        !!sprintf("mhq_overall_affected_%s", score) := dplyr::case_when(
          {{ handinj }} == "left" || {{ handinj }} == 2 ~
            .data[[sprintf("mhq_overall_left_%s", score)]],
          {{ handinj }} == "right" || {{ handinj }} == 1 ~
            .data[[sprintf("mhq_overall_right_%s", score)]],
          {{ handinj }} == "both" || {{ handinj }} == 3 ~ mean(c(
            .data[[sprintf("mhq_overall_left_%s", score)]],
            .data[[sprintf("mhq_overall_right_%s", score)]]
          )),
          TRUE ~
            NA_real_
        ),
        !!sprintf("mhq_overall_normal_%s", score) := dplyr::case_when(
          {{ handinj }} == "left" || {{ handinj }} == 2 ~
            .data[[sprintf("mhq_overall_right_%s", score)]],
          {{ handinj }} == "right" || {{ handinj }} == 1 ~
            .data[[sprintf("mhq_overall_left_%s", score)]],
          TRUE ~
            NA_real_
        )
      )
  }

  data %>%
    dplyr::ungroup()
}
