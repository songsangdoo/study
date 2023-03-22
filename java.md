## 프로그램 언어

- 컴파일 언어 : 소스 &rarr; 컴파일 &rarr; 실행파일 &rarr; 실행

  - 실행 속도가 빠르기 때문에 산업적인 일에 많이 쓰인다

    <sup>ex) C / C++ / Java</sup>

    - C : 실행속도가 가장 빠른 언어라 os에 주로 쓰인다

    - Java : 상대적으로 배우기 쉽고, C언어에 비해 개발이 편리해 많이 쓰인다

- 스크립트 언어 : 소스 &rarr; 실행

  - 컴파일 과정이 없고 코딩이 편리하기 때문에 교육에 많이 쓰인다

    - javascript

    - python : 데이터 분석, 통계 쪽에 주로 쓰인다

---

# Java

- 준비 : JDK, 편집기

  - JDK(Java Development Kit) : 자바 프로그램 개발을 위해서 쓰이고, Oracle JDK 이외에도 openjdk 등 여러 곳에서 JDK를 제공한다

    - JRE(Java Runtime Environment) : 자바 구동 환경으로 JVM(Java Virtual Muchine), 시스템 라이브러리로 구성된다

      <small>!! 자바 프로그램 개발이 아닌 이미 개발된 프로그램 단순 실행을 위해서는 JRE만 있어도 된다</small>

    - 컴파일러, 디버거 등의 개발도구

