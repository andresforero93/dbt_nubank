{% macro transaction_unions( ) %}
SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 'investment transfer in' as transaction_type
          FROM {{ ref('transfer_ins') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 'investment transfer out' as transaction_type
          FROM {{ ref('transfer_outs') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status 
              , type 
          FROM {{ ref('int_investments_pivoted') }}

        UNION ALL 

        SELECT  id
            , account_id
            , amount
            , time_id_requested_at
            , time_id_completed_at
            , status
            , in_or_out
          FROM {{ ref('pix_movements') }}
{% endmacro %}