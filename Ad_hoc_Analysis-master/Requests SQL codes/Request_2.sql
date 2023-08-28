Select X.A as unique_products_2020, Y.B as unique_products_2021 , round((B-A)*100/A,2) AS percentage_chg from
(
    (select count(distinct (product_code)) as A from fact_sales_monthly
    where fiscal_year = 2020) X,
    (select count(distinct (product_code)) as B from fact_sales_monthly
    where fiscal_year = 2021) Y
)