{{ config(
    materialized = 'view'
) }}

WITH actions_events AS (

    SELECT
        *
    FROM
        {{ ref('silver__actions_events') }}
)
SELECT
    action_id,
    txn_hash,
    block_timestamp,
    action_index,
    action_name,
    action_data,
    _ingested_at AS ingested_at
FROM
    actions_events
