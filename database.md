
# 데이터베이스
- 데이터베이스의 정의 

  - 데이터의 집합

  - 여러 명의 사용자가 공유

  - 동시 접근이 가능
  - MariaDB에서는 '데이터의 저장공간' 자체를 의미하기도 한다

  <img src="https://hongong.hanbit.co.kr/wp-content/uploads/2021/11/DBMS_%EA%B0%9C%EB%85%90.png" width="500">

- 데이터베이스의 역사

  - 초기에는 수기 기록을 했으나 파일시스템의 사용으로 발전했다

  - 파일시스템을 사용하다가 대량의 데이터를 보다 효율적으로 관리, 운영하기 위해 데이터베이스를 사용하기 시작했다

  - 영구 저장소 구분

    - 로컬 저장소 : 파일

    - 원격 저장소 : 데이터베이스



## DBMS (DataBase Management System)
- 데이터베이스를 관리, 운영하는 역할을 한다

- 저장용량에 따라 많이 쓰이는 DBMS

  - 대용량

    - DB2

    - Oracle
  - 범용
    - MySQL
    - MariaDB

    - SQLServer

  - 소형
    - Access

    - SQLite

- 데이터베이스 관련 개발자

  - 시스템 관리자(SA) : 설치, 외부 접근 보안에 관련된 일을 한다

  - 데이터베이스 관리자(DBA) : 모니터링, 튜닝, 백업, 복원, 내부 접근 보안에 관련된 일을 한다

  - 개발자 : SQL을 이용해 데이터베이스와 프로그램을 연동시킨다

### SQL
- DBMS에 명령을 주고 바로 결과를 얻는 대화식 언어


- DBMS 제작회사와 독립적으로 ANSI 표준을 따른다

- DBMS간에 상호 호환성이 뛰어나 다른 시스템으로 이식이 쉽다

- 구성
  - DML(Data Manipulation Lang.) : 데이터 조작

    - select, insert, update, delete
  - DDL(Data Definition Lang.) : 데이터 정의

    - create, alter, drop, rename, truncate
  - DCL(Data Control Lang.) : 데이터 접근 권한

    - grant, revoke
  - TCL(Transaction Control Lang.) : 트랜잭션
    - commit, rollback, savepoint

### MariaDB

- 서버 접근 방법

  <b>1<sub>st</sub> .</b> 컴퓨터 관리

  <b>2<sub>nd</sub> .</b> 서비스

  <b>3<sub>rd</sub> .</b> MariaDB

- 클라이언트 관리자로 접근 방법
```sql
-- Command Prompt(MariaDB)

> mysql -u root -p
-- -u 옵션은 user, root는 관리자(유저), -p 옵션은 패스워드를 의미한다
> Enter password:******
-- > mysql -u root -p123456
-- -p 옵션 뒤에 바로 암호를 써도 되지만 암호가 노출되기 때문에 지양한다
```

```sql
-- Mysql Client(MariaDB)

> Enter password:****** 
-- mysql Client는 기본 설정이 관리자 접속이다
```



#### MariaDB 명령어

  <small>!! 데이터베이스는 행과 열(컬럼)로 구성된 테이블로 이루어져 있다</small>

- 기본 명령어
```sql
> show databases;
-- 데이터베이스 목록을 보여준다

> use DB1;
-- 사용중인 데이터베이스를 DB1으로 바꾼다

> show tables;
-- 사용중인 데이터베이스의 테이블 목록을 보여준다

> describe user;
-- > desc user;
-- user 테이블에 있는 컬럼(열)의 정보를 보여준다
```
##### DML(Data Manipulation Lang.) 

- 데이터베이스의 데이터를 조작한다

```sql
-- 대소문자 구별을 하지 않는다
-- 공백은 사용할 수 없고, 사용할 경우 작은 따옴표를 이용해 묶어주어야 한다

MariaDB [sample]> select columName1 from tableName1;

MariaDB [sample]> select * from dept;
-- dept 테이블의 모든 데이터를 보여준다

MariaDB [sample]> select deptno, dname from dept;
-- dept 테이블의 deptno, dname 컬럼을 deptno, dname 순서로 보여준다
MariaDB [sample]> select dname, deptno from dept;
-- dept 테이블의 dname, deptno 컬럼을 dname, deptno 순서로 보여준다
-- 원본의 컬럼 순서가 변경되는 것은 아니다

MariaDB [sample]> select deptno as no, dname as name, loc as location from dept;
-- as를 이용해 alias(별칭)으로 보이게 할 수도 있다
-- as를 생략하고 alias를 바로 적을 수 있다
```


```sql
-- 산술 연산자
-- + , -, /, %
-- null이 산술 연산에 쓰일 경우 결과값은 항상 null이 나온다

MariaDB [sample]> select 3 + 5;
+-------+
| 3 + 5 |
+-------+
|     8 |
+-------+
1 row in set (0.000 sec)

MariaDB [sample]> select 1 * null;
+----------+
| 1 * null |
+----------+
|     NULL |
+----------+
1 row in set (0.001 sec)

MariaDB [sample]> select sal, sal * 12 from emp;
-- emp 테이블에서 sal, sal*12 컬럼을 보여준다
-- sal*12 컬럼은 sal에 있는 데이터에 각각 '* 12' 연산을 한 결과이다
```

