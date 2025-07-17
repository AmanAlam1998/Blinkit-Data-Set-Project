
create table blinkit (
Item_FAT_Content varchar(100),
Item_Identifier varchar(100),
Item_Type varchar(100),
Outlet_Establishment_Year int,
Outlet_Identifier varchar (50),
Outlet_Location_Type varchar (50),
Outlet_Size char (100),
Outlet_Type varchar(100),
Item_Visibility numeric (10,2),
Item_Weight numeric (10,2),
Sales numeric(10,2),
Rating numeric (10,2)
);

drop table if exists blinkit;
select * from blinkit;

update blinkit
set item_fat_content=
case
when item_fat_content in ('LF','low fat') then 'Low Fat'
when item_fat_content ='reg' then 'Regular'
else item_fat_content
end;

select count (*) from blinkit;
select * from blinkit;

select distinct(item_fat_content) from blinkit;

select cast(sum(sales)/1000000 as decimal (10,2)) as Total_Sales_Million from blinkit ;

select cast(avg(sales) as decimal (10,2)) as average_sales from blinkit;

select * from blinkit;

select count(*) as Total_items_Sold from blinkit;

select cast(sum(sales) as decimal (10,2)) as total_sales from blinkit
where item_fat_content='Low Fat' and outlet_establishment_year=2012;
select * from blinkit;
select cast(avg(rating)as decimal (10,2)) as Avg_Rating from blinkit;

select item_fat_content, outlet_establishment_year,
cast(sum(sales)as decimal (10,2)) as total_sales, 
cast(avg(sales) as decimal(10,2)) as Avg_Sales,
cast(avg(rating) as decimal(10,2)) as Avg_rating,
count(*) as Total_items_sold
from blinkit
where outlet_establishment_year=2022
group by item_fat_content,outlet_establishment_year
order by item_fat_content asc;

select * from blinkit;

select item_type, cast(sum(sales) as decimal (10,2)) as totl_sales,
cast(avg(sales) as decimal(10,2)) as Avg_sales,
count(*) as total_items_sold,
cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit
group by item_type;

select * from blinkit;

select outlet_type,item_fat_content,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast(avg(sales)as decimal(10,2)) as avg_sales,
cast(avg(rating)as decimal(10,2)) as avg_rating,
count(*) as total_items_sold
from blinkit
group by outlet_type,item_fat_content;

select * from blinkit;

select outlet_type,outlet_establishment_year,
cast(sum(sales) as decimal(10,2)) as total_sales
from blinkit
group by outlet_type,outlet_establishment_year;

SELECT 
    outlet_location_type,
    COALESCE(SUM(CASE WHEN item_fat_content = 'Low Fat' THEN sales END), 0) AS low_fat,
    COALESCE(SUM(CASE WHEN item_fat_content = 'Regular' THEN sales END), 0) AS regular
FROM 
    blinkit
GROUP BY 
    outlet_location_type
ORDER BY 
    outlet_location_type;


select * from blinkit;

select distinct(item_type) from blinkit;
select distinct(outlet_size) from blinkit;


select outlet_size,
coalesce(sum(case when item_fat_content='Low Fat' then sales end),0) as Low_Fat,
coalesce(sum(case when item_fat_content='Regular' then sales end),0) as Regular
from
blinkit
group by outlet_size
order by outlet_size;

select * from blinkit;

select outlet_size,
coalesce(Avg(case when item_fat_content='Low Fat' then sales end),0) as Low_Fat,
coalesce(avg(case when item_fat_content='Regular' then sales end),0) as Regular
from blinkit
group by outlet_size
order by outlet_size;

select outlet_establishment_year,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast(avg(sales) as decimal(10,2)) as avg_sales,
cast(avg(rating)as decimal(10,2)) as avg_rating
from blinkit
group by outlet_establishment_year
order by outlet_establishment_year asc;


select outlet_size,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast((sum(sales)*100/sum(sum(sales)) over())as decimal(10,2))as Sales_Percentage
from blinkit
group by outlet_size
order by total_sales desc;

select outlet_size,sum(sales) as total_sales
from blinkit
group by outlet_size
order by total_sales desc;

select * from blinkit;

select outlet_location_type,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast((sum(sales)*100/sum(sum(sales)) over()) as decimal(10,2))as sales_percentage,
cast(avg(sales) as decimal(10,2)) as avg_sales,
cast(avg(rating)as decimal(10,2))as avg_rating,
count(*) as total_items_sold
from blinkit
where outlet_establishment_year=2018
group by outlet_location_type
order by outlet_location_type asc;


select outlet_type, sum(sales) as total_sales,
avg(sales) as avg_sales, avg(rating) as avg_rating,
count(*) as total_items_sold,
cast((sum(sales)*100/sum(sum(sales)) over ())as decimal(10,2))as sales_percentage
from blinkit
group by outlet_type
order by total_sales desc;






