WITH unions AS 
     (  
       {{ transaction_unions()}} --macro to avoid repeat SQL script
     )
     
 SELECT  u.id
      , u.account_id
      , ts.id as status_id
      , tt.id as transaction_type_id
      , tf.id as transaction_flow_id
      , tr.timestamp AS requested_at
      , tc.timestamp AS completed_at
      , u.amount
  FROM unions AS u
  LEFT JOIN {{ ref('d_time') }} AS tr ON u.time_id_requested_at = tr.id
  LEFT JOIN {{ ref('d_time') }}  AS tc ON u.time_id_completed_at = tc.id
  LEFT JOIN {{ ref('dm_transaction_types') }} AS tt on tt.type = u.type
  LEFT JOIN {{ ref('dm_transaction_flows')}} as tf on tf.flow = u.flow
  LEFT JOIN {{ ref('dm_transaction_status') }} AS ts on ts.status = u.status