```sql
-- 비교, 논리 연산자
-- true는 1, false는 0의 결과값을 보여준다

MariaDB [sample]> select 2 < 3;
+-------+
| 2 < 3 |
+-------+
|     1 |
+-------+
1 row in set (0.000 sec)

MariaDB [sample]> select 2 = 3;
+-------+
| 2 = 3 |
+-------+
|     0 |
+-------+
1 row in set (0.000 sec)

MariaDB [sample]> select 2 != 3;
+--------+
| 2 != 3 |
+--------+
|      1 |
+--------+
1 row in set (0.000 sec)

MariaDB [sample]> select 2 <> 3;
-- '!=' 연산자와 같다
+--------+
| 2 <> 3 |
+--------+
|      1 |
+--------+
1 row in set (0.000 sec)

MariaDB [sample]> select 1 && 1;
+--------+
| 1 && 1 |
+--------+
|      1 |
+--------+
1 row in set (0.000 sec)

MariaDB [sample]> select 1 and 1;
+---------+
| 1 and 1 |
+---------+
|       1 |
+---------+
1 row in set (0.000 sec)

MariaDB [sample]> select 1 || 1;
+--------+
| 1 || 1 |
+--------+
|      1 |
+--------+
1 row in set (0.000 sec)

MariaDB [sample]> select 1 or 0;
+--------+
| 1 or 0 |
+--------+
|      1 |
+--------+
1 row in set (0.000 sec)
```
```sql
-- where를 이용해서 행제한 조건을 줄 수 있다

MariaDB [sample]> select deptno from dept where deptno < 30;
-- deptno 컬럼의 행 중에 30 미만의 값을 가지는 행만 출력한다 
MariaDB [sample]> select deptno from dept where deptno <> 10;
-- deptno 컬럼의 행 중에 값이 10이 아닌 행만 출력한다

MariaDB [sample]> select empno, ename, sal from emp where sal <= 1000;
+-------+-------+--------+
| empno | ename | sal    |
+-------+-------+--------+
|  7369 | SMITH | 800.00 |
|  7900 | JAMES | 950.00 |
+-------+-------+--------+
2 rows in set (0.008 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename = king;
ERROR 1054 (42S22): Unknown column 'king' in 'where clause'
-- 컬럼이 아닌 값이 문자열일 때, 작은 따옴표로 묶어줘야 한다
MariaDB [sample]> select empno, ename, sal from emp where ename = 'king';
+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7839 | KING  | 5000.00 |
+-------+-------+---------+
1 row in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename > 'king';
-- 문자열의 크기 비교는 아스키 코드 값의 비교로 이루어진다
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7788 | SCOTT  | 3000.00 |
|  7844 | TURNER | 1500.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
6 rows in set (0.001 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename < 'b';
+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7499 | ALLEN | 1600.00 |
|  7876 | ADAMS | 1100.00 |
+-------+-------+---------+
2 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, hiredate from emp where hiredate = '2011-12-03';
+-------+-------+------------+
| empno | ename | hiredate   |
+-------+-------+------------+
|  7900 | JAMES | 2011-12-03 |
|  7902 | FORD  | 2011-12-03 |
+-------+-------+------------+
2 rows in set (0.014 sec)

MariaDB [sample]> select empno, ename, hiredate from emp where hiredate > '2011-12-03';
+-------+--------+------------+
| empno | ename  | hiredate   |
+-------+--------+------------+
|  7788 | SCOTT  | 2017-07-13 |
|  7876 | ADAMS  | 2017-07-13 |
|  7934 | MILLER | 2012-01-23 |
+-------+--------+------------+
3 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where sal >= 1000 && sal <= 2000 ;
-- MariaDB [sample]> select empno, ename, sal from emp where sal >= 1000 and sal <= 2000 ;
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7499 | ALLEN  | 1600.00 |
|  7521 | WARD   | 1250.00 |
|  7654 | MARTIN | 1250.00 |
|  7844 | TURNER | 1500.00 |
|  7876 | ADAMS  | 1100.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
6 rows in set (0.001 sec)

MariaDB [sample]> select empno, ename, sal, hiredate from emp where hiredate > '2010-12-31' and hiredate < '2012-01-01';
-- 입사년도가 2011년인 사원의 정보 출력
+-------+--------+---------+------------+
| empno | ename  | sal     | hiredate   |
+-------+--------+---------+------------+
|  7499 | ALLEN  | 1600.00 | 2011-02-20 |
|  7521 | WARD   | 1250.00 | 2011-02-22 |
|  7566 | JONES  | 2975.00 | 2011-04-02 |
|  7654 | MARTIN | 1250.00 | 2011-09-28 |
|  7698 | BLAKE  | 2850.00 | 2011-05-01 |
|  7782 | CLARK  | 2450.00 | 2011-06-09 |
|  7839 | KING   | 5000.00 | 2011-11-17 |
|  7844 | TURNER | 1500.00 | 2011-09-08 |
|  7900 | JAMES  |  950.00 | 2011-12-03 |
|  7902 | FORD   | 3000.00 | 2011-12-03 |
+-------+--------+---------+------------+
10 rows in set (0.000 sec)
-- 범위형 제한은 "between ~ and"를 사용할 수도 있다
MariaDB [sample]> select empno, ename, sal, hiredate from emp where hiredate between '2011-01-01' and '2011-12-31';
+-------+--------+---------+------------+
| empno | ename  | sal     | hiredate   |
+-------+--------+---------+------------+
|  7499 | ALLEN  | 1600.00 | 2011-02-20 |
|  7521 | WARD   | 1250.00 | 2011-02-22 |
|  7566 | JONES  | 2975.00 | 2011-04-02 |
|  7654 | MARTIN | 1250.00 | 2011-09-28 |
|  7698 | BLAKE  | 2850.00 | 2011-05-01 |
|  7782 | CLARK  | 2450.00 | 2011-06-09 |
|  7839 | KING   | 5000.00 | 2011-11-17 |
|  7844 | TURNER | 1500.00 | 2011-09-08 |
|  7900 | JAMES  |  950.00 | 2011-12-03 |
|  7902 | FORD   | 3000.00 | 2011-12-03 |
+-------+--------+---------+------------+
10 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, job from emp where job = 'clerk' or job = 'salesman';
+-------+--------+----------+
| empno | ename  | job      |
+-------+--------+----------+
|  7369 | SMITH  | CLERK    |
|  7499 | ALLEN  | SALESMAN |
|  7521 | WARD   | SALESMAN |
|  7654 | MARTIN | SALESMAN |
|  7844 | TURNER | SALESMAN |
|  7876 | ADAMS  | CLERK    |
|  7900 | JAMES  | CLERK    |
|  7934 | MILLER | CLERK    |
+-------+--------+----------+
8 rows in set (0.001 sec)
-- 목록형 제한은 "in()"를 사용할 수도 있다
MariaDB [sample]> select empno, ename, job from emp where job in('clerk','salesman');
+-------+--------+----------+
| empno | ename  | job      |
+-------+--------+----------+
|  7369 | SMITH  | CLERK    |
|  7499 | ALLEN  | SALESMAN |
|  7521 | WARD   | SALESMAN |
|  7654 | MARTIN | SALESMAN |
|  7844 | TURNER | SALESMAN |
|  7876 | ADAMS  | CLERK    |
|  7900 | JAMES  | CLERK    |
|  7934 | MILLER | CLERK    |
+-------+--------+----------+
8 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, job, deptno from emp where deptno in(10, 20);
+-------+--------+-----------+--------+
| empno | ename  | job       | deptno |
+-------+--------+-----------+--------+
|  7369 | SMITH  | CLERK     |     20 |
|  7566 | JONES  | MANAGER   |     20 |
|  7782 | CLARK  | MANAGER   |     10 |
|  7788 | SCOTT  | ANALYST   |     20 |
|  7839 | KING   | PRESIDENT |     10 |
|  7876 | ADAMS  | CLERK     |     20 |
|  7902 | FORD   | ANALYST   |     20 |
|  7934 | MILLER | CLERK     |     10 |
+-------+--------+-----------+--------+
8 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal, comm from emp where comm is null;
-- null인 값을 확인하려면 "is null"을 써야한다
+-------+--------+---------+------+
| empno | ename  | sal     | comm |
+-------+--------+---------+------+
|  7369 | SMITH  |  800.00 | NULL |
|  7566 | JONES  | 2975.00 | NULL |
|  7698 | BLAKE  | 2850.00 | NULL |
|  7782 | CLARK  | 2450.00 | NULL |
|  7788 | SCOTT  | 3000.00 | NULL |
|  7839 | KING   | 5000.00 | NULL |
|  7876 | ADAMS  | 1100.00 | NULL |
|  7900 | JAMES  |  950.00 | NULL |
|  7902 | FORD   | 3000.00 | NULL |
|  7934 | MILLER | 1300.00 | NULL |
+-------+--------+---------+------+
10 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal, comm from emp where comm is not null;
-- null이 아닌 값을 확인하려면 "is not null"을 써야한다
+-------+--------+---------+---------+
| empno | ename  | sal     | comm    |
+-------+--------+---------+---------+
|  7499 | ALLEN  | 1600.00 |  300.00 |
|  7521 | WARD   | 1250.00 |  500.00 |
|  7654 | MARTIN | 1250.00 | 1400.00 |
|  7844 | TURNER | 1500.00 |    0.00 |
+-------+--------+---------+---------+
4 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename like 'k%';
-- 'k'로 시작하는 값을 가진 값을 확인
-- '%' 임의의 문자 집합을 의미한다(공집합도 가능하다)
+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7839 | KING  | 5000.00 |
+-------+-------+---------+
1 row in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename like '%g';
-- 'g'로 끝나는 값을 가진 값을 확인
+-------+-------+---------+
| empno | ename | sal     |
+-------+-------+---------+
|  7839 | KING  | 5000.00 |
+-------+-------+---------+
1 row in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename like '%i%';
-- 'i'를 포함하는 값을 가진 값을 확인
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7369 | SMITH  |  800.00 |
|  7654 | MARTIN | 1250.00 |
|  7839 | KING   | 5000.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
4 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, hiredate from emp where hiredate like '2011%';
-- 2011년도에 입사한 직원을 확인
+-------+--------+------------+
| empno | ename  | hiredate   |
+-------+--------+------------+
|  7499 | ALLEN  | 2011-02-20 |
|  7521 | WARD   | 2011-02-22 |
|  7566 | JONES  | 2011-04-02 |
|  7654 | MARTIN | 2011-09-28 |
|  7698 | BLAKE  | 2011-05-01 |
|  7782 | CLARK  | 2011-06-09 |
|  7839 | KING   | 2011-11-17 |
|  7844 | TURNER | 2011-09-08 |
|  7900 | JAMES  | 2011-12-03 |
|  7902 | FORD   | 2011-12-03 |
+-------+--------+------------+
10 rows in set (0.001 sec)

MariaDB [sample]> select empno, ename, hiredate from emp where hiredate like '%-02-%';
-- 2월에 입사한 직원을 확인
+-------+-------+------------+
| empno | ename | hiredate   |
+-------+-------+------------+
|  7499 | ALLEN | 2011-02-20 |
|  7521 | WARD  | 2011-02-22 |
+-------+-------+------------+
2 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal from emp where ename like '_i%';
-- '_'는 한개의 임의의 문자를 의미한다
+-------+--------+---------+
| empno | ename  | sal     |
+-------+--------+---------+
|  7839 | KING   | 5000.00 |
|  7934 | MILLER | 1300.00 |
+-------+--------+---------+
2 rows in set (0.001 sec)
```
```sql
MariaDB [sample]> select distinct deptno from emp;
-- distinct는 중복되는 값 제거를 의미한다
-- deptno 컬럼이 갖고 있는 값을 확인한다
+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.007 sec)

MariaDB [sample]> select distinct job from emp;
-- job 컬럼이 갖고 있는 값을 확인한다
+-----------+
| job       |
+-----------+
| CLERK     |
| SALESMAN  |
| MANAGER   |
| ANALYST   |
| PRESIDENT |
+-----------+
5 rows in set (0.000 sec)

MariaDB [sample]> select distinct deptno, job from emp;
-- deptno, job을 한 쌍의 값으로 볼 때 중복이 되지 않는 값을 확인한다
+--------+-----------+
| deptno | job       |
+--------+-----------+
|     20 | CLERK     |
|     30 | SALESMAN  |
|     20 | MANAGER   |
|     30 | MANAGER   |
|     10 | MANAGER   |
|     20 | ANALYST   |
|     10 | PRESIDENT |
|     30 | CLERK     |
|     10 | CLERK     |
+--------+-----------+
9 rows in set (0.001 sec)
```
```sql
MariaDB [sample]> select * from emp limit 3;
-- "limit"을 이용해서 전체 데이터가 아닌 일부 데이터만 확인할 수 있다
-- 가장 위에서부터 총 3개의 데이터를 확인한다
+-------+-------+----------+------+------------+---------+--------+--------+
| empno | ename | job      | mgr  | hiredate   | sal     | comm   | deptno |
+-------+-------+----------+------+------------+---------+--------+--------+
|  7369 | SMITH | CLERK    | 7902 | 2010-12-17 |  800.00 |   NULL |     20 |
|  7499 | ALLEN | SALESMAN | 7698 | 2011-02-20 | 1600.00 | 300.00 |     30 |
|  7521 | WARD  | SALESMAN | 7698 | 2011-02-22 | 1250.00 | 500.00 |     30 |
+-------+-------+----------+------+------------+---------+--------+--------+
3 rows in set (0.000 sec)

MariaDB [sample]> select * from emp limit 1, 3;
-- 인덱스 1부터 총 3개의 데이터를 확인한다
-- 인덱스는 0부터 시작한다
+-------+-------+----------+------+------------+---------+--------+--------+
| empno | ename | job      | mgr  | hiredate   | sal     | comm   | deptno |
+-------+-------+----------+------+------------+---------+--------+--------+
|  7499 | ALLEN | SALESMAN | 7698 | 2011-02-20 | 1600.00 | 300.00 |     30 |
|  7521 | WARD  | SALESMAN | 7698 | 2011-02-22 | 1250.00 | 500.00 |     30 |
|  7566 | JONES | MANAGER  | 7839 | 2011-04-02 | 2975.00 |   NULL |     20 |
+-------+-------+----------+------+------------+---------+--------+--------+
3 rows in set (0.000 sec)
```
```sql
MariaDB [sample]> select * from emp order by deptno asc;
-- "order by"를 이용해서 순서대로 정렬할 수 있다
-- select ~ from ~ where ~ order by ~;
-- deptno 값을 기준으로 오름차순 정렬
-- asc는 기본값으로 생략 가능하다
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 |    NULL |     10 |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 |    NULL |     10 |
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 |    NULL |     10 |
|  7902 | FORD   | ANALYST   | 7566 | 2011-12-03 | 3000.00 |    NULL |     20 |
|  7876 | ADAMS  | CLERK     | 7788 | 2017-07-13 | 1100.00 |    NULL |     20 |
|  7788 | SCOTT  | ANALYST   | 7566 | 2017-07-13 | 3000.00 |    NULL |     20 |
|  7566 | JONES  | MANAGER   | 7839 | 2011-04-02 | 2975.00 |    NULL |     20 |
|  7369 | SMITH  | CLERK     | 7902 | 2010-12-17 |  800.00 |    NULL |     20 |
|  7698 | BLAKE  | MANAGER   | 7839 | 2011-05-01 | 2850.00 |    NULL |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 2011-09-28 | 1250.00 | 1400.00 |     30 |
|  7844 | TURNER | SALESMAN  | 7698 | 2011-09-08 | 1500.00 |    0.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 2011-02-22 | 1250.00 |  500.00 |     30 |
|  7900 | JAMES  | CLERK     | 7698 | 2011-12-03 |  950.00 |    NULL |     30 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 2011-02-20 | 1600.00 |  300.00 |     30 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select * from emp order by deptno desc;
-- deptno 값을 기준으로 내림차순 정렬
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7499 | ALLEN  | SALESMAN  | 7698 | 2011-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 2011-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 2011-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 2011-05-01 | 2850.00 |    NULL |     30 |
|  7900 | JAMES  | CLERK     | 7698 | 2011-12-03 |  950.00 |    NULL |     30 |
|  7844 | TURNER | SALESMAN  | 7698 | 2011-09-08 | 1500.00 |    0.00 |     30 |
|  7369 | SMITH  | CLERK     | 7902 | 2010-12-17 |  800.00 |    NULL |     20 |
|  7902 | FORD   | ANALYST   | 7566 | 2011-12-03 | 3000.00 |    NULL |     20 |
|  7876 | ADAMS  | CLERK     | 7788 | 2017-07-13 | 1100.00 |    NULL |     20 |
|  7788 | SCOTT  | ANALYST   | 7566 | 2017-07-13 | 3000.00 |    NULL |     20 |
|  7566 | JONES  | MANAGER   | 7839 | 2011-04-02 | 2975.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 |    NULL |     10 |
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 |    NULL |     10 |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select * from emp order by hiredate;
-- 입사일 순으로 정렬
+-------+--------+-----------+------+------------+---------+---------+--------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 2010-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 2011-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 2011-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 2011-04-02 | 2975.00 |    NULL |     20 |
|  7698 | BLAKE  | MANAGER   | 7839 | 2011-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 2011-09-08 | 1500.00 |    0.00 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 2011-09-28 | 1250.00 | 1400.00 |     30 |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 |    NULL |     10 |
|  7902 | FORD   | ANALYST   | 7566 | 2011-12-03 | 3000.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 2011-12-03 |  950.00 |    NULL |     30 |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 |    NULL |     10 |
|  7876 | ADAMS  | CLERK     | 7788 | 2017-07-13 | 1100.00 |    NULL |     20 |
|  7788 | SCOTT  | ANALYST   | 7566 | 2017-07-13 | 3000.00 |    NULL |     20 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select deptno, job, empno, ename from emp order by deptno, job;
-- deptno를 기준으로 먼저 정렬하고 동순위일 경우 job을 기준으로 정렬한다
+--------+-----------+-------+--------+
| deptno | job       | empno | ename  |
+--------+-----------+-------+--------+
|     10 | CLERK     |  7934 | MILLER |
|     10 | MANAGER   |  7782 | CLARK  |
|     10 | PRESIDENT |  7839 | KING   |
|     20 | ANALYST   |  7902 | FORD   |
|     20 | ANALYST   |  7788 | SCOTT  |
|     20 | CLERK     |  7876 | ADAMS  |
|     20 | CLERK     |  7369 | SMITH  |
|     20 | MANAGER   |  7566 | JONES  |
|     30 | CLERK     |  7900 | JAMES  |
|     30 | MANAGER   |  7698 | BLAKE  |
|     30 | SALESMAN  |  7654 | MARTIN |
|     30 | SALESMAN  |  7521 | WARD   |
|     30 | SALESMAN  |  7844 | TURNER |
|     30 | SALESMAN  |  7499 | ALLEN  |
+--------+-----------+-------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select deptno, job, empno, ename from emp order by 1;
-- 첫번째 컬럼인 deptno를 기준으로 정렬한다
+--------+-----------+-------+--------+
| deptno | job       | empno | ename  |
+--------+-----------+-------+--------+
|     10 | CLERK     |  7934 | MILLER |
|     10 | PRESIDENT |  7839 | KING   |
|     10 | MANAGER   |  7782 | CLARK  |
|     20 | ANALYST   |  7902 | FORD   |
|     20 | CLERK     |  7876 | ADAMS  |
|     20 | ANALYST   |  7788 | SCOTT  |
|     20 | MANAGER   |  7566 | JONES  |
|     20 | CLERK     |  7369 | SMITH  |
|     30 | MANAGER   |  7698 | BLAKE  |
|     30 | SALESMAN  |  7654 | MARTIN |
|     30 | SALESMAN  |  7844 | TURNER |
|     30 | SALESMAN  |  7521 | WARD   |
|     30 | CLERK     |  7900 | JAMES  |
|     30 | SALESMAN  |  7499 | ALLEN  |
+--------+-----------+-------+--------+
14 rows in set (0.001 sec)

MariaDB [sample]> select deptno no, job, empno, ename from emp order by no;
-- alias를 이용해 정렬할 수도 있다
+------+-----------+-------+--------+
| no   | job       | empno | ename  |
+------+-----------+-------+--------+
|   10 | CLERK     |  7934 | MILLER |
|   10 | PRESIDENT |  7839 | KING   |
|   10 | MANAGER   |  7782 | CLARK  |
|   20 | ANALYST   |  7902 | FORD   |
|   20 | CLERK     |  7876 | ADAMS  |
|   20 | ANALYST   |  7788 | SCOTT  |
|   20 | MANAGER   |  7566 | JONES  |
|   20 | CLERK     |  7369 | SMITH  |
|   30 | MANAGER   |  7698 | BLAKE  |
|   30 | SALESMAN  |  7654 | MARTIN |
|   30 | SALESMAN  |  7844 | TURNER |
|   30 | SALESMAN  |  7521 | WARD   |
|   30 | CLERK     |  7900 | JAMES  |
|   30 | SALESMAN  |  7499 | ALLEN  |
+------+-----------+-------+--------+
14 rows in set (0.000 sec)
```
###### Information Function

