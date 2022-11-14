SELECT  DISTINCT transaction_type_id
      , CASE WHEN transaction_type_id = 1 then 'transfer in'
             WHEN transaction_type_id = 2 then 'transfer out'
             WHEN transaction_type_id = 3 then 'investment transfer in'
             WHEN transaction_type_id = 4 then 'investment transfer out'
             WHEN transaction_type_id = 5 then 'pix in'
             WHEN transaction_type_id = 6 then 'pix out'
              END AS transaction_name
 FROM {{ ref('fct_transactions') }}
ORDER BY 1 