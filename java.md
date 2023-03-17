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

-----------
## Java 문법
### Java 기본 
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
> java HelloWorld // 실행 시킬 때, 파일명에 확장자 쓰지 않는 것에 주의하자
// Hello world!
```
- Java 출력 기본

  - 개발자는 본인이 출력의 결과를 미리 알아야 한다 !!
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
- 배열, 클래스
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
      int i2 = c1; // char 자료형도 int 자료형으로 묵시적 형변환 가능하다
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
      // short sum2 = s1 + s2;  
      // System.out.println(sum2);  에러!! byte, short 자료형은 산술 연산 시  int 자료형으로 형변환 된 후 연산된다
      short s1 = 10;
      short s2 = 20;
      int sum2 = s1 + s2; // int 자료형으로 결과를 받으면 에러가 생기지 않는다
      // short sum2 = (short)(s1 + s2);  이처럼 명시적 형변환을 이용할 수도 있다
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
  - 조건 파악이 중요하다
  - 기본적으로 Javascript 와 동일하다
  #### 조건에 의한 분기
    - flowchart 먼저 생각하기 !!
    
    - if 

    ```java
    if(조건식){
      // 실행문
    }

    if(조건식){
      // 실행문
    } else{
      // 실행문
    }

    if(조건식1){
      // 실행문
    } else if(조건식2){
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
    - switch : 소괄호 안 조건식의 값은 정수, 문자열, 상수 값을 가진다
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
  #### 조건에 의한 반복 (loop)
  - 순서 : 초기화 &rarr; 조건식 &rarr; 실행문 &rarr; 증감식 <br>
                  &rarr; 조건식 &rarr; 실행문 &rarr; 증감식
                  &rarr; ...

  - 무한루프는 시스템 다운을 시키기 때문에 조건문 만들 때 주의 !!

    <small> !! 특히 증감식 설정을 잘못할 경우 무한루프가 생긴다</small>

    <small>!! 의도적으로 무한루프를 만들고 특정 경우에만 break 로 빠져나오게 하는 경우도 있다</small>
  - for : 반복횟수가 정해져 있을 때 사용한다
  ```java
  public class LoopEx01 {
    public static void main(String[] args) {
      for(int i = 0, j = 0; i < 10; i++, j += 2){
        System.out.print(i + j);
        System.out.println();
      }
      /* 
      위의 코드와 같은 코드다
      int i = 0, j = 0;
      for(; i < 10; i++, j += 2){
        System.out.print(i + j);
        System.out.println();
      }
      */ 
      /* 
      위의 코드와 같은 코드다
      int i = 0, j = 0;
      for(; i < 10;){
        System.out.print(i + j);
        System.out.println();
        i++, j += 2
      }
      */ 
    }
  }
  ```
  별 찍기 예제
  ```java
  public class LoopEx02 {
    public static void main(String[] args) {
      for(int i = 0; i < 10; i++){
        for(int j = 0; j <= i; j++){
          System.out.print("*");
        }
        System.out.println();
      }
    }
  }
  ```
  char 자료형, 별 찍기 응용
  ```java
  public class LoopEx03 {
    public static void main(String[] args) {
      for(int i = 0; i < 10; i++){
        char c = 'A';
        for(int j = 0; j <= i; j++){
          System.out.print(c);
          c++;
        }
        System.out.println();
      }
    }
  }
  ```
  구구단 출력
  ```java
  public class LoopEx04 {
    public static void main(String[] args) {
      for(int i = 1; i < 10; i++){
        System.out.print(i + "단 :" + '\t');
        for(int j = 1; j < 10; j++){
          System.out.printf("%d * %d = %d\t", i, j, i * j);
        }
        System.out.println();
      }
    }
  }
  ```
  - while : 상황에 의해서 반복이 진행될 때 사용한다
  ```java
  public class LoopEx05 {
    public static void main(String[] args) {
      int i = 0; // 초기화
      while(i < 10){
        System.out.println(i);
        i++; // 증감식
      }
    }
  }
  ```
  구구단 출력
  ```java
  public class LoopEx05 {
    public static void main(String[] args) {
      int i = 1;
      while(i < 10){
        int j = 1;
        System.out.print(i + "단 :" + '\t');
        while(j < 10){
          System.out.printf("%d * %d = %d\t", i, j, i * j);
          j++;
        }
        i++;
        System.out.println();
      }
    }
  }  
  ```
  - do ~ while : while 작업 중 최소 한번은 실행되어야 하는 곳에 사용한다
  ```java
  public class LoopEx06 {
    public static void main(String[] args) {
      int i = 1;
      do{
        System.out.print(i + "단 :" + '\t');
        int j = 1;
        do{
          System.out.printf("%d * %d = %d\t", i, j, i * j);
          j++;  
        }while(j < 10);
        System.out.println();
        i++;
      }while(i < 10);
    }
  }
  ```

  - break / continue / label
  ```java
  public class LoopEx07 {
    public static void main(String[] args) {
      outer: for(int i = 1; i < 10; i++){
        inner: for(int j = 1; j < 10; j++){
          if(j == 5){
            break;
            // break outer;  이 경우도 생각해보기
          }
          System.out.printf("%d * %d = %d\t", i, j, i * j);
        }
        System.out.println();
      }
    }
  }
  // outer 는 밖의 for 문을 가리키는 label, inner 는 안의 for 문을 가리키는 label 이다
  ```
### 배열
- 같은 타입의 데이터 여러 개를 연속된 데이터 공간에 할당시켜 하나로 다루는 것을 배열이라고 한다
- 같은 타입의 데이터를 넣어야 하지만, 묵시적 형변환이 되는 값이라면 할당시킬 수 있다

  <sup>ex) int[] 자료형에 byte, short, char 자료형 값을 할당시킬 수 있다</sup>
- 배열의 크기를 변경시킬 수는 없다
- 배열의 메모리 구조를 잘 이해하자 !!

#### 배열의 기본
##### 1차원 배열
```java
public class ArrayEx01 {
  public static void main(String[] args) {
    int[] arr; // 배열의 선언 
    // int 가 아니라 int[] 가 자료형이다

    arr = new int[5]; // 배열의 생성
    // int 값이 5개 들어가는 배열을 생성한 뒤, 그 배열을 가리키는 참조값을 arr 에 할당한다
    // int[] arr = new int[5];  선언과 생성을 동시에 할 수 있다

    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;
    arr[4] = 50; // 배열의 초기화

    System.out.println(arr[4]); // 50
    System.out.println(arr); // [I@71dac704
    // arr 을 출력하면 참조값을 출력한다
  }
}
```
```java
public class ArrayEx05 {
  public static void main(String[] args) {
    int[] intArr1 = new int[]{10, 20, 30};
    int[] intArr2 = {10, 20, 30};
    // 배열의 초기화 방법
    for(int i = 0; i < intArr1.length; i++){
      System.out.println(intArr1[i]);
    }
    // for 문을 이용한 배열의 출력
    for(int data : intArr2){
      System.out.println(data);
    }
    // 향상된 for 문을 이용한 출력
  }
}
```
- 배열은 초기화 생성될 때 자료형에 맞는 기본값을 가지고 있다

