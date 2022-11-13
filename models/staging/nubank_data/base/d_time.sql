SELECT  TIME_ID AS ID
      , ACTION_TIMESTAMP AS TIMESTAMP
      , WEEK_ID
      , MONTH_ID
      , YEAR_ID
      , WEEKDAY_ID
  FROM {{source ('nubank_data', 'd_time')}}