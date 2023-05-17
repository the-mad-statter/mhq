# nolint start: cyclocomp_linter,line_length_linter.

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
    cohort == "healthy" && scale == "over" && score == "stnd" && stat == "m" ~ 95.2,
    cohort == "healthy" && scale == "over" && score == "stnd" && stat == "s" ~ 0.456933,
    cohort == "healthy" && scale == "hand" && score == "stnd" && stat == "m" ~ 95.7,
    cohort == "healthy" && scale == "hand" && score == "stnd" && stat == "s" ~ 0.5077033,
    cohort == "healthy" && scale == "aodl" && score == "stnd" && stat == "m" ~ 97.5,
    cohort == "healthy" && scale == "aodl" && score == "stnd" && stat == "s" ~ 0.304622,
    cohort == "healthy" && scale == "pain" && score == "stnd" && stat == "m" ~ 4.7,
    cohort == "healthy" && scale == "pain" && score == "stnd" && stat == "s" ~ 0.5584737,
    cohort == "healthy" && scale == "asth" && score == "stnd" && stat == "m" ~ 91.2,
    cohort == "healthy" && scale == "asth" && score == "stnd" && stat == "s" ~ 1.116947,
    cohort == "healthy" && scale == "sfac" && score == "stnd" && stat == "m" ~ 95.3,
    cohort == "healthy" && scale == "sfac" && score == "stnd" && stat == "s" ~ 0.6600143,
    TRUE ~ NA_real_
  )
}

# nolint end
