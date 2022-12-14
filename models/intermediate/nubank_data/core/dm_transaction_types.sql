WITH unions AS 
     (  
       {{ transaction_unions()}} --macro to avoid repeat SQL script
     )
        
SELECT  distinct  DENSE_RANK() OVER(order by type) as id
      , type 
  FROM unions
 ORDER BY 2
