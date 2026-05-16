select count (*) from customer_demographics where deceased_indicator ='Y';

create or replace view clean_customer_demographics  as select * from customer_demographics where deceased_indicator !='Y';

select * from clean_customer_demographics; 

select count(*) from transactions where online_order is null ;

select coalesce (online_order, False ) as online_order From transactions;

select distinct order_status from transactions;

create or replace View clean_trasnactions as select * from transactions where order_status='Approved';

select * from clean_trasnactions;

select count(*) from transactions where list_price isnull or standard_cost isnull;

create or replace view clean_transactions as select * from transactions where list_price is not null and standard_cost is not null; 

select count(*) from clean_trasnactions where list_price isnull or standard_cost isnull;


create or replace View clean_trasnactions as select * from transactions where order_status='Approved';

select count(*) from transactions where list_price isnull or standard_cost isnull;

create or replace view clean_trasnactions as select * from transactions where order_status='Approved' and list_price is not null and standard_cost is not null ;
select count(*) from clean_transactions where list_price isnull or standard_cost isnull;



select transaction_id, list_price, standard_cost, ROUND((list_price - standard_cost)::numeric,2) as profit from transactions limit 10;


select customer_id, dob, extract(YEAR from age(current_date, dob)) as age  from customer_demographics limit 6;

select min(tenure),avg(tenure), max(tenure), count(*) filter(where tenure isnull) as null_tenures from customer_demographics; 

create or replace view clean_customer_demographics  as select * from customer_demographics where deceased_indicator !='Y' and tenure is not null;
select min(tenure),avg(tenure), max(tenure), count(*) filter(where tenure isnull) as null_tenures from clean_customer_demographics; 





select  transaction_id, customer_id, transaction_date, coalesce(online_order,false) as online_order,
	order_status,brand, product_line, product_class, product_size , list_price,standard_cost,
	ROUND((list_price - standard_cost)::numeric, 2) AS profit FROM transactions WHERE order_status = 'Approved';





	SELECT t.transaction_id,t.customer_id,t.transaction_date,COALESCE(t.online_order, FALSE) AS online_order,
	t.order_status,t.brand,t.product_line,t.product_class,t.product_size,t.list_price,
	t.standard_cost,ROUND((t.list_price - t.standard_cost)::numeric, 2) AS profit,
    cd.first_name,cd.last_name,cd.gender,cd.past_3_years_bike_related_purchases,cd.DOB,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, cd.DOB)) AS age,cd.job_industry_category,
    cd.wealth_segment,cd.tenure
	from transactions t join clean_customer_demographics cd on t.customer_id= cd.customer_id
	where t.order_status='Approved';


	SELECT t.transaction_id,t.customer_id,t.transaction_date,COALESCE(t.online_order, FALSE) AS online_order,
	t.order_status,t.brand,t.product_line,t.product_class,t.product_size,t.list_price,
	t.standard_cost,ROUND((t.list_price - t.standard_cost)::numeric, 2) AS profit,
    cd.first_name,cd.last_name,cd.gender,cd.past_3_years_bike_related_purchases,cd.DOB,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, cd.DOB)) AS age,cd.job_industry_category,
    cd.wealth_segment,cd.tenure,
	ca.state,ca.country,ca.postcode,ca.property_valuation
	from transactions t join clean_customer_demographics cd on t.customer_id= cd.customer_id
	join customer_address ca on t.customer_id= ca.customer_id
	where t.order_status='Approved';






	Create or replace view kpmg_cleaned_data as SELECT t.transaction_id,t.customer_id,t.transaction_date,COALESCE(t.online_order, FALSE) AS online_order,
	t.order_status,t.brand,t.product_line,t.product_class,t.product_size,t.list_price,
	t.standard_cost,ROUND((t.list_price - t.standard_cost)::numeric, 2) AS profit,
    cd.first_name,cd.last_name,cd.gender,cd.past_3_years_bike_related_purchases,cd.DOB,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, cd.DOB)) AS age,cd.job_industry_category,
    cd.wealth_segment,cd.tenure,
	ca.state,ca.country,ca.postcode,ca.property_valuation
	from transactions t join clean_customer_demographics cd on t.customer_id= cd.customer_id
	join customer_address ca on t.customer_id= ca.customer_id
	where t.order_status='Approved';


	select * from kpmg_cleaned_data limit 5; 