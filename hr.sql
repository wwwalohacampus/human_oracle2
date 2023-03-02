
-- ������ ��ȸ ��ɾ� - SELECT
-- SELECT �÷���, ...
-- FROM ���̺��
-- WHERE ����;


-- 02 
SELECT USER_ID, USERNAME
FROM ALL_USERS
WHERE USERNAME = 'HR';

-- HR(�λ���� ����) ���� �����͸� �����ͼ� �ǽ�
-- HR ������ ���� ���, HR���� ����

-- HR ���� �����ϱ�
-- 11g ���� ���ϴ� � �̸����ε� �������� ����
-- 12c ���� �̻󿡼��� 'c##' ���ξ �ٿ��� �����ϵ��� ��Ģ�� ����

-- ���� �����ϱ�
-- c## ���� ���� ����
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CREATE USER ������ IDENTIFIED BY ��й�ȣ;
CREATE USER HR IDENTIFIED BY 123456;
-- ������ ����� �� �ִ� �뷮 ���� (���Ѵ�)
ALTER USER HR QUOTA UNLIMITED ON users;
-- ������ ���� �ο� 
GRANT connect, resource TO HR;

-- ���� ����
DROP USER HR CASCADE;

-- HR ������ ��� �ִ� ���,
-- HR ���� ��� ����
ALTER USER HR ACCOUNT UNLOCK;


-- hr_main.sql �����Ͽ� HR ���� ������ ��������
-- 1. SQL PLUS 
-- 2. HR �������� ����
-- 3. ��ɾ� �Է� : @[���]\hr_main.sql
--    @? : ����Ŭ ��ġ�� �⺻ ���
--    @?/demo/schema/human_resources/hr_main.sql
--> 1  : 123456 [�����ȣ]
--> 2  : users [tablespace]  
--> 3  : temp [temp tablespace]
--> 4  : [log ���] - C:\KHM\SETUP\WINDOWS.X64_193000_db_home\demo\schema\log






-- 3.
-- ���̺� EMPLOYEES �� ���̺� ������ ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ���̺� : ��� ���� �����͸� �����ϴ� �⺻ ����
-- �� = row = ���ڵ�    :  �� �Ӽ��� ���� �ϳ��� �����͸� �ǹ�
-- �� = column = �Ӽ�   :  �������� �̸�(Ư��)�� ����
DESC employees;


-- 3.
-- ���̺� EMPLOYEES ���� EMPLOYEE_ID, FIRST_NAME (ȸ����ȣ, �̸�) �� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT employee_id, first_name
FROM employees;


-- 04
-- AS (alias) : ��µǴ� �÷��� ������ ���� ��ɾ�
SELECT employee_id AS "��� ��ȣ"   -- ���Ⱑ ������, " �� ǥ��
      ,first_name AS �̸�
      ,last_name AS ��
      ,email AS �̸���
      ,phone_number AS ��ȭ��ȣ
      ,hire_date AS �Ի�����
      ,salary AS �޿�
FROM employees;


-- 5.
-- ���̺� EMPLOYEES �� JOB_ID�� �ߺ��� �����͸� �����ϰ� 
-- ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT DISTINCT job_id
FROM employees;

-- 6. 
-- ���̺� EMPLOYEES �� SALARY(�޿�)�� 6000�� �ʰ��ϴ� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT *
FROM employees
WHERE salary > 6000;


-- 7. 
-- ���̺� EMPLOYEES �� SALARY(�޿�)�� 10000�� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.

SELECT *
FROM employees
WHERE salary = 10000;


-- 8.
-- ���̺� EMPLOYEES �� ��� �Ӽ����� 
-- SALARY �� �������� �������� �����ϰ�, 
-- FIRST_NAME �� �������� �������� �����Ͽ� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.

-- ���� ��ɾ�
-- ORDER BY �÷��� [ASC/DESC];
-- * ASC  : ��������
-- * DESC : ��������
-- * (����) : ���������� �⺻��
SELECT *
FROM employees
ORDER BY salary DESC, first_name ASC;

