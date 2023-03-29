
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

    <b><small> 장부 &rarr; 프로그램화(ERP) &rarr; Extended ERP</small></b>
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

  <samll>!! https://www.w3schools.com/sql/default.asp 참조</small>
- DBMS에 명령을 주고 바로 결과를 얻는 대화식 언어


- DBMS 제작회사와 독립적으로 ANSI 표준을 따른다

  <small>!! DBMS 제작회사는 표준 SQL을 확장해 사용한다</small>

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

- 서버 확인 방법

  <b>1<sub>st</sub> .</b> 컴퓨터 관리

  <b>2<sub>nd</sub> .</b> 서비스

  <b>3<sub>rd</sub> .</b> MariaDB

- 클라이언트 관리자로 서버 접속 방법
```sql
-- Command Prompt(MariaDB)

> mysql -h 192.168.0.87 -u root -p
-- -h 옵션은 ip, -u 옵션은 사용자, root는 관리자(사용자), -p 옵션은 패스워드를 의미한다
-- ip를 따로 설정하지 않으면 내 컴퓨터의 ip에 접속한다
-- 세미콜론(;)을 붙히지 않는 것에 주의하자
> Enter password:******
-- > mysql -u root -p123456
-- -p 옵션 뒤에 바로 암호를 써도 되지만 암호가 노출되기 때문에 지양한다
-- -p 옵션 뒤에 데이터베이스 이름을 입력하면 암호 입력후 바로 그 데이터베이스에 접속한다
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

> use DBsample;
-- 사용중인 데이터베이스를 DBsample로 바꾼다

> show tables;
-- 사용중인 데이터베이스의 테이블 목록을 보여준다

> describe user;
-- > desc user;
-- user 테이블에 있는 컬럼(열)의 정보를 보여준다
```
##### DML 기본 명령어

- 데이터베이스의 데이터를 조작한다

- select, insert, update, delete

```sql
-- 대소문자 구별을 하지 않는다
-- 공백은 사용할 수 없고, 사용할 경우 작은 따옴표를 이용해 묶어주어야 한다

MariaDB [sample]> select columName1 from tableName1;
-- select는 컬럼별 데이터를 보여준다

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
-- '%'는 임의의 문자 집합을 의미한다(공집합도 가능하다)
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
-- deptno 컬럼이 갖고 있는 값을 모두 확인한다
+--------+
| deptno |
+--------+
|     20 |
|     30 |
|     10 |
+--------+
3 rows in set (0.007 sec)

MariaDB [sample]> select distinct job from emp;
-- job 컬럼이 갖고 있는 값을 모두 확인한다
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
-- deptno, job을 한 쌍의 값으로 볼 때 중복이 되지 않는 값을 모두 확인한다
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
- 시스템 정보에 관한 함수

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
- 숫자에 관련된 함수
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
- 문자열에 관련된 함수
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
- 날짜, 시간에 관련된 함수
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

###### Control function

- 제어문에 관련된 함수

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
-- 주로 산술 연산자와 같이 쓰인다
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

MariaDB [sample]> select empno, ename, sal, comm, sal * 12, sal * 12 + ifnull(comm, 0) '연봉' from emp;
+-------+--------+---------+---------+----------+----------+
| empno | ename  | sal     | comm    | sal*12   | 연봉     |
+-------+--------+---------+---------+----------+----------+
|  7369 | SMITH  |  800.00 |    NULL |  9600.00 |  9600.00 |
|  7499 | ALLEN  | 1600.00 |  300.00 | 19200.00 | 19500.00 |
|  7521 | WARD   | 1250.00 |  500.00 | 15000.00 | 15500.00 |
|  7566 | JONES  | 2975.00 |    NULL | 35700.00 | 35700.00 |
|  7654 | MARTIN | 1250.00 | 1400.00 | 15000.00 | 16400.00 |
|  7698 | BLAKE  | 2850.00 |    NULL | 34200.00 | 34200.00 |
|  7782 | CLARK  | 2450.00 |    NULL | 29400.00 | 29400.00 |
|  7788 | SCOTT  | 3000.00 |    NULL | 36000.00 | 36000.00 |
|  7839 | KING   | 5000.00 |    NULL | 60000.00 | 60000.00 |
|  7844 | TURNER | 1500.00 |    0.00 | 18000.00 | 18000.00 |
|  7876 | ADAMS  | 1100.00 |    NULL | 13200.00 | 13200.00 |
|  7900 | JAMES  |  950.00 |    NULL | 11400.00 | 11400.00 |
|  7902 | FORD   | 3000.00 |    NULL | 36000.00 | 36000.00 |
|  7934 | MILLER | 1300.00 |    NULL | 15600.00 | 15600.00 |
+-------+--------+---------+---------+----------+----------+
14 rows in set (0.001 sec)
```
```sql
MariaDB [sample]> select case 1
    -> when 1 then 'one'
    -> when 2 then 'two'
    -> else 'more'
    -> end;
+------------------------------------------------------------+
| case 1
when 1 then 'one'
when 2 then 'two'
else 'more'
end |
+------------------------------------------------------------+
| one                                                        |
+------------------------------------------------------------+
1 row in set (0.011 sec)

MariaDB [sample]> select empno, ename, case job
-- case를 이용해 하나의 컬럼을 확인하는 것이기 때문에 반드시 쉼표(,)로 구분해줘야 한다
    -> when 'clerk' then '사원'
    -> when 'analyst' then '분석'
    -> when 'manager' then '관리'
    -> when 'president' then '대표'
    -> else '영업'
    -> end 'job'
    -- end 뒤에는 결과에서 보일 컬럼명을 적어준다
    -> from emp;
+-------+--------+--------+
| empno | ename  | job    |
+-------+--------+--------+
|  7369 | SMITH  | 사원   |
|  7499 | ALLEN  | 영업   |
|  7521 | WARD   | 영업   |
|  7566 | JONES  | 관리   |
|  7654 | MARTIN | 영업   |
|  7698 | BLAKE  | 관리   |
|  7782 | CLARK  | 관리   |
|  7788 | SCOTT  | 분석   |
|  7839 | KING   | 대표   |
|  7844 | TURNER | 영업   |
|  7876 | ADAMS  | 사원   |
|  7900 | JAMES  | 사원   |
|  7902 | FORD   | 분석   |
|  7934 | MILLER | 사원   |
+-------+--------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select ename, deptno, case deptno
    -> when 10 then '회계'
    -> when 20 then '조사'
    -> when 30 then '영업'
    -> when 40 then '총무'
    -> end 'dename'
    -- dename이 컬럼명으로 나온다
    -> from emp;
+--------+--------+--------+
| ename  | deptno | dename |
+--------+--------+--------+
| SMITH  |     20 | 조사   |
| ALLEN  |     30 | 영업   |
| WARD   |     30 | 영업   |
| JONES  |     20 | 조사   |
| MARTIN |     30 | 영업   |
| BLAKE  |     30 | 영업   |
| CLARK  |     10 | 회계   |
| SCOTT  |     20 | 조사   |
| KING   |     10 | 회계   |
| TURNER |     30 | 영업   |
| ADAMS  |     20 | 조사   |
| JAMES  |     30 | 영업   |
| FORD   |     20 | 조사   |
| MILLER |     10 | 회계   |
+--------+--------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal, case deptno
    -> when 10 then sal * 1.1
    -> when 20 then sal * 1.2
    -> when 30 then sal * 1.3
    -> when 40 then sal
    -> end '인상급여'
    -> from emp;
+-------+--------+---------+--------------+
| empno | ename  | sal     | 인상급여     |
+-------+--------+---------+--------------+
|  7369 | SMITH  |  800.00 |      960.000 |
|  7499 | ALLEN  | 1600.00 |     2080.000 |
|  7521 | WARD   | 1250.00 |     1625.000 |
|  7566 | JONES  | 2975.00 |     3570.000 |
|  7654 | MARTIN | 1250.00 |     1625.000 |
|  7698 | BLAKE  | 2850.00 |     3705.000 |
|  7782 | CLARK  | 2450.00 |     2695.000 |
|  7788 | SCOTT  | 3000.00 |     3600.000 |
|  7839 | KING   | 5000.00 |     5500.000 |
|  7844 | TURNER | 1500.00 |     1950.000 |
|  7876 | ADAMS  | 1100.00 |     1320.000 |
|  7900 | JAMES  |  950.00 |     1235.000 |
|  7902 | FORD   | 3000.00 |     3600.000 |
|  7934 | MILLER | 1300.00 |     1430.000 |
+-------+--------+---------+--------------+
14 rows in set (0.000 sec)
```