!! 자료형별 기본값

|자료형|기본값|비고|
|:---:|:--:|:---:|
|boolean|false|
|char|'\u0000'|공백 문자|
|byte, short, int| 0 |
|long| 0L|
|float| 0.0f|
|double|0.0|
|참조형 변수|null|아무것도 참조하지 않음|
```java
public class ArrayEx02 {
  public static void main(String[] args) {
    int[] intArr = new int[5];
    double[] doubleArr = new double[5];
    System.out.println(intArr[0]); // 기본값 0
    System.out.println(doubleArr[0]); // 기본값 0.0
    System.out.println(intArr.length); // 5
    // 배열의 길이를 출력한다
  }
}
```

```java
public class ArrayEx03 {
  public static void main(String[] args) {
    int[] points = new int[3]; 
    System.out.printf("배열의 크기 : %d\n", points.length);
    points[0] = 1;
    points[1] = 'A'; // char 자료형 값이 int 형으로 저장되면 아스키 코드값으로 저장된다
    // !! 같은 자료형이 아니더라도 묵시적 형변환이 가능하다면 배열에 저장이 가능하다 
    System.out.printf("0 번째 요소 : %d\n", points[0]); // 1
    System.out.printf("1 번째 요소 : %d\n", points[1]); // 65
    System.out.printf("2 번째 요소 : %d\n", points[2]); // 0
  }
}
```
- 배열의 인덱스 범위를 벗어나면 Runtime Exception 이 발생하고 프로그램이 비정상으로 종료된다
```java
public class ArrayEx04 {
  public static void main(String[] args) {
    int[] intArr = new int[3];
    System.out.println(intArr[0]);
    System.out.println(intArr[5]); // 컴파일 단계에서는 에러가 나지 않지만, 실행단계에서 에러가 난다
  }
}
```
##### 다차원 배열 
- 배열을 관리하는 1차원 배열
```java
public class Arrayex06 {
  public static void main(String[] args) {
    int[][] arr1; // 2차원 배열의 선언

    arr1 = new int[3][2]; // 3행 2열의 배열을 생성하고, 참조값을 arr1 에 할당
    // new int[3][2] 에서 2는 생략이 가능하지만, 3은 생략이 불가능하다 (!! 가변배열 참조)
    arr1[0][0] = 10;
    arr1[0][1] = 20;
    arr1[1][0] = 30;
    arr1[1][1] = 40;
    arr1[2][0] = 50;
    arr1[2][1] = 60; // 배열의 초기화
    // 중괄호 중첩을 이용할 수도 있다
    // int[][] arr1 = new int[][]{{10, 20}, {30, 40}, {50, 60}};
    // int[][] arr1 = {{10, 20}, {30, 40}, {50, 60}};
    System.out.println(arr1[0][0]); // 10
    System.out.println(arr1[2][1]); // 60
    System.out.println(arr1); // [[I@123772c4
    System.out.println(arr1[0]); // [I@2d363fb3

    for(int row = 0; row < arr1.length; row++){
      for(int col = 0; col < arr1[0].length; col++){
        System.out.printf("arr1[%d][%d] : %d\n", row, col, arr1[row][col]);
      }
    }
    // for 문을 이용한 2차원 배열 출력
    for(int[] rows : arr1){
      for(int data : rows){
        System.out.println(data);
      }
    }
    // 향상된 for 문을 이용한 2차원 배열 출력
  }
}
```
```java
public class ArrayEx08 {
  public static void main(String[] args) {
    
    int[][][] arr3d = {{{1, 2},{3, 4}}, {{5, 6},{7, 8},{9, 0}}};
    
    for(int[][] outer : arr3d){
      for(int[] inner : outer){
        for(int data : inner){
          System.out.println(data);
        }
      }
    } // 3차원 배열의 출력
  }
}
```
- 다차원 배열은 배열이 또 다른 배열을 참조하는 형태이기 때문에 가변배열로 설정도 가능하다
```java
public class ArrayEx07 {
  public static void main(String[] args) {
    int[][] arr1 = new int[4][]; // 가변 배열
    // new int[4][] 에서 4는 생략이 불가하고, 뒤의 괄호는 배열의 길이가 각각 다르기 때문에 비워둔다
    arr1[0] = new int[]{1, 2, 3, 4};
    arr1[1] = new int[]{10, 20, 30, 40};
    arr1[2] = new int[]{100, 200, 300};
    arr1[3] = new int[]{1000, 2000};

    int sum = 0;
    int count = 0;

    for(int i = 0; i < arr1.length; i++){
      for(int j = 0; j < arr1[i].length; j++){
        sum += arr1[i][j];
        count++;
      }
    }
    System.out.printf("arr1 배열의 총합은 %d 이고, 평균은 %3.1f", sum, (float)sum / count);
  }
}
```
## 클래스와 객체
- Java 는 객체지향 언어이다 

- OOP(Object Oriented Programming) : 객체지향 프로그래밍
  - "OOP is A.P.I.E"
    - 은닉(Encapsulation)

    - 상속(Inheritance)

      - 추상(Abstraction)

      - 다형(Polymorphism)

- 클래스에 대한 문법을 배워서 라이브러리(API)를 사용할 수 있어야 한다
- 클래스 : 참조형 자료이고 객체를 생성할 수 있다
  - 사용자 정의 클래스 
  - 라이브러리(API)

    <small> !! https://docs.oracle.com/en/java/javase/11/docs/api/index.html 참조
  - 내장 클래스
  - 외부 클래스
  
- 객체(인스턴스) : 각각의 상태(멤버변수)와 기능(메서드)를 갖는다 
- 추상화와 구체화
  - 객체 &rarr; 추상화(공통점 추출) &rarr; 클래스
  
    <sup>ex) 그랜저, 소나타, 아반떼 &rarr; 공통점 추출 &rarr; 자동차
  
  - 클래스 &rarr; 구체화(구체적 상태, 기능 추가) &rarr; 객체
  
    <sup>ex) 자동차 &rarr; 그랜저 상태, 기능 추가 &rarr; 그랜저

!! UML(Unified Modeling Language) : 추상화 모델링 기술
  - Class Diagram

  - Use Case Diagram
  - Sequence Diagram
  - ...
### 클래스 기본 문법
- 다수의 클래스가 선언된 소스파일을 컴파일 하면 각각의 클래스가 따로 컴파일 되어 여러 개의 클래스 파일이 생긴다

  <small>!! 보통은 소스파일 하나 당 한개의 클래스를 선언한다</small>
