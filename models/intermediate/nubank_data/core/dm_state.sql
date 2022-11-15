SELECT  id
      , state
  FROM {{ ref('state')}}