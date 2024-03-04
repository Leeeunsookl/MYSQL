-- 내장함수 build in functions
-- MYSQL은 문자열,숫자,날짜,시간에 관한 많은 내장함수 제공

-- concat(문자열1,문자열2,......)
-- concat_ws(구분자, 문자열1, 문자열2,.......)

select concat ('호랑이','기운');
select concat_ws('-','2023','03','04'); -- 문자열 사이에 구분자를 넣어준다는 뜻임
select concat_ws('=','내돈','300만원'); -- 문자열 사이에 구분자를 넣어준다는 뜻임

-- elt : 해당 위치 문자열 반환
-- field : 찾을 문자열 위치 반환
-- find_in_set : 찾을 문자열의 위치 반환
-- instr : 기준 문자열에서 부분 문자열의 시작 위치 반환
-- locate : instr과 동일하고 순서만 반대

select

find_in_set('바나나','사과,딸기,바나나'),
instr('사과딸기바나나','딸기'),
locate('딸기','사과딸기바나나');

-- format(숫자, 소수점 자리수)
-- 1000 단위마다 콤마(,)표시를 해주며 소수점 아래 자릿수까지 반올림 표현
select format(9698415123135.1351531,3);

-- insert(기준문자열, 위치,길이,삽입할 문자열)
select insert ('내 이름은 아무개 입니다.',7,3,'이은숙');

-- left,right
-- left 왼쪽에서 문자열의 길이만큼을 반환 , right는 오른쪽에서
select left('Hello World!',3),right('Hello world!', 3);

-- upper, lower 대문자 소문자 변환
select upper ('Hello World!'), lower('Hello World!');

-- lpad(문자열, 길이, 채울 문자열), rpad(문자열, 길이, 채울 문자열)
-- 문자열을 길이만큼 왼쪽으로 늘린 후에 빈 곳을 문자열로 채운다.
-- 001313-1*******
select lpad('왼쪽',6,'@'), rpad('오른쪽',6,'@'); -- 왼쪽은 두글자, 오른쪽은 세글자니까 @@,@@@

-- ltrim(문자열),rtrim(문자열) 
-- 왼쪽공백제거, 오른쪽공백제거 꺼억~먹는다고 생각하면됨
select ltrim('                           왼쪽');

-- trim(문자열), trim(방향 자를문자열 from 문자열)
-- 방향 : leading(앞),both(양쪽),trailing(뒤) 해당 방향에 대한 지정한 문자열을 제거할 수 있다.
select trim(both '@' from '@기름호랑이@@');

-- replace (문자열, 횟수), replace(문자열,찾을문자열,바꿀문자열),reverse(문자열)

select replace ('마이SQL','마이','MY');

-- substring(문자열, 시작위치, 길이)
-- 시작 위치부터 길이만큼의 문자를 반환 길이생략시 처음부터 끝까지 나옴
select substring('안녕하세요 반갑습니다.',7,2), substring('안녕하세요 반갑습니다.',7);

-- substring_index(문자열, 구분자, 횟수)
select substring_index('sdlfjlsd.test@gmail.com', '.', 2);
-- 구분자 횟수 이후 버림, 음수면 오른쪽에서
select substring_index('sdlfjlsd.test@gmail.com', '.', -2);

-- 수학 관련 함수
-- abs(숫자):절대값 ceiling(숫자):올림 floor(숫자) 버림 round(숫자) 반올림
select round (123456.500), floor(123456.999),ceiling(123456.111);
-- mod(숫자1, 숫자2) or 숫자1 % 숫자2 or 숫자1 mod 숫자2 .. 나머지반환
select mod(100,7), 100 % 7, 100 mod 7;
-- pow(숫자1, 숫자2) : n승 / sqrt(숫자) : 루트
select pow(3,27),sqrt(27);
-- rand() : 0 이상 1미만 실수 
-- m <= 임의의 정수 <n 을 구하고 싶다면
-- floor((rand() * (n-m) + m ))  
select floor((rand() * (7-2) +2 ));

select rand(),floor (rand()*(11-1)+1);

-- sign(숫자)
-- 양수면 1, 0이면 0, 음수면 -1을 반환
select sign(10.1),sign(0),sign(-2.1);

-- truncate(숫자, 정수); 소수점 기준 정수 위치 다음부터 버림
select truncate(12345.1235, 2);
select truncate(12345.1235, -2);   	-- 역방향..왼쪽을 기준으로 되니 12300이 된다.

-- 날짜 및 시간 관련 함수 
-- adddate(날짜,차이) subdate(날짜,차이) 날짜 기준으로 차이를 더하고 뺌
select adddate('20240304',interval 30 day);
select adddate('20240304',interval 6 month);
select adddate('20240304',interval 6032 year);

select subdate('20240304',interval 30 day);
select subdate('20240304',interval 6 month);
select subdate('20240304',interval 1002 year);

-- addtime(날짜/시간, 시간) subtime

select addtime ('2024/03/01 16:50:07','3:00:00');
select subtime ('2024/03/01 16:50:07','3:00:00');

-- curdate :현재연월일 curtime:현재시분초 now or sysdate:현재연월일시분초 
select now(),sysdate();
select curdate(), curtime();

-- year(날짜), month(날짜), day(날짜)
-- 연 월 일 시 분 초 밀리초 까지 다 가능함
select year(curdate()),month(now()),day(sysdate()),microsecond(curtime()),second(now());

-- datediff(날짜1, 날짜2) : 날짜1-날짜2 일수
-- timediff(날짜1 or 시간1, 날짜2 또는 시간2) : 시간1-시간2 결과

select datediff (20240301,20240205),
timediff('13:30:00','00.30.00');

select dayofweek(now()),monthname(now()),dayofyear(now());
-- 일요일이 1임, 오늘의 숫자, 이번달~, 올해 며칠이 지났니

select last_day('20240201');
-- 해당날짜 달에서 마지막~! 윤년이라서 29일까지 정확히 나왔음

select quarter(20240801);
-- 몇쿼터? 분기구해주는것

select time_to_sec('1:1:1');
-- 시간을 초단위로 구하는것임 