- 클래스 구성
```java
public class ClassName { 
// public 은 접근 제어자로 아무 것도 쓰여 있지 않을 경우 default 가 생략되어 있는 것이다
  int mem1;
  char mem2;
  ... // 멤버변수

  void func1(){
    ...
  }
  int func2(){
    ...
    return value;
  } 
  ... // 메서드
}
```
- 메모리 구조를 잘 파악하자 !!
------
!! JVM 메모리 구조
- 클래스 영역 : 클래스의 원형에 대한 정보가 저장되는 영역
  - Field 정보 : 멤버변수, 데이터 접근 제어자 정보
  - Method 정보 : 메서드, 리턴타입, 파라미터, 접근 제어자 정보
  - Type 정보 : 타입의 이름, 상위 클래스 이름, 접근 제어자, 타입의 속성이 클래스인지 인터페이스인지에 대한 정보

  - 상수 풀 : 상수에 대한 정보
- 스택 영역 : 메서드 호출 시 로컬 변수가 쌓이는 영역으로 스레드마다 따로 공간을 가진다 (객체를 받는 변수가 이 영역에 저장된다)

- 힙 영역 : new로 생성된 객체가 저장되는 영역으로 스레드가 모두 공유한다 (스택 영역에 있는 변수가 가리키는 객체가 이 영역에 저장된다)
---------------

#### 클래스 선언 및 생성

```java
class Student {
  String name;
  String idNum;
  int age;
  double height, weigth; 
}

public class ObjectEx01 {
  public static void main(String[] args) {
    Student stu1; // Student 객체를 받는 변수 stu1 선언
    stu1 = new Student(); // Student 객체의 참조값을 변수 stu1에 할당한다
    System.out.println(stu1); // Student@2d363fb3 (자료형@해시코드)
    stu1.name = "홍길동"; // "."은 메모리 참조 연산자
    stu1.idNum = "1001";
    stu1.age = 20;
    stu1.height = 180.5;
    stu1.weigth = 75;
    System.out.println(stu1.name); // 홍길동
    
    Student stu2 = new Student();
    System.out.println(stu2); // Student@7d6f77cc 
    stu2.name = "박문수";
    stu2.idNum = "1002";
    stu2.age = 22;
    stu2.height = 182;
    stu2.weigth = 78;
    System.out.println(stu2.age); // 22
  }
}
```
#### 변수
- 선언 위치(사용 영역)에 따라 구분된다

  - 클래스 영역에 선언 : 멤버변수(클래스 멤버변수, 인스턴스 멤버변수)

    <small>!! 클래스 영역에 선언되는 변수 (클래스 멤버변수, 인스턴스 멤버변수) 는 초기화 하지 않아도 기본값을 가지기 때문에 초기화가 필수가 아니다</small>
  - 함수(클래스 내부의 메서드 포함), 초기화 블록, 생성자 영역에 선언 : 로컬변수 

    <small>!! 로컬변수는 기본값을 가지지 않기 때문에 사용하기 전에 반드시 초기화 해줘야 한다</small>
-------
!! 자료형에 따른 기본값

|자료형|기본값|비고|
|:---:|:--:|:---:|
|boolean|false|
|char|'\u0000'|공백 문자|
|byte, short, int| 0 |
|long| 0L|
|float| 0.0f|
|double|0.0|
|참조형 변수|null|아무것도 참조하지 않음|
------------
- 구분
  - 클래스 멤버변수 : 같은 클래스로 만들어진 객체가 공유하는 데이터로 클래스가 클래스 영역에 저장될 때 생기기 때문에 객체가 만들어지지 않아도 사용할 수 있다 (선언할 때, static을 붙인다)
  - 인스턴스 멤버변수 : 힙 영역에 저장된 객체마다 따로 갖는 변수이기 때문에, 객체를 만들어야 사용할 수 있다


  - 로컬 변수
  
  ```java
  class Variable {
    String instanceVar; // 인스턴스 멤버변수
    static String classVar; // 클래스 멤버변수
    void doFunc(){
      int localVar2 = 20; // 지역변수
      System.out.println(localVar2);
    }
  }
  public class VariableEx10 {
    public static void main(String[] args) { // 메인 메서드
      int localVar1 = 10; // 지역변수
      System.out.println(localVar1);

      Variable v1 = new Variable();
      v1.instanceVar = "10";
      System.out.println(v1.instanceVar);  
      Variable.classVar = "20";
      System.out.println(Variable.classVar);
      // v1.classVar = "20";
      // System.out.println(v1.classVar); 
      // 에러가 나지 않지만 보통은 객체명이 아닌 클래스명으로 클래스 변수를 사용한다
    }
  }
  ```
  ```java
  class Variable {
    String instanceVar; 
    static String classVar; 
  }
  
  public class VariableEx11 {
    public static void main(String[] args) { 
      Variable v1 = new Variable();
      Variable v2 = new Variable();
  
      v1.instanceVar = "10";
      v2.instanceVar = "20";
      System.out.println(v1.instanceVar); // 10 
      System.out.println(v2.instanceVar); // 20
      v1.classVar = "30";
      v2.classVar = "40";
      System.out.println(v1.classVar); // 40
      System.out.println(v2.classVar); // 40
      // 클래스 멤버변수는 공유 데이터이기 때문에 위와 같이 객체명을 사용하지 않고 아래와 같이 클래스명을 사용한다
      System.out.println(Variable.classVar); // 40
    }
  }
  ```

#### 메서드

