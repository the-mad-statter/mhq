# needs work
score_mhq <- function(data) {
  data %>%
    dplyr::rowwise() %>%

    # FUNCTION RIGHT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(ia1:ia5))),
      .mean = mean(dplyr::c_across(ia1:ia5), na.rm = TRUE),
      mhq_function_right_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(ia1:ia5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(ia1:ia5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_function_right_normalized = (-(mhq_function_right_raw - 25) / 20) * 100
    ) %>%

    # FUNCTION LEFT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(ib1:ib5))),
      .mean = mean(dplyr::c_across(ib1:ib5), na.rm = TRUE),
      mhq_function_left_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(ib1:ib5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(ib1:ib5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_function_left_normalized = (-(mhq_function_left_raw - 25) / 20) * 100
    ) %>%

    # ACTIVITIES OF DAILY LIVING - RIGHT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(iia1:iia5))),
      .mean = mean(dplyr::c_across(iia1:iia5), na.rm = TRUE),
      mhq_activities_right_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(iia1:iia5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(iia1:iia5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_activities_right_normalized = (-(mhq_activities_right_raw - 25) / 20) * 100
    ) %>%

    # ACTIVITIES OF DAILY LIVING - LEFT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(iib1:iib5))),
      .mean = mean(dplyr::c_across(iib1:iib5), na.rm = TRUE),
      mhq_activities_left_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(iib1:iib5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(iib1:iib5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_activities_left_normalized = (-(mhq_activities_left_raw - 25) / 20) * 100
    ) %>%

    # ACTIVITIES OF DAILY LIVING - BOTH
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(iic1:iic7))),
      .mean = mean(dplyr::c_across(iic1:iic7), na.rm = TRUE),
      mhq_activities_both_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(iic1:iic7)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(iic1:iic7), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_activities_both_normalized = (-(mhq_activities_both_raw - 35) / 28) * 100,
    ) %>%

    # ACTIVITIES OF DAILY LIVING - OVERALL
    dplyr::mutate(
      mhq_activities_overall_right_normalized = (
        mhq_activities_right_normalized +
          mhq_activities_both_normalized) / 2,
      mhq_activities_overall_left_normalized = (
        mhq_activities_left_normalized +
          mhq_activities_both_normalized) / 2,
      mhq_activities_overall_both_normalized = (
        mhq_activities_right_normalized +
          mhq_activities_left_normalized +
          mhq_activities_both_normalized) / 3
    ) %>%

    # WORK
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(iii1:iii5))),
      .mean = mean(dplyr::c_across(iii1:iii5), na.rm = TRUE),
      mhq_work_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(iii1:iii5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(iii1:iii5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_work_normalized = (-(mhq_work_raw - 25) / 20) * 100
    ) %>%

    # PAIN - RIGHT
    dplyr::mutate(
      iva2 = 6 - iva2,
      .nmiss = sum(is.na(dplyr::c_across(iva1:iva5))),
      .mean = mean(dplyr::c_across(iva1:iva5), na.rm = TRUE),
      mhq_pain_right_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(iva1:iva5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(iva1:iva5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_pain_right_normalized = if_else(iva1 == 5, 0, (-(mhq_pain_right_raw - 25) / 20) * 100),
      iva2 = 6 - iva2
    ) %>%

    # PAIN - LEFT
    dplyr::mutate(
      ivb2 = 6 - ivb2,
      .nmiss = sum(is.na(dplyr::c_across(ivb1:ivb5))),
      .mean = mean(dplyr::c_across(ivb1:ivb5), na.rm = TRUE),
      mhq_pain_left_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(ivb1:ivb5)),
        .nmiss < 5 / 2 ~ sum(dplyr::c_across(ivb1:ivb5), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_pain_left_normalized = if_else(ivb1 == 5, 0, (-(mhq_pain_left_raw - 25) / 20) * 100),
      ivb2 = 6 - ivb2
    ) %>%

    # AESTHETICS - RIGHT
    dplyr::mutate(
      va1 = 6 - va1,
      .nmiss = sum(is.na(dplyr::c_across(va1:va4))),
      .mean = mean(dplyr::c_across(va1:va4), na.rm = TRUE),
      mhq_aesthetics_right_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(va1:va4)),
        .nmiss < 4 / 2 ~ sum(dplyr::c_across(va1:va4), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_aesthetics_right_normalized = ((mhq_aesthetics_right_raw - 4) / 16) * 100,
      va1 = 6 - va1
    ) %>%

    # AESTHETICS - LEFT
    dplyr::mutate(
      vb1 = 6 - vb1,
      .nmiss = sum(is.na(dplyr::c_across(vb1:vb4))),
      .mean = mean(dplyr::c_across(vb1:vb4), na.rm = TRUE),
      mhq_aesthetics_left_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(vb1:vb4)),
        .nmiss < 4 / 2 ~ sum(dplyr::c_across(vb1:vb4), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_aesthetics_left_normalized = ((mhq_aesthetics_left_raw - 4) / 16) * 100,
      vb1 = 6 - vb1
    ) %>%

    # SATISFACTION - RIGHT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(via1:via6))),
      .mean = mean(dplyr::c_across(via1:via6), na.rm = TRUE),
      mhq_satisfaction_right_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(via1:via6)),
        .nmiss < 6 / 2 ~ sum(dplyr::c_across(via1:via6), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_satisfaction_right_normalized = ((mhq_satisfaction_right_raw - 30) / 24) * 100,
    ) %>%

    # SATISFACTION - LEFT
    dplyr::mutate(
      .nmiss = sum(is.na(dplyr::c_across(vib1:vib6))),
      .mean = mean(dplyr::c_across(vib1:vib6), na.rm = TRUE),
      mhq_satisfaction_left_raw = dplyr::case_when(
        .nmiss == 0 ~ sum(dplyr::c_across(vib1:vib6)),
        .nmiss < 6 / 2 ~ sum(dplyr::c_across(vib1:vib6), na.rm = TRUE) + .nmiss * .mean,
        TRUE ~ NA_real_
      ),
      mhq_satisfaction_left_normalized = ((mhq_satisfaction_left_raw - 30) / 24) * 100,
    ) %>%

    # OVERALL
    dplyr::mutate(
      mhq_overall_right_normalized = (
        mhq_function_right_normalized +
          mhq_activities_right_normalized +
          mhq_work_normalized + # work questions were not asked per hand in redcap
          (100 - mhq_pain_right_normalized) +
          mhq_aesthetics_right_normalized +
          mhq_satisfaction_right_normalized
      ) / 6,
      mhq_overall_left_normalized = (
        mhq_function_left_normalized +
          mhq_activities_left_normalized +
          mhq_work_normalized + # work questions were not asked per hand in redcap
          (100 - mhq_pain_left_normalized) +
          mhq_aesthetics_left_normalized +
          mhq_satisfaction_left_normalized
      ) / 6,
      mhq_overall_both_normalized = (
        (mhq_function_right_normalized + mhq_function_left_normalized) / 2 +
          mhq_activities_both_normalized +
          mhq_work_normalized +
          ((100 - mhq_pain_right_normalized) + (100 - mhq_pain_left_normalized)) / 2 +
          (mhq_aesthetics_right_normalized + mhq_aesthetics_left_normalized) / 2 +
          (mhq_satisfaction_right_normalized + mhq_satisfaction_left_normalized) / 2
      ) / 6
    ) %>%

    dplyr::select(-c(.nmiss, .mean)) %>%
    dplyr::ungroup()
}
