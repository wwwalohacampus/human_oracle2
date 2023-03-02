
-- 데이터 조회 명령어 - SELECT
-- SELECT 컬럼명, ...
-- FROM 테이블명
-- WHERE 조건;


-- 02 
SELECT USER_ID, USERNAME
FROM ALL_USERS
WHERE USERNAME = 'HR';

-- HR(인사관리 정보) 샘플 데이터를 가져와서 실습
-- HR 계정이 없는 경우, HR계정 생성

-- HR 계정 생성하기
-- 11g 버전 이하는 어떤 이름으로도 계정생성 가능
-- 12c 버전 이상에서는 'c##' 접두어를 붙여서 생성하도록 규칙을 정함

-- 계정 생성하기
-- c## 없이 계정 생성
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CREATE USER 계정명 IDENTIFIED BY 비밀번호;
CREATE USER HR IDENTIFIED BY 123456;
-- 계정이 사용할 수 있는 용량 설정 (무한대)
ALTER USER HR QUOTA UNLIMITED ON users;
-- 계정에 권한 부여 
GRANT connect, resource TO HR;

-- 계정 삭제
DROP USER HR CASCADE;

-- HR 게정이 잠겨 있는 경우,
-- HR 게정 잠금 해제
ALTER USER HR ACCOUNT UNLOCK;


-- hr_main.sql 실행하여 HR 샘플 데이터 가져오기
-- 1. SQL PLUS 
-- 2. HR 계정으로 접속
-- 3. 명령어 입력 : @[경로]\hr_main.sql
--    @? : 오라클 설치된 기본 경로
--    @?/demo/schema/human_resources/hr_main.sql
--> 1  : 123456 [비빌번호]
--> 2  : users [tablespace]  
--> 3  : temp [temp tablespace]
--> 4  : [log 경로] - C:\KHM\SETUP\WINDOWS.X64_193000_db_home\demo\schema\log






-- 3.
-- 테이블 EMPLOYEES 의 테이블 구조를 조회하는 SQL 문을 작성하시오.
-- 테이블 : 행과 열로 데이터를 관리하는 기본 구조
-- 행 = row = 레코드    :  각 속성에 대한 하나의 데이터를 의미
-- 열 = column = 속성   :  데이터의 이름(특성)을 정의
DESC employees;


-- 3.
-- 테이블 EMPLOYEES 에서 EMPLOYEE_ID, FIRST_NAME (회원번호, 이름) 를 
-- 조회하는 SQL 문을 작성하시오.
SELECT employee_id, first_name
FROM employees;


-- 04
-- AS (alias) : 출력되는 컬럼명에 별명을 짓는 명령어
SELECT employee_id AS "사원 번호"   -- 띄어쓰기가 있으면, " 로 표기
      ,first_name AS 이름
      ,last_name AS 성
      ,email AS 이메일
      ,phone_number AS 전화번호
      ,hire_date AS 입사일자
      ,salary AS 급여
FROM employees;


-- 5.
-- 테이블 EMPLOYEES 의 JOB_ID를 중복된 데이터를 제거하고 
-- 조회하는 SQL 문을 작성하시오.

SELECT DISTINCT job_id
FROM employees;

-- 6. 
-- 테이블 EMPLOYEES 의 SALARY(급여)가 6000을 초과하는 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.

SELECT *
FROM employees
WHERE salary > 6000;


-- 7. 
-- 테이블 EMPLOYEES 의 SALARY(급여)가 10000인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.

SELECT *
FROM employees
WHERE salary = 10000;


-- 8.
-- 테이블 EMPLOYEES 의 모든 속성들을 
-- SALARY 를 기준으로 내림차순 정렬하고, 
-- FIRST_NAME 을 기준으로 오름차순 정렬하여 조회하는 SQL 문을 작성하시오.

-- 정렬 명령어
-- ORDER BY 컬럼명 [ASC/DESC];
-- * ASC  : 오름차순
-- * DESC : 내림차순
-- * (생략) : 오름차순이 기본값
SELECT *
FROM employees
ORDER BY salary DESC, first_name ASC;