```java
class MethodEx {
  void doFunc1(){
    System.out.println("doFunc1 호출");
  }
  void doFunc2(int data1){
    System.out.println("doFunc2 호출 ; " + data1);
  }
  void doFunc3(int data1, String data2){
    System.out.println("doFunc3 호출 : " + data1);
    System.out.println("doFunc3 호출 : " + data2);
  }
  // void - return 값이 없음을 나타낸다
  int doFunc4(int data1, int data2){
    int sum = data1 + data2;
    return sum;
  }
}
public class ObjectEx02 {
  public static void main(String[] args) {
    MethodEx ex = new MethodEx();
    ex.doFunc1(); // doFunc1 메서드 호출
    ex.doFunc2(10); // doFunc2 메서드 호출
    ex.doFunc3(10, "abc"); // doFunc3 메서드 호출
    int result = ex.doFunc4(20, 30); // doFunc4 메서드 호출하고 반환값을 변수에 할당
    System.out.println("result : " + result); 
  }
}
```
```java
class Util {
  int viewMaxNumber(int a, int b, int c){
    int maxNum = a;
    if(b > maxNum){
      maxNum = b;
    }
    if(c > maxNum){
      maxNum = c;
    }
    return maxNum;
  }
  int doCalculator(int a, int b, String oper){
    int result = 0;
    switch(oper){
      case "+":
        result = a + b;
        break;
      case "-":
        result = a - b;
        break;
      case "*":
        result = a * b;
        break;
      default :
      System.out.println("해당되는 연산이 없습니다"); 
    }
    return result;
  }
}

public class Test {
  public static void main(String[] args) {
    Util util = new Util();
    int result1 = util.viewMaxNumber(24, 56, 12);
    System.out.println("최대값 : " + result1);
    int result2 = util.doCalculator(20, 40, "+");
    System.out.println("연산 결과 : " + result2);
  }
}
```
- 메서드도 멤버변수와 마찬가지로 인스턴스 메서드와 클래스 메서드로 구분된다
```java
class Variable {
  String instanceVar; 
  static String classVar; 
  void doFunc1(){ // 인스턴스 메서드
    System.out.println("doFunc1 호출");
  }
  static void doFunc2(){ // 클래스 메서드
    System.out.println("doFunc2 호출");
  }
}
public class VariableEx11 {
  public static void main(String[] args) { 
    Variable v1 = new Variable();
    Variable v2 = new Variable();
    v1.doFunc1(); 
    v2.doFunc1();
    // 같은 내용이 출력되지만 서로 다른 영역의 함수를 호출한 것이다
    v1.doFunc2();
    v2.doFunc2();
    // 모두 클래스 영역에 있는 함수를 호출한 것이다
    // 보통은 아래와 같이 클래스명을 사용한다
    Variable.doFunc2();
  }
}
```
  - 클래스 메서드는 인스턴스 멤버변수, 메서드를 사용할 수 없다

    &rarr; &nbsp;static 메서드는 static 붙은 변수만 사용 가능하다

  ```java
  class Variable {
    String instanceVar; 
    static String classVar;

    void doFunc1(){ 
      System.out.println("doFunc1 호출");
      System.out.println(instanceVar);
      System.out.println(classVar);
    }
    static void doFunc2(){ 
      System.out.println("doFunc2 호출");
      // System.out.println(instanceVar); 
      // 에러!! 클래스 메서드는 인스턴스 멤버변수 사용이 불가능하다
      System.out.println(classVar);
    }
  }

  public class VariableEx11 {
    public static void main(String[] args) { 
      Variable v1 = new Variable();
      Variable v2 = new Variable();

      v1.instanceVar = "10";
      v2.instanceVar = "20";

      Variable.classVar = "30";

      v1.doFunc1(); 
      v2.doFunc1();
      Variable.doFunc2();
    }
  }
  ```
  !! 메인 메서드도 static 메서드다
  ```java
  public class VariableEx13 {
    String instanceVar = "10";
    static String classVar = "20";

    void doFunc1(){
      System.out.println("doFunc1 호출");
    }
    static void doFunc2(){
      System.out.println("doFunc2 호출");
    }

    public static void main(String[] args) { 
      System.out.println(classVar);
      VariableEx13.doFunc2();
      // System.out.println(instanceVar);
      // 에러!! 메인 메서드도 static 메서드이기 때문에 인스턴스 멤버변수를 사용하지 못한다
      VariableEx13 v13 = new VariableEx13();
      v13.instanceVar = "20";
      System.out.println(v13.instanceVar);
      v13.doFunc1();
      // 이렇게 객체를 먼저 만들고, 그 객체를 이용해 인스턴스 변수, 메서드를 사용할 수는 있다
    }
  ```
##### 오버로딩 (Overloading) 

- 동일한 기능을 해서 중복코드가 발생하는 메서드를 같은 이름으로 새로 정의

  <small>!! 기본적으로 같은 이름의 메서드는 선언할 수 없지만, 파라미터의 개수, 타입이 달라지면 선언가능하다</small>

  <small>!! 오버라이딩(Overriding)과 비교</small>

```java
class MethodEx {
  void doFunc(){
    System.out.println("doFunc 호출1");
  }
  // void doFunc(){
  //   System.out.println("doFunc 호출2");
  // } 에러!! 
  void doFunc(String s){
    System.out.println("duFunc 호출 : " + s);
  }
  void doFunc(String s, int a){
    System.out.println("doFunc 호출 : " + s + a);
  }
  void doFunc(int a, String s ){
    System.out.println("doFunc 호출 : " + a + s);
  }
}
public class MainEx03 {
  public static void main(String[] args) {
    MethodEx ex = new MethodEx();
    ex.doFunc();
    ex.doFunc("hi");
    ex.doFunc("hi", 10);
    ex.doFunc(10, "hi");
  }
}
```
```java
class Overloading{
  String val;
  void doFunc(){
    doFunc("value1"); // 중복 코드를 제거하기 위하여 오버로딩 된 함수를 이용해 작성할 수 있다
  }
  void doFunc(String val){
    this.val = val; // this 는 자기 참조값으로 자신을 가리키는 참조값을 가진다
    System.out.println(val);
  }
}
public class MainEx04 {
  public static void main(String[] args){
    Overloading ovl = new Overloading();
    ovl.doFunc(); // value
    ovl.doFunc("HI") // HI
  }
}
```
<sup> ex) !! https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/String.html#indexOf(int)<br> 
String 클래스의 indexof 메서드 오버로딩 확인</sup>

##### 가변인자 
```java
class MethodEx{
  void doFunc(int a, int b){
    System.out.println("doFunc 호출");
  }
  void doFunc1(int ...args){
    System.out.println("doFunc 호출");
    System.out.println(args.length);
    for(int i = 0; i < args.length; i++){
      System.out.println(args[i]);
    }
  } // 인자를 배열로 받아 개수 상관없이 받을 수 있다 (배열의 이름 args)
}
public class MainEx04 {
  public static void main(String[] args) {
    MethodEx ex = new MethodEx();
    ex.doFunc(10, 20);
    // ex.doFunc(10, 20, 30);  에러!!
    ex.doFunc1(10, 20);
    ex.doFunc1(10, 20, 30);
  }
}
```
```java
public class MainEx20 {
  public static void main(String[] args) {
  // args 는 프로그램 실행시 터미널을 통해 문자열을 배열로 받아준다
    System.out.println(args.length);
    for(int i = 0; i < args.length; i++){
      System.out.println(args[i]);
    }
  }
}
```
```java
public class javaMainParam {
  public static void main(String[] args) {
    int sum = 0;
    for(String arg : args){
      int num = Integer.parseInt(arg);
      sum += num;
    }
    System.out.printf("배열의 길이 : %d, 요소의 총합 : %d", args.length, sum);
  }
}
```
#### this
- 객체마다 가지고 있고, 객체마다 다른 값을 가진다

- 객체의 참조주소를 값으로 가지기 때문에 this 를 자기참조라고 한다
- 객체가 생성되어야 사용할 수 있기 때문에, static 메서드는 this 를 사용할 수 없다

  &rarr; &nbsp;메인메서드에서 this 는 사용할 수 없다
