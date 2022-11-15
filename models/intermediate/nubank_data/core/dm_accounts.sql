SELECT  a.id
      , customer_id
      , da.id AS status_id
      , created_at
      , branch
      , check_digit 
      , number
  FROM {{ ref('account') }} as a
  LEFT JOIN {{ ref('dm_account_status') }} as da on da.status = a.status 