-- 9.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
-- 조건 연산 
-- OR 연산 : ~또는, ~이거나
-- WHERE A OR B;
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' OR job_id = 'IT_PROG';



-- 10.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
-- 단, IN 키워드를 사용하시오.
SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG');


-- 11.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘FI_ACCOUNT’ 이거나 ‘IT_PROG’ 아닌
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
-- 단, IN 키워드를 사용하시오.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG');



-- 12.
-- 테이블 EMPLOYEES 의 JOB_ID가 ‘IT_PROG’ 이면서 SALARY 가 6000 이상인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.
SELECT *
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 6000;


-- 13.
-- 테이블 EMPLOYEES 의 FIRST_NAME 이 ‘S’로 시작하는 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오.  
-- LIKE
-- : 대체 문자를 통해서 형식에 맞는 문자열 데이터를 조회
-- - 대체 문자
-- * % : 여러 글자 대체
-- * _ : 한 글자 대체

SELECT * FROM employees WHERE first_name LIKE 'S%';

-- 14. 테이블 EMPLOYEES 의 FIRST_NAME 이 ‘s’로 끝나는 사원 조회
SELECT * FROM employees WHERE first_name LIKE '%s';

-- 15. 테이블 EMPLOYEES 의 FIRST_NAME 에 ‘s’가 포함되는 사원 조회
SELECT * FROM employees WHERE first_name LIKE '%s%';

-- 16. 
-- 테이블 EMPLOYEES 의 FIRST_NAME 이 5글자인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오. 
SELECT * FROM employees WHERE first_name LIKE '_____';

-- LENGTH(컬럼명) : 글자 수를 반환하는 함수
SELECT * FROM employees WHERE LENGTH(first_name) = 5;


SELECT * FROM employees;


-- 17.
-- 테이블 EMPLOYEES 의 COMMISSION_PCT가 NULL 인 
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오. 
SELECT * 
FROM employees
WHERE commission_pct IS NULL;


-- 18.
-- 테이블 EMPLOYEES 의 COMMISSION_PCT가 NULL 이 아닌
-- 사원의 모든 컬럼을 조회하는 SQL 문을 작성하시오. 
SELECT * 
FROM employees
WHERE commission_pct IS NOT NULL;

-- 19.
-- 테이블 EMPLOYEES 의 사원의 HIRE_DATE가 04년 이상인
-- 모든 컬럼을 조회하는 SQL 문을 작성하시오. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01';


-- 20.
-- 테이블 EMPLOYEES 의 사원의 HIRE_DATE가 04년도부터 05년도인 
-- 모든 컬럼을 조회하는 SQL 문을 작성하시오. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01'
  AND hire_date <= '05/12/31';
  
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '05/12/31';




-- 21.
-- 12.45, -12.45 보다 크거나 같은 정수 중 제일 작은 수를 
-- 계산하는 SQL 문을 각각 작성하시오.
-- * dual ?
-- : 산술 연산, 함수 결과 등을 확인해볼 수 있는 임시 테이블
-- CEIL()  "천정"
-- : 지정한 값보다 크거나 같은 정수 중 제일 작은 수를 반환하는 함수
SELECT CEIL(12.45) FROM dual;
SELECT CEIL(-12.45) FROM dual;
SELECT CEIL(12.45), CEIL(-12.45) FROM dual;


-- 22.
-- 12.55와 -12.55 보다 작거나 같은 정수 중 가장 큰 수를 
-- 계산하는 SQL 문을 각각 작성하시오.
-- FLOOR() "바닥"
-- : 지정한 값보다 작거나 같은 정수 중 가장 큰 수를 반환하는 함수
SELECT FLOOR(12.55) FROM dual;
SELECT FLOOR(-12.55) FROM dual;
SELECT FLOOR(12.55), FLOOR(-12.55) FROM dual;


-- 23
-- ROUND(값, 자리수)
-- : 지정한 값을, 해당 자리수에서 반올림하는 함수
-- a a a a a.bbbbb
--  ...-2 -1.01234

-- 0.54 를 소수점 아래 첫째 자리에서 반올림하시오
SELECT ROUND(0.54, 0) FROM dual;

