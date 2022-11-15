WITH unions AS 
     (  
       {{ transaction_unions()}} --macro to avoid repeat SQL script
     )
        
SELECT  distinct  DENSE_RANK() OVER(order by status) as id  
      , status
  FROM unions
 ORDER BY 2