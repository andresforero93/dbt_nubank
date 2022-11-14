WITH status AS (
                 SELECT distinct status
                  FROM {{ ref('account') }}
               )

SELECT  status
       , DENSE_RANK() OVER(order by status ) as status_id  
 FROM status
ORDER BY 2