- 외부에 만들어 놓은 .sql 파일 사용하기

  <small>!! .sql 파일은 utf-8형식으로 저장되어 있어야 다국어가 깨지지 않는다</small>
```sql
-- c:\mariadb\ex01.sql

select sal * 12 + ifnull(null, 0) from emp;
```
```sql
MariaDB [sample]> source c:\mariadb\ex01.sql
-- 끝에 세미콜론(;) 붙히지 않는 것에 주의하자
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
###### 그룹형 함수

- 그룹별 데이터에 대한 함수

```sql
MariaDB [sample]> select count(empno) from emp;
-- null 값을 가진 데이터를 제외한 empno 칼럼의 데이터 개수를 출력한다
+--------------+
| count(empno) |
+--------------+
|           14 |
+--------------+
1 row in set (0.025 sec)

MariaDB [sample]> select count(empno) from emp where deptno = 30;
+--------------+
| count(empno) |
+--------------+
|            6 |
+--------------+
1 row in set (0.000 sec)

MariaDB [sample]> select count(empno), count(comm) from emp;
-- null 값을 가진 데이터는 빼고 세기 때문에 값이 다르게 나온다
+--------------+-------------+
| count(empno) | count(comm) |
+--------------+-------------+
|           14 |           4 |
+--------------+-------------+
1 row in set (0.000 sec)

MariaDB [sample]> select count(*) from emp;
-- null 값을 가진 데이터를 세지 않기 때문에 특정 컬럼명을 쓰지 않고 '*'를 사용해서 데이터 
개수를 확인한다
-- '*'를 사용하면 각 컬럼 별 데이터 개수 중 최대값을 출력한다
+----------+
| count(*) |
+----------+
|       14 |
+----------+
1 row in set (0.001 sec)
```


!! 모르는 데이터베이스에 접근했을 때,

<b>1<sub>st</sub> .</b> describe로 컬럼파악하기

<b>2<sub>nd</sub> .</b> count로 데이터 개수 파악하기

<b>3<sub>rd</sub> .</b> limit을 이용해 일부 데이터만 확인하기

```sql
MariaDB [sample]> select max(sal), min(sal) from emp;
+----------+----------+
| max(sal) | min(sal) |
+----------+----------+
|  5000.00 |   800.00 |
+----------+----------+
1 row in set (0.008 sec)

