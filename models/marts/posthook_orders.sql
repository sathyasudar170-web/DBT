{{
    config(
        materialized='table',
        post_hook=[
            "INSERT INTO DB.RAW_SCHEMA.MODEL_LOG
             (MODEL_NAME, STATUS, RUN_AT)
             VALUES ('m1', 'COMPLETED', CURRENT_TIMESTAMP)"
        ]
    )
}}

SELECT *
FROM {{ source('raw', 'orders') }}