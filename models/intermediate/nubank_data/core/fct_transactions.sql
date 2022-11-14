WITH unions AS 
     (  SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 1 AS transaction_type_id
          FROM {{ ref('transfer_ins') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 2 AS transaction_type_id
          FROM {{ ref('transfer_outs') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status 
              , CASE WHEN type = 'investment_transfer_in' THEN 3
                    WHEN type = 'investment_transfer_out' THEN 4
                END AS transaction_type_id
          FROM {{ ref('int_investments_pivoted') }}

        UNION ALL 

        SELECT  id
            , account_id
            , amount
            , time_id_requested_at
            , time_id_completed_at
            , status
            , CASE WHEN in_or_out = 'pix_in' THEN 5
                    WHEN in_or_out = 'pix_out' THEN 6
                END AS transaction_type_id   
          FROM {{ ref('pix_movements') }}
     )
     
 SELECT  u.id
      , u.account_id
      , u.amount
      , tr.timestamp AS requested_at
      , tc.timestamp AS completed_at
      , u.status
      , u.transaction_type_id
  FROM unions AS u
  LEFT JOIN {{ ref('d_time') }} AS tr ON u.time_id_requested_at = tr.id
  LEFT JOIN {{ ref('d_time') }}  AS tc ON u.time_id_completed_at = tc.id