-- 9.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ���� ���� 
-- OR ���� : ~�Ǵ�, ~�̰ų�
-- WHERE A OR B;
SELECT *
FROM employees
WHERE job_id = 'FI_ACCOUNT' OR job_id = 'IT_PROG';



-- 10.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, IN Ű���带 ����Ͻÿ�.
SELECT *
FROM employees
WHERE job_id IN ('FI_ACCOUNT', 'IT_PROG');


-- 11.
-- ���̺� EMPLOYEES �� JOB_ID�� ��FI_ACCOUNT�� �̰ų� ��IT_PROG�� �ƴ�
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
-- ��, IN Ű���带 ����Ͻÿ�.
SELECT *
FROM employees
WHERE job_id NOT IN ('FI_ACCOUNT', 'IT_PROG');



-- 12.
-- ���̺� EMPLOYEES �� JOB_ID�� ��IT_PROG�� �̸鼭 SALARY �� 6000 �̻��� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT *
FROM employees
WHERE job_id = 'IT_PROG' AND salary >= 6000;


-- 13.
-- ���̺� EMPLOYEES �� FIRST_NAME �� ��S���� �����ϴ� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�.  
-- LIKE
-- : ��ü ���ڸ� ���ؼ� ���Ŀ� �´� ���ڿ� �����͸� ��ȸ
-- - ��ü ����
-- * % : ���� ���� ��ü
-- * _ : �� ���� ��ü

SELECT * FROM employees WHERE first_name LIKE 'S%';

-- 14. ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ������ ��� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%s';

-- 15. ���̺� EMPLOYEES �� FIRST_NAME �� ��s���� ���ԵǴ� ��� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%s%';

-- 16. 
-- ���̺� EMPLOYEES �� FIRST_NAME �� 5������ 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT * FROM employees WHERE first_name LIKE '_____';

-- LENGTH(�÷���) : ���� ���� ��ȯ�ϴ� �Լ�
SELECT * FROM employees WHERE LENGTH(first_name) = 5;


SELECT * FROM employees;


-- 17.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� 
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT * 
FROM employees
WHERE commission_pct IS NULL;


-- 18.
-- ���̺� EMPLOYEES �� COMMISSION_PCT�� NULL �� �ƴ�
-- ����� ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT * 
FROM employees
WHERE commission_pct IS NOT NULL;

-- 19.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�� �̻���
-- ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01';


-- 20.
-- ���̺� EMPLOYEES �� ����� HIRE_DATE�� 04�⵵���� 05�⵵�� 
-- ��� �÷��� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
SELECT *
FROM employees
WHERE hire_date >= '04/01/01'
  AND hire_date <= '05/12/31';
  
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '05/12/31';




-- 21.
-- 12.45, -12.45 ���� ũ�ų� ���� ���� �� ���� ���� ���� 
-- ����ϴ� SQL ���� ���� �ۼ��Ͻÿ�.
-- * dual ?
-- : ��� ����, �Լ� ��� ���� Ȯ���غ� �� �ִ� �ӽ� ���̺�
-- CEIL()  "õ��"
-- : ������ ������ ũ�ų� ���� ���� �� ���� ���� ���� ��ȯ�ϴ� �Լ�
SELECT CEIL(12.45) FROM dual;
SELECT CEIL(-12.45) FROM dual;
SELECT CEIL(12.45), CEIL(-12.45) FROM dual;


-- 22.
-- 12.55�� -12.55 ���� �۰ų� ���� ���� �� ���� ū ���� 
-- ����ϴ� SQL ���� ���� �ۼ��Ͻÿ�.
-- FLOOR() "�ٴ�"
-- : ������ ������ �۰ų� ���� ���� �� ���� ū ���� ��ȯ�ϴ� �Լ�
SELECT FLOOR(12.55) FROM dual;
SELECT FLOOR(-12.55) FROM dual;
SELECT FLOOR(12.55), FLOOR(-12.55) FROM dual;


-- 23
-- ROUND(��, �ڸ���)
-- : ������ ����, �ش� �ڸ������� �ݿø��ϴ� �Լ�
-- a a a a a.bbbbb
--  ...-2 -1.01234

-- 0.54 �� �Ҽ��� �Ʒ� ù° �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(0.54, 0) FROM dual;