-- 0.54 를 소수점 아래 둘째 자리에서 반올림하시오
SELECT ROUND(0.54, 1) FROM dual;

-- 125.67 을 일의 자리에서 반올림하시오
SELECT ROUND(125.67, -1) FROM dual;

-- 125.67 을 십의 자리에서 반올림하시오
SELECT ROUND(125.67, -2) FROM dual;


-- 24.
-- 각 소문제에 제시된 두 수를 이용하여 나머지를 구하는 SQL문을 작성하시오.
-- MOD( A, B )
-- : A 를 B 로 나눈 나머지를 구하는 함수

-- 3을 8로 나눈 나머지
SELECT MOD( 3, 8 ) FROM dual;

-- 30을 4로 나눈 나머지
SELECT MOD( 30, 4 ) FROM dual;

-- 25. 제곱수 구하기
-- POWER( A, B)
-- : A 의 B 제곱을 구하는 함수
-- 2의 10 제곱을 구하시오
SELECT POWER(2,10) FROM dual;

-- 2의 31 제곱을 구하시오
SELECT POWER(2, 31) FROM dual;


-- 26. 제곱근 구하기
-- SQRT( A )
-- : A의 제곱근을 구하는 함수
--   A는 양의 정수와 실수만 사용 가능
-- 2의 제곱근을 구하시오.
SELECT SQRT(2) FROM dual;

-- 100의 제곱근을 구하시오.
SELECT SQRT(100) FROM dual;

-- 27.
-- 소수점을 절삭하기
-- TRUNC( A, B )
-- : 값 A 를 자리수 B 에서 절삭하는 함수

-- 527425.1234 소수점 아래 첫째 자리에서 절삭
SELECT TRUNC(527425.1234, 0) FROM dual;

-- 527425.1234 소수점 아래 둘째 자리에서 절삭
SELECT TRUNC(527425.1234, 1) FROM dual;

-- 527425.1234 일의 자리에서 절삭
SELECT TRUNC(527425.1234, -1) FROM dual;

-- 527425.1234 십의 자리에서 절삭
SELECT TRUNC(527425.1234, -2) FROM dual;


-- 28.
-- 절댓값 구하기
-- ABS( A )
-- 값 A 의 절댓값을 구하여 반환하는 함수

-- -20 의 절댓값 구하기
SELECT ABS(-20) FROM dual;

-- -12.456 의 절댓값 구하기
SELECT ABS(-12.456) FROM dual;


-- 29.
-- 문자열 대소문자 변환함수
SELECT 'AlOhA WoRlD~!' AS 원문
      ,UPPER('AlOhA WoRlD~!') AS 대문자
      ,LOWER('AlOhA WoRlD~!') AS 소문자
      ,INITCAP('AlOhA WoRlD~!') AS "첫글자만 대문자"
FROM dual;

-- 30.
-- 글자 수와 바이트수를 구하는 함수
-- 영문, 숫자, 빈칸 : 1byte
-- 한글            : 3byte
SELECT LENGTH('ALOHA WORLD') AS "글자 수"
      ,LENGTHB('ALOHA WORLD') AS "바이트 수"
FROM dual;

SELECT LENGTH('알로하 월드') AS "글자 수"
      ,LENGTHB('알로하 월드') AS "바이트 수"
FROM dual;

-- 31.
-- 두 문자열을 연결하기
SELECT CONCAT('ALOHA', 'WORLD') AS "함수"
      ,'ALOHA' || 'WORLD' AS "기호"
FROM dual;


