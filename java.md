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
