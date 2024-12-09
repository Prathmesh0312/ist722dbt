 select
        row_number() over (order by customer_id) as customerkey, -- Generate a surrogate key
        customer_id as customerid,  -- Business / source key
        customer_firstname as firstname,
        customer_lastname as lastname,
        customer_email as email,
        customer_address as address,
        customer_city as city,
        customer_state as state,
        customer_zip as zip,
        customer_phone as phone
    from
        RAW.FUDGEMART_V3.FM_CUSTOMERS