-- 0.54 �� �Ҽ��� �Ʒ� ��° �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(0.54, 1) FROM dual;

-- 125.67 �� ���� �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(125.67, -1) FROM dual;

-- 125.67 �� ���� �ڸ����� �ݿø��Ͻÿ�
SELECT ROUND(125.67, -2) FROM dual;


-- 24.
-- �� �ҹ����� ���õ� �� ���� �̿��Ͽ� �������� ���ϴ� SQL���� �ۼ��Ͻÿ�.
-- MOD( A, B )
-- : A �� B �� ���� �������� ���ϴ� �Լ�

-- 3�� 8�� ���� ������
SELECT MOD( 3, 8 ) FROM dual;

-- 30�� 4�� ���� ������
SELECT MOD( 30, 4 ) FROM dual;

-- 25. ������ ���ϱ�
-- POWER( A, B)
-- : A �� B ������ ���ϴ� �Լ�
-- 2�� 10 ������ ���Ͻÿ�
SELECT POWER(2,10) FROM dual;

-- 2�� 31 ������ ���Ͻÿ�
SELECT POWER(2, 31) FROM dual;


-- 26. ������ ���ϱ�
-- SQRT( A )
-- : A�� �������� ���ϴ� �Լ�
--   A�� ���� ������ �Ǽ��� ��� ����
-- 2�� �������� ���Ͻÿ�.
SELECT SQRT(2) FROM dual;

-- 100�� �������� ���Ͻÿ�.
SELECT SQRT(100) FROM dual;

-- 27.
-- �Ҽ����� �����ϱ�
-- TRUNC( A, B )
-- : �� A �� �ڸ��� B ���� �����ϴ� �Լ�

-- 527425.1234 �Ҽ��� �Ʒ� ù° �ڸ����� ����
SELECT TRUNC(527425.1234, 0) FROM dual;

-- 527425.1234 �Ҽ��� �Ʒ� ��° �ڸ����� ����
SELECT TRUNC(527425.1234, 1) FROM dual;

-- 527425.1234 ���� �ڸ����� ����
SELECT TRUNC(527425.1234, -1) FROM dual;

-- 527425.1234 ���� �ڸ����� ����
SELECT TRUNC(527425.1234, -2) FROM dual;


-- 28.
-- ���� ���ϱ�
-- ABS( A )
-- �� A �� ������ ���Ͽ� ��ȯ�ϴ� �Լ�

-- -20 �� ���� ���ϱ�
SELECT ABS(-20) FROM dual;

-- -12.456 �� ���� ���ϱ�
SELECT ABS(-12.456) FROM dual;


-- 29.
-- ���ڿ� ��ҹ��� ��ȯ�Լ�
SELECT 'AlOhA WoRlD~!' AS ����
      ,UPPER('AlOhA WoRlD~!') AS �빮��
      ,LOWER('AlOhA WoRlD~!') AS �ҹ���
      ,INITCAP('AlOhA WoRlD~!') AS "ù���ڸ� �빮��"
FROM dual;

-- 30.
-- ���� ���� ����Ʈ���� ���ϴ� �Լ�
-- ����, ����, ��ĭ : 1byte
-- �ѱ�            : 3byte
SELECT LENGTH('ALOHA WORLD') AS "���� ��"
      ,LENGTHB('ALOHA WORLD') AS "����Ʈ ��"
FROM dual;

SELECT LENGTH('�˷��� ����') AS "���� ��"
      ,LENGTHB('�˷��� ����') AS "����Ʈ ��"
FROM dual;

-- 31.
-- �� ���ڿ��� �����ϱ�
SELECT CONCAT('ALOHA', 'WORLD') AS "�Լ�"
      ,'ALOHA' || 'WORLD' AS "��ȣ"
FROM dual;


