-- selecting country id intead of country name and deleting city id
SELECT  cu.id
      , cu.first_name
      , cu.last_name
      , co.id AS country_id
      , cu.cpf
  FROM {{ ref('customer')}} as cu
  LEFT JOIN {{ ref('country')}} as co on co.country = cu.country