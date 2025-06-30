{{ config(
    materialized="incremental" , 
    unique_key = 'order_id' , 
    incremental_strategy="delete+insert") }}
    select * from {{source('db_table','orders_sflk')}}