-- 32.
-- ���ڿ� �κ� ����Լ�
-- SUBSTR( ���ڿ�, ���۹�ȣ, ���ڼ� )
-- 'www.alohacampus.com'
SELECT SUBSTR('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTR('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTR('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.alohacampus.com', 1, 3) AS "1"
      ,SUBSTRB('www.alohacampus.com', 5, 11) AS "2"
      ,SUBSTRB('www.alohacampus.com', -3, 3) AS "3"
FROM dual;

-- 'www.�˷���ķ�۽�.com'
-- SUBSTR, SUBSTRB �Լ��� ���� . ���б�ȣ�� ����� ����غ�����
SELECT SUBSTR('www.�˷���ķ�۽�.com', 1, 3) AS "1"
      ,SUBSTR('www.�˷���ķ�۽�.com', 5, 6) AS "2"
      ,SUBSTR('www.�˷���ķ�۽�.com', -3, 3) AS "3"
FROM dual;

SELECT SUBSTRB('www.�˷���ķ�۽�.com', 1, 3) AS "1"
      ,SUBSTRB('www.�˷���ķ�۽�.com', 5, 18) AS "2"
      ,SUBSTRB('www.�˷���ķ�۽�.com', -3, 3) AS "3"
FROM dual;


-- 33.
-- ���ڿ����� Ư�� ������ ��ġ�� ���ϴ� �Լ�
-- INSTR( ���ڿ�, ã�� ����, ���� ��ȣ, ���� )
-- ex) 'ALOHACAMPUS'
-- �ش� ���ڿ����� ù���� ���� ã�Ƽ�, 2��° A �� ��ġ�� ���Ͻÿ�.
-- INSTR('ALOHACAMPUS', 'A', 1, 2 )

SELECT INSTR('ALOHACAMPUS', 'A', 1, 1) AS "1��° A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 2) AS "2��° A"
      ,INSTR('ALOHACAMPUS', 'A', 1, 3) AS "3��° A"
FROM dual;

-- 34. ���ڿ��� ����/�����ʿ� ����ϰ� ������� Ư�� ���ڷ� �Լ�
-- LPAD( ���ڿ�, ĭ�� ��, ä�� ���� ) 
-- : ���ڿ��� ������ ĭ�� Ȯ���ϰ�, ���ʿ� Ư�� ���ڷ� ä��

-- RPAD( ���ڿ�, ĭ�� ��, ä�� ���� ) 
-- : ���ڿ��� ������ ĭ�� Ȯ���ϰ�, �����ʿ� Ư�� ���ڷ� ä��

SELECT LPAD('ALOHACAMPUS', 20, '#') AS "����"
      ,RPAD('ALOHACAMPUS', 20, '#') AS "������"
FROM dual;

-- 35.
-- HIRE_DATE �Ի����ڸ� ��¥������ �����Ͽ� ����Ͻÿ�.
-- TO_CHAR( ������, '��¥/���� ����' )
-- : Ư�� �����͸� ���ڿ� �������� ��ȯ�ϴ� �Լ�

SELECT first_name AS �̸�
      ,TO_CHAR(hire_date, 'YYYY-MM-DD (dy) HH:MI:SS') AS �Ի�����
FROM employees;

-- 36.
-- SALARY �޿��� ��ȭ������ �����Ͽ� ����Ͻÿ�.
SELECT first_name AS �̸�
      ,TO_CHAR(salary, '$999,999,999.00') AS �޿�
FROM employees;

-- 37. 
-- TO_DATE( ������ )
-- ������ �����͸� ��¥�� �����ͷ� ��ȯ�ϴ� �Լ�
SELECT 20230228 AS ����
      ,TO_DATE(20230228) AS ��¥
FROM employees;


-- 38.
-- TO_NUMBER( ������ )
-- ������ �����͸� ������ �����ͷ� ��ȯ�ϴ� �Լ�
SELECT '1,200,000' AS ����
      ,TO_NUMBER('1,200,000', '999,999,999') AS ����
FROM dual;


-- 39.
-- ����, ����, ���� ��¥�� ����Ͻÿ�.
-- sysdate : ���� ��¥/�ð� ������ ������ �ִ� Ű����
-- 2023/03/02 - YYYY/MM/DD �������� ���
-- ��¥ ������ --> ���� ������ ��ȯ
SELECT sysdate FROM dual;

