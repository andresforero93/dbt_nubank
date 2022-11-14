SELECT  ACCOUNT_ID AS ID
      , CUSTOMER_ID
      , CREATED_AT
      , STATUS
      , ACCOUNT_BRANCH AS BRANCH
      , ACCOUNT_CHECK_DIGIT AS CHECK_DIGIT
      , ACCOUNT_NUMBER AS NUMBER
  FROM {{source ('nubank_data', 'account')}}