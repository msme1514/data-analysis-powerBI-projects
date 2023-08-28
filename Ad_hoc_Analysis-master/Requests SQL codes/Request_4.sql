WITH CTE1 AS (
    SELECT DP.segment AS A, COUNT(DISTINCT (FSM.product_code)) AS B
        FROM fact_sales_monthly FSM JOIN dim_product dp
            on FSM.product_code = dp.product_code
                GROUP BY  FSM.fiscal_year , DP.segment
                    HAVING FSM.fiscal_year = '2020'),
CTE2 AS (
    SELECT DP.segment AS C, COUNT(DISTINCT (FSM.product_code)) AS D
        FROM fact_sales_monthly FSM
            JOIN dim_product dp on FSM.product_code = dp.product_code
                GROUP BY  FSM.fiscal_year , DP.segment
                    HAVING FSM.fiscal_year = '2021')

SELECT CTE1.A AS SEGMENT , CTE1.B AS product_count_2020, CTE2.D AS product_count_2021, (CTE2.D - CTE1.B) AS difference
FROM CTE1, CTE2
WHERE  CTE1.A = CTE2.C


