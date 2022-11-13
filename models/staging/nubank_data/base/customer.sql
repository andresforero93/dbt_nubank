SELECT  CUSTOMER_ID AS ID
      , FIRST_NAME
      , LAST_NAME
      , CUSTOMER_CITY AS CITY_ID
      , CPF
      , COUNTRY_NAME
  FROM {{source ('nubank_data', 'customer')}}