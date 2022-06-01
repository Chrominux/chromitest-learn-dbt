SELECT

  SUM(c_acctbal) as sum_acctbal

FROM {{ ref('playing_with_tests') }}

HAVING SUM(c_acctbal) < 100000000