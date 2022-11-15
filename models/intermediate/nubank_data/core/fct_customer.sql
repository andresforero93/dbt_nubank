-- selecting country id intead of country name and deleting city id
SELECT  cu.id
      , cu.first_name
      , cu.last_name
      , cu.cpf
      , co.id AS country_id
      , s.id as state_id
      , ci.id as city_id      
  FROM {{ ref('customer')}} AS cu
  LEFT JOIN {{ ref('city') }} AS ci on ci.id = cu.city_id
  LEFT JOIN {{ ref('state') }} AS s ON s.id = ci.state_id
  LEFT JOIN {{ ref('country')}} AS co ON co.id = s.country_id
  
  