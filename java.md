## 프로그램 언어
- 컴파일 언어 : 소스 &rarr; 컴파일 &rarr;  실행파일 &rarr; 실행
  - 실행 속도가 빠르기 때문에 산업적인 일에 만히 쓰인다

    <sup>ex) C / C++ / Java</sup>

    - C : 실행속도가 가장 빠른 언어라 os에 주로 쓰인다

    - Java : 상대적으로 배우기 쉽고, C언어에 비해 개발이 편리해 많이 쓰인다
- 스크립트 언어 : 소스 &rarr; 실행
  - 컴파일 과정이 없고 코딩이 편리하기 때문에 교육에 많이 쓰인다

    <sup>ex) Javascript / python </sup>
    - python : 데이터 분석, 통계 쪽에 주로 쓰인다

--------------
# Java
- 준비 : JDK, 편집기

  - JDK(Java Development Kit) : 자바 프로그램 개발을 위해서 쓰인다
    - JRE(Java Runtime Environment) : 자바 구동 환경으로 JVM(Java Virtual Muchine), 시스템 라이브러리로 구성된다 

      <small>!! 자바 프로그램 개발이 아닌 이미 개발된 프로그램 단순 실행을 위해서는 JRE만 있어도 된다</small>
    - Oracle JDK 이외에도 openjdk 등 여러 곳에서 JDK를 제공한다

    - 컴파일러, 디버거 등의 개발도구

- 편집기
  - 메모장

  - VsCode

  - IDE (Intergrated Development Environment)
    - eclipse (전통)

    - intellij (최신)
- 자바 프로그램 실행절차<br><br>

<img src="https://mblogthumb-phinf.pstatic.net/20160912_214/it_sion_1473653250675llB1C_PNG/2.png?type=w800"><br>

- 자바 소스 코드 작성 시 주의사항
  - public 이 붙은 class 는 하나만 존재해야 한다

  - public class 가 있으면 소스파일 이름은 class 이름과 같아야 한다
  - 대/소문자 구분한다
  - 문장끝에 세미콜론(;)을 붙인다
  - 영역을 표시할 때 중괄호를 사용한다

- Java 기본 
```java
// 파일명 == public class 이름
public class HelloWorld {
    // main 메서드가 프로그램의 시작점이다
  public static void main(String[] args){
    // 내용 
    System.out.println("Hello world!"); 
  }
}
```
위의 자바 파일을 작성하고 CMD에서 실행
```java
> javac HelloWorld.java 
// 에러가 나오지 않으면 디렉터리에 HelloWorld.class 파일이 생성된다
// Java 파일에 주석이라도 한글이 들어가 있는 경우에는 아래와 같이 -encoding utf-8 을 이용한다
// > javac -encoding utf-8 HellowWorld.java
> java HelloWorld // 파일명에 확장자 쓰지 않는 것에 주의하자
// Hello world!
```
- Java 출력 기본
```java
public class PrintEx01 {
  public static void main(String[] args) {
    System.out.println("Hello Print");
    System.out.println("Hello Print");
    System.out.println("Hello Print");
    // System.out.println -ln(엔터)
    System.out.print("Hello Print");
    System.out.print("Hello Print");
    System.out.print("Hello Print");
    // 엔터키 적용이 되지 않는다
    System.out.printf("%s %s\n","Hello","world");
    System.out.printf("%d %d\n",10, 20);
    // %s - 문자열
    // %d - 10진 정수
    // &f - 10진 실수
    // \n, %n - 엔터키
    // %4d - 4자리 확보하고 오른쪽 정렬
    // %04d - 4자리 확보하고 빈칸은 0으로 채운다
    // %5.2f - 소수점 포함해서 5자리 확보하고 소수점 이하 2자리 까지 표현
  }
}
```
-----------
## Java 문법
### 저장공간
#### 변수 
  