MariaDB [sample]> select max(sal), ename from emp;
-- 에러 !! 컬럼별로 각각 계산이 되는 것이기 때문에 최대 급여를 받는 직원은 king인데 smith로 나온다
+----------+-------+
| max(sal) | ename |
+----------+-------+
|  5000.00 | SMITH |
+----------+-------+
1 row in set (0.000 sec)

MariaDB [sample]> select sum(comm) from emp;
+-----------+
| sum(comm) |
+-----------+
|   2200.00 |
+-----------+
1 row in set (0.011 sec)

MariaDB [sample]> select avg(comm), sum(comm) / count(*) from emp;
-- avg는 null 값을 가진 데이터는 배제하고 평균을 내기 때문에 결과의 차이가 있다
+------------+----------------------+
| avg(comm)  | sum(comm) / count(*) |
+------------+----------------------+
| 550.000000 |           157.142857 |
+------------+----------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select avg(comm), sum(comm) / count(comm) from emp;
+------------+-------------------------+
| avg(comm)  | sum(comm) / count(comm) |
+------------+-------------------------+
| 550.000000 |              550.000000 |
+------------+-------------------------+
1 row in set (0.000 sec)

MariaDB [sample]> select avg(ifnull(comm,0)) from emp;
+---------------------+
| avg(ifnull(comm,0)) |
+---------------------+
|          157.142857 |
+---------------------+
1 row in set (0.001 sec)
```
```sql
MariaDB [sample]> select count(*) from emp group by deptno;
-- deptno 별 데이터 갯수를 확인한다
+----------+
| count(*) |
+----------+
|        3 |
|        5 |
|        6 |
+----------+
3 rows in set (0.018 sec)

MariaDB [sample]> select deptno, count(*) from emp group by deptno;
-- group by를 사용해서 그룹화가 먼저 되기 때문에 첫번째, 두번째 컬럼이 관계를 갖는다
+--------+----------+
| deptno | count(*) |
+--------+----------+
|     10 |        3 |
|     20 |        5 |
|     30 |        6 |
+--------+----------+
3 rows in set (0.000 sec)

MariaDB [sample]> select deptno, max(sal) from emp group by deptno;
+--------+----------+
| deptno | max(sal) |
+--------+----------+
|     10 |  5000.00 |
|     20 |  3000.00 |
|     30 |  2850.00 |
+--------+----------+
3 rows in set (0.013 sec)

MariaDB [sample]> select deptno, max(sal), ename from emp group by deptno;
-- ename으로 그룹화 된 것이 아니기 때문에 세번째 컬럼은 나머지 다른 두개의 컬럼과 관계를 갖지 않는다
+--------+----------+-------+
| deptno | max(sal) | ename |
+--------+----------+-------+
|     10 |  5000.00 | CLARK |
|     20 |  3000.00 | SMITH |
|     30 |  2850.00 | ALLEN |
+--------+----------+-------+
3 rows in set (0.001 sec)

MariaDB [sample]> select job, avg(sal) from emp group by job;
+-----------+-------------+
| job       | avg(sal)    |
+-----------+-------------+
| ANALYST   | 3000.000000 |
| CLERK     | 1037.500000 |
| MANAGER   | 2758.333333 |
| PRESIDENT | 5000.000000 |
| SALESMAN  | 1400.000000 |
+-----------+-------------+
5 rows in set (0.001 sec)

MariaDB [sample]> select deptno, job, sum(sal) from emp group by deptno, job;
-- 컬럼을 묶어서 그룹화 시키는 것도 가능하다
-- group by를 사용하면 자동 정렬된 형태로 결과가 나타난다
+--------+-----------+----------+
| deptno | job       | sum(sal) |
+--------+-----------+----------+
|     10 | CLERK     |  1300.00 |
|     10 | MANAGER   |  2450.00 |
|     10 | PRESIDENT |  5000.00 |
|     20 | ANALYST   |  6000.00 |
|     20 | CLERK     |  1900.00 |
|     20 | MANAGER   |  2975.00 |
|     30 | CLERK     |   950.00 |
|     30 | MANAGER   |  2850.00 |
|     30 | SALESMAN  |  5600.00 |
+--------+-----------+----------+
9 rows in set (0.001 sec)

MariaDB [sample]> select deptno, job, sum(sal) from emp
    -> where sum(sal) >= 2000 group by deptno, job;
ERROR 1111 (HY000): Invalid use of group function
-- where에 그룹화 함수를 사용한 경우, group by를 사용할 수 없다

MariaDB [sample]> select deptno, job, sum(sal) 
    -> from emp where sal >= 2000 group by deptno, job;
-- where에 그룹화 함수를 사용하지 않는 경우에는 group by 사용이 가능하다
-- 조건에 맞는 데이터를 걸러낸 다음 그룹화를 진행하는 순서를 가진다
+--------+-----------+----------+
| deptno | job       | sum(sal) |
+--------+-----------+----------+
|     10 | MANAGER   |  2450.00 |
|     10 | PRESIDENT |  5000.00 |
|     20 | ANALYST   |  6000.00 |
|     20 | MANAGER   |  2975.00 |
|     30 | MANAGER   |  2850.00 |
+--------+-----------+----------+
5 rows in set (0.001 sec)

MariaDB [sample]> select deptno, job, sum(sal) from emp
    -> group by deptno, job having sum(sal) >= 2000;
