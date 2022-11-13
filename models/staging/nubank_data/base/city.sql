SELECT  CITY_ID AS ID
      , CITY
      , STATE_ID
  FROM {{source ('nubank_data', 'city')}}