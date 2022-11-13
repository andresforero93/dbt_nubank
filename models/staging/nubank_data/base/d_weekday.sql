SELECT  WEEKDAY_ID AS ID
      , ACTION_WEEKDAY AS WEEKDAY
  FROM {{source ('nubank_data', 'd_weekday')}}