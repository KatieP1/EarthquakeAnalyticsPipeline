CREATE OR REPLACE TABLE `cpsc482-project.earthquake_dataset.new_earthquake_predictions`
AS
SELECT  t.id,
        t.time,
        t.year,
        t.month,
        t.day_of_year,
        t.hour,
        t.latitude,
        t.longitude,
        t.location,
        t.depth,
        t.mag,
        t.magType,
        t.place,
        t.type,
        t.tsunami,
        t.mag_category,
        t.depth_category,
        t.nst,
        t.gap,
        t.dmin,
        t.rms,
        t.season,
        t.hemisphere,
        t.decimal_year,
        m.predicted_mag AS predicted_mag
FROM ML.PREDICT(MODEL `cpsc482-project.earthquake_dataset.earthquake_model`, 
  (SELECT *
  FROM `cpsc482-project.earthquake_dataset.clean_earthquake_table`)) m
  JOIN `cpsc482-project.earthquake_dataset.clean_earthquake_table` t USING (id)