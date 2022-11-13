SELECT  COUNTRY_ID AS ID
      , COUNTRY
  FROM {{source ('nubank_data', 'country')}}