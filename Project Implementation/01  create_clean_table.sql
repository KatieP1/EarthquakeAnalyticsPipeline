CREATE OR REPLACE TABLE `cpsc482-project.earthquake_dataset.clean_earthquake_table`
AS
  SELECT  id,
          time,
          year,
          month,
          day_of_year,
          hour,
          ST_GEOGPOINT(longitude, latitude) AS location,
          depth,
          mag,
          UPPER(TRIM(magType)) AS magType,
          place,
          LOWER(TRIM(type)) AS type,
          CASE
            WHEN tsunami = 1 THEN TRUE
            ELSE FALSE
          END AS tsunami,
          mag_category,
          depth_category,
          nst,
          gap,
          dmin,
          rms,
          CASE
            WHEN month IN (6, 7, 8) THEN 'Summer'
            WHEN month IN (9, 10, 11) THEN 'Autumn'
            WHEN month in (12, 1, 2) THEN 'Winter'
            ELSE 'Spring'
          END AS season,
          CASE
            WHEN latitude >= 0 THEN 'Northern'
            ELSE 'Southern'
          END AS hemisphere,
          year + (CAST(day_of_year AS FLOAT64)/365.0) AS decimal_year
  FROM `cpsc482-project.earthquake_dataset.earthquake_table`
  WHERE LOWER(TRIM(type)) = 'earthquake' AND
        depth IS NOT NULL AND 
        depth_category IS NOT NULL AND 
        nst IS NOT NULL AND
        gap IS NOT NULL AND
        dmin IS NOT NULL AND
        rms IS NOT NULL   