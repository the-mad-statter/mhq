# nolint start: cyclocomp_linter

#' MHQ Normative Values
#'
#' @param cohort cohort of patients from which values were calculated
#' @param scale desired (sub)scale
#' @param score desired score class
#' @param stat requested statistic
#'
#' @return the requested statistic or missing if not implemented
#' @export
#'
#' @examples
#' mhq_norms("healthy", "hand", "stnd", "m")
#'
#' @references
#' Nolte, M. T., Shauver, M. J., & Chung, K. C. (2017). Normative values of the
#' Michigan Hand Outcomes Questionnaire for patients with and without hand
#' conditions. Plastic and reconstructive surgery, 140(3), 425e-433e, DOI:
#' 10.1097/PRS.0000000000003581
mhq_norms <- function(
    cohort = c("healthy", "trauma", "disease", "nonspecific", "systemic"),
    scale = c("hand", "aodl", "work", "pain", "asth", "sfac", "over"),
    score = c("raw", "mean", "stnd", "norm"),
    stat = c("m", "s")) {
  scale <- match.arg(scale)
  score <- match.arg(score)
  stat <- match.arg(stat)
  cohort <- match.arg(cohort)

  dplyr::case_when(
    cohort == "healthy" ~
      dplyr::case_when(
        scale == "over" && score == "stnd" && stat == "m" ~ 95.2,
        scale == "over" && score == "stnd" && stat == "s" ~ 0.456933,
        scale == "hand" && score == "stnd" && stat == "m" ~ 95.7,
        scale == "hand" && score == "stnd" && stat == "s" ~ 0.5077033,
        scale == "aodl" && score == "stnd" && stat == "m" ~ 97.5,
        scale == "aodl" && score == "stnd" && stat == "s" ~ 0.304622,
        scale == "pain" && score == "stnd" && stat == "m" ~ 4.7,
        scale == "pain" && score == "stnd" && stat == "s" ~ 0.5584737,
        scale == "asth" && score == "stnd" && stat == "m" ~ 91.2,
        scale == "asth" && score == "stnd" && stat == "s" ~ 1.116947,
        scale == "sfac" && score == "stnd" && stat == "m" ~ 95.3,
        scale == "sfac" && score == "stnd" && stat == "s" ~ 0.6600143,
        TRUE ~ NA_real_
      ),
    TRUE ~ NA_real_
  )
}

# nolint end
