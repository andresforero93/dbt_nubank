SELECT  YEAR_ID AS ID
      , ACTION_YEAR AS YEAR
  FROM {{source ('nubank_data', 'd_year')}}