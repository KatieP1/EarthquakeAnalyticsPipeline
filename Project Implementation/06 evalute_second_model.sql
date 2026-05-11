SELECT ROUND(mean_absolute_error, 4) AS mean_absolute_error,
       ROUND(mean_squared_error, 4) AS mean_squared_error,
       ABS(ROUND(sqrt(mean_squared_error))),
       ROUND(r2_score) AS r2_score
FROM ML.EVALUATE(MODEL `cpsc482-project.earthquake_dataset.earthquake_model`)