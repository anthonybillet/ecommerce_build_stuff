view: logit_shifting_BQML_test {
  # this is all thoery, not applied yet, Gemini made this: https://gemini.google.com/corp/app/ec303c75c7958dfd
  derived_table: {
    sql:
        -- Let's assume your desired "shift" is +0.5
        DECLARE logit_shift FLOAT64 DEFAULT {% parameter logit_shift_variable %};

        SELECT
          *,
          -- 1. Get the predicted probability for class 1
          predicted_label_probs[OFFSET(1)].prob AS original_probability,

          -- 2. Convert probability to logit (log-odds)
          LN(predicted_label_probs[OFFSET(1)].prob / (1 - predicted_label_probs[OFFSET(1)].prob)) AS original_logit,

          -- 3. Apply the shift
          LN(predicted_label_probs[OFFSET(1)].prob / (1 - predicted_label_probs[OFFSET(1)].prob)) + logit_shift AS shifted_logit,

          -- 4. Convert shifted logit back to probability
          1 / (1 + EXP(-(LN(predicted_label_probs[OFFSET(1)].prob / (1 - predicted_label_probs[OFFSET(1)].prob)) + logit_shift))) AS shifted_probability
        FROM
          ML.PREDICT(MODEL `my_dataset.logit_model`,
            (SELECT * FROM `my_dataset.new_data_to_predict`) ;;
  }

  parameter: logit_shift_variable {
    description: "Enter a value you'd like to logit shift by"
    type: number

  }

  dimension: original_probability {
    type: number
    sql: ${TABLE}.original_probability ;;
  }

  dimension: original_logit {
    type: number
    sql: ${TABLE}.original_logit ;;
  }

  dimension: shifted_logit {
    type: number
    sql: ${TABLE}.original_logit ;;
  }

  dimension: shifted_probability {
    type: number
    sql: ${TABLE}.original_logit ;;
  }

}