SELECT TO_CHAR( sysdate-1, 'YYYY/MM/DD' ) AS ����
      ,TO_CHAR( sysdate, 'YYYY/MM/DD' ) AS ����
      ,TO_CHAR( sysdate+1, 'YYYY/MM/DD' ) AS ����
FROM dual;

-- 40.
-- ����� �ٹ��޼��� �ټӿ����� ���Ͻÿ�.
-- MONTHS_BETWEEN( A, B )
-- - ��¥ A���� B ���� ���� �� ���̸� ��ȯ�ϴ� �Լ�
--   (��, A > B ��, A�� �� �ֱ� ��¥�� �����ؾ� ����� ��ȯ)
SELECT first_name �̸�
      ,TO_CHAR(hire_date, 'YYYY.MM.DD') �Ի�����
      ,TO_CHAR(sysdate, 'YYYY.MM.DD') ����
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date)) || '����' �ٹ��޼�
      ,TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12) || '��' �ټӿ���      
FROM employees;

-- 41.
-- ���÷κ��� 6���� ���� ��¥�� ���Ͻÿ�.
-- ADD_MONTHS( ��¥, ���� �� )
-- : ������ ��¥�κ��� �ش� ���� ���� ���� ��¥�� ��ȯ�ϴ� �Լ�
SELECT sysdate ����
      ,ADD_MONTHS(sysdate, 6) "6������"
FROM dual;


-- 42.
-- ���� ���� ���ƿ��� ������� ���Ͻÿ�
-- NEXT_DAY( ��¥, ���� )
-- : ������ ��¥ ���� ���ƿ��� ������ ��ȯ�ϴ� �Լ�
-- �� �� ȭ �� �� �� ��
-- 1  2  3  4 5  6  7
SELECT sysdate ����
      ,NEXT_DAY( sysdate, 7 ) "���� �����"
FROM dual;

SELECT '2023/02/27' "DB 1����"
      ,NEXT_DAY( sysdate, 1 ) "���� �Ͽ���"
      ,NEXT_DAY( sysdate, 2 ) "���� ������"
      ,NEXT_DAY( sysdate, 3 ) "���� ȭ����"
      ,NEXT_DAY( sysdate, 4 ) "���� ������"
      ,NEXT_DAY( sysdate, 5 ) "���� �����"
      ,NEXT_DAY( sysdate, 6 ) "���� �ݿ���"
      ,NEXT_DAY( sysdate, 7 ) "���� �����"
FROM dual;

-- 43.
-- ���� ��¥�� �ش� ���� ����, ���� ���ڸ� ���Ͻÿ�.
-- LAST_DAY( ��¥ )
-- : ���� �� ��¥�� ������ ���� ���� ���ڸ� ��ȯ�ϴ� �Լ�
-- ��¥ : XXXXXX.YYYYYYY
-- 1970��01��01�� 00��00��00��00ms �� 2023��3��02�� .....
-- ���� ���ڸ� ������ ���, �ð������� �Ҽ��κ����� ���
-- xxxxx.yyyyy --> 2023��3��20��
-- �� ���� �Ʒ��� �����ϸ�, ���ʸ� ���� �� �ִ�
SELECT TRUNC( sysdate, 'MM' ) ����
      ,sysdate ����
      ,LAST_DAY( sysdate ) ����
FROM dual;


SELECT TRUNC( TO_DATE('23/04/20'), 'MM' ) ����
      ,TO_DATE('23/04/20') ����
      ,LAST_DAY( TO_DATE('23/04/20') ) ����
FROM dual;

-- 44.
-- ���̺� EMPLOYEES �� COMMISSION_PCT �� �ߺ����� �˻��ϵ�, 
-- NULL �̸� 0���� ��ȸ�ϰ� ������������ �����ϴ� SQL ���� �ۼ��Ͻÿ�.

-- NVL( ��, ��ü�� �� ) : �ش� ���� NULL �̸� ������ ������ ��ȯ�ϴ� �Լ�
SELECT DISTINCT NVL(commission_pct, 0) "Ŀ�̼�(%)"
FROM employees
ORDER BY NVL(commission_pct, 0) DESC
;

SELECT DISTINCT NVL(commission_pct, 0) "Ŀ�̼�(%)"
FROM employees
ORDER BY "Ŀ�̼�(%)" DESC
;

