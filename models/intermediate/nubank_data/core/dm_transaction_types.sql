WITH unions AS 
     (  
       {{ transaction_unions()}} --macro to avoid repeat SQL script
     )
        
SELECT  distinct  DENSE_RANK() OVER(order by transaction_type) as transaction_type_id
      , transaction_type  
  FROM unions
 ORDER BY 2
