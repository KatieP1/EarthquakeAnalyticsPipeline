CREATE OR REPLACE MODEL `cpsc482-project.earthquake_dataset.earthquake_model`
OPTIONS (
  model_type = 'BOOSTED_TREE_REGRESSOR',
  input_label_cols = ['mag'],
  data_split_method = 'AUTO_SPLIT'
) AS
SELECT  mag,
        id,
        latitude,
        longitude,
        depth,
        magType,
        place,
        mag_category,
        depth_category,
        nst,
        dmin,
        hemisphere,
        decimal_year
FROM `cpsc482-project.earthquake_dataset.clean_earthquake_table`