```java
class Method {
  String data;

  void doFunc(String data){
    this.data = data;
    // this.data 는 위에서 선언한 인스턴스 변수 data 를 의미고 대입연산자 오른쪽의 data 는 전달받을 인수를 의미한다
    System.out.println("doFunc1 호출 : " + data);
    System.out.println("doFunc1 호출 : " + this.data);
    System.out.println("this : " + this); // 객체의 참조값이 출력된다
  }
}
public class MethodEx01 {
  public static void main(String[] args) {
    Method m1 = new Method();
    m1.doFunc("10");
    System.out.println("m1 : " + m1); 
    // 객체의 참조값이 출력되는데, 이 값은 m1 객체에서 사용되는 this 의 값과 같다

    Method m2 = new Method();
    m2.doFunc("10");
    System.out.println("m2 : " + m2); 
    // m1 객체의 this 와 m2 객체의 this 는 서로 다른 값을 가진다
  }
}
```
#### 생성자
- 객체를 생성할 때 new 와 함께 사용한다

- 구성
```java
class ClassName {
  Sting var;

  public ClassName(){
    // 객체 생성 작업 (주로 멤버변수 초기화 작업을 한다)
  }
}
```
- 생성자를 따로 만들지 않을 경우에만 컴파일러가 객체 생성만 하는 기본 생성자를 만들어준다
```java
class Constructor {
  void doFunc(){
    System.out.println("doFunc 호출");
  }
}
public class ConstructorEx01 {
  public static void main(String[] args) {
    Constructor c1 = new Constructor(); // 여기서 Constructor() 가 기본생성자다
    c1.doFunc();
  }
}
```
- 생성자는 기본적으로 오버로딩 되어 상황에 맞게 생성자를 사용한다
```java
class Constructor {
  String data;

  Constructor(){
    this.data = "10";
  }
  Constructor(String data){
    this.data = data;
  }
  // 생성자 오버로딩
  void doFunc(){
    System.out.println("doFunc 호출");
    System.out.println("data : " + this.data);
  }
}
public class ConstructorEx02 {
  public static void main(String[] args) {
    Constructor c1 = new Constructor("20");
    Constructor c2 = new Constructor();

    c1.doFunc();
    c2.doFunc();
  }
}
```
!! Deprecated : 미래에 사라질 지 모르니 사용을 지양하라는 뜻을 가지고 있다
##### this()
- this()로 다른 생성자를 호출해서 생성자를 만들 수 있다

- this()를 사용할 경우에는 this()가 반드시 첫 행에 있어야 한다 (주석 제외)
- 다른 생성자를 이용할 때는 this()를 이용한다
```java
class Constructor {
  String data1, data2;
  Constructor(){
    // this.data1 = "10";
    // this.data2 = "20";

    // Constructor("10","20");
    // 에러!! 생성자는 일반 메서드처럼 호출이 불가능하기 때문에 반드시 this()를 이용한다
    this("10","20");
  }
  Constructor(String data1){
    // this.data1 = data1;
    // this.data2 = "20";
    this(data1, "20");
  }
  Constructor(String data1, String data2){
    this.data1 = data1;
    this.data2 = data2;
  }
  void doFunc(){
    System.out.println("doFunc 호출");
    System.out.println("data1 : " + this.data1);
    System.out.println("data2 : " + this.data2);
  }
}
public class ConstructorEx03 {
  public static void main(String[] args) {
    Constructor c1 = new Constructor();
    Constructor c2 = new Constructor("30");
    Constructor c3 = new Constructor("50", "60");

    c1.doFunc();
    c2.doFunc();
    c3.doFunc();
  }
}
```
### 클래스 배열
```java
class Book {
  String title;
  String author;
  int price;

  Book(String title, String author, int price){
    this.title = title;
    this.author = author;
    this.price = price;
  }
}

public class ArrayEx09 {
  public static void main(String[] args) {
    int[] intArr = new int[3];
    intArr[0] = 10;
    intArr[1] = 20;
    intArr[2] = 30;
    System.out.println(intArr[0]);
    System.out.println(intArr[1]);
    System.out.println(intArr[2]);

    Book[] bookArr = new Book[3];
    Book book1 = new Book("Java", "홍길동", 1000);
    Book book2 = new Book("JSP", "박문수", 2000);
    Book book3 = new Book("Spring", "이몽룡", 3000);
    bookArr[0] = book1;
    bookArr[1] = book2;
    bookArr[2] = book3;

    System.out.println(bookArr[0].title);
    System.out.println(bookArr[0].author);
    System.out.println(bookArr[0].price);

    System.out.println(bookArr[0]); // Book@2d363fb3
    System.out.println(book1); // Book@2d363fb3
    // 같은 참조값 갖는 것 확인하기
    for(Book book : bookArr){
      System.out.println(book.title);
      System.out.println(book.author);
      System.out.println(book.price);
    }
    // 향상된 for문으로 클래스 배열의 내용 출력하기
  }
}
```
```java
public class ArrayEx24 {
  public static void main(String[] args) {
    String[][] addressArr = new String[][]{
      {"1001", "홍길동", "001-111-1111"},
      {"1002", "박문수", "001-111-1121"},
      {"1003", "임꺽정", "003-113-1241"}
    };
    for(int i = 0; i < addressArr.length; i++){
      for(int j = 0; j < addressArr[i].length; j++){
        System.out.printf("%s\t", addressArr[i][j]);
      }
      System.out.println();
    }
    // 향상된 for 문
    // for(String[] outter : addressArr){
    //   for(String inner : outter){
    //     System.out.print(inner + '\t');
    //   }
    //   System.out.println();
    // }
  }
}
```
2차원 배열을 이용한 위의 코드를 클래스 배열을 이용해 만들 수있다
```java
class Address {
  String idNum;
  String name;
  String phone;

  Address(String idNum, String name, String phone){
    this.idNum = idNum;
    this.name = name;
    this.phone = phone;
  }
}
public class ArrayEx24 {
  public static void main(String[] args) {
    Address[] addressArr =  new Address[3]; 
    addressArr[0] = new Address("1001", "홍길동", "011-111-1111");
    addressArr[1] = new Address("1002", "박문수", "010-222-2222");
    addressArr[2] = new Address("1003", "임꺽정", "019-111-3123");
    for(int i = 0; i < addressArr.length; i++){
        System.out.printf("%s\t%s\t%s\n", addressArr[i].idNum, addressArr[i].name, addressArr[i].phone);
    }
    // 향상된 for문
    // for(Address address : addressArr){
    //   System.out.printf("%s\t%s\t%s\n", address.idNum, address.name, address.phone);
    // }
  }
}
```
### 접근제어자
- OOP 의 4가지 속성 중 은닉(Encapsulation)에 해당된다

- 종류 : public, protected, default, private
- 접근 제어자의 적용 가능 범위

  |  구분  |  같은 클래스  | 같은 패키지 | 다른 패키지의<br>자손 클래스 | 전체  |
  | :---: | :---: | :----------: | :--------: | :---: |
  | public | O |    O     |   O    | O  |
  | protected | O  |     O     | O      |   |
  | default  | O |      O    |       |  |
  | private  | O |          |        |  |