-- 32.
-- 문자열 부분 출력함수
-- SUBSTR( 문자열, 시작번호, 글자수 )
-- 'www.alohacampus.com'
SELECT SUBSTR('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTR('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTR('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTRB('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTRB('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

-- 'www.알로하캠퍼스.com'
-- SUBSTR, SUBSTRB 함수로 각각 . 구분기호로 나누어서 출력해보세요
SELECT SUBSTR('www.알로하캠퍼스.com', 1, 3) AS "1"
      ,SUBSTR('www.알로하캠퍼스.com', 5, 6) AS "2"
      ,SUBSTR('www.알로하캠퍼스.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.알로하캠퍼스.com', 1, 3) AS "1"
      ,SUBSTRB('www.알로하캠퍼스.com', 5, 18) AS "2"
      ,SUBSTRB('www.알로하캠퍼스.com', -3, 3) AS "3"
FROM dual;


-- 33.
-- 문자열에서 특정 문자의 위치를 구하는 함수
-- INSTR( 문자열, 찾을 문자, 시작 번호, 순서 )
-- ex) 'ALOHACAMPUS'
-- 해당 문자열에서 첫글자 부터 찾아서, 2번째 A 의 위치를 구하시오.
-- INSTR('ALOHACAMPUS', 'A', 1, 2 )

SELECT INSTR('ALOHACAMPUS', 'A', 1, 1) AS "1번째 A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 2) AS "2번째 A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 3) AS "3번째 A"
FROM dual;

-- 34. 문자열을 왼쪽/오른쪽에 출력하고 빈공간을 특정 문자로 함수
-- LPAD( 문자열, 칸의 수, 채울 문자 ) 
-- : 문자열에 지정한 칸을 확보하고, 왼쪽에 특정 문자로 채움

-- RPAD( 문자열, 칸의 수, 채울 문자 ) 
-- : 문자열에 지정한 칸을 확보하고, 오른쪽에 특정 문자로 채움

SELECT LPAD('ALOHACAMPUS', 20, '#') AS "왼쪽"
      ,RPAD('ALOHACAMPUS', 20, '#') AS "오른쪽"
FROM dual;

-- 35.
-- HIRE_DATE 입사일자를 날짜형식을 지정하여 출력하시오.
-- TO_CHAR( 데이터, '날짜/숫자 형식' )
-- : 특정 데이터를 문자열 형식으로 변환하는 함수

SELECT first_name AS 이름
      ,TO_CHAR(hire_date, 'YYYY-MM-DD (dy) HH:MI:SS') AS 입사일자
FROM employees;

-- 36.
-- SALARY 급여를 통화형식을 지정하여 출력하시오.
SELECT first_name AS 이름
      ,TO_CHAR(salary, '$999,999,999.00') AS 급여
FROM employees;

-- 37. 
-- TO_DATE( 데이터 )
-- 문자형 데이터를 날짜형 데이터로 변환하는 함수
SELECT 20230228 AS 문자
      ,TO_DATE(20230228) AS 날짜
FROM employees;


-- 38.
-- TO_NUMBER( 데이터 )
-- 문자형 데이터를 숫자형 데이터로 변환하는 함수
SELECT '1,200,000' AS 문자
      ,TO_NUMBER('1,200,000', '999,999,999') AS 숫자
FROM dual;


-- 39.
-- 어제, 오늘, 내일 날짜를 출력하시오.
-- sysdate : 현재 날짜/시간 정보를 가지고 있는 키워드
-- 2023/03/02 - YYYY/MM/DD 형식으로 출력
-- 날짜 데이터 --> 문자 데이터 변환
SELECT sysdate FROM dual;

SELECT TO_CHAR( sysdate-1, 'YYYY/MM/DD' ) AS 어제
      ,TO_CHAR( sysdate, 'YYYY/MM/DD' ) AS 오늘
      ,TO_CHAR( sysdate+1, 'YYYY/MM/DD' ) AS 내일
FROM dual;

-- 40.
-- 사원의 근무달수와 근속연수를 구하시오.
-- MONTHS_BETWEEN( A, B )
-- - 날짜 A부터 B 까지 개월 수 차이를 반환하는 함수
--   (단, A > B 즉, A가 더 최근 날짜로 지정해야 양수로 반환)
SELECT first_name 이름
      ,TO_CHAR(hire_date, 'YYYY.MM.DD') 입사일자
      ,TO_CHAR(sysdate, 'YYYY.MM.DD') 오늘
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) || '개월' 근무달수
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12) || '년' 근속연수      
FROM employees;

-- 41.
-- 오늘로부터 6개월 후의 날짜를 구하시오.
-- ADD_MONTHS( 날짜, 개월 수 )
-- : 지정한 날짜로부터 해당 개월 수를 후의 날짜를 반환하는 함수
SELECT sysdate 오늘
      ,ADD_MONTHS(sysdate, 6) "6개월후"
