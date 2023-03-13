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
    // %d - 숫자
    // \n, %n - 엔터키
  }
}
```
-----------
## Java 문법
### 저장공간
- 변수 
  
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

- 상수 
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
- 기본형
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
  - 논리형 
  ```java
  public class VariableEx03 {
    public static void main(String[] args) {
      boolean bool1 = true; // boolean 형은 true, false 값만 갖는다
      // boolean bool1 = True;  에러!! 대소문자 구분 잘해야된다
      System.out.println(bool1);

    }
  }
  ```
- 참조형