-- ��ȸ�� �÷��� ��Ī���� ORDER BY ������ ����� �� �ִ�


-- 45.
-- EMPLOYEES �� FIRST_NAME, SALARY, COMMISSION_PCT �Ӽ��� �̿��Ͽ� 
-- �޿�, Ŀ�̼�, �����޿��� ��ȸ�Ͻÿ�.
-- * �����޿� = �޿� + (�޿� * Ŀ�̼�)
-- * NVL2( ��, NULL�� �ƴ� �� ��, NULL�� �� �� )
SELECT first_name �̸�
      ,salary �޿�
      ,NVL(commission_pct, 0) Ŀ�̼�
      ,NVL2(commission_pct, salary+(salary*commission_pct), salary) �����޿�
FROM employees
ORDER BY �����޿� DESC
;


-- 46.
-- DEPARTMENTS ���̺��� �����Ͽ�, ����� �̸��� �μ����� ����Ͻÿ�.
-- DECODE( �÷���, ���ǰ�1, ��ȯ��1, ���ǰ�2, ��ȯ��2, ... )
-- : ������ �÷��� ���� ���ǰ��� ��ġ�ϸ� �ٷ� ���� ��ȯ���� ����ϴ� �Լ�
SELECT first_name   �̸�
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
       ) �μ�
FROM employees;


-- 47.
-- CASE ��
-- : ���ǽ��� ������ ��, ����� ���� �����ϴ� ����
/* 
    CASE
         WHEN ���ǽ�1 THEN ��ȯ��1
         WHEN ���ǽ�2 THEN ��ȯ��2
         WHEN ���ǽ�3 THEN ��ȯ��3
         ...
    END
*/
-- �� �� ���� : ctrl + shift + D
SELECT first_name �̸�
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
        END �μ�
FROM employees;


-- 48.
-- EMPLOYEES ���̺�� ���� ��ü ��� ���� ���Ͻÿ�.
-- count( �÷��� )
-- : �÷��� �����Ͽ� null �� ������ ������ ������ ��ȯ�ϴ� �Լ�
-- * null �� ���� �����Ͷ�� � �÷��� �����ϴ��� ������ �����Ƿ�,
--   COUNT(*) �� ������ ���Ѵ�.
SELECT COUNT(*) �����
FROM employees;

-- 49. 
-- ������� �ְ�޿��� �����޿��� ���Ͻÿ�.
SELECT MAX(salary) �ְ�޿�
      ,MIN(salary) �����޿�
FROM employees;

-- 50. 
-- ������� �޿� �հ�� ����� ���Ͻÿ�.
SELECT SUM(salary) �޿��հ�
      ,ROUND( AVG(salary), 2 ) �޿����
FROM employees;


-- 51. 
-- ������� �޿� ǥ�������� �л��� ���Ͻÿ�.
SELECT ROUND( STDDEV(salary), 2 ) �޿�ǥ������
      ,ROUND( VARIANCE(salary), 2 ) �޿��л�
FROM employees;