-- 그룹화를 시키고 그룹화 함수를 사용한 조건에 부합하는 결과만 보이고 싶을 때는 group by 뒤에 having을 사용한다
-- 그룹화를 먼저 하고 난 뒤 조건에 해당되는 데이터를 걸러낸다
+--------+-----------+----------+
| deptno | job       | sum(sal) |
+--------+-----------+----------+
|     10 | MANAGER   |  2450.00 |
|     10 | PRESIDENT |  5000.00 |
|     20 | ANALYST   |  6000.00 |
|     20 | MANAGER   |  2975.00 |
|     30 | MANAGER   |  2850.00 |
|     30 | SALESMAN  |  5600.00 |
+--------+-----------+----------+
6 rows in set (0.011 sec)

MariaDB [sample]> select deptno, case deptno
    -> when 10 then '회계'
    -> when 20 then '조사'
    -> when 30 then '영업'
    -> else '총무'
    -> end 'dename'
    -> , count(deptno) '인원수'
    -> from emp
    -> group by deptno
    -> having count(deptno) >= 6;
+--------+--------+-----------+
| deptno | dename | 인원수    |
+--------+--------+-----------+
|     30 | 영업   |         6 |
+--------+--------+-----------+
1 row in set (0.000 sec)
```
##### 서브 쿼리

- 중첩된 쿼리

  <sup>ex) 최고 급여를 받는 사원정보 출력</sup>

  <sup>ex) scott의 보다 많은 급여를 받는 사원정보 출력</sup>

- 구분

  - 단일행 : 하나의 결과를 가지고 다시 쿼리

    <small>!! 단일행 서브 쿼리에서는 비교연산자만 사용할 수 있다</small>

  - 복수행 : 여러 데이터의 결과를 가지고 다시 쿼리

###### 단일행 서브쿼리
- 비교 연산자를 사용한다

```sql
MariaDB [sample]> select ename, sal from emp
    -> where sal > (select sal from emp where ename = 'scott');
-- scott의 급여를 먼저 구하고
-- scott의 급여보다 높은 급여를 받는 사원정보를 보여준다
-- 단일행 서브 쿼리
+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
+-------+---------+
1 row in set (0.000 sec)

MariaDB [sample]> select ename, sal from emp
    -> where sal = (select max(sal) from emp);
-- 최고 급여를 먼저 구하고
-- 급여가 최고 급여인 사원정보를 보여준다
+-------+---------+
| ename | sal     |
+-------+---------+
| KING  | 5000.00 |
+-------+---------+
1 row in set (0.000 sec)
```
###### 복수형 서브 쿼리

- 연산자로 "in ,< All, > All, < Any, > Any"를 사용한다
```sql
MariaDB [sample]> select deptno, ename, sal from emp
    -> where sal in (select max(sal) from emp group by deptno);
-- 부서별 최고 급여를 받는 사원 정보 확인
-- 여러 데이터(복수)의 결과를 가지고 쿼리는 in을 사용한다
-- 복수형 서브쿼리
+--------+-------+---------+
| deptno | ename | sal     |
+--------+-------+---------+
|     30 | BLAKE | 2850.00 |
|     20 | SCOTT | 3000.00 |
|     10 | KING  | 5000.00 |
|     20 | FORD  | 3000.00 |
+--------+-------+---------+
4 rows in set (0.001 sec)

MariaDB [sample]> select ename, job from emp
    -> where job in (select distinct job from emp where deptno = 20);
-- 20번 부서에 속한 직원의 직책과 같은 사원의 정보 확인
-- distinct를 사용해 중복되는 값을 제거했다
+--------+---------+
| ename  | job     |
+--------+---------+
| SMITH  | CLERK   |
| JONES  | MANAGER |
| BLAKE  | MANAGER |
| CLARK  | MANAGER |
| SCOTT  | ANALYST |
| ADAMS  | CLERK   |
| JAMES  | CLERK   |
| FORD   | ANALYST |
| MILLER | CLERK   |
+--------+---------+
9 rows in set (0.001 sec)


MariaDB [sample]> select ename, sal from emp
    -> where sal > All(select sal from emp where job = 'manager');
-- 서브 쿼리의 모든 리턴값보다 큰 값을 구하고 싶을 때는 '> All(subquery)'를 사용한다 
-- 서브 쿼리의 리턴값 중 최대값보다 큰 값을 구하는 것과 같다
+-------+---------+
| ename | sal     |
+-------+---------+
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
3 rows in set (0.000 sec)


MariaDB [sample]> select ename, sal from emp
    -> where sal < Any(select sal from emp where job = 'manager');
-- 서브 쿼리의 리턴값 중 최대값보다 작은 값을 구하고 싶을 때는 '< Any(subquery)'를 사용한다
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| MILLER | 1300.00 |
+--------+---------+
10 rows in set (0.001 sec)


MariaDB [sample]> select ename, sal from emp
    -> where sal < All(select avg(sal) from emp group by deptno);
-- 서브 쿼리의 모든 리턴값보다 작은 값을 구하고 싶을 때는 '< All(subquery)'를 사용한다
-- 서브 쿼리의 최솟값보다 작은 값을 구하는 것과 같다
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| MILLER | 1300.00 |
+--------+---------+
7 rows in set (0.001 sec)

MariaDB [sample]> select ename, sal from emp
    -> where sal > Any (select sal from emp where job = 'clerk');
