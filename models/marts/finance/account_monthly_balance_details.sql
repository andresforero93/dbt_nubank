
SELECT  *
       , round(total_transfer_in - total_transfer_out,2) as account_monthly_balance
  FROM (
        SELECT  date_trunc('month', t.completed_at::date) AS month
                , c.id
                , SUM( CASE WHEN t.transaction_flow_id = 1 THEN t.amount ELSE 0 END) AS total_transfer_in
                , SUM( CASE WHEN t.transaction_flow_id = 2 THEN t.amount ELSE 0 END) AS total_transfer_out
          FROM {{ ref('fct_transactions') }} AS t
          LEFT JOIN {{ ref('fct_accounts') }} AS a ON a.id = t.account_id
          LEFT JOIN {{ ref('customer') }} AS c ON c.id = a.customer_id
         WHERE t.status_id = 1
         GROUP BY 1, 2
       )
 ORDER BY 2, 1