-- 52.
-- MS_STUDENT ���̺��� �����Ͻÿ�.
-- * ���̺� ����
/*
    CREATE TABLE ���̺�� (
        �÷���1  Ÿ��   [NOT NULL/NULL] [��������],
        �÷���2  Ÿ��   [NOT NULL/NULL] [��������],
        �÷���3  Ÿ��   [NOT NULL/NULL] [��������],
        ...
    );
*/
-- * ���̺� ����
/*
    DROP TABLE ���̺��;
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
    , ETC VARCHAR2() DEFAULT '����' 
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

COMMENT ON TABLE MS_STUDENT IS '�л����� ������ �����Ѵ�.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '�л� ��ȣ';
COMMENT ON COLUMN MS_STUDENT.NAME IS '�̸�';
COMMENT ON COLUMN MS_STUDENT.CTZ_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MS_STUDENT.DEPT_NO IS '�μ���ȣ';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '������ȣ';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '�������';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '��������';

-- 53
-- MS_STUDENT ���̺� ����, ����, ��������, �������� �Ӽ��� �߰��Ͻÿ�.

-- ���̺� �Ӽ� �߰�
-- ALTER TABLE ���̺�� ADD �÷��� Ÿ�� DEFAULT �⺻�� [NOT NULL];
ALTER TABLE MS_STUDENT ADD GENDER CHAR(6) DEFAULT '��Ÿ' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.GENDER IS '����';

ALTER TABLE MS_STUDENT ADD STATUS VARCHAR2(10) DEFAULT '���' NOT NULL;
COMMENT ON COLUMN MS_STUDENT.STATUS IS '����';

ALTER TABLE MS_STUDENT ADD ADM_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '��������';

ALTER TABLE MS_STUDENT ADD GRD_DATE DATE NULL;
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '��������';

-- ���̺� �Ӽ� ����
ALTER TABLE MS_STUDENT DROP COLUMN GENDER;
ALTER TABLE MS_STUDENT DROP COLUMN STATUS;
ALTER TABLE MS_STUDENT DROP COLUMN ADM_DATE;
ALTER TABLE MS_STUDENT DROP COLUMN GRD_DATE;

-- 54
-- MS_STUDENT ���̺��� CTZ_NO �Ӽ��� BIRTH �� �̸��� �����ϰ�
-- ������ Ÿ���� DATE �� �����Ͻÿ�.
-- �׸���, ���� '�������' �� �����Ͻÿ�.
ALTER TABLE MS_STUDENT RENAME COLUMN CTZ_NO TO BIRTH;
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '�������';

-- �Ӽ� ���� - Ÿ�� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE;
-- �Ӽ� ���� - NULL ���� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH NULL;
-- �Ӽ� ���� - DEFAULT ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DEFAULT sysdate;

-- ���ÿ� ���� ����
ALTER TABLE MS_STUDENT MODIFY BIRTH DATE DEFAULT sysdate NOT NULL;



-- 55.
-- MS_STUDENT ���̺��� �к� ��ȣ(DEPT_NO) �Ӽ��� �����Ͻÿ�.
ALTER TABLE MS_STUDENT DROP COLUMN DEPT_NO;



-- 56.
-- MS_STUDENT ���̺��� �����Ͻÿ�.
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
    , GENDER CHAR(6) DEFAULT '��Ÿ' NOT NULL
    , STATUS VARCHAR2(10) DEFAULT '���' NOT NULL
    , ADM_DATE DATE NULL
    , GRD_DATE DATE NULL
    , REG_DATE DATE DEFAULT sysdate NOT NULL 
    , UPD_DATE DATE DEFAULT sysdate NOT NULL 
    , ETC VARCHAR2(1000) DEFAULT '����' 
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

COMMENT ON TABLE MS_STUDENT IS '�л����� ������ �����Ѵ�.';
COMMENT ON COLUMN MS_STUDENT.ST_NO IS '�л� ��ȣ';
COMMENT ON COLUMN MS_STUDENT.NAME IS '�̸�';
COMMENT ON COLUMN MS_STUDENT.BIRTH IS '�������';
COMMENT ON COLUMN MS_STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN MS_STUDENT.ADDRESS IS '�ּ�';
COMMENT ON COLUMN MS_STUDENT.MJ_NO IS '������ȣ';
COMMENT ON COLUMN MS_STUDENT.GENDER IS '����';
COMMENT ON COLUMN MS_STUDENT.STATUS IS '����';
COMMENT ON COLUMN MS_STUDENT.ADM_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.GRD_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.REG_DATE IS '�������';
COMMENT ON COLUMN MS_STUDENT.UPD_DATE IS '��������';
COMMENT ON COLUMN MS_STUDENT.ETC IS 'Ư�̻���';



-- 58
-- MS_STUDENT ���̺� �����͸� �߰��Ͻÿ�.
-- * ������ �߰�
/*
    �� �⺻����
    INSERT INTO [���̺��] ( �÷�1, �÷�2, ... )
    VALUES ( '��1', '��2', ... );
    * �÷� �ۼ� ������, �� �ۼ� ������ ¦�� �̷����Ѵ�.
    

    �� �÷��� ����
    INSERT INTO ���̺�
    VALUES ( ��1, ��2, ��3, ... )
    * �÷����� �����ϰ� �ۼ��ϸ�, �÷� ���� ������� ��� ���� �����ؾ��Ѵ�.


    �� �����͸� ��ȸ�Ͽ� �߰��ϱ�
     INSERT INTO ���̺� ( �÷�1, �÷�2, �÷�3, ... )
     SELECT �÷�1, �÷�2, �÷�3, ...
     FROM ���̺�
     [WHERE] ���� ;
    
*/

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,MJ_NO,GENDER,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20180001', '�ּ���', '991005', 'csa@univ.ac.kr', '����', '��', 'I01', '����', '2018/03/01', NULL, sysdate, sysdate, NULL );

