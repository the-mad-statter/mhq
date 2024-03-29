% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sfac.R
\name{mhq_sfac}
\alias{mhq_sfac}
\title{MHQ Satisfaction}
\usage{
mhq_sfac(
  data,
  ...,
  handinj,
  score = c("raw", "mean", "stnd", "norm"),
  norm_m = 0,
  norm_s = 1
)
}
\arguments{
\item{data}{a \link[dplyr:reexports]{dplyr::tibble} containing the (sub)scale item responses to be
scored}

\item{...}{<\link[dplyr:dplyr_tidy_select]{dplyr::dplyr_tidy_select}> columns of the (sub)scale items in
order (See Note).}

\item{handinj}{<\link[dplyr:dplyr_tidy_select]{dplyr::dplyr_tidy_select}> column specification of the
affected hand(s)}

\item{score}{desired score class}

\item{norm_m}{mean value to use when computing normative scores}

\item{norm_s}{standard deviation value to use when computing normative scores}
}
\value{
data augmented with score columns:
\enumerate{
\item mhq_sfac_left_\if{html}{\out{<scale>}}
\itemize{
\item score from the left hand items
}
\item mhq_sfac_right_\if{html}{\out{<scale>}}
\itemize{
\item score from the right hand items
}
\item mhq_sfac_both_\if{html}{\out{<scale>}}
\itemize{
\item an average of the left and right scores
}
\item mhq_sfac_\if{html}{\out{<scale>}}
\itemize{
\item the requested satisfaction scale score
}
}
}
\description{
MHQ Satisfaction
}
\note{
Items indicated in the ellipsis (...) are expected to be in the following
order:

VI The following questions refer to your satisfaction with your
hand(s)/wrist(s) during the past week.

A The following questions refer to your satisfaction with your right
hand/wrist.
\enumerate{
\item Overall function of your right hand
\item Motion of the fingers in your right hand
\item Motion of your right wrist
\item Strength of your right hand
\item Pain level of your right hand
\item Sensation (feeling) of your right hand
}

B The following questions refer to your satisfaction with your left
hand/wrist.
7. Overall function of your left hand
8. Motion of the fingers in your left hand
9. Motion of your left wrist
10. Strength of your left hand
11. Pain level of your left hand
12. Sensation (feeling) of your left hand
}
\examples{
mhq_sfac(mhq, via1:vib6, handinj = handinj, score = "stnd")

}
