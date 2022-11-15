SELECT id
     , city 
  FROM {{ ref('city') }}