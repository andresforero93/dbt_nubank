SELECT  id
      , country
  FROM {{ ref('country') }}