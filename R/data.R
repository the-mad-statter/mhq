# nolint start: line_length_linter.

#' Michigan Hand Outcomes Questionnaire (MHQ) Data
#'
#' @description
#' Example Michigan Hand Outcomes Questionnaire (MHQ) Data
#'
#' @format
#' A 5 x 63 [dplyr::tibble]
#'
#' - hand. The injured hand
#'     - 1, right | 2, left | 3, both
#'
#' - I. The following questions refer to the function of your hand(s)/wrist(s) during the past week.
#'
#'     - A. The following questions refer to your right hand/wrist.
#'
#'         - ia1. Overall, how well did your right hand work?
#'             - 1, Very good | 2, Good | 3, Fair | 4, Poor | 5, Very poor
#'         - ia2. How well did your right fingers move?
#'             - 1, Very good | 2, Good | 3, Fair | 4, Poor | 5, Very poor
#'         - ia3. How well did your right wrist move?
#'             - 1, Very good | 2, Good | 3, Fair | 4, Poor | 5, Very poor
#'         - ia4. How was the strength in your right hand?
#'             - 1, Very good | 2, Good | 3, Fair | 4, Poor | 5, Very poor
#'         - ia5. How was the sensation (feeling) in your right hand?
#'             - 1, Very good | 2, Good | 3, Fair | 4, Poor | 5, Very poor
#'
#'     - B The following questions refer to your left hand/wrist.
#'
#'         - ib1. Overall, how well did your left hand work?
#'             - 1, Very Good | 2, Good | 3, Fair | 4, Poor | 5, Very Poor
#'         - ib2. How well did your left fingers move?
#'             - 1, Very Good | 2, Good | 3, Fair | 4, Poor | 5, Very Poor
#'         - ib3. How well did your left wrist move?
#'             - 1, Very Good | 2, Good | 3, Fair | 4, Poor | 5, Very Poor
#'         - ib4. How was the strength in your left hand?
#'             - 1, Very Good | 2, Good | 3, Fair | 4, Poor | 5, Very Poor
#'         - ib5. How was the sensation (feeling) in your left hand?
#'             - 1, Very Good | 2, Good | 3, Fair | 4, Poor | 5, Very Poor
#'
#' - II. The following questions refer to the ability of your hand(s) to do certain tasks during the past week.
#'
#'     - A. How difficult was it for you to perform the following activities using your right hand?
#'
#'         - iia1. Turn a door knob
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iia2. Pick up a coin
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iia3. Hold a glass of water
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iia4. Turn a key in a lock
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iia5. Hold a frying pan
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'
#'     - B. How difficult was it for you to perform the following activities using your left hand?
#'
#'         - iib1. Turn a door knob
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iib2. Pick up a coin
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iib3. Hold a glass of water
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iib4. Turn a key in a lock
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iib5. Hold a frying pan
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'
#'     - C. How difficult was it for you to perform the following activities using both of your hands?
#'
#'         - iic1. Open a jar
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic2. Button a shirt/blouse
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic3. Eat with a knife/fork
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic4. Carry a grocery bag
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic5. Wash dishes
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic6. Wash your hair
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'         - iic7. Tie shoelaces/knots
#'             - 1, Not at all difficult | 2, A little difficult | 3, Somewhat difficult | 4, Moderately difficult | 5, Very difficult
#'
#' - III. The following questions refer to how you did in your normal work (including both housework and school work) during the past 4 weeks.
#'
#'     - iii1. How often were you unable to do your work because of problems with your hand(s)/wrist(s)?
#'         - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'     - iii2. How often did you have to shorten your work day because of problems with your hand(s)/wrist(s)?
#'         - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'     - iii3. How often did you have to take it easy at your work because of problems with yoru hand(s)/wrist(s)?
#'         - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'     - iii4. How often did you accomplish less in your work because of problems with your hand(s)/wrist(s)?
#'         - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'     - iii5. How often did you take longer to do the tasks in your work because of problems with your hand(s)/wrist(s)?
#'         - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'
#' - IV. The following questions refer to how much pain you had in your hand(s)/wrist(s) during the past week.
#'
#'     - A. The following questions refer to your right hand.
#'
#'         - iva1. How often did you have pain in your right hand/wrist?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva2. Please describe the pain you have in your right hand/wrist.
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva3. How often did the pain in your right hand/wrist interfere with your sleep?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva4. How often did the pain in your right hand/wrist interfere with your daily activities (such as eating or bathing)?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva5. How often did the pain in your right hand/wrist make you unhappy?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'
#'     - B. The following questions refer to your left hand.
#'
#'         - iva1. How often did you have pain in your left hand/wrist?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva2. Please describe the pain you have in your left hand/wrist.
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva3. How often did the pain in your left hand/wrist interfere with your sleep?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva4. How often did the pain in your left hand/wrist interfere with your daily activities (such as eating or bathing)?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'         - iva5. How often did the pain in your left hand/wrist make you unhappy?
#'             - 1, Always | 2, Often | 3, Sometimes | 4, Rarely | 5, Never
#'
#' - V. The following questions refer to the appearance (look) of your hands during the past week.
#'
#'     - A. The following questions refer to your right hand.
#'
#'         - va1. I was satisfied with the appearance (look) of my right hand.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - va2. The appearance (look) of my right hand sometimes made me uncomfortable in public.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - va3. The appearance (look) of my right hand made me depressed.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - va4. The appearance (look) of my right hand interfered with my normal social activities.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'
#'     - B. The following questions refer to your left hand.
#'
#'         - vb1. I was satisfied with the appearance (look) of my left hand.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - vb2. The appearance (look) of my left hand sometimes made me uncomfortable in public.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - vb3. The appearance (look) of my left hand made me depressed.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'         - vb4. The appearance (look) of my left hand interfered with my normal social activities.
#'             - 1, Strongly agree, | 2, Agree | 3, Neither agree nor disagree | 4, Disagree | 5, Strongly disagree
#'
#' - VI. The following questions refer to your satisfaction with your hand(s)/wrist(s) during the past week.
#'
#'     - A. The following questions refer to your right hand/wrist.
#'
#'         - via1. Overall function of your right hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - via2. Motion of the fingers in your right hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - via3. Motion of your right wrist
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - via4. Strength of your right hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - via5. Pain level of your right hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - via6. Sensation (feeling) of your right hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'
#'     - B The following questions refer to your left hand/wrist.
#'
#'         - vib1. Overall function of your left hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - vib2. Motion of the fingers in your left hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - vib3. Motion of your left wrist
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - vib4. Strength of your left hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - vib5. Pain level of your left hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
#'         - vib6. Sensation (feeling) of your left hand
#'             - 1, Very satisfied | 2, Somewhat satisfied | 3, Neither satisfied nor dissatisfied | 4, Somewhat dissatisfied | 5, Very dissatisfied
"mhq"

# nolint end