FROM dual;


-- 42.
-- 오늘 이후 돌아오는 토요일을 구하시오
-- NEXT_DAY( 날짜, 요일 )
-- : 지정한 날짜 이후 돌아오는 요일을 반환하는 함수
-- 일 월 화 수 목 금 토
-- 1  2  3  4 5  6  7
SELECT sysdate 오늘
      ,NEXT_DAY( sysdate, 7 ) "다음 토요일"
FROM dual;

SELECT '2023/02/27' "DB 1일차"
      ,NEXT_DAY( sysdate, 1 ) "다음 일요일"
      ,NEXT_DAY( sysdate, 2 ) "다음 월요일"
      ,NEXT_DAY( sysdate, 3 ) "다음 화요일"
      ,NEXT_DAY( sysdate, 4 ) "다음 수요일"
      ,NEXT_DAY( sysdate, 5 ) "다음 목요일"
      ,NEXT_DAY( sysdate, 6 ) "다음 금요일"
      ,NEXT_DAY( sysdate, 7 ) "다음 토요일"
FROM dual;

-- 43.
-- 오늘 날짜와 해당 월의 월초, 월말 일자를 구하시오.
-- LAST_DAY( 날짜 )
-- : 지정 한 날짜와 동일한 월의 월말 일자를 반환하는 함수
-- 날짜 : XXXXXX.YYYYYYY
-- 1970년01월01일 00시00분00초00ms → 2023년3월02일 .....
-- 지난 일자를 정수로 계산, 시간정보는 소수부분으로 계산
-- xxxxx.yyyyy --> 2023년3월20일
-- 월 단위 아래로 절삭하면, 월초를 구할 수 있다
SELECT TRUNC( sysdate, 'MM' ) 월초
      ,sysdate 오늘
      ,LAST_DAY( sysdate ) 월말
FROM dual;


SELECT TRUNC( TO_DATE('23/04/20'), 'MM' ) 월초
      ,TO_DATE('23/04/20') 오늘
      ,LAST_DAY( TO_DATE('23/04/20') ) 월말
FROM dual;

-- 44.
-- 테이블 EMPLOYEES 의 COMMISSION_PCT 를 중복없이 검색하되, 
-- NULL 이면 0으로 조회하고 내림차순으로 정렬하는 SQL 문을 작성하시오.

-- NVL( 값, 대체할 값 ) : 해당 값이 NULL 이면 지정된 값으로 변환하는 함수
SELECT DISTINCT NVL(commission_pct, 0) "커미션(%)"
FROM employees
ORDER BY NVL(commission_pct, 0) DESC
;

SELECT DISTINCT NVL(commission_pct, 0) "커미션(%)"
FROM employees
ORDER BY "커미션(%)" DESC
;

-- 조회한 컬럼의 별칭으로 ORDER BY 절에서 사용할 수 있다


-- 45.
-- EMPLOYEES 의 FIRST_NAME, SALARY, COMMISSION_PCT 속성을 이용하여 
-- 급여, 커미션, 최종급여를 조회하시오.
-- * 최종급여 = 급여 + (급여 * 커미션)
-- * NVL2( 값, NULL이 아닐 때 값, NULL일 때 값 )
SELECT first_name 이름
      ,salary 급여
      ,NVL(commission_pct, 0) 커미션
      ,NVL2(commission_pct, salary+(salary*commission_pct), salary) 최종급여
FROM employees
ORDER BY 최종급여 DESC
;


-- 46.
-- DEPARTMENTS 테이블을 참조하여, 사원의 이름과 부서명을 출력하시오.
-- DECODE( 컬럼명, 조건값1, 반환값1, 조건값2, 반환값2, ... )
-- : 지정한 컬럼의 값이 조건값에 일치하면 바로 뒤의 반환값을 출력하는 함수
SELECT first_name   이름
      ,DECODE( department_id, 10, 'Administration',
                              20, 'Marketing',
                              30, 'Purchasing',
                              40, 'Human Resources',
                              50, 'Shipping',
                              60, 'IT',
                              70, 'Public Relations',
                              80, 'Sales',
                              90, 'Executive',
                              100, 'Finance'
       ) 부서
