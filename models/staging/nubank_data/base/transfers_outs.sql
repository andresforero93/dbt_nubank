SELECT  ID
      , ACCOUNT_ID
      , AMOUNT
      , TRANSACTION_REQUESTED_AT AS TIME_ID_REQUESTED_AT
      , TRANSACTION_COMPLETED_AT AS TIME_ID_COMPLETED_AT
      , STATUS
  FROM {{source ('nubank_data', 'transfer_outs')}}