SELECT  CUSTOMER_ID AS ID
      , FIRST_NAME
      , LAST_NAME
      , CUSTOMER_CITY AS CITY_ID
      , CPF
  FROM {{source ('nubank_data', 'customer')}}