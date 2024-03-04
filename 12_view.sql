-- view

-- cte: 쿼리 내부(1개의 쿼리문)에서 with~ as절 사용한 "임시"의 가상테이블
-- select 쿼리문 저장한 객체로 가상테이블이라고 부름
-- 실질적인 데이터를 물리적x 쿼리로만 저장했지만
-- 테이블 사용하는 것과 동일하게 사용할 수 있음

-- view는 데이터를 쉽게 읽고 이해하는 동시에 보안유지도 됨

select * from tbl_menu;

-- view 생성
create view hansik as 
select menu_code,menu_name,menu_price,category_code,orderable_status
from tbl_menu
where category_code=4;

select*from hansik;

-- view라는 가상의 테이블은 베이스테이블 (tbl_menu)의 정보가 변경되면 
-- view의 결과도 같이 변경된다.

insert into tbl_menu values (null,'식혜맛국밥',5500,4,'N');

insert into hansik values (null, '수정과국밥',6000,4,'Y');

update hansik set menu_name='버터맛국밥',menu_price=5500
where menu_code=23;

-- view로 dml 명령어 조작이 안되는 경우
-- 1. 뷰 정의에 포함되지 않은 컬럼을 조작하는 경우
-- 2. 뷰에 포함되지 않은 컬럼 중 베이스 테이블 컬럼이 not null 제약조건 지정된 경우
-- 3. 산술표현식이 정의된 경우
-- 4. join을 이용해 여러 테이블을 연결한 경우
-- 5. distict를 포함한 경우
-- 6. 그룹함수(avg, sum 등등)나 group by절을 포함한 경우

-- view삭제
drop view hansik;