- 접근 제어자의 사용 범위

  |구분|클래스|생성자|멤버|
  | :---: | :---: | :---: | :---: |
  |public|O|O|O|
  |protected||O|O|
  |default|O|O|O|
  |private||O|O|
#### private 
- 데이터는 보통 private 을 접근 제어자로 사용한다

  <small>!! 메서드는 보통 public 을 접근 제어자로 사용한다</small>
  ```java
  class Modifier {
    String data1 = "default";
    public String data2 = "public";
    private String data3 = "private";

    void viewData3(){
      System.out.println(this.data1);
      System.out.println(this.data2);
      System.out.println(this.data3); 
    }
  }
  public class ModifierEx01 {
    public static void main(String[] args) {
      Modifier m = new Modifier();
      System.out.println(m.data1);
      System.out.println(m.data2);
      // System.out.println(m.data3);
      // 에러!! private 접근 제어자를 가진 변수는 다른 클래스에서 사용이 불가능하다
      m.viewData3();
      // 이렇게 클래스 내부의 메서드를 이용해 private 접근 제어자의 변수를 사용할 수 있다
    }
  }
  ```
  !! 아래와 같이 사용할 클래스 파일이 소스파일 외부에 있는 게 보통이다 
  ```java
  // Modifier.java
  class Modifier {
    String data1 = "default";
    public String data2 = "public";
    private String data3 = "private";

    void viewData(){
      System.out.println(this.data1);
      System.out.println(this.data2);
      System.out.println(this.data3); 
    }
  }
  ```
  ```java
  // ModifierEx01.java
  public class ModifierEx01 {
    public static void main(String[] args) {
      Modifier m = new Modifier();
      System.out.println(m.data1);
      System.out.println(m.data2);
      m.viewData();
    }
  }
  ```
##### getter , setter 메서드
  - getter 메서드 : private 멤버변수의 값을 반환한다

  - setter 메서드 : private 멤버변수의 값을 설정한다
```java
class Modifier {
  private String data;

  public void setData(String data){
    this.data = data;
  } // setter 메서드
  public String getData(){
    return this.data;
  } // getter 메서드
}

public class ModifierEx01 {
  public static void main(String[] args) {
    Modifier m = new Modifier();
    // m.data = "홍길동";
    // 에러!! 
    m.setData("홍길동"); // setter 메서드를 이용해 data의 값을 설정
    // System.out.println(m.data);
    // 에러!! 
    System.out.println(m.getData()); // getter 메서드를 이용해 data 값을 출력
  }
}
```
!! 왜 setter 메서드를 이용해 값을 설정하게 할까?

&rarr; &nbsp;부적절한 값으로 설정하는 것을 조건문을 통해 막을 수 있다
```java
class BelievableUserInfo{
  private String name = "홍길동";
  private int account = 10000;

  public String getName(){
    return this.name;
  }
  public void setName(String name){
    if(name != null){ 
      this.name = name;
    } else{
      System.out.println("부적절한 name 할당 시도 무시 : " + name);
    }
  } // name 의 값이 null 이면 값을 설정하지 않고 메세지를 출력하게 한다

  public int getAccount(){
    return this.account;
  }
  public void setAccout(int account){
    if(account > 0){
      this.account = account;
    } else{
      System.out.println("부적절한 account 할당 시도 무시 : " + account);
    }
  }
} // account 값이 음수이면 값을 설정하지 않고 메세지를 출력하게 한다

public class ModifierEx01 {
  public static void main(String[] args) {
    BelievableUserInfo info = new BelievableUserInfo();
    System.out.printf("사용자 정보 : %s, %d%n",info.getName(),info.getAccount());
    info.setName(null); // 부적절한 name 할당 시도 무시 : null
    // 메세지를 출력하고 값을 설정하지 않는다
    info.setAccout(-10000); // 부적절한 account 할당 시도 무시 : -10000
    // 메세지를 출력하고 값을 설정하지 않는다
    System.out.printf("사용자 정보 : %s, %d%n",info.getName(), info.getAccount());
  }
}
```
### 상속
- OOP 의 4가지 속성 중 상속(Inheritance)에 해당한다
- 상속을 통해서 기존 클래스를 재사용해 새로운 클래스를 만든다

  &rarr; &nbsp;&nbsp;공통 내용의 모듈화

  <small>기존 클래스 (조상클래스, 부모클래스, 공통클래스)

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&uarr;</b> &nbsp;&nbsp;&nbsp;상속 (화살표 방향 주의 !!)
  
   새로운 클래스(자손클래스, 자식클래스, 서브클래스)</small>

- 자손 클래스는 하나의 부모 클래스만 가질 수 있다

  &rarr; &nbsp;&nbsp;단일상속만 가능하다 (조상은 많을 수 있다)
- 상속은 "is ~ a 관계"라고도 한다

  <small>ex) <b>Apple is a Fruit</b><br> Apple 클래스는 Fruit 클래스를 상속시켜 만들 수 있다</small> 

- 상속 방법
```java
class Child extends Parents {
  
}
```
- 상속 받은 클래스의 멤버변수, 메서드를 사용할 수 있다
```java
class Parent {
  String p = "부모";

  void viewParent(){
    System.out.println("viewParent 호출");
  }
}

class Child1 {
  String c1 = "자식";

  void viewChild(){
    System.out.println("viewChild 호출");
  }
}

class Child2 extends Parent {
  String c2 = "자식2";

  void viewChild(){
    System.out.println("viewChild 호출");
  }
}
public class InheritanceEx01 {
  public static void main(String[] args) {
    Parent p = new Parent();
    p.viewParent();
    Child1 c1 = new Child1();
    c1.viewChild();
    // c1.viewParent();
    // 에러!! 클래스 내부에 선언되어 있지 않는 메서드는 호출할 수 없다
    System.out.println(c1.c1);
    // System.out.println(c1.p);
    // 에러!! 클래스 내부에 선언되어 있지 않는 변수는 호출할 수 없다
    Child2 c2 = new Child2();
    c2.viewChild();
    c2.viewParent(); // Parent 클래스를 상속받았기 때문에 메서드 viewParent 호출이 가능하다
    System.out.println(c2.c2);
    System.out.println(c2.p); // Parent 클래스를 상속받았기 때문에 변수 p 사용이 가능하다
  }
}
```
- 메모리 관점에서의 상속
```java
class Parent {
  Parent(){
    System.out.println("Parent 생성자 호출");
  }
}
class Child extends Parent {
  Child(){
    System.out.println("Child 생성자 호출");
  }
}
public class ConstructorEx11 {
  public static void main(String[] args) {
    Child c = new Child();
    // Parent 생성자 호출
    // Child 생성자 호출
    // 자식 클래스의 생성자가 호출 될 때, 부모 클래스의 생성자 역시 호출된다
  }
}
```
```java
class Parent {  
    void viewParent(){ 
      System.out.println("viewParent 호출 : " + this);
    }
  }
  class Child extends Parent {
    void viewChild(){
      System.out.println("viewChild 호출 : " + this);
    }
  }
public class InheritancEx02 {
  public static void main(String[] args) {
    Child c = new Child();
    System.out.println(c); // Child@7d6f77cc
    c.viewChild(); // viewChild 호출 : Child@7d6f77cc
    c.viewParent(); // viewParent 호출 : Child@7d6f77cc
    // 자손 클래스의 객체가 생성될 때, 그 객체 안에 부모 클래스의 객체도 생성되기 때문에 두 객체의 참조값이 같다
  }
}
```
#### Object
- 모든 클래스의 조상 클래스 

  &rarr; "extends ParentClass" 가 없으면 컴파일러가  "extends Object" 를 추가해서 컴파일한다
