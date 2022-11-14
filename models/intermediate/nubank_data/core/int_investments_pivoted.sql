-- transform json format to .sql and renaming columns

select value:transaction_id::number as id
     , json:account_id::number as account_id
     , value:status::text as status
     , value:amount::float as amount
     , value:investment_requested_at::number as time_id_requested_at
     , try_to_numeric(TRANSLATE(value:investment_completed_at,'"','')) as time_id_completed_at
     , value:investment_completed_at_timestamp::timestamp as completed_at_timestamp
     , value:type::text as type
  from {{ ref('investments') }}
     , lateral flatten( input => json:transactions ) -- split json into rows by transactions key