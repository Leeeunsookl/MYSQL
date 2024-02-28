-- order by 절을 사용하여 사용자 지정 목록을 사용하여 데이터 정렬
-- 맨 왼쪽 값이 2번째 인자 이후의 값과 일치하면 해당 위치 값을 반환
select field('a','a','b','c');

select
field(orderable_status,'N','Y')
from tbl_menu;

-- tbl_menu 테이블에서 메뉴이름, 판매상태를 조회하는데 판매 상태가 N 인 친구들이 위로 오게
select
menu_name
, orderable_status
from tbl_menu
order by
field(orderable_status,'N','Y');
-- null 값이 있는 정렬에 대한 정렬

select
*
from tbl_category;

-- 오름차순 시 null 값이 처음으로(default)
select category_code,
category_name,
ref_category_code
from tbl_category
order by
ref_category_code desc;
-- 오름 차순시 null 값을 마지막으로 ( is null asc)
select
category_code
,category_name
,ref_category_code
from tbl_category
order by
ref_category_code is null asc;