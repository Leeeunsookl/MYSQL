#나만의 것 주민등록처럼

VARCHAR(30)_30만큼 문자열 공간 확보
페이지 전체 쿼리 실행하려면 CTRL+SFT+ENTER

select
*(전체)
from

where

where 절은 특정 조건에 맞는 레코드만 선택
-- (!= , <>) 부정 연산자이다
orderable_status <> 'Y';

- order by
-- order by 절은 select 문과 함께 사용하며
-- 결과 집합을 특정 열이나 열들의 값에 따라 정렬하는데 사용한다
- - like 연산자
-- tbl_menu 테이블에서 메뉴이름, 가격을 조회하는데
-- 메뉴이름이 '마늘'이라는 단어를 포함하고 있는 녀석들만 조회해줘

menu_name like '%갈치%';
not like 하면 제외됨

category_code in (4,5,6);    -- 역시나 not in 을 이용해 4,5,6 포함하지 않은 값을 찾을수도 있다

ref_category_code is null; (부정문은 is not null)
ref_category_code = null; < 연산자로는 불가!! 문장으로 쓰세요

<distinct 중복값 제거>

select 

*

from tbl_menu

order by category__code;

select 

distinct catergory_code

from tbl_menu

order by category_code;

<null 값 포함 distinct 사용>

select 

*

 from tbl_category_code;

select 

**distinct** ref_category_code

from tbl_category;

다중열 distinct 값 모두 동일하면 중복으로 판별

select 

category_code,

orderable_status

from

tbl_menu;

**select distinct** 

category_code,

orderable_status

from

tbl_menu;

limit → select 결과 반환할 행 수 제한 

select  * from tbl_menu

order by menu_price desc; (내림차순으로 정리)

select * from tbl_menu

order by menu_price desc

limit 5; 

limit [offset, ] row_count

offset: 인덱스로 표시할 시작할 행 번호

row_count: 이후 행부터 반환 받을 행 갯수

select menu_code, menu_name, menu_price

from tbl_menu

order by menu_price desc

limit 1, 4;

join

연관있는 두개이상의 테이블 결합 → 이것들은 다 사용 가능

alias(as).. sql 별칭 

별칭 띄어쓰기나 특수기호 없으면 홀따옴료 or as 생략 가능

selcect menu_code_as ’code’, menu_name_ as ‘name’, menu_price ‘price’

from tbl_menu 

order by price;

테이블 별칭도 가능 

select 

1. category_code,

 a.  menu_name

from

tbl_menu a;

join 종류 

inner join : 교집합 반환/ inner생략 가능 

select 

menu_name, category_name 

from tbl_menu;

on 키워드 join, 연관있는 컬럼(컬럼명 같든 다르든) 조건 작성할 때 씀

select

1. menu_name,
2. category_name

form

tbl_menu a

**join** tbl_category b 

**on** 

a.category_code = b. category_code;

using join 컬럼명 같으면 연관있는 컬럼 조건 작성해서 join시킴

select 

1. menu_name, 

 b .category_menu

from tbl_menu a

**join**

tbl_category_code b **using** (category_code);

left join 첫번째 테이블 모든 레코드, 두번째 테이블의 일치하는 레코드 반환

select

1. **category**_name,
2. menu_name

from **tbl_category a**

left join **tbl_menu b** 

on a. category_code = b. category_code;

(on 은 같든 다르든 관련 있는 거 중에서 테이블 중 일치하는 레코드 반환)

right join 두번째 테이블/ 첫번째 테이블의 일치하는 레코드 반환

sql join 유형 left랑 비교하면 a b이름이 바뀜

select

1. menu_name,
2. category_name

from **tbl_menu a**               

right join 

**tbl_category b** 

on a. category_code = b. category code;

cross join 모든 가능한 조합 반환

select 

1. menu_name,
2. category_name

from tbl_menu a

cross join tbl_category b;

self join.. 같은 테이블 내에서 관계 찾기 (안에서 붙어먹은 놈들)

select 

*

from tbl_category;

select

1. category name,
2. category name

from tbl_category a

**join** tbl_category b on. a.ref_category_code=b.category_code;

select

[a.menu](http://a.menu) name,

[b.menu](http://b.menu) name

from

tbl menu a

join tbl_name b on [a.menu](http://a.menu) code = b. menu_code;
