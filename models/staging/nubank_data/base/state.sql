SELECT  STATE_ID AS ID
      , STATE
      , COUNTRY_ID
  FROM {{source ('nubank_data', 'state')}}