SELECT  ACCOUNT_ID AS ID
      , CUSTOMER_ID
      , CREATED_AT
      , STATUS
      , ACCOUNT_BRANCH
      , ACCOUNT_CHECK_DIGIT
      , ACCOUNT_NUMBER
  FROM {{source ('nubank_data', 'account')}}