- 편집기

  - 메모장

  - VSCode

  - IDE (Intergrated Development Environment)

    - eclipse : 전자 정부 프레임워크 (https://www.egovframe.go.kr/home/main.do)

    - intellij : 안드로이드 개발

- 자바 프로그램 실행절차<br><br>

<img src="https://mblogthumb-phinf.pstatic.net/20160912_214/it_sion_1473653250675llB1C_PNG/2.png?type=w800" ><br>

- 자바 소스 코드 작성 시 주의사항

  - public이 붙은 class 는 하나만 존재해야 한다

  - public class가 있으면 소스파일 이름은 class 이름과 같아야 한다
  - 대/소문자 구분한다
  - 문장끝에 세미콜론(;)을 붙인다
  - 영역을 표시할 때 중괄호를 사용한다

### elipse

- Java 편집기로 전자정부 프레임워크에 쓰인다

- 설치 및 실행 : 압축해제 &rarr; workspace 설정

- eclipse 실행순서

  1<sub >st</sub> . 프로젝트 만들기

  2<sub >nd</sub> . 패키지 만들기

  3<sub >rd</sub> . 클래스 만들기

  4<sub >th</sub> . 소스 파일 실행

  <small> !! 이때, 소스파일을 실행시키면 바로 실행이 되는데, 소스파일로 실행되는 것이 아니라 <br>소스 파일이 컴파일된 클래스 파일이 bin 디렉터리에 만들어지고, 그 클래스 파일이 실행되는 것이다</small>

  <small>!! Java는 소스파일이 실행되는 것이 아니라 소스파일이 컴파일된 class 파일을 실행시킨다</small>

- 메인 메서드에서의 파라미터 args는 메인 메서드를 한번은 실행해야 그 값을 줄 수 있다

---

## Java 문법

### Java 기본

- 파일명은 public class 이름과 같아야 한다

```java
// HelloWorld.java

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
// 에러가 나오지 않으면 현재 디렉터리에 HelloWorld.class 파일이 생성된다
// Java 파일에 주석이라도 한글이 들어가 있는 경우에는 아래와 같이 -encoding utf-8 을 이용한다
// > javac -encoding utf-8 HellowWorld.java
> java HelloWorld // 실행 시킬 때, 파일명에 확장자 쓰지 않는 것에 주의하자
// Hello world!
```

- Java 출력 기본

  <small>!! 개발자는 본인이 출력의 결과를 미리 알아야 한다</small>

```java
public class PrintEx01 {
  public static void main(String[] args) {
    System.out.println("Hello Print");
    System.out.println("Hello Print");
    System.out.println("Hello Print");
    // System.out.println()은 출력 마지막에 엔터키가 들어간다
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

    // int num1 = 20;
    // System.out.println(num4);
    // 에러!! 같은 이름의 변수 재선언 불가능하다
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
    System.out.println(c1); // a
    System.out.println(c2); // a
    // 문자는 ASKII 코드 값으로 저장되기 때문에 숫자로 저장할 수도 있다
    // ASKII 코드 - 영문자, 숫자, 특수기호
    char c3 = 'b';
    // char c3 = 97 + 1;
    System.out.println(c3); // b
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
    // String은 기본자료형이 아닌 객체자료형이다
    char c1 = 'a';
    // char c1 = "a";
    // 에러!! char 형은 작은 따옴표를 사용한다
    String str1 = "Hello";
    // String str1 = 'Hello';
    //  에러!! String 은 큰 따옴표를 사용한다
    System.out.println(c1); // a
    System.out.println(str1); // Hello
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
    // 실수형 - float < double (할당할 수 있는 값의 범위 차이가 있다)

    /* int i = 2.5;  에러!!
    System.out.println(i); */

    // float f = 2.5;
    // 에러!! f를 붙이지 않은 실수는 double 자료형으로 float 자료형에 할당시킬 수 없다
    // double이 모든 실수의 기본형
    float f = 2.5f;
    // float 자료형 변수에 할당할 실수 뒤에는 f나 F를 반드시 붙여야 한다
    double height = 180.1;
    double weight = 60.4;
    System.out.println(height);
    System.out.println(weight);
    // 지수(e) - e 뒤에 붙어있는 수 만큼 지수승 한다
    double d2 = 3.14e2;
    System.out.println(d2); // 3.14 * 100
    double d3 = 3.14e-2;
    System.out.println(d3); // 3.14 * 0.01
    float f3 = 0.1234567890123456789f;
    double d4 = 0.1234567890123456789;
    System.out.println(f3); // 0.12345679
    // float 자료형은 소수점 9번째에서 반올림하여 소수점 8번째 자리까지 표현
    System.out.println(d4); // 0.12345678901234568
    // double 자료형은 소수점 18번째 자리에서 반올림하여 소수점 17번째 자리까지 표현
  }
}
```

- 논리형

```java
public class VariableEx03 {
  public static void main(String[] args) {
    boolean bool1 = true;
    // boolean 형은 true, false 값만 갖는다
    // boolean bool1 = True;
    // 에러!! 대소문자 구분 잘해야된다
    System.out.println(bool1); // true
  }
}
```

---

#### 참조형

- 배열, 클래스

---

#### 형변환

- 형변환 연산자 : 소괄호를 이용한다

- 구분

  - 묵시적 형변환 : 큰 자료형으로는 묵시적 형변환이 가능하다

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
      // short s1 = i1;
      // 에러!! 작은 자료형으로 묵시적 형변환 불가
      int i1 = 20;
      short s1 = (short)i1; // 소괄호 안에 형변환시킬 자료형을 넣는다
      System.out.println(s1); // 20
      char c1 = 'A';
      int i2 = c1 + 3;
      System.out.println(i2); // 68
      System.out.println((char)i2); // D
      // int 자료형은 형변환 연산자를 사용해 char 자료형으로 변환시킬 수 있다

      // boolean b = false;
      // int i3 = (int)b;
      // 에러!! boolean 자료형은 형변환 연산자를 사용하더라도 int 자료형으로 형변환 불가
    }
  }
  ```

  ### 연산자

  #### 산술연산자

  - <b>+ , - , \* , / , %</b> <br><br>

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
      // 에러!! byte, short 자료형은 산술 연산 시  int 자료형으로 형변환 된 후 연산된다
      short s1 = 10;
      short s2 = 20;
      int sum2 = s1 + s2; // int 자료형으로 결과를 받으면 에러가 생기지 않는다
      // short sum2 = (short)(s1 + s2);
      // 명시적 형변환을 이용할 수도 있다
      System.out.println(sum2);
      // int i3 = 100;
      // long l1 = 200;
      // int sum3 = i1 + l1;
      // 에러!! int 자료형보다 큰 자료형과 산술 연산 시 큰 자료형으로 형변환된 후 연산된다
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
      System.out.println(product1); // -1454759936
      // 변수 product1에 오버플로우된 값이 할당되어 있다
      long product2 = (long)i1 * i2;
      // 피연산자 중 하나를 long 자료형으로 바꿔주면 형변환이 일어나 오버플로우가 일어나지 않는다
      System.out.println(product2); // 2000000000000
    }
  }
  ```

  #### 대입연산자

  - <b>= , += , -= , \*= , /= , %= </b>

  #### 비교연산자

  - <b>< , > , <= , >= , == , != </b>

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

  ***

  ### 제어문

  - 조건 파악이 중요하다

  - 기본적으로 Javascript 와 동일하다

  #### 조건에 의한 분기

  <small>!! flowchart 먼저 생각하기 </small>

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
      int score = 99;
      if(score >= 90){
        System.out.println("A");
      } else if(score >= 80){
        System.out.println("B");
      } else if(score >= 70){
        System.out.println("C");
      } else if(score >= 60){
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
      int score = 94;
      switch(score / 10){
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
      String msg = (10 < 20 && 30 > 10)? "1" : "20";
      System.out.println(msg); // 1
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
      초기화 식을 밖으로 뺄 수 있다
      int i = 0, j = 0;
      for(; i < 10; i++, j += 2){
        System.out.print(i + j);
        System.out.println();
      }
      */
      /*
      조건식도 밖으로 뺄 수 있다
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

- 같은 타입의 데이터 여러 개를 연속된 데이터 공간에 할당시켜 하나의 변수로 다루는 것을 배열이라고 한다

- 같은 타입의 데이터를 넣어야 하지만, 묵시적 형변환이 되는 값이라면 할당시킬 수 있다

  <sup>ex) int[] 자료형에 byte, short, char 자료형 값을 할당시킬 수 있다</sup>

- 배열의 크기는 변경시킬 수 없다
- 배열의 메모리 구조를 잘 이해하자 !!

#### 배열의 기본

##### 1차원 배열

```java
public class ArrayEx01 {
  public static void main(String[] args) {
    int[] arr; // 배열의 선언
    // int가 아니라 int[] 가 자료형이다

    arr = new int[5]; // 배열의 생성
    // int 값이 5개 들어가는 배열을 생성한 뒤, 그 배열을 가리키는 참조값을 arr에 할당한다
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

  |      자료형      |  기본값  |          비고          |
  | :--------------: | :------: | :--------------------: |
  |     boolean      |  false   |
  |       char       | '\u0000' |       공백 문자        |
  | byte, short, int |    0     |
  |       long       |    0L    |
  |      float       |   0.0f   |
  |      double      |   0.0    |
  |   참조형 변수    |   null   | 아무것도 참조하지 않음 |

```java
public class ArrayEx02 {
  public static void main(String[] args) {
    int[] intArr = new int[5];
    double[] doubleArr = new double[5];
    System.out.println(intArr[0]); // 0
    System.out.println(doubleArr[0]); // 0.0
    // 기본값을 출력한다
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
    points[1] = 'A'; // char 자료형 값이 int 자료형으로 저장되면 아스키 코드값으로 저장된다
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

- 배열을 참조하는 1차원 배열

```java
public class Arrayex06 {
  public static void main(String[] args) {
    int[][] arr1; // 2차원 배열의 선언

    arr1 = new int[3][2]; // 3행 2열의 배열을 생성하고, 참조값을 arr1 에 할당
    // new int[3][2]에서 2는 생략이 가능하지만, 3은 생략이 불가능하다 (!! 가변배열 참조)
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

- 가변배열

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

  <small> !! 클래스에 대한 문법을 배워서 라이브러리(API)를 사용할 수 있어야 한다</small>

- 클래스 : 참조형 자료이고 객체를 생성할 수 있다

  - 사용자 정의 클래스
  - 라이브러리(API)

    <small> !! https://docs.oracle.com/en/java/javase/11/docs/api/index.html 참조</small>

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

  !! JVM 메모리 구조

  - 클래스 영역 : 클래스의 원형에 대한 정보가 저장되는 영역

    - Field 정보 : 멤버변수, 변수 접근 제어자 정보
    - Method 정보 : 메서드, 리턴타입, 파라미터, 메서드 접근 제어자 정보
    - Type 정보 : 타입의 이름, 상위 클래스 이름, 클래스 접근 제어자, 타입의 속성이 클래스인지 인터페이스인지에 대한 정보

    - 상수 풀 : 상수에 대한 정보

  - 스택 영역 : 메서드 호출 시 로컬 변수가 쌓이는 영역으로 스레드마다 따로 공간을 가진다 (객체를 받는 변수가 이 영역에 저장된다)

  - 힙 영역 : new로 생성된 객체가 저장되는 영역으로 스레드가 모두 공유한다 (스택 영역에 있는 변수가 가리키는 객체가 이 영역에 저장된다)

- 클래스 선언 및 생성

```java
class Student {
  String name;
  String idNum;
  int age;
  double height, weigth;
} // Student 클래스 선언

public class ObjectEx01 {
  public static void main(String[] args) {
    Student stu1; // Student 객체를 받는 변수 stu1 선언
    stu1 = new Student();
    // Student 객체를 생성하고 그 객체의 참조값을 변수 stu1에 할당한다
    System.out.println(stu1); // Student@2d363fb3
    // 객체를 참조하는 변수를 출력하면 "자료형@해시코드"가 출력된다
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

    <small>!! 클래스 영역에 선언되는 변수는 초기화 하지 않아도 기본값을 가지기 때문에 초기화가 필수가 아니다</small>

  - 함수(클래스 내부의 메서드 포함), 초기화 블록, 생성자 영역에 선언 : 로컬변수

    <small>!! 로컬변수는 기본값을 가지지 않기 때문에 사용하기 전에 반드시 초기화 해줘야 한다</small>

    !! 자료형에 따른 기본값

    |      자료형      |  기본값  |          비고          |
    | :--------------: | :------: | :--------------------: |
    |     boolean      |  false   |
    |       char       | '\u0000' |       공백 문자        |
    | byte, short, int |    0     |
    |       long       |    0L    |
    |      float       |   0.0f   |
    |      double      |   0.0    |
    |   참조형 변수    |   null   | 아무것도 참조하지 않음 |

- 구분

  - 클래스 멤버변수 : 같은 클래스로 만들어진 객체가 공유하는 데이터로 클래스가 클래스 영역에 저장될 때 생기기 때문에 객체가 만들어지지 않아도 사용할 수 있다 (선언할 때, static을 붙인다)
  - 인스턴스 멤버변수 : 힙 영역에 저장된 객체마다 따로 갖는 변수이기 때문에, 객체를 만들어야 사용할 수 있다

  - 로컬 변수

  ```java
  class Variable {
    String instanceVar; // 인스턴스 멤버변수
    static String classVar; // 클래스 멤버변수
    void doFunc(){
      int localVar2 = 20; // 로컬변수
      System.out.println(localVar2);
    }
  }
  public class VariableEx10 {
    public static void main(String[] args) { // 메인 메서드
      int localVar1 = 10; // 로컬변수
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
    System.out.println("doFunc2 호출 : " + data1);
  }
  void doFunc3(int data1, String data2){
    System.out.println("doFunc3 호출 : " + data1);
    System.out.println("doFunc3 호출 : " + data2);
  }
  // void는 return 값이 없음을 나타낸다
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
      case "X":
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
    v1.doFunc1(); // doFunc1 호출
    v2.doFunc1(); // doFunc1 호출
    // 같은 내용이 출력되지만 서로 다른 영역의 함수를 호출한 것이다
    v1.doFunc2(); // doFunc2 호출
    v2.doFunc2(); // doFunc2 호출
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
  void doFunc(int a, String s){
    System.out.println("doFunc 호출 : " + a + s);
  }
}
public class MainEx03 {
  public static void main(String[] args) {
    MethodEx ex = new MethodEx();
    ex.doFunc();
    ex.doFunc("hi");
    ex.doFunc("hi", 10); // doFunc 호출 : hi10
    // doFunc(String s, inta) 호출
    ex.doFunc(10, "hi"); // doFunc 호출 : hi10
    // doFunc(int a, String s) 호출
  }
}
```

```java
class Overloading{
  String val;
  void doFunc(){
    doFunc("value1"); // 중복 코드를 제거하기 위하여 오버로딩된 함수를 이용해 작성할 수 있다
  }
  void doFunc(String val){
    this.val = val; // this는 자기 참조값으로 자신을 가리키는 참조값을 가진다
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

- 파라미터의 개수를 정할 수 없을 때 사용한다

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
  } // 인자를 이름이 args인 배열로 받아 개수 상관없이 받을 수 있다
}
public class MainEx04 {
  public static void main(String[] args) {
    MethodEx ex = new MethodEx();
    ex.doFunc(10, 20);
    // ex.doFunc(10, 20, 30);
    // 에러!! 파라미터 개수가 2개로 정해져 있다
    ex.doFunc1(10, 20);
    ex.doFunc1(10, 20, 30);
  }
}
```

```java
public class MainEx20 {
  public static void main(String[] args) {
  // args는 프로그램 실행시 터미널을 통해 문자열을 배열로 받아준다
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

  &rarr; 객체에 대한 참조

- 객체의 참조주소를 값으로 가지기 때문에 this를 자기참조라고 한다
- 객체가 생성되어야 사용할 수 있기 때문에, static 메서드는 this를 사용할 수 없다

  &rarr; &nbsp;메인메서드에서 this 는 사용할 수 없다

```java
class Method {
  String data;

  void doFunc(String data){
    this.data = data;
    // this.data는 위에서 선언한 인스턴스 변수 data를 의미하고 대입연산자 오른쪽의 data는 전달받을 인수를 의미한다
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
    // 객체의 참조값이 출력되는데, 이 값은 m1 객체에서 사용되는 this의 값과 같다

    Method m2 = new Method();
    m2.doFunc("10");
    System.out.println("m2 : " + m2);
    // m1 객체의 this 와 m2 객체의 this는 서로 다른 값을 가진다
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
    Constructor c1 = new Constructor(); // Constructor()가 기본생성자
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

- this()로 같은 클래스 내의 다른 생성자를 호출해서 생성자를 만들 수 있다

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

2차원 배열을 이용한 위의 코드를 클래스 배열을 이용해 만들 수 있다

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

### 접근 제어자

- OOP 의 4가지 속성 중 은닉(Encapsulation)에 해당된다

- 종류 : public, protected, default, private
- 접근 제어자의 적용 가능 범위

  |   구분    | 같은 클래스 | 같은 패키지 | 다른 패키지의<br>자손 클래스 | 전체 |
  | :-------: | :---------: | :---------: | :--------------------------: | :--: |
  |  public   |      O      |      O      |              O               |  O   |
  | protected |      O      |      O      |              O               |      |
  |  default  |      O      |      O      |                              |      |
  |  private  |      O      |             |                              |      |

- 접근 제어자의 사용 범위

  |   구분    | 클래스 | 생성자 | 멤버 |
  | :-------: | :----: | :----: | :--: |
  |  public   |   O    |   O    |  O   |
  | protected |        |   O    |  O   |
  |  default  |   O    |   O    |  O   |
  |  private  |        |   O    |  O   |

#### private

- 데이터는 보통 private을 접근 제어자로 사용한다

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

- private 접근 제어자를 사용하는 변수를 사용하기 위해 쓰이는 메서드

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
    System.out.println(m.getData()); // 홍길동
    // getter 메서드를 이용해 data 값을 출력
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
    System.out.printf("사용자 정보 : %s, %d%n",info.getName(), info.getAccount()); // 사용자 정보 : 홍길동, 10000
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

  <small>!! 클래스가 다른 클래스를 이용하는 방법으로는 상속, 포함 두가지가 있다</small>

- 자손 클래스는 하나의 부모 클래스만 가질 수 있다

  &rarr; &nbsp;단일상속만 가능하다

  &rarr; &nbsp;조상은 많을 수 있지만 부모는 하나뿐이다

- 상속은 "is ~ a 관계"라고도 한다

  <sup>ex) <b>Apple is a Fruit</b><br> Apple 클래스는 Fruit 클래스를 상속시켜 만들 수 있다</sup>

  <small>!! 다른 클래스를 포함하는 포함관계는 "has ~ a 관계"라고 한다</small>

  ```java
  class A {
    B b = new B(); // 이런 경우를 포함관계라고 한다
  }
  ```

- 상속 방법

```java
class Child extends Parent {
  // 클래스 내용
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
  String c1 = "자식1";

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
    p.viewParent(); // viewParent 호출
    Child1 c1 = new Child1();
    c1.viewChild(); // viewChild 호출
    // c1.viewParent();
    // 에러!! 클래스 내부에 선언되어 있지 않는 메서드는 호출할 수 없다
    System.out.println(c1.c1); // 자식1
    // System.out.println(c1.p);
    // 에러!! 클래스 내부에 선언되어 있지 않는 변수는 호출할 수 없다
    Child2 c2 = new Child2();
    c2.viewChild(); // viewChild 호출
    c2.viewParent(); // viewParent 호출
    // Parent 클래스를 상속받았기 때문에 메서드 viewParent 호출이 가능하다
    System.out.println(c2.c2); // 자식2
    System.out.println(c2.p);  // 부모
    // Parent 클래스를 상속받았기 때문에 변수 p 사용이 가능하다
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
    // 자식 클래스의 생성자가 호출될 때, 부모 클래스의 생성자 역시 호출된다
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

  &rarr; "extends ParentClass"가 없으면 컴파일러가 "extends Object"를 추가해서 컴파일한다

```java
class Parent /* extends Object */ {
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
    c.viewChild(); // viewChild 호출
    c.viewParent(); // viewParent 호출
    Parent p = new Parent();
    p.viewParent(); // viewParent 호출
    System.out.println(p.toString());
    // 상속받은 Object 의 메서드라서 사용이 가능하다
    System.out.println(c.toString());
    // Parent 클래스를 상속받아 그 조상 클래스인 Object 클래스의 메서드도 사용이 가능하다
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
    // 에러!! private 접근 제어자를 쓴 변수, 메서드는 선언된 클래스에서만 사용가능하다
    System.out.println(p2);
    System.out.println(p3);
  }
}
class GrandChild extends Child {
  void viewGrandChild(){
    System.out.println("viewGrandChild 호출 : " + this);
    // System.out.println(p1);
    // 에러!! private 접근 제어자를 쓴 변수 ,메서드는 선언된 클래스에서만 사용가능하다
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

- 조상 클래스의 메서드를 자손 클래스에서 재정의한다

  <small>!! 오버로딩(Overloading) 은 새로운 메서드를 정의하는 것이다</small>

- 메서드 이름, 파라미터, 리턴 타입은 조상클래스와 같아야 한다
- 접근 제어자는 조상 클래스의 메서드보다 범위가 넓거나 같아야 한다

- 조상 클래스의 메서드보다 더 상위의 예외를 던질 수는 없다

- "@Override" 애노테이션을 써서 오버라이딩 규칙에 맞지 않을 경우, 오류를 발생시키라고 컴파일러에게 전달할 수 있다

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
  // 에러!! 리턴 타입이 달라졌으므로 같은 이름의 메서드를 선언하는 것과 같다
}
public class OverridingEx02 {
  public static void main(String[] args) {
    Child c = new Child();
    c.viewParent(); // Child의 viewParent 호출
    // 자식 클래스의 객체가 오버라이딩된 메서드를 호출하면 자식 클래스의 메서드를 호출한다
    c.viewParent(20); // Child의 viewParent 호출 : 20
    // 오버로딩
  }
}
```

#### super

- 객체마다 가지고 있고, 객체마다 다른 값을 가진다

  &rarr; 객체에 대한 참조

- 자식 클래스에서 조상 클래스의 참조값을 값으로 가진다

  <small> !! 단, 부모 클래스에만 접근이 가능하다</small>

  <small> !! this와 비교하기</small>

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
    System.out.println("Child의 viewParent 호출 ");
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

  <small>!! 자손 클래스 생성자에 this() 또는 super()를 이용해 다른 생성자를 호출하는 코드가 없다면,<br> 컴파일러가 조상의 기본 생성자를 호출하는 super()를 첫행에 삽입한다</small>

- super()로 조상 클래스의 생성자를 호출한다

- super()는 반드시 첫 줄에 써야 한다

```java
class Parent {
  String data;
  Parent(String data){
    this.data = data;
    System.out.println("Parent(String data) 생성자 호출 : " + data);
  }
}
class Child extends Parent {
  Child(){
    // Parent("19");
    // 에러!!
    super("19"); // 조상 클래스의 생성자를 호출할 때는 super()를 사용해야만 한다
    // super와 super()는 별개다
    System.out.println("Child 생성자 호출");
  }
}
public class ConstructorEx11 {
  public static void main(String[] args) {
    Child c = new Child(); // Parent(String data) 생성자 호출 : 19
  }
}
```

#### final

- final이 붙으면 상속, 오버라이딩을 할 수 없다

  <small>!! final static이 변수에 붙으면 상수를 의미한다 (할당된 값 변경 불가)</small>

```java
final class Parent {
  // final이 붙은 클래스는 상속을 하지 못한다
  Parent(){
    System.out.println("Parent 생성자 호출");
  }
}
class Child /* extends Parent */{
  // final class를 상속받으면 에러가 발생한다
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
  // final이 붙은 조상 클래스의 메서드는 자손 클래스에서 오버라이딩 할 수 없다
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

- 부모 클래스 참조 변수를 통해서 자식 클래스 객체의 메서드를 호출

#### 객체의 형변환

- 클래스의 경우 상속관계에서만 형변환이 가능하다

- 자동형변환 : 자식 &rarr; 부모

- 강제형변환 : 부모 &rarr; 자식

  <small>!! 부모 클래스 객체 변수는 강제형변환을 통해서만 자식 클래스의 객체를 참조할 수 있다</small>

  <small>!! 자식 클래스 객체를 부모 클래스로 형변환시킨 경우만 자식 클래스로 다시 형변환시켜야 문제가 없기 때문에 강제형변환을 통해 원래 클래스로 돌아간다고 생각하자</small>

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
    // Child 객체 생성 후 Parent로 자동형변환
    // p2는 Child 객체를 참조하고 있다
    Child c2 = (Child)p1; // 강제형변환
    System.out.println(c2);
    // p1이 참조하는 객체를 c2 도 참조한다

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
    System.out.println("Parent viewParent2 호출");
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
    // 부모는 자식 클래스 객체에 새롭게 정의된 메서드를 사용할 수 없다
    p1.viewParent1(); // Parent viewParent1 호출
    p1.viewParent2(); // Child viewParent2 호출
    // 부모 클래스가 자식 클래스의 객체를 참조하는 경우,
    // 오버라이딩된 클래스 객체의 메서드는 자손 클래스의 메서드가 호출된다
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

#### instanceof

- 객체가 특정 클래스의 객체를 포함하는지 확인하기 위해 사용된다

```java
class Employee1 extends Person {
  public void salary() {
    System.out.println("Employee salary 호출");
  }
}

class Employee2 extends Person {
  public void salary() {
    System.out.println("Employee2 salary 호출");
  }
}

public class MainEx01 {

  public static void main(String[] args) {
    Person p1 = new Employee1();
    Person p2 = new Employee2();    
    p1.salary(); // Employee salary 호출    
    p2.salary(); // Employee2 salary 호출
    System.out.println(p1 instanceof Person); // true
    System.out.println(p1 instanceof Employee1); // true
    System.out.println(p1 instanceof Employee2); // false
    System.out.println(p1 instanceof Object); // true
    // 특정 객체인지 확인하고 진리값을 반환한다
    // 자식 클래스의 객체가 만들어질 때, 조상 클래스의 객체도 같이 만들어지기 때문에 자식 클래스의 객체는 조상 클래스의 객체를 포함하는 것과 같다
  }
}
```

!! 조상 클래스의 객체는 자식 클래스로 형변환 하더라도 자식 클래스 객체의 메서드는 사용할 수 없다

```java
class Employee1 extends Person {
	public void salary() {
		System.out.println("Employee1 salary 호출");
	}
	public void viewEmployee() {
		System.out.println("Employee1 viewEmployee 호출");
	}
}
class Employee2 extends Person {
	public void salary() {
		System.out.println("Employee2 salary 호출");
	}
	public void viewEmployee() {
		System.out.println("Employee2 viewEmployee 호출");
	}
}

public class MainEx02 {

	public static void main(String[] args) {
		Person p1 = new Person();
		// Employee1 e1 = (Employee1)p1;
		// e1.viewEmployee();
		// 컴파일을 되지만 실행시 에러가 발생한다
		if(p1 instanceof Employee1) {
      Employee1 e1 = (Employee1)p1;
			e1.viewEmployee();
		}else {
			System.out.println("자식클래스 메서드 사용불가");
		}

		Person p2 = new Employee2();
		Employee2 e2 = (Employee2)p2;
		e2.viewEmployee(); // Employee2 viewEmployee 호출
	}

}
```

### 패키지(package)

<small> jdk 10 이하 - 패키지 &supset; 클래스

jdk 10 이상 - 모듈 &supset; 패키지 &supset; 클래스</small>

- 상속, 포함 등의 관계를 가지는 클래스들의 집합 디렉터리

- 하나의 패키지에서 클래스의 이름이 중복될 수 없다

- 패키지 선언

```java
package packageName;

class className {

}
// className 을 packageName 패키지에 포함시킨다
```

```java
// 패키지 이름은 보통 회사 도메인을 거꾸로 사용한다
// package 도메인(회사 도메인)

package com.naver.www // naver 패키지
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
// 현재 디렉터리에 위에서 선언한 패키지가 없는 경우 그 이름의 패키지를 만들고 그 패키지에 컴파일 결과인 클래스 파일을 만든다
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
    pack1.PackB b = new pack1.PackB();
    // pack1에 있는 PackB 클래스를 사용
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
### 추상 클래스
- OOP의 네가지 속성 중 추상(Abstraction)에 해당한다
  

  <small>!! 여기서 추상은 공통성을 의미한다</small>
- 자손 클래스의 공통된 부분을 추상화해서 만든 클래스

  <small>!! 반대로 공통적인 부분을 조상 클래스로 만들어주고 자손 클래스 각각의 속성을 추가한다고 생각할 수도 있다</small> 


- 추상 메서드를 가질 수 있다

  <small>!! 추상 메서드는 구현이 되지 않은 메서드이다</small>

  <small>!! 일반 클래스는 추상 메서드를 가질 수 없다</small> 
  ```java
  abstract void method(); 
  // 구현부({})가 없는 메서드를 추상 메서드라고 한다
  ```
  <small>!! 추상 메서드가 없어도 추상 클래스로 선언할 수 있다</small>

- 상속을 전제로 만든 상속 전용 클래스로 직접 객체 생성은 할 수 없다

  &rarr; &nbsp;직접 객체 생성을 못하기 때문에 자식 클래스의 객체를 참조한다

- 추상 클래스에 선언된 추상 메서드는 상속을 통해 구현되어야 한다
  
    <small>!! 자식 클래스에서도 추상 메서드가 구현되지 않는다면 자식 클래스도 추상 클래스가 된다</small>
  
    <small>!! 상속받은 메서드의 구현을 강제하여 프로그램의 안정성을 확보한다 </small>
- 선언방법
```java
abstract class ClassName{
  void method1(){}; // 내용이 없는 메서드
  abstract void method2(); // 추상 메서드
}
public static void main(String[] args){
  // ClassName cn = new ClassName();
  // 에러!! 추상 클래스는 인스턴스화가 불가능하다
}
```


```java
class Parent1 {
  Parent1(){
    System.out.println("Parent1 생성자 호출")
  }
}

abstract class Parent2 {
  Parent2(){
    System.out.println("Parent2 생성자 호출")
  }
  abstract void viewParent2();
}

class Child2 extends Parent2{
  Child2(){
    System.out.println("Child2 생성자 호출");
  }
  // abstract void method();
  // 추상 메서드는 추상 클래스만 가질 수 있다
  void viewParent2(){
    System.out.println("Child2에서 구현된 메서드");
  } // 추상 메서드 구현
  // 추상 클래스를 상속 받은 자식 클래스는 추상 메서드를 구현해야한다
  // 자식 클래스가 추상 메서드를 구현하지 않을 경우 자식 클래스도 추상 클래스로 선언해야 한다
}

public class ObjectEx01 {
  public static void main(String[] args) {
    Parent1 p1 = new Parent1();
    // Parent2 p2 = new Parent2();
    // 추상 클래스는 객체 생성 불가
    Child2 c2 = new Child2();
    Parent2 p2 = c2;
    // 자식 클래스의 객체를 참조하는 것은 가능하다
  }
}
```
#### 인터페이스(interface)

- 상수, 추상 메서드만 가질 수 있는 클래스

  <small>!! 추상 클래스는 일반 메서드를 가질 수 있고, 추상 메서드가 없더라도 추상 클래스로 선언이 가능하다</small>

  <small> !! jdk 1.8부터는 default, static 메서드 선언이 가능해졌다</small> 
  ```java
  interface DefaultMethodInterface {
    void abstractMethod();

    default void defaultMethod(){
      System.out.println("default 메서드")
    }
  }

  public class MainEx03 implements DefaultMethodInterface{

    public void abstractMethod(){
      System.out.println("자식에서 반드시 재정의 필요")
    }
    public static void main(String[] args){
      DefaultMethodInterface dmt = new MainEx03();
      dmt.abstractMethod(); // 자식에서 반드시 재정의 필요
      dmt.defaultMethod(); // default 메서드
    }
  }
  ```
  ```java
  interface StaticMethodInterface{
    static void staticMethod(){
      System.out.println("Static 메서드");
    }
  }
  public class MainEx03 {

    public static void main(String[] args){
      StaticMethodInterface.staticMethod(); // Static 메서드
      // static 메서드이기 때문에 객체 생성 없이 인터페이스 이름으로 바로 사용할 수 있다 
    }
  }
  ```


- 상속 관계가 없는 클래스들에게 인터페이스를 통해 관계를 줄 수 있다

- 모듈간 독립적 프로그래밍을 가능하게 해서 개발 시간을 단축 시킨다

- 선언 및 구현
```java
interface InterfaceName1{
  public static final int var1;
  public static final String var2;
  ...
  public abstract void method1();
  public abstract void method2();
  ...
}
interface InterfaceName2{
  public static final int varA;
  public static final String varB;
  ...
  public abstract void methodA();
  public abstract void methodB();
  ...
}

class ClassName1 implements InterfaceName1 , InterfaceName2 {

}
// 클래스 하나로 여러개의 인터페이스를 구현할 수 있기 때문에 "편법적 다중상속"이라고도 불린다
class ClassName2 extends ParentClass implements InterfaceName1{

}
// 상속을 받으면서 구현도 할 수 있다
```
```java
interface InterA{
  public static final String STR1 = "홍길동";
  // 상수
  String STR2 = "박문수";
  // 인터페이스에서는 "public static final"인 변수만 가질 수 있으므로 
  //"public static final"은 생략이 가능하다
  public abstract void methodA();
  // 추상 메서드
  void methodB();
  // 인터페이스는 "public abstract"인 추상 메서드만 가질 수 있으므로
  // "public abstract"는 생략이 가능하다

  // public void methodB(){}
  // 에러!! 인터페이스는 구현부를 가진 메서드를 가질 수 없다
}

class ClassA implements InterA{
  public void methodA(){
    System.out.println("methodA 호출")
  }
  public void methodB(){
    System.out.println("methodB 호출")
  }
}

public class MainEx{
  public static void main(String[] args){
    ClassA a = new ClassA();
    a.methodA(); // methodA 호출
    a.methodB(); // methodB 호출 
    System.out.println(a.STR1); // 홍길동
    System.out.println(a.STR2); // 박문수
  }
}
```
- 인터페이스끼리는 다중 상속이 가능하다

```java
public interface InterA{
  public abstract void methodA();
}

public interface interB extends InterA{
  public abstract void methodB();
}
// extends를 이용해 어떤 인터페이스를 다른 인터페이스가 상속받을 수 있다
class Parent{
  public void methodC(){
    System.out.println("methodC 호출");
  }
}
class Child extends Parent implements interB{
  public void methodA(){
    System.out.println("methodA 호출");
  }
  public void methodB(){
    System.out.println("methodB 호출");
  }
  public void methodC(){
    System.out.println("Child methodC 호출");
  }
}
public class MainEx{
  public static void main(String[] args){
    Child c = new Child();
    c.methodA(); // methodA 호출
    c.methodB(); // methodB 호출
    c.methodC(); // Child의 methodC 호출
  }
}
```
```java
interface Fightable{
  int fire();
}
interface Transformable{
  void changeShape(boolean isHeroMode);
}

public interface Heroable extends Fightable, Transformable{
  void upgrade;
} // Heroable 인터페이스가 Fightable, Transformable 인터페이스를 다중 상속하고 있다
```
### 열거형(enum)
- 한정된 상수값으로 이루어진 데이터를 한번에 관리하기 위해 사용하는 자료형

  <sup>ex) {봄, 여름, 가을, 겨울}, {월, 화, 수, 목, 금, 토, 일}


- 선언 및 데이터 접근 방법
```java
enum Grade{
  SALES, PART_TIME_JOB, NORMAL
}
System.out.println(Grade.SALES);
```
### 애노테이션(annotation)

- 사람이 아니라 컴파일러, 프레임워크에게 전달되는 메타데이터을 의미한다

- 기본 애노테이션

|애노테이션|설명|
|---|---|
|@Override|컴파일러에게 재정의된 메서드라고 알려준다|
|@Deprecated|앞으로 없어질 수 있으니 사용을 자제하라고 알려준다|
|@SupressWarnings|컴파일러에게 특정 경고 메세지를 무시하라고 알려준다|
|@FunctionallInterface|함수형 인터페이스라는 것을 알려준다(Lamda 참조)|

### Generic

- Generic을 사용하면 컴파일할 때, 객체의 타입을 체크하도록 한다

- ArrayList에는 자료형 상관없이 데이터가 추가되기 때문에 데이터를 사용할 때 여러 문제점이 생긴다

  &rarr; &nbsp;Gerneric을 사용해
  컬렉션(클래스, 메서드) 내부의 자료형을 선언한다

```java
import java.util.ArrayList;

public class ArrayListEx04 {

  public static void main(String[] args) {
  	ArrayList al1 = new ArrayList();

  	al1.add("홍길동");
  	al1.add(new Person("1001", "홍길동"));
  	// 모든 객체를 추가시킬 수 있다
  	// 그렇기 때문에 al1에 있는 데이터를 사용할 때 문제가 생길 수도 있다
  	//  for(int i = 0; i < al1.size(); i++) {
  	//  	String s = (String)al1.get(i);
  	//  	System.out.println(s);
  	//  }
  	// 컴파일에서는 문제가 생기지 않지만, 실행시에 에러가 생긴다

  	ArrayList<String> al2 = new ArrayList<>();
  	al2.add("홍길동");
  	// al2.add(new Person("1001", "홍길동"));
  	// 에러!! al2에 String 객체만 들어가도록 선언했다
  	// Generic
  	for(int i = 0; i < al2.size(); i++) {
  		String s = al2.get(i);
  		System.out.println(s);
  	}
  }

}
```
## java.lang

<small>!! API (Application Programming Interface) : 미리 만들어진 클래스들의 모임</small>

- java.base 모듈에 있는 패키지

- 범용적으로 쓰이기 때문에 따로 import 하지 않는다

  <small>!! 이외의 패키지는 모두 import 해야 사용할 수 있다 </small>

### Object

- 모든 클래스의 가장 최상위 조상 클래스

#### Object 클래스의 메서드

- toString()

  - 기본적으로는 객체의 참조값이 출력된다

  - 객체변수를 출력하면 객체변수.toString()이 출력된다

  ```java
  public class ObjectEx01 {
    public static void main(String[] args) {
      Object o1 = new Object();
      System.out.println(o1); // java.lang.Object@262b2c86
      System.out.println(o1.toString()); // java.lang.Object@262b2c86
      // 객체변수 o1을 출력하면 ol.toString()이 출력된다
      // 16진수 참조값
      System.out.println(o1.getClass().getName()); // java.lang.Object
      System.out.println(o1.hashCode()); // 640363654
      // 10진수 참조값이 출력된다
    }
  }
  ```

  - 보통 자손 클래스에서 객체의 내용(멤버변수) 출력을 하도록 오버라이딩된다

  ```java
  public class ObjectEx01 {
    public static void main(String[] args) {
  	  String str = new String("Hello toString");
  	  System.out.println(str); // Hello toString
  	  System.out.println(str.toString()); // Hello toString
      // String 클래스의 toString()은 객체의 값을 출력하도록 오버라이딩 되어 있다
    }
  }
  ```

  ```java
  // Person.java

  public class Person {
    private int id;
  	private String name;
  	private int age;
  	public Person(int id, String name, int age) {
      this.id = id;
  		this.name = name;
  		this.age = age;
  	}

  //	public String viewData() {
  //		return this.id + "/" + this.name + "/" + this.age;
  //	}
  // 클래스의 멤버변수를 출력하는 메서드의 이름이 작성자마다 다르면 복잡해지므로 toString()을 오버라이딩해 사용하기로 되어 있다

  	@Override
  	public String toString() {
  		return "Person [id=" + id + ", name=" + name + ", age=" + age + "]";
  	}
  }
  ```

  ```java
  // 위에서 작성한 Person 클래스 사용

  public class ObjectEx01 {
    public static void main(String[] args) {
      Person p1 = new Person(100, "홍길동", 20);
      System.out.println(p1); // Person [id=100, name=홍길동, age=20]
      System.out.println(p1.toString()); // Person [id=100, name=홍길동, age=20]
    }
  }
  ```

- equals()

  - 기본적으로는 할당되어 있는 참조값을 비교한다

    &rarr; "=="와 같은 결과를 가진다

  ```java
  public class ObjectEx01 {
    public static void main(String[] args) {
      int a1 = 10;
      int a2 = 10;
      System.out.println(a1 == a2); // true
      // 기본 자료형의 값을 비교
      Object o1 = new Object();
      Object o2 = new Object();
      System.out.println(o1 == o2); // false
      // 참조형일 경우 할당되어 있는 참조값을 비교
      System.out.println(o1.equals(o2)); // false
      // equals()는 기본적으로 할당되어 있는 참조값을 비교
      String str1 = new String("박문수");
      String str2 = new String("박문수");
      System.out.println(str1 == str2); // false
      System.out.println(str1.equals(str2)); // true
      // String 클래스는 오버라이딩 돼서 참조하는 참조값이 아닌 객체의 값 자체를 비교한다
    }
  }
  ```

### String

- 문자열에 관련된 클래스

<small>문자열 관련 클래스 종류 : String, StringBuffer, StringBuilder</small>

- final 클래스로 상속되지 않는다

- 불변성(Immutable) : 문자열을 한번 생성되면 그 자체의 값이 변하지는 않는다

- 문자열 저장 방법

```java
public class StringEx01 {

  public static void main(String[] args) {
    // 문자열 선언 방법
    String str1 = "Hello String";
    // 큰 따옴표를 이용해 문자열을 만들면 클래스 영역에 상수 풀에 저장되기 때문에 같은 내용의 문자열은 새로 생성되지 않고 만들어져 있는 문자열을 이용한다
    // String str1 = new String("Hello String");
    // 생성자를 사용해 문자열을 만들면 힙 영역에 만들어져서 같은 내용의 문자열이라도 계속 새로 생성된다
    // char[] str1 = {'H', 'e', 'l', 'l', 'O', 'S', 't', 'r', 'i', 'n', 'g'};
    // 문자 배열은 문자열로 다룰 수 있다
	}

}
```

#### String 클래스의 메서드

```java
public class StringEx01 {
  public static void main(String[] args) {
    String str1 = "Hello String";
    System.out.println(str1.length()); // 12
    System.out.println("Hello".length()); // 5
    // 문자열의 길이를 반환한다
    System.out.println(str1.charAt(0)); // H
    System.out.println(str1.charAt(str1.length()-1)); // g
    // 문자열의 특정 인덱스에 있는 문자를 문자로 반환한다
    System.out.println(str1.substring(2)); // llo String
    // 괄호 안 인덱스에 해당하는 문자부터 문자열로 반환한다
    System.out.println(str1.substring(2, 4)); // ll
    // str1의 인덱스 2부터 인덱스 (4 - 1)까지 문자열로 반환한다
    System.out.println(str1.indexOf('l')); // 2
    // 괄호 안의 문자 또는 문자열이 처음으로 나오는 인덱스를 반환한다
    System.out.println(str1.lastIndexOf('l')); // 3
    // 괄호 안의 문자 또는 문자열이 마지막으로 나오는 인덱스를 반환한다
    System.out.println(str1.indexOf('p')); // -1
    // 괄호 안의 문자 또는 문자열을 포함하지 않으면 -1을 반환한다
    System.out.println(str1.startsWith("He")); // true
    // 괄호 안의 문자, 문자열로 시작하는지 확인해서 진리값을 반환한다
    System.out.println(str1.endsWith("ng")); // true
    // 괄호 안의 문자, 문자열로 끝나는지 확인해서 진리값을 반환한다
    System.out.println("Hello String Hello".replaceAll("Hello", "안녕")); // 안녕 String 안녕
    // "Hello"를 "안녕"으로 모두 변환시킨다
    System.out.println(str1.concat(" 안녕")); // Hello String 안녕
    // 괄호 안의 문자, 문자열을 문자열 뒤에 결합 시킨다
    System.out.println("hello".toUpperCase()); // HELLO
    // 문자열을 모두 대문자로 변환한다
    System.out.println("HELLO".toLowerCase()); // hello
    // 문자열을 모두 소문자로 변환한다
    System.out.println("   Hello     String   ".trim()); // Hello     String
    // 문자열의 앞, 뒤 공백을 없애준다
    String str2 = "apple,banana,pineapple,kiwi";
    String[] strArr = str2.split(",");
    // "," 단위로 문자열을 구분한다
    for(String str : strArr) {
    	System.out.println(str);
    }
    String str3 = String.join(",", strArr);
    // ","를 구분자로 문자열 배열의 값들을 결합시켜 하나의 문자열로 반환한다
    System.out.println(str3); // apple,banana,pineapple,kiwi
    String str4 = String.format("%s - %s - %s", "aaa", "bbb", "ccc");
    // System.out.printf()와 동일하다
    System.out.println(str4); // aaa - bbb - ccc
  }
}
```

단어의 첫 문자를 대문자로 만들기

```java
public class Capitaliztion {
  public static void main(String[] args) {
    String str = "park dae ho";
    String[] strArr = str.split(" ");
    for(int i = 0; i < strArr.length; i++) {
    	strArr[i] = strArr[i].substring(0, 1).toUpperCase() + strArr[i].substring(1);
    }
    System.out.println(String.join(" ", strArr));
  }
}
```

### StringBuffer, StringBuilder

- 버퍼(임시 저장공간)을 이용해서 문자열을 저장하고, 추가 / 수정 / 삭제가<br> 가능하기 때문에 불변성을 가진 String 클래스보다 사용하기 편리하다

#### StringBuffer, StringBuilder 클래스의 메서드

```java
public class StringBuilderEx01 {

  public static void main(String[] args) {
  	StringBuilder sb1 = new StringBuilder();
  	StringBuilder sb2 = new StringBuilder(100);
  	StringBuilder sb3 = new StringBuilder("Hello StringBulider");

  	System.out.println(sb1.capacity()); // 16
  	System.out.println(sb2.capacity()); // 100
  	System.out.println(sb3.capacity()); // 35
  	// 버퍼의 크기를 반환한다
  	System.out.println(sb1.length()); // 0
  	System.out.println(sb2.length()); // 0
  	System.out.println(sb3.length()); // 19
  	// 저장 문자열의 길이를 반환한다
  	System.out.println(sb3.charAt(0)); // H
  	System.out.println(sb3.substring(4)); // o StringBulider

  	StringBuilder builder = new StringBuilder("사봉-용산-사가정-용마산");
  	builder.append("-중곡");
  	// builder의 문자열 뒤에 "-중곡"을 붇인다
  	System.out.println(builder); // 사봉-용산-사가정-용마산-중곡
  	builder.insert(3, "면목-");
  	System.out.println(builder); // 사봉-면목-용산-사가정-용마산-중곡
  	builder.delete(5, 8);
  	System.out.println(builder); // 사봉-면목-사가정-용마산-중곡
  	builder.replace(0, 1, "상");
  	// 인덱스 0부터 인덱스(1 - 1)까지인 문자열을 "상"으로 대체한다
  	// String 클래스와 달리 replaceAll이 아닌 것에 주의하자
  	System.out.println(builder); // 상봉-면목-사가정-용마산-중곡
  	System.out.println(builder.reverse()); // 곡중-산마용-정가사-목면-봉상
  	// 문자열을 거꾸로 나열한 것을 반환
  }
}
```

### Math

- 수학 계산과 관련된 클래스로 멤버변수가 없고, static 메서드만을 가지고 있다

#### Math 클래스의 메서드

```java
public class MathEx01 {

  public static void main(String[] args) {
  	System.out.println(Math.ceil(10.3)); // 11.0
  	System.out.println(Math.ceil(10.5)); // 11.0
  	System.out.println(Math.ceil(10.7)); // 11.0
  	// 올림
  	System.out.println(Math.floor(10.3)); // 10.0
  	System.out.println(Math.floor(10.5)); // 10.0
  	System.out.println(Math.floor(10.7)); // 10.0
  	// 내림
  	System.out.println(Math.round(10.3)); // 10
  	System.out.println(Math.round(10.5)); // 11
  	System.out.println(Math.round(10.7)); // 11
  	// 반올림
  	System.out.println(Math.pow(10.0, 2.0)); // 100.0
  	// 10.0의 2.0승
  	System.out.println(Math.random()); // 0.7022833597632225
  	// 0 <= x < 1 난수 반환
  	System.out.println((int)(Math.random()*10)); // 7
  	// 1 <= x <10 정수 반환
  }
}
```

### Wrapper

- 기본 자료형을 객체로 만들기 위한 클래스이다

| 기본형  | Wrapper 클래스 |
| :-----: | :------------: |
|  byte   |      Byte      |
|  char   |      Char      |
|  short  |     Short      |
|   int   |      Int       |
|  long   |      Long      |
|  float  |     Float      |
| double  |     Double     |
| boolean |    Boolean     |

- Wrapper 클래스는 기본 자료형처럼 쓸 수 있다

#### Wrapper 클래스의 멤버변수, 메서드

```java
public class WrapperEx01 {

  public static void main(String[] args) {
  	System.out.println(Integer.MAX_VALUE); // 2147483647
  	System.out.println(Integer.MIN_VALUE); // -2147483648
  	// int 자료형 최대, 최소값 반환
  	System.out.println(Double.MAX_VALUE); // 1.7976931348623157E308
  	System.out.println(Double.MIN_VALUE); // 4.9E-324
  	// double 자료형 최대, 최소값 반환

  	Integer i1 = Integer.valueOf(123);
  	// Integer i1 = Integer.valueOf("123");

  	// Integer i1 = 123;
  	// Wrapper 클래스로 자동형변환
  	// 오토박싱

  	int i2 = i1.intValue();
  	float f1 = i1.floatValue();
  	System.out.println(i2); // 123
  	System.out.println(f1); // 123.0
  	// 자료형의 형변환

  	int i3 = Integer.parseInt("123");
  	float f2 = Float.parseFloat("123");
  	System.out.println(i3); // 123
  	System.out.println(f2); // 123.0
  	// 문자열을 정수, 실수로 형변환시킨다

  	int i4 = 10;
  	int i5 = 20;
  	int sum1 = i4 + i5;
  	System.out.println(sum1); // 30
  	Integer i6 = Integer.valueOf("10");
  	Integer i7 = Integer.valueOf("20");
  	int sum2 = i6 + i7;
  	// 계산을 위해서 기본 자료형으로 자동형변환
  	// 언박싱
  	System.out.println(sum2); // 30
  }
}
```

주민등록번호 검사기

```java

public class JuminCheckMain {
  public static void main(String[] args) {
    // 입력은 arguments로 받는다
  	if (args.length != 1) {
  		System.out.println("java 클래스명 XXXXXX-XXXXXXX 형식으로 입력해주세요");
  	}else {
  		String strJumin = args[0].replaceAll("-", "");
  		int[] num = new int[13];
  		int[] checkNum = {2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5};
  		int sum = 0;
  		for (int i = 0; i < checkNum.length; i++) {
  			num[i] = Integer.parseInt(strJumin.substring(i, i + 1)) * checkNum[i];
  		}
  		for (int number : num) {
  			sum += number;
  		}
  		if(Integer.parseInt(strJumin.substring(strJumin.length()-1)) == ((11 - (sum%11))%10) ) {
  			System.out.println("형식이 맞습니다");
  		}else {
  			System.out.println("형식이 맞지 않습니다");
  		}
  	}
  }
}
```

```java

public class JuminCheckMain {

  public static void main(String[] args) {
  	if (args.length != 1) {
  		System.out.println("java 클래스명 XXXXXX-XXXXXXX 형식으로 입력해주세요");
  	}else {
  		String strJumin = args[0].replaceAll("-", "");
  		int checkBit = 2;
  		int sum = 0;
  		for(int i = 0; i < strJumin.length() - 1; i++) {
  			if(checkBit == 10) {
  				checkBit = 2;
  			}
  			sum += Integer.parseInt(strJumin.substring(i, i + 1)) * checkBit;
  			checkBit++;
  		}
  		if (Integer.parseInt(strJumin.substring(strJumin.length() - 1)) == (11 - (sum % 11)) % 10) {
  			System.out.println("형식이 맞습니다");
  		}else {
  			System.out.println("형식이 맞지 않습니다");
  		}
  	}
  }

}
```

### System

- 운영체제와의 소통을 위한 클래스로 static 메서드를 제공한다

#### System 클래스의 메서드

```java
public class SystemEx {

  public static void main(String[] args) {
  	System.out.println("시작");
  	if(args.length != 1) {
  		System.out.println("비정상");
  		System.exit(0);
  		// 프로그램을 강제로 종료시킨다
  	}
  	System.out.println("정상");
  }
}
```

```java
public class SystemEx {

  public static void main(String[] args) {
  	System.out.println(System.currentTimeMillis()); // 1679361735964
  	// 1970년 1월 1일에서 지금까지의 밀리초를 반환
    // 타임스탬프로 쓰인다
  	System.out.println(System.nanoTime()); // 2166129652274300
  	// 1970년 1월 1일에서 지금까지의 밀리초를 나노초로 반환
  	long time1 = System.currentTimeMillis();
    // 프로그램 실행 전 타임스탬프
  	int sum = 0;
  	for(int i = 1; i <= 1_000_000; i++) {
  		sum += i;
  	}
  	long time2 = System.currentTimeMillis();
    // 프로그램 실행 후 타임스탬프
  	System.out.println("실행시간 : " + (time2 - time1)); // 실행시간 : 3
  }

}
```

```java
public class SystemEx {

  public static void main(String[] args) {
  	System.out.println(System.getProperty("os.name")); // Windows 10
  	System.out.println(System.getProperty("user.name")); // KITCOOP
  	System.out.println(System.getProperty("user.home")); // C:\Users\KITCOOP
  	// 시스템 속성값을 반환한다
  	System.out.println(System.getenv("JAVA_HOME")); // C:\Program Files\Java\jdk-11.0.17
  	System.out.println(System.getenv("PATH")); // C:\java\eclipse\plugins\...
  	// 환경변수 값을 반환한다
  }

}
```

```java
public class SystemEx {

  public static void main(String[] args) {
  	System.out.print("Hello");
  	System.out.print(System.lineSeparator()); // 엔터키
  	// lineSeparator()가 문자열 "\n"을 반환한다
  	System.out.println("World");
  }

}
```

```java

public class SystemEx {

  public static void main(String[] args) {
  	int[] src = {1, 2, 3, 4, 5};
  	int[] dest1 = src;
  	dest1[0] = 6;
  	System.out.println(src[0]); // 6
  	System.out.println(dest1[0]); // 6
  	// 변수의 참조값이 할당되기 때문에 값이 같이 바뀌는 얕은 복사가 일어난다
  	int[] src2 = { 10, 20, 30, 40, 50};
  	int[] dest2 = {0, 0, 0, 0, 0};
  	System.arraycopy(src2, 0, dest2, 0, src2.length);
  	System.out.println(dest2[0]); // 10
  	dest2[0] = 100;
  	System.out.println(dest2[0]); // 100
  	System.out.println(src2[0]); // 10
  	// System.arraycopy()를 이용해 깊은 복사를 할 수도 있다
  }

}
```

##### Java 프로그램을 이용해서 명령프롬프트에 명령을 줄 수 있다

```java
// 명령프롬프트

> "c:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "www.daum.net"
// Edge 브라우저를 통해 다음 홈페이지가 열린다
// 큰 따옴표로 묶어주는 이유는 공백이 있는 것을 하나의 문자열로 만들어주기 위해서이다
```

```java
import java.io.IOException;

public class ProcessBilderEx01 {

  public static void main(String[] args) throws IOException {
  	ProcessBuilder processBuilder = new ProcessBuilder("c:\\Program Files (x86)
    \\Microsoft\\Edge\\Application\\msedge.exe", "www.daum.net");
  	// "\"가 아니라 "\\"를 이용해 디렉터리를 구분한다
  	processBuilder.start();
    // Edge 브라우저를 통해 다음 홈페이지가 열린다
  }
}
```

```java
// 명령프롬프트

> "C:\WINDOWS\system32\notepad.exe"
// 메모장을 실행한다
```

```java
import java.io.IOException;

public class ProcessBilderEx01 {

  public static void main(String[] args) throws IOException {
  	ProcessBuilder processBuilder = new ProcessBuilder("C:\\WINDOWS\\system32\\notepad.exe");
  	processBuilder.start();
    // 메모장을 실행한다
  }

}
```

## java.util

- import를 해야 사용할 수 있다

### Date

- 날짜, 시간 관련 클래스

#### Date 클래스의 메서드

```java
import java.util.Date;

public class DateEx01 {

  public static void main(String[] args) {
  	Date d1 = new Date();
  	System.out.println(d1); // Tue Mar 21 11:21:53 KST 2023
  	// 현재 날짜 시간 반환
  	// 참조값이 나오지 않고 내용이 나오도록 toString()이 오버라이딩 되어 있다
  	System.out.println(d1.toLocaleString()); // 2023. 3. 21. 오전 11:21:53
  	// 현재 날짜 시간을 현지방식으로 표현
  	// 메서드에 선이 그어진 것은 그 메서드가 deprecated 되어 있으니 사용을 지양하라는 표시이다
  	String strDate = d1.toLocaleString();
  	System.out.println(strDate.substring(0, 4)); // 2023
  	System.out.println(d1.getYear() + 1900); // 2023
  	// 연도 출력
  	// 1900년이 0으로 반환되기 때문에 1900을 더해줘야 한다
  	System.out.println(strDate.substring(6, 7)); // 3
  	System.out.println(d1.getMonth() + 1); // 3
  	// 달 출력
  	// 1월이 0으로 반환되기 때문에 1을 더해줘야 한다
  	System.out.println(strDate.substring(9, 11)); // 21
  	System.out.println(d1.getDate()); // 21
  	// 날짜 출력
  	System.out.println(d1.getDay()); // 2
  	// 일요일이 0이다
  	String[] weekName = {"일", "월", "화", "수", "목", "금", "토"};
  	System.out.println(weekName[d1.getDay()]); // 화

  	Date d2 = new Date(2023 - 1900, 3 - 1, 1);
  	// 날짜를 지정할 수도 있다
  	System.out.println(d1.toLocaleString()); // 2023. 3. 21. 오전 11:37:05

  	Date d3 = new Date(2023 - 1900, 12 - 1, 24);
  	System.out.println(weekName[d3.getDay()]); // 일
  }

}
```

```java
import java.util.Date;

public class DateTest {

  public static void main(String[] args) {
  	Date d1 = new Date();
  	System.out.println(d1);
  	Date d2 = new java.sql.Date(1500000000000L); // 밀리초로 날짜 객체 생성
  	System.out.println(d2);
  	long gap = d1.getTime() - d2.getTime();
  	System.out.println("두 날짜의 차는 " + (gap/1000/60/60/24) + "일 이다");

  }

}

```

### Calendar

- 날짜, 시간 관련 클래스

- 객체 생성 방식에 주의

#### Calendar 클래스의 멤버변수와 메서드

```java
import java.util.Calendar;

public class CalendarEx01 {

  public static void main(String[] args) {
  	// Calendar calendar1 = new Calendar();
  	// 에러!!
  	// Calendar 클래스는 객체 생성 방식이 다르다
  	Calendar calendar = Calendar.getInstance();
  	System.out.println(calendar.toString());
    // Calendar 클래스의 멤버변수 목록이 출력된다
    System.out.println(calendar.getTime()); // Tue Mar 21 12:38:34 KST 2023
  	System.out.println(calendar.get(Calendar.YEAR)); // 2023
  	System.out.println(calendar.get(Calendar.MONTH) + 1); // 2
  	// 1월이 0이다
  	System.out.println(calendar.get(Calendar.DATE)); // 21
  	System.out.println(calendar.get(Calendar.DAY_OF_WEEK)); // 3
  	// 일요일이 1이다

  }

}
```

```java
import java.util.Calendar;
import java.util.Date;

public class CalendarEx02 {

  public static void main(String[] args) {
  	Calendar c = Calendar.getInstance();
  	c.set(2023, 3-1, 1);
  	// 특정 날짜 설정
  	System.out.println(c.getTime()); // Wed Mar 01 12:14:53 KST 2023
  	// 특정 날짜, 현재 시간 반환

  	c.add(Calendar.DATE, 3);
  	// 3일 후의 날짜로 설정
  	System.out.println(c.getTime()); // Sat Mar 04 12:16:25 KST 2023
  	Date date = c.getTime();
  	System.out.println(date); // Sat Mar 04 12:16:25 KST 2023
  }

}
```

```java
import java.util.Calendar;
import java.util.Date;

public class CalendarEx02 {

  public static void main(String[] args) {
  	// TODO Auto-generated method stub
  	Calendar c = Calendar.getInstance();
  	c.set(2023, 3-1, 1);
  	// 특정 날짜 설정
  	System.out.println(c.getTime()); // Wed Mar 01 12:20:18 KST 2023
  	// 특정 날짜, 현재 시간 출력

  	c.add(Calendar.DATE, 3);
  	// 3일 후의 날짜로 설정
  	c.add(Calendar.MONTH, -6);
  	// 6개월 전의 날짜로 설정
  	System.out.println(c.getTime()); // Sun Sep 04 12:20:18 KST 2022

  	Date date = c.getTime();
  	System.out.println(date); // Sun Sep 04 12:20:18 KST 2022
  	// getTime()으로 Date 객체를 만들 수 있다
  }

}
```

Calendar 클래스를 이용해 달력 출력하기

```java
import java.util.Calendar;


public class CalendarEx03 {

  public static void main(String[] args) {
  	int year = 2023;
  	int month = 3;

  	Calendar startCalendar = Calendar.getInstance();
  	Calendar endCalendar = Calendar.getInstance();
  	startCalendar.set(year, month - 1, 1);
  	endCalendar.set(year, month, 1 - 1);
  	int startDayOfWeek = startCalendar.get(Calendar.DAY_OF_WEEK);
  	int endDate = endCalendar.get(Calendar.DATE);

  	System.out.println(" SU MO TU WE TH FR SA");
  	for (int i = 1; i < startDayOfWeek; i++) {
  		System.out.print("   ");
  	}
  	for (int i = 1, n = startDayOfWeek; i <= endDate; i++, n++) {
  		System.out.print((i < 10) ? "  " + i : " " + i);
  		if(n % 7 == 0) {
  			System.out.println();
  		}
  	}
  }

}
```

### StringTokenizer

- 문자열을 구분하는 클래스

```java
import java.util.StringTokenizer;

public class StringTokenizerEx {

  public static void main(String[] args) {
  	String strData1 = "사과 참외 수박 딸기";
  	StringTokenizer str1 = new StringTokenizer(strData1);

  	System.out.println(str1.countTokens()); // 4
  	System.out.println(str1.nextToken()); // 사과
  	System.out.println(str1.nextToken()); // 참외
  	System.out.println(str1.nextToken()); // 수박
  	System.out.println(str1.nextToken()); // 딸기
  	// System.out.println(str1.nextToken());
  	// 에러!! 다음 토큰이 존재하지 않는다
  	while(str1.hasMoreTokens()) { // str1이 토큰을 가지고 있다면 반복문 실행
  		System.out.println(str1.nextToken());
  	} // str1이 가지고 있는 토큰 모두 출력

  	String strData3 = "x=100*(200+300)/2";
  	StringTokenizer str3 = new StringTokenizer(strData3, "+-*/=()");
  	// 구분자가 여러개일 경우 각각의 구분자가 나올 때마다 구분한다
  	while(str3.hasMoreTokens()){
  		System.out.println(str3.nextToken());
  	}
  	// 출력 결과 확인해보기
  }

}

```

!! String 클래스의 split()과 비교하기

```java
import java.util.StringTokenizer;

public class StringTokenizerEx {

  public static void main(String[] args) {
  	String strData = "사과&참외&&수박&&딸기";
  	StringTokenizer st = new StringTokenizer(strData, "&");
  	while(st.hasMoreTokens()) {
  		System.out.print(st.nextToken() + ' '); // 사과 참외 수박 딸기
  	}
  	// 구분자 사이에 값이 없으면 넘어간다
  	System.out.println();
  	String[] arrData = strData.split("&");
  	for(String data : arrData) {
  		System.out.print(data + ' ');
  	} // 사과 참외  수박  딸기
  	// 구분자 사이에 값이 없으면 빈 문자열이 생긴다

  }

}
```

### StringJoiner

- 문자열을 연결시키는 클래스

```java
import java.util.StringJoiner;

public class StringJoinerEx {

  public static void main(String[] args) {
  	String str1 = "사과" + ",수박" + ",딸기" + ",참외";
  	System.out.println(str1); // 사과,수박,딸기,참외
  	String str2 = "사과".concat(",수박").concat(",딸기").concat(",참외");
  	System.out.println(str2); // 사과,수박,딸기,참외
  	String str3 = String.format("%s,%s,%s,%s", "사과", "수박", "딸기", "참외");
  	System.out.println(str3); // 사과,수박,딸기,참외

  	String[] arrStr = {"사과","수박","딸기","참외"};
  	String str4 = String.join(",", arrStr);
  	System.out.println(str4); // 사과,수박,딸기,참외

  	StringJoiner sj = new StringJoiner(",");
    // 괄호 안의 문자를 구분자로 add()를 통해 문자열을 연결시킨다
  	sj.add("사과");
  	sj.add("수박");
  	sj.add("딸기");
  	sj.add("참외");
  	System.out.println(sj.toString()); // 사과,수박,딸기,참외
  }

}
```

### Random

- 난수 추출에 사용하는 클래스

```java
import java.util.Random;

public class RandomEx {

  public static void main(String[] args) {
  	Random r1 = new Random(System.currentTimeMillis());
  	// 괄호 안의 값은 seeding 값으로 난수를 추출할 때마다 초기화 되는 값을 이용한다
    // 만약 seeding 값이 초기화 되는 값이 아니면 실행시 계속 같은 결과를 얻게 된다
  	System.out.println(r1.nextInt(10)); // 4
  	// 0 <= x < 10인 정수값을 가지는 난수 추출
  	System.out.println(r1.nextInt(45) + 1); // 34
  	// 1 <= x < (45 + 1)인 정수값을 가지는 난수 추출

  }

}

```

```java
import java.util.Random;

public class RandomEx02 {

  public static void main(String[] args) {
  	Random random = new Random(System.currentTimeMillis());
  	for (int j = 0; j < 5; j++) {
  		for (int i = 0; i < 6; i++) {
  				System.out.printf("%2d ", random.nextInt(45) + 1);
  		}
  		System.out.println();
  	}
  }

}
```

### Scanner

- 키보드로 입력을 받을 때 사용하는 클래스

```java
import java.util.Scanner;

public class ScannerEx {

  public static void main(String[] args) {
  	Scanner sc = new Scanner(System.in); // 키보드를 통해 입력을 받는 Scanner 객체를 변수 sc에 할당
  	System.out.print("입력 : ");
  	String msg = sc.next();
  	// 공백 이전까지만 입력을 받는다
  	// 입력 : "aaa bbb ccc"
  	// msg : "aaa
  	// 큰 따옴표를 써서 하나의 문자열로 묶어도 공백 이전까지만 입력을 받는다
  	System.out.print("msg : " + msg);

  	sc.close();
  	// 반드시 닫아줘야 한다
  }

}
```

```java
import java.util.Scanner;

public class ScannerEx02 {

  public static void main(String[] args) {
  	Scanner sc = new Scanner(System.in);

  	System.out.print("아이디 : ");
  	String id = sc.nextLine();
  	// 공백이 있더라도 한줄 전체를 입력받아 반환한다
  	System.out.print("비밀번호 : ");
  	String pw = sc.nextLine();

  	System.out.println("id : " + id);
  	System.out.println("pw : " + pw);

  	sc.close();
  }

}
```

특정값을 입력해서 무한루프 빠져나오기

```java
import java.util.Scanner;

public class ScannerEx03 {

  public static void main(String[] args) {
  	Scanner sc = new Scanner(System.in);

  	String msg = "";
  	while(true) {
  		System.out.print("입력 > ");
  		msg = sc.nextLine();
  		if(!msg.equals("exit")) {
  			System.out.println("msg : " + msg);
  		}else {
  			System.out.println("종료");
  			break;
  			// "exit"을 입력받으면 무한루프를 빠져나온다
  		}
  	}
  	sc.close();
  }

}
```

구구단 출력

```java
import java.util.Scanner;

public class Gugudan {

  public static void main(String[] args) {
  	Scanner sc = new Scanner(System.in);
  	while(true)	{
  	  System.out.print("단수 > ");
  	  String in = sc.nextLine();
  	  if(in.equals("q") || in.equals("Q")) {
  	  	System.out.println("종료");
  	  	break;
  	  }
  	  int dan = Integer.parseInt(in); 
  	  for(int i = 1; i <= 9; i++) {
  	  	System.out.printf("%2d X %2d = %2d%n", dan, i, dan * i);
  	  }
  	}
  }

}
```

## 컬렉션 프레임워크

- java.util 패키지에 하위 클래스들로 자료구조에 사용된다

- 구분

  - list 계열 : 순서가 있는 데이터 집합 &rarr; 데이터의 중복을 허락한다

  - Set 계열 : 순서가 없는 데이터 집합 &rarr; 데이터의 중복을 허락하지 않는다
  - Map 계열 : 중복이 가능하지 않은 키와 중복이 가능한 값의 쌍으로 데이터를 관리하는 집합

### Collection 인터페이스

- List, Set 인터페이스의 조상이 되는 인터페이스

#### List 인터페이스를 구현한 클래스

- 순서가 있는 데이터의 집합을 표현할 때 사용한다

  &rarr; &nbsp; 순서가 있기 때문에 데이터가 중복될 수 있다
```java
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ListEx {
  public static void main(String[] args) {
    ArrayList<String> al = new ArrayList<>();
    al.add("홍길동");
    al.add("박문수");
    al.add("이몽룡");
    System.out.println(al);
    Vector<String> v = new Vector<>();
    v.add("홍길동");
    v.add("박문수");
    v.add("이몽룡");
    System.out.println(v);
    // 같은 List 인터페이스를 구현한 클래스이기 때문에 메서드 이름과 기능이 같다

    List<String> l1 = new ArrayList<>();
    l1.add("홍길동");
    l1.add("박문수");
    l1.add("이몽룡");
    System.out.println(l1);
    List<String> l2 = new Vector<>();
    l2.add("홍길동");
    l2.add("박문수");
    l2.add("이몽룡");
    // 다형성을 이용해 List 인터페이스를 바로 사용할 수도 있다
  }
}
```

```java
import java.util.ArrayList;

public class ArrayListEx {

  public static void main(String[] args) {
  	ArrayList al1 = new ArrayList();
  	ArrayList al2 = new ArrayList(100);
  	al1.add("홍길동");
  	al1.add("박문수");
  	al1.add("이몽룡");
  	// String 객체가 Object 객체로 형변환 되서 추가된다
  	System.out.println(al1); // [홍길동, 박문수, 이몽룡]
  	System.out.println(al1.size()); // 3
  	// String data1 = al1.get(0);
  	// 에러!! al1에 저장된 객체는 Object 객체이다
  	String data1 = (String)al1.get(0);
  	// 배열과 달리 값을 가져오기 위해서 get()을 사용한다
  	System.out.println(data1); // 홍길동
  	for(int i = 0; i < al1.size(); i++) {
  		System.out.print((String)al1.get(i) + " "); // 홍길동 박문수 이몽룡
  	}
  }

}
```

```java
import java.util.ArrayList;

public class ArrayListEx {

  public static void main(String[] args) {
  	ArrayList al = new ArrayList();
  	al.add("홍길동");
  	al.add("박문수");
  	al.add("이몽룡");

  	System.out.println(al.toString()); // [홍길동, 박문수, 이몽룡]
  	al.add(2, "장길산");
  	System.out.println(al.toString()); // [홍길동, 박문수, 장길산, 이몽룡]
  	al.set(0, "이몽룡");
  	System.out.println(al.toString()); // [이몽룡, 박문수, 장길산, 이몽룡]
  	al.remove(0);
  	System.out.println(al.toString()); // [박문수, 장길산, 이몽룡]
  	// ArrayList에서는 추가/삭제가 용이하다
  	al.clear();
  	// 값 전부 삭제
  	System.out.println(al.toString()); // []
  	System.out.println(al.size()); // 0
  }

}
```

!! ArrayList에 추가 될때 Object 객체로 형변환 된 후 추가되는 것에 주의하자

```java
  import java.util.ArrayList;

class Person {
  private String hakbun;
  private String name;  
  public Person(String hakbun, String name) {
  	this.hakbun = hakbun;
  	this.name = name;
  } 
  public String getHakbun() {
  	return hakbun;
  }
  public String getName() {
  	return name;
  } 
  @Override
  public String toString() {
  	return super.toString();
  } 
}

public class ArrayListEx03 {

  public static void main(String[] args) {
  	ArrayList al = new ArrayList(); 
  	Person p1 = new Person("1001", "홍길동");
  	Person p2 = new Person("1002", "박문수"); 
  	al.add(p1);
  	al.add(p2);
  	// Person 객체가 Object 객체로 형변환 되서 추가된다
  	for(int i = 0; i < al.size(); i++) {
  	  Person p = (Person)al.get(i);
  	  System.out.println(p.getHakbun());
  	  // 학번 출력
  	  System.out.println(p.getName());
  	  // 이름 출력
  	}
  }
}
```
```java
import java.util.ArrayList;

public class ArrayListEx {
  public static void main(String[] args) {
    ArrayList<Integer> al = new ArrayList<>();
    al.add(1);
    al.add(2);
    al.add(3);
    al.add(4);
    al.add(5);

    for(int i = 0; i < al.size(); i++) {
      if(al.get(i) instanceof Integer) {
        // System.out.println(al.get(i));
        al.remove(i);
      }
    }
    System.out.println(al); // [2, 4]
    // remove()의 사용으로 배열의 크기가 달라지기 때문에 데이터가 모두 삭제된
    // 출력이 나오지 않고 일부 데이터가 남아있는 형태로 출력된다
  }
}
```
#### Set 인터페이스를 구현한 클래스
- 순서가 없는 데이터를 표현할 때 사용한다

  &rarr; &nbsp; 순서가 없기 때문에 데이터가 중복될 수 없다
```java
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SetEx {
  public static void main(String[] args) {
    HashSet<String> hs1 = new HashSet<>();
    Set<String> hs2 = new HashSet<>();

    hs1.add("홍길동");
    hs1.add("박문수");
    hs1.add("임꺽정");
    System.out.println(hs1); // [홍길동, 박문수, 임꺽정]
    System.out.println(hs1.size()); // 3

    hs1.add("홍길동");
    hs1.add("장길산");
    System.out.println(hs1); // [홍길동, 박문수, 임꺽정, 장길산]
    // 중복된 데이터는 추가하지 않는다

    Iterator<String> i = hs1.iterator();
    while(i.hasNext()){
      System.out.println(i.next());
    } 
    // hs1의 데이터를 모두 출력한다
    for(String str : hs2){
      System.out.println(str);
    }
    // hs2의 데이터를 모두 출력한다
  }
}
```
중복이 허용되지 않는 속성을 이용해 로또 출력하기
```java
import java.util.HashSet;
import java.util.Random;

public class LottoEx {
  public static void main(String[] args) {
    HashSet<Integer> lotto = new HashSet<>();
    Random r = new Random(System.currentTimeMillis());
    for(int i = 0; i < 5; i++){
      while(true){
        if(lotto.size() == 6){
          break;
        }
        lotto.add(r.nextInt(45) + 1);
      }
      System.out.println(lotto);
      lotto.clear();
      // HashSet 객체 안의 데이터 모두 삭제
    }
  }
}
```
### Map 인터페이스
- 키, 값으로 이루어진 데이터의 집합을 표현할 때 사용한다

#### Map 인터페이스를 구현한 클래스
```java
import java.util.HashMap;

public class HashMapEx {
  public static void main(String[] args) {
    HashMap<String, String> hm = new HashMap<>();
    hm.put("a", "홍길동");
    hm.put("b", "박문수");
    hm.put("c", "임꺽정");
    System.out.println(hm); // {a=홍길동, b=박문수, c=임꺽정}
    System.out.println(hm.size()); // 3

    hm.put("d", "장길산");
    System.out.println(hm); // {a=홍길동, b=박문수, c=임꺽정, d=장길산}

    hm.put("c", "이몽룡"); 
    System.out.println(hm); // {a=홍길동, b=박문수, c=이몽룡, d=장길산}

    System.out.println(hm.get("a")); // 홍길동
    System.out.println(hm.get("b")); // 박문수
    System.out.println(hm.get("c")); // 이몽룡
    
    hm.remove("c");
    System.out.println(hm); // {a=홍길동, b=박문수, d=장길산}
    
    hm.clear();
    System.out.println(hm); // {}
  }
}
```
```java
import java.util.Enumeration;
import java.util.Properties;
import java.util.Set;

public class PropertiesEx {
  public static void main(String[] args) {
  
    Properties pro = new Properties();
    pro.setProperty("timeout", "30"); 
    pro.setProperty("language", "kr");
    pro.setProperty("size", "10");

    System.out.println(pro); // {size=10, language=kr, timeout=30}
    System.out.println(pro.size()); // 3

    Enumeration e = pro.propertyNames();
    while(e.hasMoreElements()) {
    	System.out.println(e.nextElement());
    }
    // pro의 키값만 모두 출력

    Set<String> names = pro.stringPropertyNames();
    for (String name : names) {
    	System.out.println(name);
    }
    // pro의 키값만 모두 출력
  }
}
```
```java
import java.util.Properties;
import java.util.Set;

public class PropertiesEx02 {

  public static void main(String[] args) {
    Properties prop = System.getProperties();
    // 시스템 속성을 할당받는다
    Set<String> names = prop.stringPropertyNames();
    for(String name : names) {
    	System.out.println(name);
    }
    // 시스템 속성의 키를 모두 출력

    System.out.println(System.getProperty("java.version")); // 17.0.6
    // "java.version" 키의 값을 확인
  }
}
```
## 스택과 큐
### 스택(Stack)
- 나중에 들어간 데이터가 먼저 나온다
```java
import java.util.Stack;

public class StackEx01 {

  public static void main(String[] args) {
    Stack<String> stack = new Stack<>();
    stack.push("홍길동");
    stack.push("박문수");
    stack.push("임꺽정");
    System.out.println(stack); // [홍길동, 박문수, 임꺽정]
    System.out.println(stack.pop()); // 임꺽정
    // 마지막에 추가 된 데이터를 반환한다
    System.out.println(stack); // [홍길동, 박문수]
    // pop() 메서드를 사용하면 반환된 값이 제거된다
    System.out.println(stack.pop()); // 박문수
    System.out.println(stack); // [홍길동]
  }

}
```
### 큐(Queue)
- 먼저 들어간 데이터가 먼저 나온다

```java
import java.util.LinkedList;
import java.util.Queue;

public class QueueEx01 {

  public static void main(String[] args) {
    Queue<String> queue = new LinkedList<>();
    queue.offer("홍길동");
    queue.offer("박문수");
    queue.offer("임꺽정");
    System.out.println(queue); // [홍길동, 박문수, 임꺽정]
    System.out.println(queue.poll()); // 홍길동
    // 가장 먼저 추가된 값을 반환한다
    System.out.println(queue); // [박문수, 임꺽정]
    // poll() 메서드를 사용하면 반환된 값이 제거된다
    System.out.println(queue.poll()); // 박문수
    System.out.println(queue); // [임꺽정]
  }

}
```