```java
class Parent /* extends Oject */ {  
  void viewParent(){ 
    System.out.println("viewParent 호출");
  }
}
class Child extends Parent {
  void viewChild(){
    System.out.println("viewChild 호출");
  }
}
public class Inheritance {
  public static void main(String[] args) {
    Child c = new Child();
    c.viewChild();
    c.viewParent();
    Parent p = new Parent();
    p.viewParent();
    System.out.println(p.toString()); // 상속받은 Object 의 메서드라서 사용이 가능하다
    System.out.println(c.toString()); // Parent 클래스를 상속받아 그 조상 클래스인 Object 클래스의 메서드도 사용이 가능하다
  }
}
```
#### 상속에서의 접근제어자
```java
class Parent {  
  private String p1 = "홍길동";
  public String p2 = "박문수";
  String p3 = "이몽룡";
  void viewParent(){ 
    System.out.println("viewParent 호출 : " + this);
  }
}
class Child extends Parent {
  void viewChild(){
    System.out.println("viewChild 호출 : " + this);
    // System.out.println(p1);
    // 에러!! private 접근제어자를 쓴 변수 ,메서드는 선언된 클래스에서만 사용가능하다
    System.out.println(p2);
    System.out.println(p3);
  }
}
class GrandChild extends Child {
  void viewGrandChild(){
    System.out.println("viewGrandChild 호출 : " + this);
    // System.out.println(p1);
    // 에러!! private 접근제어자를 쓴 변수 ,메서드는 선언된 클래스에서만 사용가능하다
    System.out.println(p2);
    System.out.println(p3);
  }
}
public class InheritanceEx03 {
  public static void main(String[] args) {
    GrandChild gc = new GrandChild();
    gc.viewGrandChild();
    gc.viewChild();
    gc.viewParent();
    Child c = new Child();
    // System.out.println(c.p1);
    // 에러 !! private 접근제어자를 쓴 변수, 메서드는 선언된 클래스에서만 사용가능하다
    System.out.println(c.p2);
    System.out.println(c.p3);
  }
}
```
#### 오버라이딩(Overriding)
- 메서드의 재정의

  &rarr; &nbsp;오버로딩(Overloading) 은 새로운 메서드를 정의하는 것이다
- 메서드 이름, 파라미터, 리턴 타입은 조상클래스와 같아야 한다
- 접근 제어자는 조상 클래스의 메서드보다 범위가 넓거나 같아야 한다

- 조상 클래스의 메서드보다 더 상위의 예외를 던질 수는 없다

```java
class Parent {  
    void viewParent(){ 
      System.out.println("viewParent 호출 : " + this);
    }
  }
  class Child extends Parent {
    void viewChild(){
      System.out.println("viewChild 호출 : " + this);
    }
    void viewParent(){
      System.out.println("Child의 viewPanrent 호출");
    }
    void viewParent(int a){
      System.out.println("Child의 viewPanrent 호출 : " + a);
    }
    // int viewParent(){
    //   System.out.println("Child의 viewPanrent 호출 : " + a);
    //   return 10;
    // }
    // 에러!! 같은 이름의 메서드를 선언할 수는 없다
  }
public class OverridingEx02 {
  public static void main(String[] args) {
    Child c = new Child();
    c.viewParent(); // Child의 viewParent 호출
    // 자식 클래스의 객체가 오버라이딩 된 메서드를 호출하면 자식 클래스의 메서드를 호출한다
    c.viewParent(20); // Child의 viewParent 호출 : 20 
    // 오버로딩
  }
}
```
#### super
- 자식 클래스에서 조상 클래스의 참조값을 값으로 가진다

  <small> !! this 와 비교하기</small>
```java
class Parent {  
    String p = "박문수";
    void viewParent(){ 
      System.out.println("viewParent 호출 : " + this);
    }
  }
  class Child extends Parent {
    String p = "홍길동";
    void viewChild(){
      System.out.println("viewChild 호출 : " + this);
    }
    void viewParent(){
      System.out.println("Child의 viewPanrent 호출 ");
    }
    void viewSuperParent(){
      super.viewParent();
    }
    void viewP(){
      System.out.println(p);
    }
    void viewSuperP(){
      System.out.println(super.p);
    }
  }
public class SuperEx02 {
  public static void main(String[] args) {
    Child c = new Child();
    c.viewParent(); // Child의 viewPanrent 호출
    c.viewSuperParent(); // viewParent 호출 : Child@7d6f77cc
    c.viewP(); // 홍길동
    c.viewSuperP(); // 박문수
  }
}
```
#### super()
- 자손 클래스의 객체가 생성될 때, 그 객체 안에 조상 클래스의 객체도 호출된다

- super()로 조상 클래스의 생성자를 호출한다

- super() 는 반드시 첫 줄에 써야 한다
```java
class Parent {
  Parent(String data){
    System.out.println("Parent(String data) 생성자 호출");
  }
}
class Child extends Parent {
  Child(){
    // Parent("19");
    // 에러!!
    super("19"); // 조상 클래스의 생성자를 호출할 때는 super() 를 사용해야만 한다
    // super 와 super() 는 별개다
    System.out.println("Child 생성자 호출");
  }
}
public class ConstructorEx11 {
  public static void main(String[] args) {
    Child c = new Child();
  }
}
```
#### final
- final 이 붙으면 상속, 오버라이딩을 할 수 없다

  <small>!! final static 이 변수에 붙으면 상수를 의미한다 (할당 된 값 변경 불가)</small>

```java
final class Parent {
  // final 이 붙은 클래스는 상속을 하지 못한다
  Parent(){
    System.out.println("Parent 생성자 호출");
  }
}
class Child /* extends Parent */{
  // final class 를 상속받으면 에러가 발생한다
  Child(){
    System.out.println("Child 생성자 호출");
  }
}

public class FinalEx01 {
  public static void main(String[] args) {
    Child c = new Child();

  }
}
```
```java
class Parent {
  Parent(){
    System.out.println("Parent 생성자 호출");
  }

  final void viewParent(){
    System.out.println("viewParent 호출");
  }
}
class Child extends Parent {
  Child(){
    System.out.println("Child 생성자 호출");
  }
  // void viewParent(){
  //   System.out.println("Child의 viewParent 호출");
  // }
  // final 이 붙은 조상 클래스의 메서드는 자손 클래스에서 오버라이딩 할 수 없다
}

public class FinalEx01 {
  public static void main(String[] args) {
    Child c = new Child();
    c.viewParent();
  }
}
```
### 다형성
- OOP 의 네가지 속성 중 다형(Poymorphism)에 해당한다
#### 클래스의 형변환
- 상속관계에서만 형변환이 가능하다
- 자동형변환 : 자식 &rarr; 부모

