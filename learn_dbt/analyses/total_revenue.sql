with
    stg_payments_data as(
        SELECT * FROM {{ ref('stg_payments') }}
    ),
    total_S_payments as (
        SELECT 
            'Successful payments' as Total,
            sum(amount) as amount
        FROM stg_payments_data WHERE STATUS LIKE 'success'
        group by 1
    )
SELECT * FROM total_S_payments