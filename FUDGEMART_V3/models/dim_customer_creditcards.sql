with customer_credit_card_source as (
    select
        cc.customer_id,
        cc.creditcard_id,
        c.creditcard_number,
        try_to_date(c.creditcard_exp_date, 'YYYY-MM-DD') as creditcard_exp_date -- Ensure proper date conversion
    from raw.fudgemart_v3.fm_customer_creditcards cc
    inner join raw.fudgemart_v3.fm_creditcards c
        on cc.creditcard_id = c.creditcard_id
    where try_to_date(c.creditcard_exp_date, 'YYYY-MM-DD') is not null -- Filter invalid dates
)
select * from customer_credit_card_source
