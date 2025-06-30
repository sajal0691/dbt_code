{{ config(
    materialized="incremental" , 
    unique_key = 'order_id' , 
    incremental_strategy="merge") }}
    select * from {{source('db_table','orders_sflk')}}