-- 서브 쿼리의 리턴값 중 최솟값 보다 큰 값을 구하고 싶을 때는 '> Any(subquery)'를 사용한다
+--------+---------+
| ename  | sal     |
+--------+---------+
| ALLEN  | 1600.00 |
| WARD   | 1250.00 |
| JONES  | 2975.00 |
| MARTIN | 1250.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| SCOTT  | 3000.00 |
| KING   | 5000.00 |
| TURNER | 1500.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| FORD   | 3000.00 |
| MILLER | 1300.00 |
+--------+---------+
13 rows in set (0.001 sec)

```
##### 테이블 병합(relation, join)
- 테이블끼리 연결시켜 데이터 조작을 할 수 있다
###### EQUI JOIN
- 테이블끼리 기준이 되는 컬럼이 있다면 연결시킬 수 있다
```sql
MariaDB [sample]> select * from emp cross join dept limit 4;
-- deptno가 기준이 되는 컬럼
-- cross join을 사용해 테이블끼리 곱해서 연결 시킨다
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
| empno | ename | job   | mgr  | hiredate   | sal    | comm | deptno | deptno | dname      | loc      |
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     10 | ACCOUNTING | NEW YORK |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     30 | SALES      | CHICAGO  |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     40 | OPERATIONS | BOSTON   |
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
4 rows in set (0.000 sec)

MariaDB [sample]> select * from emp inner join dept limit 4;
-- inner join을 사용할 수도 있다
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
| empno | ename | job   | mgr  | hiredate   | sal    | comm | deptno | deptno | dname      | loc      |
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     10 | ACCOUNTING | NEW YORK |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     30 | SALES      | CHICAGO  |
|  7369 | SMITH | CLERK | 7902 | 2010-12-17 | 800.00 | NULL |     20 |     40 | OPERATIONS | BOSTON   |
+-------+-------+-------+------+------------+--------+------+--------+--------+------------+----------+
4 rows in set (0.000 sec)

MariaDB [sample]> select * from emp inner join dept where emp.deptno = dept.deptno;
-- 테이블을 연결시킨 뒤, 조건을 줘서 원하는 정보만 얻을 수 있다
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno | deptno | dname      | loc      |
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
|  7369 | SMITH  | CLERK     | 7902 | 2010-12-17 |  800.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | SALESMAN  | 7698 | 2011-02-20 | 1600.00 |  300.00 |     30 |     30 | SALES      | CHICAGO  |
|  7521 | WARD   | SALESMAN  | 7698 | 2011-02-22 | 1250.00 |  500.00 |     30 |     30 | SALES      | CHICAGO  |
|  7566 | JONES  | MANAGER   | 7839 | 2011-04-02 | 2975.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7654 | MARTIN | SALESMAN  | 7698 | 2011-09-28 | 1250.00 | 1400.00 |     30 |     30 | SALES      | CHICAGO  |
|  7698 | BLAKE  | MANAGER   | 7839 | 2011-05-01 | 2850.00 |    NULL |     30 |     30 | SALES      | CHICAGO  |
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
|  7788 | SCOTT  | ANALYST   | 7566 | 2017-07-13 | 3000.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
|  7844 | TURNER | SALESMAN  | 7698 | 2011-09-08 | 1500.00 |    0.00 |     30 |     30 | SALES      | CHICAGO  |
|  7876 | ADAMS  | CLERK     | 7788 | 2017-07-13 | 1100.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7900 | JAMES  | CLERK     | 7698 | 2011-12-03 |  950.00 |    NULL |     30 |     30 | SALES      | CHICAGO  |
|  7902 | FORD   | ANALYST   | 7566 | 2011-12-03 | 3000.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
14 rows in set (0.001 sec)

MariaDB [sample]> select * from emp e inner join dept d where e.deptno = d.deptno;
-- 테이블 별칭을 사용할 수도 있다
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm    | deptno | deptno | dname      | loc      |
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
|  7369 | SMITH  | CLERK     | 7902 | 2010-12-17 |  800.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | SALESMAN  | 7698 | 2011-02-20 | 1600.00 |  300.00 |     30 |     30 | SALES      | CHICAGO  |
|  7521 | WARD   | SALESMAN  | 7698 | 2011-02-22 | 1250.00 |  500.00 |     30 |     30 | SALES      | CHICAGO  |
|  7566 | JONES  | MANAGER   | 7839 | 2011-04-02 | 2975.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7654 | MARTIN | SALESMAN  | 7698 | 2011-09-28 | 1250.00 | 1400.00 |     30 |     30 | SALES      | CHICAGO  |
|  7698 | BLAKE  | MANAGER   | 7839 | 2011-05-01 | 2850.00 |    NULL |     30 |     30 | SALES      | CHICAGO  |
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
|  7788 | SCOTT  | ANALYST   | 7566 | 2017-07-13 | 3000.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
|  7844 | TURNER | SALESMAN  | 7698 | 2011-09-08 | 1500.00 |    0.00 |     30 |     30 | SALES      | CHICAGO  |
|  7876 | ADAMS  | CLERK     | 7788 | 2017-07-13 | 1100.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7900 | JAMES  | CLERK     | 7698 | 2011-12-03 |  950.00 |    NULL |     30 |     30 | SALES      | CHICAGO  |
|  7902 | FORD   | ANALYST   | 7566 | 2011-12-03 | 3000.00 |    NULL |     20 |     20 | RESEARCH   | DALLAS   |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 |    NULL |     10 |     10 | ACCOUNTING | NEW YORK |
+-------+--------+-----------+------+------------+---------+---------+--------+--------+------------+----------+
14 rows in set (0.009 sec)

