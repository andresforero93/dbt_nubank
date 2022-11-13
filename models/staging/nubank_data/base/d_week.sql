SELECT  WEEK_ID AS ID
      , ACTION_WEEK AS WEEK
  FROM {{source ('nubank_data', 'd_week')}}