SELECT * FROM ms_student;

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20210001', '�ڼ���', '020504', 'psj@univ.ac.kr', '����', '��', 'B02', '����', '2021/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20210002', '�����', '020504', 'kay@univ.ac.kr', '��õ', '��', 'S01', '����', '2021/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20160001', '������', '970210', 'jsa@univ.ac.kr', '�泲', '��', 'J02', '����', '2016/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20150010', '������', '960311', 'ydh@univ.ac.kr', '����', '��', 'K01', '����', '2015/03/01', NULL, sysdate, sysdate, NULL );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20130007', '�Ⱦƶ�', '941124', 'aar@univ.ac.kr', '���', '��', 'Y01', '����', '2013/03/01', NULL, sysdate, sysdate, '���󿹼� Ư����' );

INSERT INTO MS_STUDENT ( ST_NO,NAME,BIRTH,EMAIL,ADDRESS,GENDER,MJ_NO,STATUS,ADM_DATE,GRD_DATE,REG_DATE,UPD_DATE,ETC )
VALUES ( '20110002', '�Ѽ�ȣ', '921007', 'hsh@univ.ac.kr', '����', '��Ÿ', 'E03', '����', '2015/03/01', NULL, sysdate, sysdate, NULL );

COMMIT;

SELECT * FROM MS_STUDENT;


-- 59.
-- MS_STUDENT ���̺��� �����͸� �����Ͻÿ�.
-- UPDATE
/*
    UPDATE ���̺��
       SET �÷�1 = ������ ��,
           �÷�2 = ������ ��,
           ...
   [WHERE] ����;
*/
-- 1) �л���ȣ�� 20160001 �� �л��� �ּҸ� '����'��,
--    ���� ���¸� '����'���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET address = '����'
      ,status = '����'
 WHERE st_no = 20160001;

-- 2) �л���ȣ�� 20150010 �� �л��� �ּҸ� '����'��,
--    �缮 ���¸� '����' ����, �������ڴ� '20200220', �������ڴ� ���糯¥��
--    �׸��� Ư�̻����� '����'���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET address = '����', status = '����', grd_date = '2020/02/02',
       upd_date = sysdate, etc = '����'
WHERE st_no = 20150010;

-- 3)  �л���ȣ�� 20130007 �� ���� ���¸� '����'����,
--    �������ڴ� '20200220', �������ڴ� ���糯¥�� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET status = '����', grd_date = '2020/02/02', upd_date = sysdate
WHERE st_no = 20130007;

-- 4)  �л���ȣ�� 20110002 �� ���� ���¸� '����'����,
--    �������ڴ� '20130210', �������ڴ� ���糯¥�� 
--    �׸��� Ư�̻����� '���� ����' ���� �����Ͻÿ�.
UPDATE MS_STUDENT
   SET status = '����', grd_date = '2020/02/02', upd_date = sysdate
      ,etc = '���� ����'
WHERE st_no = 20110002;

SELECT * FROM ms_student;



-- 60.
-- MS_STUDENT ���̺��� �й��� 20110002 �� �л��� �����Ͻÿ�.
DELETE FROM MS_STUDENT WHERE ST_NO = 20110002;
















-- ����
imp userid=hr/123456 file='���\hr.dmp' fromuser=hr touser=hr
exp userid=hr/123456 file='C:\KHM\SQL\hr.dmp' log='C:\KHM\SQL\hr.log'