MariaDB [sample]> select empno, ename, dname, loc, e.deptno
    -> from emp e inner join dept d
    -> where e.deptno = d.deptno;
-- deptno는 emp, dept 테이블이 모두 갖고 있기 때문에 deptno 컬럼을 보려면 컬럼명에 어떤 테이블의 컬럼을 가져 올지 명시해야 한다
+-------+--------+------------+----------+--------+
| empno | ename  | dname      | loc      | deptno |
+-------+--------+------------+----------+--------+
|  7369 | SMITH  | RESEARCH   | DALLAS   |     20 |
|  7499 | ALLEN  | SALES      | CHICAGO  |     30 |
|  7521 | WARD   | SALES      | CHICAGO  |     30 |
|  7566 | JONES  | RESEARCH   | DALLAS   |     20 |
|  7654 | MARTIN | SALES      | CHICAGO  |     30 |
|  7698 | BLAKE  | SALES      | CHICAGO  |     30 |
|  7782 | CLARK  | ACCOUNTING | NEW YORK |     10 |
|  7788 | SCOTT  | RESEARCH   | DALLAS   |     20 |
|  7839 | KING   | ACCOUNTING | NEW YORK |     10 |
|  7844 | TURNER | SALES      | CHICAGO  |     30 |
|  7876 | ADAMS  | RESEARCH   | DALLAS   |     20 |
|  7900 | JAMES  | SALES      | CHICAGO  |     30 |
|  7902 | FORD   | RESEARCH   | DALLAS   |     20 |
|  7934 | MILLER | ACCOUNTING | NEW YORK |     10 |
+-------+--------+------------+----------+--------+
14 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, dname, loc, e.deptno
    -> from emp e inner join dept d
    -> where e.deptno = d.deptno and e.deptno = 10;
-- 어떤 것이 join 조건인지 모호하다
+-------+--------+------------+----------+--------+
| empno | ename  | dname      | loc      | deptno |
+-------+--------+------------+----------+--------+
|  7782 | CLARK  | ACCOUNTING | NEW YORK |     10 |
|  7839 | KING   | ACCOUNTING | NEW YORK |     10 |
|  7934 | MILLER | ACCOUNTING | NEW YORK |     10 |
+-------+--------+------------+----------+--------+
3 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, dname, loc, e.deptno
    -> from emp e inner join dept d
    -> on (e.deptno = d.deptno)
    -> where e.deptno = 10;
-- on에 join 조건을 주고 where에는 행 제한 조건을 줘서 모호한 표현을 피할 수 있다
+-------+--------+------------+----------+--------+
| empno | ename  | dname      | loc      | deptno |
+-------+--------+------------+----------+--------+
|  7782 | CLARK  | ACCOUNTING | NEW YORK |     10 |
|  7839 | KING   | ACCOUNTING | NEW YORK |     10 |
|  7934 | MILLER | ACCOUNTING | NEW YORK |     10 |
+-------+--------+------------+----------+--------+
3 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal, dname, loc
    -> from emp e cross join dept d
    -> on (e.deptno = d.deptno)
    -> where job = 'clerk';
+-------+--------+---------+------------+----------+
| empno | ename  | sal     | dname      | loc      |
+-------+--------+---------+------------+----------+
|  7369 | SMITH  |  800.00 | RESEARCH   | DALLAS   |
|  7876 | ADAMS  | 1100.00 | RESEARCH   | DALLAS   |
|  7900 | JAMES  |  950.00 | SALES      | CHICAGO  |
|  7934 | MILLER | 1300.00 | ACCOUNTING | NEW YORK |
+-------+--------+---------+------------+----------+
4 rows in set (0.000 sec)
```
###### NON-EQUI JOIN
- 기준이 되는 컬럼이 없어도 테이블을 연결시켜 사용할 수 있다
```sql
MariaDB [sample]> select * from emp e inner join salgrade s
    -> on (e.sal >= s.losal and e.sal <= s.hisal)
    -> where deptno = 10;
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm | deptno | grade | losal   | hisal   |
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 | NULL |     10 |     4 | 2001.00 | 3000.00 |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 | NULL |     10 |     5 | 3001.00 | 9999.00 |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 | NULL |     10 |     2 | 1201.00 | 1400.00 |
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
3 rows in set (0.001 sec)

MariaDB [sample]> select * from emp e inner join salgrade s
    -> on (e.sal between s.losal and s.hisal)
    -> where e.deptno = 10;
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm | deptno | grade | losal   | hisal   |
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
|  7782 | CLARK  | MANAGER   | 7839 | 2011-06-09 | 2450.00 | NULL |     10 |     4 | 2001.00 | 3000.00 |
|  7839 | KING   | PRESIDENT | NULL | 2011-11-17 | 5000.00 | NULL |     10 |     5 | 3001.00 | 9999.00 |
|  7934 | MILLER | CLERK     | 7782 | 2012-01-23 | 1300.00 | NULL |     10 |     2 | 1201.00 | 1400.00 |
+-------+--------+-----------+------+------------+---------+------+--------+-------+---------+---------+
3 rows in set (0.000 sec)

MariaDB [sample]> select empno, ename, sal, grade, hiredate
    -> from emp e inner join salgrade s
    -> on (e.sal between s.losal and s.hisal)
    -> where hiredate like '2011%';