FROM employees;


-- 47.
-- CASE 문
-- : 조건식을 만족할 때, 출력할 값을 지정하는 구문
/* 
    CASE
         WHEN 조건식1 THEN 반환값1
         WHEN 조건식2 THEN 반환값2
         WHEN 조건식3 THEN 반환값3
         ...
    END
*/
-- 한 줄 복사 : ctrl + shift + D
SELECT first_name 이름
      ,CASE WHEN department_id = 10 THEN 'Administration'
            WHEN department_id = 20 THEN 'Marketing'
            WHEN department_id = 30 THEN 'Purchasing'
            WHEN department_id = 40 THEN 'Human Resources'
            WHEN department_id = 50 THEN 'Shipping'
            WHEN department_id = 60 THEN 'IT'
            WHEN department_id = 70 THEN 'Public Relations'
            WHEN department_id = 80 THEN 'Sales'
            WHEN department_id = 90 THEN 'Marketing'
            WHEN department_id = 100 THEN 'Finance'
        END 부서
FROM employees;


-- 48.
-- EMPLOYEES 테이블로 부터 전체 사원 수를 구하시오.
-- count( 컬럼명 )
-- : 컬럼을 지정하여 null 을 제외한 데이터 개수를 반환하는 함수
-- * null 이 없는 데이터라면 어떤 컬럼을 지정하더라도 개수가 같으므로,
--   COUNT(*) 로 개수를 구한다.
SELECT COUNT(*) 사원수
FROM employees;

-- 49. 
-- 사원들의 최고급여와 최저급여를 구하시오.
SELECT MAX(salary) 최고급여
      ,MIN(salary) 최저급여
FROM employees;

-- 50. 
-- 사원들의 급여 합계와 평균을 구하시오.
SELECT SUM(salary) 급여합계
      ,ROUND( AVG(salary), 2 ) 급여평균
FROM employees;


-- 51. 
-- 사원들의 급여 표준편차와 분산을 구하시오.
SELECT ROUND( STDDEV(salary), 2 ) 급여표준편자
      ,ROUND( VARIANCE(salary), 2 ) 급여분산
FROM employees;


-- 52.
-- MS_STUDENT 테이블을 생성하시오.
-- * 테이블 생성
/*
    CREATE TABLE 테이블명 (
        컬럼명1  타입   [NOT NULL/NULL] [제약조건],
        컬럼명2  타입   [NOT NULL/NULL] [제약조건],
        컬럼명3  타입   [NOT NULL/NULL] [제약조건],
        ...
    );
*/
-- * 테이블 삭제
/*
    DROP TABLE 테이블명;
*/
DROP TABLE MS_STUDENT;

CREATE TABLE MS_STUDENT 
(
      ST_NO NUMBER NOT NULL 
    , NAME VARCHAR2(20) NOT NULL 
    , CTZ_NO CHAR(14) NOT NULL 
    , EMAIL VARCHAR2(100) NOT NULL 
    , ADDRESS VARCHAR2(1000) 
    , DEPT_NO NUMBER NOT NULL 
    , MJ_NO NUMBER NOT NULL 
    , REG_DATE DATE DEFAULT sysdate NOT NULL 
    , UPD_DATE DATE DEFAULT sysdate NOT NULL 
    , ETC VARCHAR2() DEFAULT '없음' 
    , CONSTRAINT MS_STUDENT_PK PRIMARY KEY 
  (
    ST_NO 
  )
  ENABLE 
);

ALTER TABLE MS_STUDENTADD CONSTRAINT MS_STUDENT_UK1 UNIQUE 
(
  EMAIL 
)
ENABLE;

COMMENT ON TABLE MS_STUDENT IS '학생들의 정보를 관리한다.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '학생 번호';
COMMENT ON COLUMN MS_STUDENT.NAME IS '이름';
COMMENT ON COLUMN MS_STUDENT.CTZ_NO IS '주민번호';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '주소';
COMMENT ON COLUMN MS_STUDENT.DEPT_NO IS '부서번호';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '전공번호';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '등록일자';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '수정일자';

