{% macro transaction_unions( ) %}
SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 'transfer' as type
              , 'in' as flow
          FROM {{ ref('transfer_ins') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status
              , 'transfer' as type
              , 'out' as flow
          FROM {{ ref('transfer_outs') }}

        UNION ALL

        SELECT  id
              , account_id
              , amount
              , time_id_requested_at
              , time_id_completed_at
              , status 
              , CASE WHEN type like '%investment_transfer%' then 'investment_transfer'
                      END as type
              , CASE WHEN type = 'investment_transfer_in' then 'in'
                     WHEN type = 'investment_transfer_out' then  'out'
                      END as flow
          FROM {{ ref('int_investments_pivoted') }}

        UNION ALL 

        SELECT  id
            , account_id
            , amount
            , time_id_requested_at
            , time_id_completed_at
            , status
            , CASE WHEN in_or_out like '%pix%' then 'pix'
                    END as type
            , CASE WHEN in_or_out = 'pix_in' then 'in'
                   WHEN in_or_out = 'pix_out' then  'out'
                    END as flow
          FROM {{ ref('pix_movements') }}
{% endmacro %}