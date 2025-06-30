{{ config(
    materialized="incremental" , 
    unique_key = 'order_id' , 
    incremental_strategy="merge") }}
    --select * from {{source('db_table','orders_sflk')}}
    with cte1 as 
    (select order_id , order_no , product_name , current_date as LOAD_DT
    from DBT_LEARNING.DBT_LEARNING_SCHEMA.ORDERS_SFLK)
    select * from cte1