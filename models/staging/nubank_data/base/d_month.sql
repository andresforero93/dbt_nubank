SELECT  MONTH_ID AS ID
      , ACTION_MONTH AS MONTH
  FROM {{source ('nubank_data', 'd_month')}}