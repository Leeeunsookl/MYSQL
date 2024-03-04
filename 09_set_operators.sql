-- 09_set_operators
-- 두개 이상의 select 문 결과집합에서
-- union < 두개 이상 쿼리 합함 중복된 값 뻄

-- 1
select
*
from
tbl_menu
where
category_code=10
union
select
*
from
tbl_menu
where menu_price<9000;

-- union all 
-- 두 개 이상의 select 문의 결과를 결합해 중복된 레코드 제거 x 다 반환

select
*
from
tbl_menu
where
category_code=10
union all
select
*
from
tbl_menu
where menu_price<9000;

-- intersect
-- 두 select 문의 결과 중 공통되는 레코드만 반환하는 sql 연산자이다.
-- mysql은 intersect 제공안하는데 inner join 또는 in 연산자 활용해서 구현하는 것 가능 

-- inner join

-- 1 
select
menu_code,menu_name,menu_price,category_code,orderable_status
from
tbl_menu;
-- 2
select 
menu_code,menu_name,menu_price,category_code,orderable_status
from
tbl_menu
where 
menu_price < 9000;

-- 결과
select
a.menu_code, a.menu_name, a.menu_price, a.category_code, a.orderable_status
from
tbl_menu a
inner join
(select 
menu_code, menu_name, menu_price, category_code, orderable_status
from
tbl_menu 
where 
menu_price < 9000) b
on (a.menu_code = b.menucode)