{{ config (
    materialized="table",
    required_tests=None
)}}

{{ dbt_utils.date_spine(
    datepart= "day",
    start_date="dateadd(week, 1, '01/01/2016')",
    end_date="dateadd(week, 1, current_date)"
    )
}}