+-------+--------+---------+-------+------------+
| empno | ename  | sal     | grade | hiredate   |
+-------+--------+---------+-------+------------+
|  7499 | ALLEN  | 1600.00 |     3 | 2011-02-20 |
|  7521 | WARD   | 1250.00 |     2 | 2011-02-22 |
|  7566 | JONES  | 2975.00 |     4 | 2011-04-02 |
|  7654 | MARTIN | 1250.00 |     2 | 2011-09-28 |
|  7698 | BLAKE  | 2850.00 |     4 | 2011-05-01 |
|  7782 | CLARK  | 2450.00 |     4 | 2011-06-09 |
|  7839 | KING   | 5000.00 |     5 | 2011-11-17 |
|  7844 | TURNER | 1500.00 |     3 | 2011-09-08 |
|  7900 | JAMES  |  950.00 |     1 | 2011-12-03 |
|  7902 | FORD   | 3000.00 |     4 | 2011-12-03 |
+-------+--------+---------+-------+------------+
10 rows in set (0.001 sec)
```
!! 세 개 이상의 테이블도 연결시킬 수 있다
```sql
MariaDB [sample]> select e.empno, e.ename, e.sal, s.grade, d.dname, d.loc
    -> from emp e inner join dept d
    -> on (e.deptno = d.deptno)
    -> inner join salgrade s
    -> on (e.sal between s.losal and s.hisal);
+-------+--------+---------+-------+------------+----------+
| empno | ename  | sal     | grade | dname      | loc      |
+-------+--------+---------+-------+------------+----------+
|  7369 | SMITH  |  800.00 |     1 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | 1600.00 |     3 | SALES      | CHICAGO  |
|  7521 | WARD   | 1250.00 |     2 | SALES      | CHICAGO  |
|  7566 | JONES  | 2975.00 |     4 | RESEARCH   | DALLAS   |
|  7654 | MARTIN | 1250.00 |     2 | SALES      | CHICAGO  |
|  7698 | BLAKE  | 2850.00 |     4 | SALES      | CHICAGO  |
|  7782 | CLARK  | 2450.00 |     4 | ACCOUNTING | NEW YORK |
|  7788 | SCOTT  | 3000.00 |     4 | RESEARCH   | DALLAS   |
|  7839 | KING   | 5000.00 |     5 | ACCOUNTING | NEW YORK |
|  7844 | TURNER | 1500.00 |     3 | SALES      | CHICAGO  |
|  7876 | ADAMS  | 1100.00 |     1 | RESEARCH   | DALLAS   |
|  7900 | JAMES  |  950.00 |     1 | SALES      | CHICAGO  |
|  7902 | FORD   | 3000.00 |     4 | RESEARCH   | DALLAS   |
|  7934 | MILLER | 1300.00 |     2 | ACCOUNTING | NEW YORK |
+-------+--------+---------+-------+------------+----------+
14 rows in set (0.001 sec)

MariaDB [sample]> select e.empno, e.ename, e.sal, s.grade, d.dname, d.loc
    -> from emp e inner join dept d inner join salgrade s
    -> on (e.deptno = d.deptno and e.sal between s.losal and s.hisal);
+-------+--------+---------+-------+------------+----------+
| empno | ename  | sal     | grade | dname      | loc      |
+-------+--------+---------+-------+------------+----------+
|  7369 | SMITH  |  800.00 |     1 | RESEARCH   | DALLAS   |
|  7499 | ALLEN  | 1600.00 |     3 | SALES      | CHICAGO  |
|  7521 | WARD   | 1250.00 |     2 | SALES      | CHICAGO  |
|  7566 | JONES  | 2975.00 |     4 | RESEARCH   | DALLAS   |
|  7654 | MARTIN | 1250.00 |     2 | SALES      | CHICAGO  |
|  7698 | BLAKE  | 2850.00 |     4 | SALES      | CHICAGO  |
|  7782 | CLARK  | 2450.00 |     4 | ACCOUNTING | NEW YORK |
|  7788 | SCOTT  | 3000.00 |     4 | RESEARCH   | DALLAS   |
|  7839 | KING   | 5000.00 |     5 | ACCOUNTING | NEW YORK |
|  7844 | TURNER | 1500.00 |     3 | SALES      | CHICAGO  |
|  7876 | ADAMS  | 1100.00 |     1 | RESEARCH   | DALLAS   |
|  7900 | JAMES  |  950.00 |     1 | SALES      | CHICAGO  |
|  7902 | FORD   | 3000.00 |     4 | RESEARCH   | DALLAS   |
|  7934 | MILLER | 1300.00 |     2 | ACCOUNTING | NEW YORK |
+-------+--------+---------+-------+------------+----------+
14 rows in set (0.001 sec)
```
###### OUTER-JOIN
- join 조건에 해당되지 않더라도 중심이 되는 테이블의 데이터는 모두 출력하게 한다

  <small>!! 이때, 중심이 되는 테이블에서 결과값이 없는 컬럼의 값은 null이다</small>

- 구분
  - right outer join : 'right outer join'을 중심으로 오른쪽 테이블의 레코드를 중심으로 한다

  - left outer join : 'left outer join'을 중심으로 왼쪽 테이블의 레코드를 중심으로 한다

  - full outer join

```sql
MariaDB [sample]> select d.deptno, d.dname, e.empno, e.ename
    -> from emp e right outer join dept d
    -> on (e.deptno = d.deptno);
