Инициализация базы данных "Sales"

Запуск: `docker-compose up`

Задача:  

Разработать SQL-скрипт, который формирует таблицу со следующим набором атрибутов:

**shop_name** — название магазина,  
**product_name** — название товара,  
**sales_fact** — количество фактических продаж на конец месяца,  
**sales_plan** — количество запланированных продаж на конец месяца,  
**sales_fact/sales_plan** — отношение количества фактических продаже к запланированному,  
**income_fact** — фактический доход,  
**income_plan** — планируемый доход,  
**income_fact/income_plan** — отношение фактического дохода к запланированному.  
```sql
with sales as (
select * from 
(select * from public.shop_dns sd
	union all
 select * from public.shop_mvideo sm
 	union all
 select * from public.shop_sitilink ss 
) as sl)
	select
		date_part('month', date) as month,
		shops.shop_name as shop_name,
		product.product_name,
		sum(sales_cnt) as sales_fact,
		sum(plan_cnt) as sales_plan,
		sum(sales_cnt)/sum(plan_cnt) AS seles_fact_plan,
		sum(sales_cnt) * price AS income_fact,
		sum(plan_cnt) * price AS income_plan,
		(sum(sales_cnt) * price) - (sum(plan_cnt) * price) AS income_fact_plan
	from sales
join shops on sales.shop_id = shops.shop_id
join plan on plan.shop_name = shops.shop_name
join product on product.product_id = sales.product_id
group by month, shops.shop_name, product.product_name, shops.shop_name, product.price
```  

Схема БД: ![Схема БД "Библиотека""](./dwh_schema.jpg)





