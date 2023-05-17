#' MHQ Work
#'
#' @inheritParams mhq_hand
#'
#' @return data augmented with mhq_work_<scale>, the requested work scale score
#' @export
#'
#' @examples
#' mhq_work(mhq, iii1:iii5, score = "stnd")
#'
#' @note
#' Items indicated in the ellipsis (...) are expected to be in the following
#' order:
#'
#' III The following questions refer to how you did in your normal work
#' (including both housework and school work) during the past 4 weeks.
#'
#' 1. How often were you unable to do your work because of problems with your
#' hand(s)/wrist(s)?
#' 2. How often did you have to shorten your work day because of problems with
#' your hand(s)/wrist(s)?
#' 3. How often did you have to take it easy at your work because of problems
#' with yoru hand(s)/wrist(s)?
#' 4. How often did you accomplish less in your work because of problems with
#' your hand(s)/wrist(s)?
#' 5. How often did you take longer to do the tasks in your work because of
#' problems with your hand(s)/wrist(s)?
mhq_work <- function(
    data,
    ...,
    score = c("raw", "mean", "stnd", "norm"),
    norm_m = 0,
    norm_s = 1) {
  score <- match.arg(score)
  dots <- names(dplyr::select(data, ...))

  if ("handinj" %in% dots) {
    warning("Ignoring the handinj argument.")
    dots <- setdiff(dots, "handinj")
  }

  n_dots <- length(dots)

  if (n_dots != 5) {
    stop(sprintf("%i items were passed in ... which expected 5.", n_dots))
  }

  data %>%
    dplyr::mutate(
      !!sprintf("mhq_work_%s", score) := mhq_scoring_algorithm(
        dplyr::select(data, dplyr::all_of(dots)),
        "work", FALSE, score, norm_m, norm_s
      )
    )
}
