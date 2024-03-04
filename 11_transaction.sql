-- transaction 시작, 진행, 종료 단계 중간에 오류발생하면
-- rollback 으로 시작이전단계로 돌아가고alter
-- 데이터베이스에 반영하기 위해 commit까지 진행해야함
-- mySQL 기본적으로 자동 커밋 설정돼있어 롤백 불가
-- 롤백할거면 자동커밋설정 OFF 필요

-- autocommit 활성화
set autocommit =1; -- true
set autocommit = on;

-- autocommit 비활성화
set autocommit =0;		-- set autocommit=off; 당연히 되겠죠

-- autocommit 비활성화 하면 transaction을 명시적으로 commit 해야만 
-- 변경한 사항이 데이터베이스에 영구적으로 반영됨
-- start transaction 구문 작성 후 
-- dml(intsert,delete,update)등 작업 수행후
-- commit or rollback을 하면 된다.

start transaction;
select*from tbl_menu;

insert into tbl_menu values (null,'바나나해장국',9000,3,'Y');
delete from tbl_menu;

update tbl_menu
set menu_name = '수정메뉴' where menu_code=1;

commit;
rollback;
