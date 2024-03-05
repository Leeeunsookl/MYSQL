-- DDL(Data Definition Language)
-- DDL은  스키마(테이블)를 정의하거나 수정하는데 씀 

-- 1-1 create
-- 테이블 생성을 위한 구문
-- if not exists를 적용하면 기존에 존재하는 테이블이라도 에러가 발생하지 않는다.

-- 테이블의 컬럼 설정 방법
-- 컬럼이름 데이터타입(길이) [not null] [default value] [auto_increment] colum_contraint;
-- primary key(식별자)
-- tb1 예시 테이블 생성하기 

create table if not exists tb1(
pk int primary key,
fk int,
col1 varchar(255),
check(col1 in ('Y','N')) 
) ENGINE=INNODB;

-- ENGINE=INNODB : 테이블을 innodb라고 불리는 스토리지 엔진(프로그램의 저장방식...)으로 
-- 생성하겠다는 의미(mysql에서 가장 많이 쓰임)

describe tb1;

insert into tb1 values(1, 10, 'Y');

select * from tb1;

-- auto_increment
-- insert시 primary 키에 해당하는 컬럼에 자동으로 변호를 발생(중복되지 않게) 시켜 저장할 수 있다.

create table if not exists tb2(
pk int auto_increment primary key,
fk int,
col1 varchar(255),
check(col1 in ('Y','N')) 
) ENGINE=INNODB;

describe tb2;
insert into tb2 values (null,10,'Y');
insert into tb2 values (null,10,'Y');
select*from tb2;

-- alter
-- 테이블에 추가/변경/수정/삭제하는 모든 것은 alter 사용

-- 열 추가, alter table 테이블명 add컬럼명 컬럼을 정의 
-- tb2에 col2 라는 컬럼 추가(int, not null)

-- select는 표가 없을 때 

alter table tb2 
add col2 int not null;

describe tb2;

-- 열 삭제 : alter table 테이블명 drop column 컬럼명
alter table tb2 
drop column col2;

-- 열이름 및 데이터 변경 alter table 테이블명 change column 기존컬럼명 바꿀컬럼명 컬럼정의alter
-- fk -> change fk 컬럼으로 변경 not null 제약조건있음

alter table tb2 
change column fk changefk int not null;

-- 열 제약 조건 추가 및 삭제
-- alter table 테이블명 drop 제약조건 
-- tb2 테이블의 primary key 제약조건 제거 

alter table tb2 drop primary key;

-- auto-increment 가 걸려 있는 컬럼은 primary key 제거가 안된다. 
-- 따라서 modify 명령어로 제거한다. 
alter table tb2 
modify pk int;

describe tb2;
alter table tb2 drop primary key;

alter table tb2 
add primary key (pk);

-- 컬럼 여러개 추가
alter table tb2 
add col3 date not null,
add col4 tinyint not null;
-- date 형이 추가가 안되는 건 MYSQL이 5.7 버전이후로 0으로 채워진 date 컬럼이 존재하면 안되기 때문

select @@glbal.sql_mode;

create table if not exists tb3(
pk int auto_increment primary key,
fk int,
col1 varchar(255),
check(col1 in ('Y','N')) 
) ENGINE=INNODB;

-- drop
-- 테이블을 삭제하기 위한 구문
drop table if exists tb3;
drop table if exists tb1, tb2;

-- truncate : 논리적으론 delete 구문 없는 where과 비슷해보이지만
-- delete는 한 행씩 지워지는 반면 truncate는 drop 이후 바로 테이블 재생성시켜줌.
-- 즉, delete보다 훨씬 효율적으로 테이블을 초기화 시켜줌.

create table if not exists tb1(
pk int auto_increment primary key,
fk int,
col1 varchar(255),
check(col1 in ('Y','N')) 
) ENGINE=INNODB;

insert into tb1 values (null,10,'Y');
insert into tb1 values (null,20,'Y');
insert into tb1 values (null,30,'Y');
insert into tb1 values (null,40,'Y');
insert into tb1 values (null,50,'Y');
insert into tb1 values (null,60,'Y');

describe tb1; -- 테이블의 구조를 보여줘!
select*from tb1; 	-- 테이블에 내용이 다 들어갔는지 보여줘

truncate table tb1;
truncate tb1;		-- table을 생략해도 되지롱

