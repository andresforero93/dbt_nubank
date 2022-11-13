SELECT  ID
      , ACCOUNT_ID
      , PIX_AMOUNT AS AMOUNT 
      , PIX_REQUESTED_AT AS TIME_ID_REQUESTED_AT
      , PIX_COMPLETED_AT AS TIME_ID_COMPLETED_AT
      , STATUS
      , IN_OR_OUT
  FROM {{source ('nubank_data', 'pix_movements')}}