-- 53
-- MS_STUDENT 테이블에 성별, 재적, 입학일자, 졸업일자 속성을 추가하시오.

-- 테이블에 속성 추가
-- ALTER TABLE 테이블명 ADD 컬럼명 타입 DEFAULT 기본값 [NOT NULL];
ALTER TABLE MS_STUDENT ADD GENDER CHAR(6) DEFAULT '기타' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.GENDER IS '성별';

ALTER TABLE MS_STUDENT ADD STATUS VARCHAR2(10) DEFAULT '대기' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.STATUS IS '재적';

ALTER TABLE MS_STUDENT ADD ADM_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '입학일자';

ALTER TABLE MS_STUDENT ADD GRD_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '졸업일자';

-- 테이블 속성 삭제
ALTER TABLE MS_STUDENT DROP COLUMN GENDER;
ALTER TABLE MS_STUDENT DROP COLUMN STATUS;
ALTER TABLE MS_STUDENT DROP COLUMN ADM_DATE;
ALTER TABLE MS_STUDENT DROP COLUMN GRD_DATE;

-- 54
-- MS_STUDENT 테이블의 CTZ_NO 속성을 BIRTH 로 이름을 변경하고
-- 데이터 타입을 DATE 로 수정하시오.
-- 그리고, 설명도 '생년월일' 로 변경하시오.
ALTER TABLE MS_STUDENT RENAME COLUMN CTZ_NO TO BIRTH;
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '생년월일';

-- 속성 변경 - 타입 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
-- 속성 변경 - NULL 여부 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH NULL;
-- 속성 변경 - DEFAULT 변경
ALTER TABLE MS_STUDENT MODIFY BIRTH DEFAULT sysdate;

-- 동시에 적용 가능
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE DEFAULT sysdate NOT NULL;



-- 55.
-- MS_STUDENT 테이블의 학부 번호(DEPT_NO) 속성을 삭제하시오.
ALTER TABLE MS_STUDENT DROP COLUMN DEPT_NO;



-- 56.
-- MS_STUDENT 테이블을 삭제하시오.
DROP TABLE MS_STUDENT;

-- 57.
CREATE TABLE MS_STUDENT 
(
      ST_NO NUMBER NOT NULL 
    , NAME VARCHAR2(20) NOT NULL 
    , BIRTH DATE NOT NULL 
    , EMAIL VARCHAR2(100) NOT NULL 
    , ADDRESS VARCHAR2(1000) 
    , MJ_NO VARCHAR2(10) NOT NULL 
    , GENDER CHAR(6) DEFAULT '기타' NOT NULL
    , STATUS VARCHAR2(10) DEFAULT '대기' NOT NULL
    , ADM_DATE DATE NULL
    , GRD_DATE DATE NULL
    , REG_DATE DATE DEFAULT sysdate NOT NULL 
    , UPD_DATE DATE DEFAULT sysdate NOT NULL 
    , ETC VARCHAR2(1000) DEFAULT '없음' 
    , CONSTRAINT MS_STUDENT_PK PRIMARY KEY 
  (
    ST_NO 
  )
  ENABLE 
);

ALTER TABLE MS_STUDENT ADD CONSTRAINT MS_STUDENT_UK1 UNIQUE 
(
  EMAIL 
)
ENABLE;

COMMENT ON TABLE MS_STUDENT IS '학생들의 정보를 관리한다.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '학생 번호';
COMMENT ON COLUMN MS_STUDENT.NAME IS '이름';
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '생년월일';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '이메일';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '주소';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '전공번호';
COMMENT ON COLUMN MS_STUDENT.GENDER IS '성별';
COMMENT ON COLUMN MS_STUDENT.STATUS IS '재적';
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '입학일자';
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '졸업일자';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '등록일자';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '수정일자';
COMMENT ON COLUMN MS_STUDENT.ETC IS '특이사항';