- 강제형변환 : 부모 &rarr; 자식 

  <small>!! 자식 클래스의 객체 변수는 강제형변환을 통해서만 부모 클래스의 객체를 참조할 수 있다</small>

  <small>!! 강제형변환을 통해 원래 클래스로 돌아간다고 생각하자</small>
```java
class Parent {
  Parent(){
    System.out.println("Parent 생성자 호출");
  }
}
class Child extends Parent {
  Child(){
    System.out.println("Child 생성자 호출");
  }
}
public class CastingEx01 {
  public static void main(String[] args) {
    Child c1 = new Child();
    Parent p1 = c1; // 자동형변환
    System.out.println(c1);
    System.out.println(p1);
    // 같은 Child 객체를 참조하고 있다
    Parent p2 = new Child();
    // Child 객체 생성 후 Parent 로 자동형변환
    // p2 는 Child 객체를 참조하고 있다
    Child c2 = (Child)p1; // 강제형변환
    System.out.println(c2);
    // p1 이 참조하는 객체를 c2 도 참조한다

    // Child c4 = new Parent(); 
    // 에러!! 자동형변환 불가능 하다
    Child c4 = (Child)new Parent();
  }
}
```
- 형변환을 하면 메서드 사용이 달라진다
```java
class Parent {
  Parent(){
    System.out.println("Parent 생성자 호출");
  }
  void viewParent1(){
    System.out.println("Parent viewParent1 호출");
  }
  void viewParent2(){
    System.out.println("Parent viewParent1 호출");
  }
}
class Child extends Parent {
  Child(){
    System.out.println("Child 생성자 호출");
  }
  void viewChild1(){
    System.out.println("Child viewChild1 호출");
  }
  void viewParent2(){
    System.out.println("Child viewParent2 호출");
  }
}
public class CastingEx02 {
  public static void main(String[] args) {
    Child c1 = new Child();
    c1.viewChild1(); // Child viewChild1 호출
    c1.viewParent1(); // Parent viewParent1 호출
    c1.viewParent2(); // Child viewParent2 호출
    
    Parent p2 = new Parent();
    p2.viewParent1(); // Parent viewParent1 호출
    p2.viewParent2(); // Parent viewParent2 호출

    Parent p1 = new Child();
    // p1.viewChild1();
    // 부모는 자식 클래스 객체에만 있는 메서드를 사용할 수 없다
    p1.viewParent1(); // Parent viewParent1 호출
    p1.viewParent2(); // Child viewParent2 호출
    // 부모 클래스가 자식 클래스의 객체를 참조하는 경우, 
    // 오버라이딩 된 클래스 객체의 메서드는 자손 클래스의 메서드가 호출된다
  }
}
```

```java
class Parent {
  void viewParent(){
    System.out.println("Parent viewParent 호출");
  }
}
class Child1 extends Parent {
  void viewParent(){
    System.out.println("Child1 viewParent 호출");
  }
}
class Child2 extends Parent {
  void viewParent(){
    System.out.println("Child2 viewParent 호출");
  }
}

public class CastingEx03 {
  public static void main(String[] args) {
    Child1 c1 = new Child1();
    c1.viewParent(); // Child1 viewParent 호출
    Child2 c2 = new Child2();
    c2.viewParent(); // Child2 viewParent 호출
    
    Parent p1 = new Child1();
    Parent p2 = new Child2();
    p1.viewParent(); // Child1 viewParent 호출
    p2.viewParent(); // Child2 viewParent 호출
    // 조상 클래스가 참조하는 자손 클래스의 객체에 따라 호출하는 메서드가 달라진다
  }
}
```
### 패키지(package)
<small> jdk 10 이하 - 패키지 &supset; 클래스

  jdk 10 이상 - 모듈 &supset; 패키지 &supset; 클래스</small>
- 패키지 안에는 같은 클래스의 이름을 중복해서 사용할 수 없다

  !! 패키지 이름 정하기
  ```java
  // package 도메인(회사 도메인)
  package com.naver.www // naver 패키지
  ```
- 패키지 선언
```java
package packageName;
class className {

}
// className 을 packageName 패키지에 포함시킨다
```
- 패키지 선언을 따로 하지 않을 경우에는 default 패키지에 포함시킨다
```java
// C:\package1\PackA.java

// default package;
public class PackA {
  public PackA(){
    System.out.println("PackA 생성자 호출");
  }
}
```
```java
// C:\package1\PackMain.java

public class PackMain {
  // 메인 메서드가 존재하는 클래스를 실행클래스라고 한다
  public static void main(String[] args) {
    PackA a = new PackA();
  }
}
// 같은 패키지에 포함되어 있어서 public 접근 제어자를 가진 PackA 클래스를 사용할 수 있다
```
- 패키지 선언을 한 경우 컴파일 방법
```java
package pack1;

public class PackB {
  public PackB(){
    System.out.println("PackB 생성자 호출");
  }
}
```
```java
// 명령프롬프트
> javac -d . -encoding utf-8 PackB.java 
// -d 옵션을 사용해야 제대로 컴파일이 된다
// "." 은 현재 디렉터리를 의미한다
// 현재 디렉터리에 위에서 선언한 패키지가 없는 경우 그 이름의 패키지를 만든다
```
- 다른 패키지에 있는 클래스 사용하기
```java
package pack1;

public class PackB {
  public PackB(){
    System.out.println("PackB 생성자 호출");
  }
}
```
```java
> javac -d . -encoding utf-8 PackB.java 
// 현재 디렉터리의 pack1 패키지에 PackB.java 를 컴파일 한다
```
```java
// C:\package1\PackMain.java

public class PackMain {
  public static void main(String[] args) {
    PackA a = new PackA();
    pack1.PackB b = new pack1.PackB(); // pack1 에 있는 PackB 클래스를 사용
  }
}
```

- import

```java
package pack1;

public class PackB {
  public PackB(){
    System.out.println("PackB 생성자 호출");
  }
}
```
```java
> javac -d . -encoding utf-8 PackB.java 
```
```java
// C:\package1\PackMain.java

import pack1.PackB;

public class PackMain {
  public static void main(String[] args){
    PackA a = new PackA();
    PackB b = new PackB();
    // pack1.PackB b = new pack1.PackB();
    // 이렇게 쓰지 않아도 된다
  }
}
```