+--------+------------+-------+--------+
| deptno | dname      | empno | ename  |
+--------+------------+-------+--------+
|     20 | RESEARCH   |  7369 | SMITH  |
|     30 | SALES      |  7499 | ALLEN  |
|     30 | SALES      |  7521 | WARD   |
|     20 | RESEARCH   |  7566 | JONES  |
|     30 | SALES      |  7654 | MARTIN |
|     30 | SALES      |  7698 | BLAKE  |
|     10 | ACCOUNTING |  7782 | CLARK  |
|     20 | RESEARCH   |  7788 | SCOTT  |
|     10 | ACCOUNTING |  7839 | KING   |
|     30 | SALES      |  7844 | TURNER |
|     20 | RESEARCH   |  7876 | ADAMS  |
|     30 | SALES      |  7900 | JAMES  |
|     20 | RESEARCH   |  7902 | FORD   |
|     10 | ACCOUNTING |  7934 | MILLER |
|     40 | OPERATIONS |  NULL | NULL   |
+--------+------------+-------+--------+
15 rows in set (0.013 sec)

MariaDB [sample]> select d.deptno, d.dname, e.empno, e.ename
    -> from dept d left outer join emp e
    -> on (e.deptno = d.deptno);
+--------+------------+-------+--------+
| deptno | dname      | empno | ename  |
+--------+------------+-------+--------+
|     20 | RESEARCH   |  7369 | SMITH  |
|     30 | SALES      |  7499 | ALLEN  |
|     30 | SALES      |  7521 | WARD   |
|     20 | RESEARCH   |  7566 | JONES  |
|     30 | SALES      |  7654 | MARTIN |
|     30 | SALES      |  7698 | BLAKE  |
|     10 | ACCOUNTING |  7782 | CLARK  |
|     20 | RESEARCH   |  7788 | SCOTT  |
|     10 | ACCOUNTING |  7839 | KING   |
|     30 | SALES      |  7844 | TURNER |
|     20 | RESEARCH   |  7876 | ADAMS  |
|     30 | SALES      |  7900 | JAMES  |
|     20 | RESEARCH   |  7902 | FORD   |
|     10 | ACCOUNTING |  7934 | MILLER |
|     40 | OPERATIONS |  NULL | NULL   |
+--------+------------+-------+--------+
15 rows in set (0.000 sec)

MariaDB [sample]> select d.deptno, d.dname, d.loc
    -> from dept d left outer join emp e
    -> on (e.deptno = d.deptno)
    -> where e.empno is null;
-- 사원이 없는 부서 출력
+--------+------------+--------+
| deptno | dname      | loc    |
+--------+------------+--------+
|     40 | OPERATIONS | BOSTON |
+--------+------------+--------+
1 row in set (0.000 sec)
```
###### SELF-JOIN
- 한 테이블 안에서 join을 사용해 내부 데이터를 연결 시켜 정보를 얻어낸다

```sql
MariaDB [sample]> select e.empno, e.ename '사원', e.mgr, m.ename '관리자'
    -> from emp e inner join emp m
    -> on (e.mgr = m.empno);
+-------+--------+------+-----------+
| empno | 사원   | mgr  | 관리자    |
+-------+--------+------+-----------+
|  7369 | SMITH  | 7902 | FORD      |
|  7499 | ALLEN  | 7698 | BLAKE     |
|  7521 | WARD   | 7698 | BLAKE     |
|  7566 | JONES  | 7839 | KING      |
|  7654 | MARTIN | 7698 | BLAKE     |
|  7698 | BLAKE  | 7839 | KING      |
|  7782 | CLARK  | 7839 | KING      |
|  7788 | SCOTT  | 7566 | JONES     |
|  7844 | TURNER | 7698 | BLAKE     |
|  7876 | ADAMS  | 7788 | SCOTT     |
|  7900 | JAMES  | 7698 | BLAKE     |
|  7902 | FORD   | 7566 | JONES     |
|  7934 | MILLER | 7782 | CLARK     |
+-------+--------+------+-----------+
13 rows in set (0.000 sec)

MariaDB [sample]> select e.empno, e.ename '사원', e.mgr, ifnull(m.ename,'관리자 없음') '관리자'
    -> from emp e left outer join emp m
    -> on (e.mgr = m.empno);
-- left outer join을 사용해 관리자 값이 null인 king까지 확인할 수 있다
+-------+--------+------+------------------+
| empno | 사원   | mgr  | 관리자           |
+-------+--------+------+------------------+
|  7369 | SMITH  | 7902 | FORD             |
|  7499 | ALLEN  | 7698 | BLAKE            |
|  7521 | WARD   | 7698 | BLAKE            |
|  7566 | JONES  | 7839 | KING             |
|  7654 | MARTIN | 7698 | BLAKE            |
|  7698 | BLAKE  | 7839 | KING             |
|  7782 | CLARK  | 7839 | KING             |
|  7788 | SCOTT  | 7566 | JONES            |
|  7839 | KING   | NULL | 관리자 없음      |
|  7844 | TURNER | 7698 | BLAKE            |
|  7876 | ADAMS  | 7788 | SCOTT            |
|  7900 | JAMES  | 7698 | BLAKE            |
|  7902 | FORD   | 7566 | JONES            |
|  7934 | MILLER | 7782 | CLARK            |
+-------+--------+------+------------------+
14 rows in set (0.014 sec)
```