<small>!! https://mariadb.com/kb/en/documentation/ 참조</small>

```sql
MariaDB [sample]> select version();
-- MariaDB 버전 확인
+-----------------+
| version()       |
+-----------------+
| 10.11.2-MariaDB |
+-----------------+
1 row in set (0.001 sec)

MariaDB [sample]> select database();
-- 현재 사용하는 데이터베이스 이름 확인
+------------+
| database() |
+------------+
| sample     |
+------------+
1 row in set (0.000 sec)

MariaDB [sample]> select user();
-- 현재 데이터베이스를 사용하고 있는 유저 확인
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.000 sec)

MariaDB [sample]> status;
-- 데이터베이스의 상태에 관한 정보 확인
--------------
mysql  Ver 15.1 Distrib 10.11.2-MariaDB, for Win64 (AMD64), source revision cafba8761af55ae16cc69c9b53a341340a845b36

Connection id:          8
Current database:       sample
Current user:           root@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server:                 MariaDB
Server version:         10.11.2-MariaDB mariadb.org binary distribution
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
TCP port:               3306
Uptime:                 4 hours 55 min 22 sec

Threads: 1  Questions: 161  Slow queries: 0  Opens: 23  Open tables: 16  Queries per second avg: 0.009
--------------
```
###### Numeric Function
```sql
MariaDB [sample]> select abs(123), abs(-123);
-- 절대값
+----------+-----------+
| abs(123) | abs(-123) |
+----------+-----------+
|      123 |       123 |
+----------+-----------+
1 row in set (0.014 sec)

MariaDB [sample]> select ceil(4.4), ceil(4.6);
-- 올림
+-----------+-----------+
| ceil(4.4) | ceil(4.6) |
+-----------+-----------+
|         5 |         5 |
+-----------+-----------+
1 row in set (0.001 sec)

MariaDB [sample]> select floor(4.4), floor(4.6);
-- 내림
+------------+------------+
| floor(4.4) | floor(4.6) |
+------------+------------+
|          4 |          4 |
+------------+------------+
1 row in set (0.000 sec)

MariaDB [sample]> select round(4.4), round(4.6);
-- 반올림
+------------+------------+
| round(4.4) | round(4.6) |
+------------+------------+
|          4 |          5 |
+------------+------------+
1 row in set (0.000 sec)

MariaDB [sample]> select truncate(999.999, 0);
-- 소숫점 자리 절삭
+----------------------+
| truncate(999.999, 0) |
+----------------------+
|                  999 |
+----------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select truncate(999.999, 2);
-- 소숫점 아래 2번째자리 아래 절삭
+----------------------+
| truncate(999.999, 2) |
+----------------------+
|               999.99 |
+----------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select truncate(999.999, -2);
-- 소숫점 위 두번째자리부터 절삭
+-----------------------+
| truncate(999.999, -2) |
+-----------------------+
|                   900 |
+-----------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select pow(2, 2);
+-----------+
| pow(2, 2) |
+-----------+
|         4 |
+-----------+
1 row in set (0.001 sec)

MariaDB [sample]> select 5 % 2, mod(5, 2);
-- 나머지
+-------+-----------+
| 5 % 2 | mod(5, 2) |
+-------+-----------+
|     1 |         1 |
+-------+-----------+
1 row in set (0.000 sec)

MariaDB [sample]> select greatest(100, 101, 102);
-- 최댓값
+-------------------------+
| greatest(100, 101, 102) |
+-------------------------+
|                     102 |
+-------------------------+
1 row in set (0.015 sec)

MariaDB [sample]> select least(sal, 2000) from emp;
-- 2000 보다 작거나 같은 sal 컬럼의 데이터를 확인
+------------------+
| least(sal, 2000) |
+------------------+
|           800.00 |
|          1600.00 |
|          1250.00 |
|          2000.00 |
|          1250.00 |
|          2000.00 |
|          2000.00 |
|          2000.00 |
|          2000.00 |
|          1500.00 |
|          1100.00 |
|           950.00 |
|          2000.00 |
|          1300.00 |
+------------------+
14 rows in set (0.001 sec)
```