```java
// 자료형 변수명;
byte age;
```
```java
public class VariableEx01 {
  public static void main(String[] args){
    int num1; // 변수 선언
    num1 = 10; // 변수 할당
    num1 = 15; // 재할당
    System.out.println(num1);

    int num2 = 20; // 변수 선언과 동시에 초기화
    System.out.println(num2);

    int num3, num4 = 50; // num3, num4를 선언하고 num4에 값 할당
    num3 = 40; // num3 에 값 할당
    System.out.println(num3);
    System.out.println(num4);
    
    // int num1 = 20;  에러!! 재선언 불가능하다
    // System.out.println(num4);
  }
}
```

#### 상수 
```java
// final 자료형 변수명;
final double height;
```
```java
public class VariableEx02 {
  public static void main(String[] args){
    final int C_NUM = 10; // 상수 선언 및 초기화
    System.out.println(C_NUM);
    // C_NUM = 20;  에러!! 상수는 재할당 불가능하다
    // System.out.println(C_NUM);
    final int C_NUM1;
    C_NUM1 = 20; // 상수도 선언 먼저하고 초기화를 나중에 할 수 있다
    System.out.println(C_NUM1);
  }
}
```
### 자료형
#### 기본형
  - 문자형
  ```java
  public class VariableEx04 {
    public static void main(String[] args) {
      // char - 문자 ('')
      char c1 = 'a';
      char c2 = 97; 
      System.out.println(c1);
      System.out.println(c2); 
      // 문자는 ASKII 코드 값으로 저장되기 때문에 숫자로 저장할 수도 있다
      // ASKII 코드 - 영문자, 숫자, 특수기호
      char c3 = 'b';
      // char c3 = 97 + 1;
      System.out.println(c3);
      // 유니코드 - 다국어
      char c4 = '\uc790'; 
      System.out.println(c4);
      // \n - 엔터키
      // \t - 탭키
      char e1 = 'a';
      char e2 = '\n';
      char e3 = 'b';
      System.out.print(e1);
      System.out.print(e2); // 엔터키
      System.out.print(e3);
    }
  }
  ```
  ```java
  public class VariableEx05 {
    public static void main(String[] args) {
      // 문자열 - String ("")
      // String 은 기본자료형이 아닌 객체자료형이다
      char c1 = 'a'; 
      // char c1 = "a";  에러!! char 형은 ('') 사용한다
      String str1 = "Hello";
      // String str1 = 'Hello';  에러!! String 은 ("") 사용한다
      System.out.println(c1);
      System.out.println(str1);
    }
  }
  ```
  - 숫자형
  ```java
  public class VariableEx06 {
    public static void main(String[] args) {
      // 정수형 - byte < short < int < long (할당할 수 있는 값의 크기(범위) 차이가 있다)
      byte b = 1;
      short s = 2;
      int i = 4;
      long l = 8;
      // long l = 8L;  이렇게 할당할 값뒤에 L을 붙히기도 한다
      System.out.println(b);
      System.out.println(s);
      System.out.println(i);
      System.out.println(l);
      // 진수 
      int i2 = 0b1010; // 할당할 값에 0b 를 붙혀주면 2진수가 된다
      int i8 = 030; // 할당할 값에 0 를 붙혀주면 8진수가 된다
      int i16 = 0xA4; // 할당할 값에 0x 를 붙혀주면 16진수가 된다
      System.out.println(i2); // 10
      System.out.println(i8); // 24
      System.out.println(i16); // 164
      // 단, 출력은 모두 10진수로 변환되어 나온다
      int bigNum = 1_000_000; 
      System.out.println(bigNum);
      // "_"로 세자리씩 끊어 줄 수 있다
    }
  }
  ```
  ```java
  public class VariableEx06 {
    public static void main(String[] args) {
      // 실수형 - float < double (할당할 수 있는 값의 크기(범위)차이가 있다)

      /* int i = 2.5;  에러!! 
      System.out.println(i); */

      // float f = 2.5;  에러!! f를 붙이지 않은 실수는 double 자료형이다
      // double이 모든 실수의 기본형
      float f = 2.5f;
      // float 자료형 변수에 할당할 실수 뒤에는 f나 F를 반드시 붙여야 한다
      double weight = 60.4;
      System.out.println(height);
      System.out.println(weight);
      // 지수(e) - e 뒤에 붙어있는 수 만큼 지수승 한다
      double d2 = 3.14e2;
      System.out.println(d2); // 3.14 * 100
      double d3 = 3.14e-2;
      System.out.println(d3); // 3.14 * 0.01
      // float 자료형은 소수점 9번째에서 반올림하여 소수점 8번째 자리까지 표현
      // double 자료형은 소수점 18번째 자리에서 반올림하여 소수점 17번째 자리까지 표현
      float f3 = 0.1234567890123456789f;
      double d4 = 0.1234567890123456789;
      System.out.println(f3); // 0.12345679
      System.out.println(d4); // 0.12345678901234568
    }
  }
  ```
  - 논리형 
  ```java
  public class VariableEx03 {
    public static void main(String[] args) {
      boolean bool1 = true; // boolean 형은 true, false 값만 갖는다
      // boolean bool1 = True;  에러!! 대소문자 구분 잘해야된다
      System.out.println(bool1); // true
    }
  }
  ```
  -----