-- 58
-- MS_STUDENT 테이블에 데이터를 추가하시오.
-- * 데이터 추가
/*
    ▶ 기본문법
    INSERT INTO [테이블명] ( 컬럼1, 컬럼2, ... )
    VALUES ( '값1', '값2', ... );
    * 컬럼 작성 순서와, 값 작성 순서가 짝을 이루어야한다.
    

    ▶ 컬럼명 생략
    INSERT INTO 테이블
    VALUES ( 값1, 값2, 값3, ... )
    * 컬럼명을 생략하고 작성하면, 컬럼 저의 순서대로 모든 값을 지정해야한다.


    ▶ 데이터를 조회하여 추가하기
     INSERT INTO 테이블 ( 컬럼1, 컬럼2, 컬럼3, ... )
     SELECT 컬럼1, 컬럼2, 컬럼3, ...
     FROM 테이블
     [WHERE] 조건 ;
    
*/

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,MJ_NO,GENDER,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20180001', '최서아', '991005', 'csa@univ.ac.kr', '서울', '여', 'I01', '재학', '2018/03/01', NULL, sysdate, sysdate, NULL );

SELECT * FROM ms_student;

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20210001', '박서준', '020504', 'psj@univ.ac.kr', '서울', '남', 'B02', '재학', '2021/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20210002', '김아윤', '020504', 'kay@univ.ac.kr', '인천', '여', 'S01', '재학', '2021/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20160001', '정수안', '970210', 'jsa@univ.ac.kr', '경남', '여', 'J02', '재학', '2016/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20150010', '윤도현', '960311', 'ydh@univ.ac.kr', '제주', '남', 'K01', '재학', '2015/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20130007', '안아람', '941124', 'aar@univ.ac.kr', '경기', '여', 'Y01', '재학', '2013/03/01', NULL, sysdate, sysdate, '영상예술 특기자' );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20110002', '한성호', '921007', 'hsh@univ.ac.kr', '서울', '기타', 'E03', '재학', '2015/03/01', NULL, sysdate, sysdate, NULL );

COMMIT;

SELECT * FROM MS_STUDENT;


-- 59.
-- MS_STUDENT 테이블의 데이터를 수정하시오.
-- UPDATE
/*
    UPDATE 테이블명
       SET 컬럼1 = 변경할 값,
           컬럼2 = 변경할 값,
           ...
   [WHERE] 조건;
*/
-- 1) 학생번호가 20160001 인 학생의 주소를 '서울'로,
--    재적 상태를 '휴학'으로 수정하시오.
UPDATE MS_STUDENT
   SET address = '서울'
      ,status = '휴학'
 WHERE st_no = 20160001;

-- 2) 학생번호가 20150010 인 학생의 주소를 '서울'로,
--    재석 상태를 '졸업' 으로, 졸업일자는 '20200220', 수정일자는 현재날짜로
--    그리고 특이사항을 '수석'으로 수정하시오.
UPDATE MS_STUDENT
   SET address = '서울', status = '졸업', grd_date = '2020/02/02',
       upd_date = sysdate, etc = '수석'
WHERE st_no = 20150010;

-- 3)  학생번호가 20130007 인 재적 상태를 '졸업'으로,
--    졸업일자는 '20200220', 수정일자는 현재날짜로 수정하시오.
UPDATE MS_STUDENT
   SET status = '졸업', grd_date = '2020/02/02', upd_date = sysdate
WHERE st_no = 20130007;

-- 4)  학생번호가 20110002 인 재적 상태를 '퇴학'으로,
--    졸업일자는 '20130210', 수정일자는 현재날짜로 
--    그리고 특이사항을 '자진 퇴학' 으로 수정하시오.
UPDATE MS_STUDENT
   SET status = '퇴학', grd_date = '2020/02/02', upd_date = sysdate
      ,etc = '자진 퇴학'
WHERE st_no = 20110002;

SELECT * FROM ms_student;



-- 60.
-- MS_STUDENT 테이블에서 학번이 20110002 인 학생을 삭제하시오.
DELETE FROM MS_STUDENT WHERE ST_NO = 20110002;
















-- 덤프
imp userid=hr/123456 file='경로\hr.dmp' fromuser=hr touser=hr
exp userid=hr/123456 file='C:\KHM\SQL\hr.dmp' log='C:\KHM\SQL\hr.log'