###### String function
```sql
MariaDB [sample]> select ascii('A'), ascii('a');
-- 아스키 코드 값 확인
+------------+------------+
| ascii('A') | ascii('a') |
+------------+------------+
|         65 |         97 |
+------------+------------+
1 row in set (0.000 sec)

MariaDB [sample]> select length('가나다'), char_length('가나다');.
-- 다국어는 char_length()로 문자열 길이를 확인한다
+---------------------+--------------------------+
| length('가나다')    | char_length('가나다')    |
+---------------------+--------------------------+
|                   9 |                        3 |
+---------------------+--------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename, char_length(ename) from emp where deptno = 10;
+--------+--------------------+
| ename  | char_length(ename) |
+--------+--------------------+
| CLARK  |                  5 |
| KING   |                  4 |
| MILLER |                  6 |
+--------+--------------------+
3 rows in set (0.000 sec)

MariaDB [sample]> select ename from emp where char_length(ename) = 4;
-- 이름이 4자인 직원 확인 
+-------+
| ename |
+-------+
| WARD  |
| KING  |
| FORD  |
+-------+
3 rows in set (0.000 sec)

MariaDB [sample]> select ename from emp where ename like '____';
-- '_' 4개 사용할 수도 있다
+-------+
| ename |
+-------+
| WARD  |
| KING  |
| FORD  |
+-------+
3 rows in set (0.000 sec)

MariaDB [sample]> select concat('asp', 'php');
-- 문자열 연결
+----------------------+
| concat('asp', 'php') |
+----------------------+
| aspphp               |
+----------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select concat(ename, '님의 직책은 ', job, '입니다') '직책' from emp where deptno = 10;                  ;
+-----------------------------------------+
| 직책                                    |
+-----------------------------------------+
| CLARK님의 직책은 MANAGER입니다          |
| KING님의 직책은 PRESIDENT입니다         |
| MILLER님의 직책은 CLERK입니다           |
+-----------------------------------------+
3 rows in set (0.000 sec)

MariaDB [sample]> select concat(ename, '님의 연봉은 ', sal*12, '입니다') '연봉'from emp where deptno = 10;
+------------------------------------------+
| 연봉                                     |
+------------------------------------------+
| CLARK님의 연봉은 29400.00입니다          |
| KING님의 연봉은 60000.00입니다           |
| MILLER님의 연봉은 15600.00입니다         |
+------------------------------------------+
3 rows in set (0.000 sec)

MariaDB [sample]> select instr('mariadb database study', 'study');
-- 문자열을 포함하는지 확인하고 위치 인덱스를 결과로 준다
-- 인덱스는 1부터 시작한다
+------------------------------------------+
| instr('mariadb database study', 'study') |
+------------------------------------------+
|                                       18 |
+------------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select instr('mariadb database study', 'ma');
+---------------------------------------+
| instr('mariadb database study', 'ma') |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select instr('mariadb database study', 'me');
-- 포함하지 않을 때의 결과값은 0
+---------------------------------------+
| instr('mariadb database study', 'me') |
+---------------------------------------+
|                                     0 |
+---------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename, instr(ename, 'mi') from emp where deptno = 20;
+-------+--------------------+
| ename | instr(ename, 'mi') |
+-------+--------------------+
| SMITH |                  2 |
| JONES |                  0 |
| SCOTT |                  0 |
| ADAMS |                  0 |
| FORD  |                  0 |
+-------+--------------------+
5 rows in set (0.000 sec)

MariaDB [sample]> select left('mariadb database study', 5);
+-----------------------------------+
| left('mariadb database study', 5) |
+-----------------------------------+
| maria                             |
+-----------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select right('mariadb database study', 5);
+------------------------------------+
| right('mariadb database study', 5) |
+------------------------------------+
| study                              |
+------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select mid('mariadb database study', 5, 5);
-- 5번째 문자부터 문자 5개를 확인
+-------------------------------------+
| mid('mariadb database study', 5, 5) |
+-------------------------------------+
| adb d                               |
+-------------------------------------+
1 row in set (0.010 sec)

MariaDB [sample]> select substring('mariadb database study', 5, 5);
-- 5번째 문자부터 문자 5개를 확인
+-------------------------------------------+
| substring('mariadb database study', 5, 5) |
+-------------------------------------------+
| adb d                                     |
+-------------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename from emp where left(ename, 1) = 's';
-- 's'로 시작하는 이름을 가진 직원 확인
+-------+
| ename |
+-------+
| SMITH |
| SCOTT |
+-------+
2 rows in set (0.000 sec)

MariaDB [sample]> select replace('mariadb database study', 'study', '스터디');
+---------------------------------------------------------+
| replace('mariadb database study', 'study', '스터디')    |
+---------------------------------------------------------+
| mariadb database 스터디                                 |
+---------------------------------------------------------+
1 row in set (0.007 sec)

MariaDB [sample]> select insert('mariadb database study', 9, 8, '데이터베이스');
-- 9번째 문자부터 8개를 잘라내고 '데이터베이스'를 삽입
+--------------------------------------------------------------+
| insert('mariadb database study', 9, 8, '데이터베이스')       |
+--------------------------------------------------------------+
| mariadb 데이터베이스 study                                   |
+--------------------------------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select lcase('ABC'), lower('ABC');
+--------------+--------------+
| lcase('ABC') | lower('ABC') |
+--------------+--------------+
| abc          | abc          |
+--------------+--------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ucase('abc'), upper('abc');
+--------------+--------------+
| ucase('abc') | upper('abc') |
+--------------+--------------+
| ABC          | ABC          |
+--------------+--------------+
1 row in set (0.000 sec)

MariaDB [sample]> select reverse('abc');
+----------------+
| reverse('abc') |
+----------------+
| cba            |
+----------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ltrim('   ad   '), rtrim('   ad    ');
-- 왼쪽, 오른쪽의 공백 각각 제거
+-------------------+--------------------+
| ltrim('   ad   ') | rtrim('   ad    ') |
+-------------------+--------------------+
| ad                |    ad              |
+-------------------+--------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select trim('   ad   ');
-- 양쪽 공백 모두 제거
+------------------+
| trim('   ad   ') |
+------------------+
| ad               |
+------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select lpad('hi', 4, '?');
-- 4자리를 확보해서 오른쪽에 문자열을 채워넣고 왼쪽의 남은 공백에 물음표를 채워넣는다
+--------------------+
| lpad('hi', 4, '?') |
+--------------------+
| ??hi               |
+--------------------+
1 row in set (0.007 sec)

MariaDB [sample]> select rpad('hi', 4, '?');
-- 4자리를 확보해서 왼쪽에 문자열을 채워넣고 오른쪽의 남은 공백에 물음표를 채워넣는다
+--------------------+
| rpad('hi', 4, '?') |
+--------------------+
| hi??               |
+--------------------+
1 row in set (0.000 sec)
```
###### Date function
```sql
MariaDB [sample]> select now(), sysdate(), current_timestamp();
-- 현재 날짜, 시간 출력
+---------------------+---------------------+---------------------+
| now()               | sysdate()           | current_timestamp() |
+---------------------+---------------------+---------------------+
| 2023-03-28 16:25:14 | 2023-03-28 16:25:14 | 2023-03-28 16:25:14 |
+---------------------+---------------------+---------------------+
1 row in set (0.011 sec)

MariaDB [sample]> select curdate();
-- 현재 날짜만 출력
+------------+
| curdate()  |
+------------+
| 2023-03-28 |
+------------+
1 row in set (0.010 sec)

MariaDB [sample]> select curtime();
-- 현재 시간만 출력
+-----------+
| curtime() |
+-----------+
| 16:26:09  |
+-----------+
1 row in set (0.001 sec)

MariaDB [sample]> select now(), now() + 1;
-- 1초 더한 시간이 나온다
+---------------------+----------------+
| now()               | now() + 1      |
+---------------------+----------------+
| 2023-03-28 16:26:35 | 20230328162636 |
+---------------------+----------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), now() - 1;
-- 1초 감소한 시간이 나온다
+---------------------+----------------+
| now()               | now() - 1      |
+---------------------+----------------+
| 2023-03-28 16:27:05 | 20230328162704 |
+---------------------+----------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), date_add(now(), interval 2 day);
-- 2일 후의 날짜, 시간
+---------------------+---------------------------------+
| now()               | date_add(now(), interval 2 day) |
+---------------------+---------------------------------+
| 2023-03-28 16:27:40 | 2023-03-30 16:27:40             |
+---------------------+---------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), date_add(now(), interval 2 month);
-- 두달 후의 날짜, 시간
+---------------------+-----------------------------------+
| now()               | date_add(now(), interval 2 month) |
+---------------------+-----------------------------------+
| 2023-03-28 16:28:11 | 2023-05-28 16:28:11               |
+---------------------+-----------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), date_sub(now(), interval 2 day);
-- 2일 전의 날짜, 시간
+---------------------+---------------------------------+
| now()               | date_sub(now(), interval 2 day) |
+---------------------+---------------------------------+
| 2023-03-28 16:28:40 | 2023-03-26 16:28:40             |
+---------------------+---------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), date_sub(now(), interval 2 month);
-- 두달 전의 날짜, 시간
+---------------------+-----------------------------------+
| now()               | date_sub(now(), interval 2 month) |
+---------------------+-----------------------------------+
| 2023-03-28 16:29:02 | 2023-01-28 16:29:02               |
+---------------------+-----------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select now(), date_sub('2023-03-25', interval 2 day);
-- 특정 날짜를 가지고도 연산이 가능하다
+---------------------+----------------------------------------+
| now()               | date_sub('2023-03-25', interval 2 day) |
+---------------------+----------------------------------------+
| 2023-03-28 16:30:13 | 2023-03-23                             |
+---------------------+----------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select timestampdiff(day, now(), '2023-03-24');
+-----------------------------------------+
| timestampdiff(day, now(), '2023-03-24') |
+-----------------------------------------+
|                                      -4 |
+-----------------------------------------+
1 row in set (0.020 sec)

MariaDB [sample]> select timestampdiff(day, now(), '2023-03-30');
+-----------------------------------------+
| timestampdiff(day, now(), '2023-03-30') |
+-----------------------------------------+
|                                       1 |
+-----------------------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename, hiredate, timestampdiff(day, hiredate, now()) from emp where deptno = 10;
+--------+------------+-------------------------------------+
| ename  | hiredate   | timestampdiff(day, hiredate, now()) |
+--------+------------+-------------------------------------+
| CLARK  | 2011-06-09 |                                4310 |
| KING   | 2011-11-17 |                                4149 |
| MILLER | 2012-01-23 |                                4082 |
+--------+------------+-------------------------------------+
3 rows in set (0.001 sec)

MariaDB [sample]> select year(now());
+-------------+
| year(now()) |
+-------------+
|        2023 |
+-------------+
1 row in set (0.000 sec)

MariaDB [sample]> select year('20230328'), year('2023-03-28'), year('2023/03/28');
+------------------+--------------------+--------------------+
| year('20230328') | year('2023-03-28') | year('2023/03/28') |
+------------------+--------------------+--------------------+
|             2023 |               2023 |               2023 |
+------------------+--------------------+--------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select extract(year from now());
+--------------------------+
| extract(year from now()) |
+--------------------------+
|                     2023 |
+--------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select dayname(now());
+----------------+
| dayname(now()) |
+----------------+
| Tuesday        |
+----------------+
1 row in set (0.012 sec)

MariaDB [sample]> select unix_timestamp();
+------------------+
| unix_timestamp() |
+------------------+
|       1679989472 |
+------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select date_format(now(), '%Y-%m-%d'), date_format(now(), '%Y/%m/%d');
+--------------------------------+--------------------------------+
| date_format(now(), '%Y-%m-%d') | date_format(now(), '%Y/%m/%d') |
+--------------------------------+--------------------------------+
| 2023-03-28                     | 2023/03/28                     |
+--------------------------------+--------------------------------+
1 row in set (0.000 sec)
```
```sql
MariaDB [sample]> select if(1 = 2, 'true', 'false');
+----------------------------+
| if(1 = 2, 'true', 'false') |
+----------------------------+
| false                      |
+----------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename, sal, if(sal < 2000, '적음', '많음') from emp where deptno = 30;
+--------+---------+------------------------------------+
| ename  | sal     | if(sal < 2000, '적음', '많음')     |
+--------+---------+------------------------------------+
| ALLEN  | 1600.00 | 적음                               |
| WARD   | 1250.00 | 적음                               |
| MARTIN | 1250.00 | 적음                               |
| BLAKE  | 2850.00 | 많음                               |
| TURNER | 1500.00 | 적음                               |
| JAMES  |  950.00 | 적음                               |
+--------+---------+------------------------------------+
6 rows in set (0.000 sec)

MariaDB [sample]> select sal, comm, ifnull(comm, 0) from emp where deptno = 30;
+---------+---------+-----------------+
| sal     | comm    | ifnull(comm, 0) |
+---------+---------+-----------------+
| 1600.00 |  300.00 |          300.00 |
| 1250.00 |  500.00 |          500.00 |
| 1250.00 | 1400.00 |         1400.00 |
| 2850.00 |    NULL |            0.00 |
| 1500.00 |    0.00 |            0.00 |
|  950.00 |    NULL |            0.00 |
+---------+---------+-----------------+
6 rows in set (0.001 sec)

MariaDB [sample]> select sal * 12 + ifnull(null, 0) from emp where deptno = 30;
+----------------------------+
| sal * 12 + ifnull(null, 0) |
+----------------------------+
|                   19200.00 |
|                   15000.00 |
|                   15000.00 |
|                   34200.00 |
|                   18000.00 |
|                   11400.00 |
+----------------------------+
6 rows in set (0.000 sec)
```

- 외부에 만들어 놓은 .sql 파일 사용하기

  <small>!! .sql 파일은 ANSI 저장형식으로 저장되어 있어야 한다</small>
```sql
MariaDB [sample]> source c:\mariadb\ex01.sql
+----------------------------+
| sal * 12 + ifnull(null, 0) |
+----------------------------+
|                   19200.00 |
|                   15000.00 |
|                   15000.00 |
|                   34200.00 |
|                   18000.00 |
|                   11400.00 |
+----------------------------+
6 rows in set (0.001 sec)
```