#### 참조형
----
#### 형변환
- 형변환 연산자 : "( )"

- 구분
  - 묵시적 형변환
  ```java
  public class TypeCastingEx01 {
    public static void main(String[] args) {
      short s1 = 10;
      int i1 = s1; 
      System.out.println(i1); // 10
      float f1 = 10.0f; 
      double d1 = f1;
      System.out.println(d1); // 10.0
      char c1 = 'A';
      int i2 = c1; // char 자료형도 int 자료형으로 형변환 가능하다
      System.out.println(i2); // 65
      // 묵시적 형변환
    }
  }
  ```
  - 명시적 형변환
  ```java
  public class TypeCastingEx02 {
    public static void main(String[] args) {
      // int i1 = 20;
      // short s1 = i1;  에러!! 큰 자료형에서 작은 자료형으로 형변환 시킬 때 묵시적 형변환 불가
      // System.out.println(s1); 
      int i1 = 20;
      short s1 = (short)i1; // 소괄호 안에 형변환시킬 자료형을 넣는다
      System.out.println(s1);
      char c1 = 'A';
      int i2 = c1 + 3;
      System.out.println(i2); // 68
      System.out.println((char)i2); // D
      // int 자료형에 형변환 연산자를 사용해 char 자료형으로 변환시킬 수 있다

      //boolean b = false;
      //int i3 = (int)b;  에러!! boolean 자료형은 형변환 연산자를 사용하더라도 int 자료형으로 형변환 불가
      //System.out.println(i3); 
    }
  }
  ```
  ### 연산자
  #### 산술연산자
  - <b>+ , - , * , / , % <br><br>
  ```java
  public class OperatorEx01 {
    public static void main(String[] args) {
      int i1 = 10;
      int i2 = 20;
      int sum1 = i1 + i2;
      System.out.println(sum1);
      // short s1 = 10;
      // short s2 = 20;
      // short sum2 = s1 + s2;  에러!! byte, short 자료형은 산술 연산 시  int 자료형으로 형변환 된 후 연산된다
      // System.out.println(sum2);
      short s1 = 10;
      short s2 = 20;
      int sum2 = s1 + s2; // int 자료형으로 결과를 받으면 에러가 생기지 않는다
      // short sum2 = (int)(s1 + s2);  이처럼 명시적 형변환을 이용할 수 있다
      System.out.println(sum2);
      // int i3 = 100;
      // long l1 = 200;
      // int sum3 = i1 + l1;  에러!! int 자료형보다 큰 자료형과 산술 연산 시 큰 자료형으로 형변환 된 후 연산된다
    }
  }
  ```
  !! 오버플로우
  - 할당되는 값이 자료형의 수용 범위를 벗어날 때 발생한다
  ```java
  public class OperatorEx02 {
    public static void main(String[] args) {
      int i1 = 1_000_000;
      int i2 = 2_000_000;
      int product1 = i1 * i2;
      System.out.println(product1); // -1454759936 (오버플로우)
      long product2 = (long)i1 * i2; 
      // 피연산자 중 하나를 long 자료형으로 바꿔주면 형변환이 일어나 오버플로우가 일어나지 않는다
      System.out.println(product2); // 2000000000000
    }
  }
  ```
  #### 대입연산자
  - <b>= , += , -= , *= , /= , %= 
  #### 비교연산자
  - <b>< , > , <= , >= , == , != 
  #### 논리연산자
  - <b>& , | , ! , ^ </b>

  - Short-Circuit 연산자 : <b> && , ||</b>
  ```java
  public class OperatorEx03 {
    public static void main(String[] args) {
      int a = 7;
      int b = 2;
      boolean result;
      result = (a -= 3) > 7 && (b += 1) < 7;
      // && 왼쪽의 값이 false 이기 때문에 무조건 거짓이므로 오른쪽 연산을 하지 않는다
      System.out.println(result); // false
      System.out.println(a); // 4
      System.out.println(b); // 2
    }
  }
  ```
  ```java
  public class ex {
    public static void main(String[] args) {
      int a = 10;
      int b = 20;
      System.out.println((a += 10) > 15 | (b -= 10) > 15); // true
      System.out.println("a = " + a + " , b = " + b); // a = 20, b = 10
      // a, b 모두 연산이 된다
      a = 10;
      b = 20;
      System.out.println((a += 10) > 15 || (b -= 10) > 15); //true
      System.out.println("a = " + a + " , b =" + b); // a = 20 , b = 20
      // b 는 연산되지 않는다
      // 비교해보기
    }
  }
  ```
  #### 비트연산자
  -------
  ### 제어문
  #### 조건에 의한 분기
    - flowchart 먼저 생각하기 !!
    - if 

    ```java
    if(조건){
      // 실행문
    }

    if(조건){
      // 실행문
    } else{
      // 실행문
    }

    if(조건1){
      // 실행문
    } else if(조건2){
      // 실행문
    } else{
      // 실행문
    }
    ```
    ```java
    public class ConditionEx03 {
      public static void main(String[] args) {
        int jumsu = 99;
        if(jumsu >= 90){
          System.out.println("A");
        } else if(jumsu >= 80){
          System.out.println("B");
        } else if(jumsu >= 70){
          System.out.println("C");
        } else if(jumsu >= 60){
          System.out.println("D");
        } else{
          System.out.println("F");
        }
      }
    }
    ```
    - switch
    ```java
    public class Switch {
      public static void main(String[] args) {
        int data = 10;
        switch(data){
          case 10 :
            System.out.println("10");
            break;
          case 20 :
            System.out.println("20");
            break;
          case 30 :
            System.out.println("30");
            break;
          default : 
            System.out.println("기타");
        }
      }
    }
    ```
    ```java
    public class Switch {
      public static void main(String[] args) {
        int jumsu = 94;
        switch(jumsu / 10){
          case 9 :
            System.out.println("A");
            break;
          case 8 :
            System.out.println("B");
            break;
          case 7 :
            System.out.println("C");
            break;
          case 6 : 
            System.out.println("D");
            break;
          default :
          System.out.println("F");
        }
      }
    }
    ```
    - 삼항연산자
    ```java
    public class ConditionEx04 {
      public static void main(String[] args) {
        // (조건)? 실행문1 : 실행문2;
        String msg = (10 < 20 && 20 > 10)? "1" : "20";
        System.out.println(msg);
      }
    }
    ```
  #### 조건에 의한 반복
