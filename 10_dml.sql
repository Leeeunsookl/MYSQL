use menudb;

-- DML DATA MANIPULATION LANGUAGE
-- 데이터 조작 테이블 값 삽입 수정 삭제 

-- insert
-- 행 추가 데이터

-- 값 잘 들어갔는지 확인할 용도
select * from tbl_menu; 

insert into tbl_menu values(null, '바나나해장국', 8500, 4, 'Y');

-- 테이블 정보 확인 (직접 써? 자동인거야?) 
describe tbl_menu;
-- auto increment 자동 증분 됨 / 안넣어도 알아서 번호 달린다는 것
-- null 허용한 컬럼: (nullable) / auto increment 

insert into tbl_menu(menu_name, menu_price, category_code, orderable_status)
values('초콜릿죽',6500,7,'Y'); 
 

-- multi insert 
insert into
tbl_menu
values 
(null,'참치맛아이스크림', 1700,12,'Y'),
(null,'멸치맛아이스크림', 1700,12,'Y'),
(null,'소시지맛커피', 2500,8,'Y');

select * from tbl_menu;

-- update
-- 테이블에 기록된 컬럼의 값을 수정하는 구문
-- 테이블의 전체 행 갯수는 변화가 없다.
select menu_code,category_code
from tbl_menu
where menu_name= '민트초코';

update tbl_menu
set 
category_code=7
where menu_code=7;

update tbl_menu
set
category_code=7,
menu_name='민트초코'
where menu_code=7;

-- delete 삭제, 행 줄음

-- 삭제 확인용
select * from tbl_menu;

delete from tbl_menu
where menu_code=24 and menu_code=25 and menu_code=26;

-- limit 활용한 delete
select*from tbl_menu;

delete from tbl_menu
order by menu_price
limit 3;

-- 테이블 행 전체 삭제
delete from tbl_menu;

select*from tbl_menu;

-- replace : 특정 조건 만족하는 값으로 대체
-- update : 이미 존재하면 갱신, 아니면 새로 삽입 (삭제하고 넣는거)

select*from tbl_menu;

insert into tbl_menu values(1,'열무김치아메키라노',5000,8,'Y');
-- insert 쓰면 primary key , unique key 충돌이 발생

replace tbl_menu values(1,'열무김치아메키라노',5000,8,'Y');
-- into 생략 가능함

replace tbl_menu set menu_code=2, menu_name='우럭쥬스'
,menu_price=2000,category_code=9,orderable_status='N';

update tbl_menu set menu_price = 7000 where menu_code=1; 

update tbl_menu set menu_code=2 , menu_name='열무민트초코'
,menu_price=8000,category_code=9,orderable_status='Y';

