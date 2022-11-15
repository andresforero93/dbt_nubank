WITH status AS (
                 SELECT distinct status
                  FROM {{ ref('account') }}
               )

SELECT DENSE_RANK() OVER(order by status ) as id
       , status  
 FROM status
ORDER BY 2