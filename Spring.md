# Spring
<small> https://spring.io/ 참조</small>

- 객체를 다루는 다양한 기능을 제공해서 웹 개발에 도움을 준다

- DI(Dependency Injection, 의존성 주입), AOP(Aspect Oriented Programming, 관점 지향 프로그래밍)를 이용해 MVC(model 2)를 구현한다

  <small> IoC를 중심으로 객체의 관리(생성, 소멸)를 spring이 대신한다</small>

  <small>https://blog.naver.com/a5019999/223085608461 참조</small>

  <small>https://blog.naver.com/mindalpong_/222280700011 참조</small>


- 전자정부프레임워크 표준이다

## Spring 기본

### Spring Project 생성 방법

- Java Project + 수동 라이브러리 적용

- Maven Project, Gradle Project

  <small>필요한 라이브러리가 많기 때문에 maven 프로젝트를 주로 이용한다</small>

  - 처음부터 Maven Project 사용하는 경우

  - Java Project를 Maven Project로 변경시키는 경우

    <b>Cofigure &rarr; Convert to Maven Project</b>

- STS (Spring Tool Suite) : spring 공식 사이트에서 제공하는 IDE + 라이브러리

  <small> https://spring.io/tools 참조</small>

- 기본 java programming
```java
// HelloBean1.java
package com.exam.spring01;

public class HelloBean1 {
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring01;

public class HelloBean2 {
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// App.java
package com.exam.spring01;

public class App {

  public static void main(String[] args) {
    
    HelloBean1 helloBean1 = new HelloBean1();
    helloBean1.sayHello("홍길동");
    
    HelloBean2 helloBean2 = new HelloBean2();
    helloBean2.sayHello("박문수");
    // 객체 생성을 프로그래머가 직접 한다
  }

}

```

- 인터페이스를 이용한 java programing
```java
// Hello.java
package com.exam.spring02;

public interface Hello {
  public abstract void sayHello(String name);
}

// HelloBean1.java
package com.exam.spring02;

public class HelloBean1 implements Hello {

  @Override
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }

}

// HelloBean2.java
package com.exam.spring02;

public class HelloBean2 implements Hello {

  @Override
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }

}

// App.java
package com.exam.spring02;

public class App {

  public static void main(String[] args) {
    
    Hello hello = new HelloBean1();
    hello.sayHello("홍길동");
    System.out.println(hello);
    
    hello = new HelloBean2();
    hello.sayHello("박문수");
    System.out.println(hello);
    // 변수가 참조하는 객체를 프로그래머가 직접 변경시켜준다
  }

}
```

### Spring Bean Configuration File(Assembler)

- Spring은 미리 설정한 xml 파일을 이용해 객체를 생성하고 사용한다

  <small>!! Spring에서 다루는 자바 객체를 bean이라고 한다</small>

```java
// HelloBean1.java
package com.exam.spring03;

public class HelloBean1 {

  public HelloBean1() {
    System.out.println("HelloBean1 생성자 호출");
  }

  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring03;

public class HelloBean2 {

  public HelloBean2() {
    System.out.println("HelloBean2 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// App.java
package com.exam.spring03;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    
    GenericXmlApplicationContext ctx 
    = new GenericXmlApplicationContext("classpath:com/exam/spring03/context.xml");
    
    HelloBean1 helloBean1 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean1.sayHello("홍길동");
    
    HelloBean2 helloBean2 = (HelloBean2)ctx.getBean("helloBean2");
    helloBean2.sayHello("박문수");
    
    ctx.close();
    // 프로그래머가 직접 객체 생성을 하지 않는다
    // close() 메서드로 닫아주는 것 잊지 말자
  }
  
}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring03.HelloBean1"></bean>
  <!-- <bean id="helloBean1" class="com.exam.spring03.HelloBean1"></bean> -->
  <!-- name 속성 대신 id 속성을 사용할 수도 있다 -->
  <bean name="helloBean2" class="com.exam.spring03.HelloBean2"></bean>
  
</beans>

```

----------


```java
// Hello.java
package com.exam.spring04;

public interface Hello {
  public abstract void sayHello(String name);
}

// HelloBean1.java
package com.exam.spring04;

public class HelloBean1 implements Hello {
  public HelloBean1() {
    System.out.println("HelloBean1 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring04;

public class HelloBean2 implements Hello {
  public HelloBean2() {
    System.out.println("HelloBean2 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}
```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring04.HelloBean1"></bean>
  <bean name="helloBean2" class="com.exam.spring04.HelloBean2"></bean>
  
</beans>
```

```java
// App.java
package com.exam.spring04;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    GenericXmlApplicationContext ctx 
    = new GenericXmlApplicationContext("classpath:com/exam/spring04/context.xml");
    
    Hello hello = (Hello)ctx.getBean("helloBean1");
    hello.sayHello("홍길동");
    
    hello = (Hello)ctx.getBean("helloBean2");
    hello.sayHello("박문수");
    
    ctx.close();
  }

}

```




### 객체


#### 객체 생성 타입
##### prototype
- bean 태그의 scope 속성 값으로, 필요할 때마다 객체를 생성한다


```java
// HelloBean1.java
package com.exam.spring05;

public class HelloBean1 {
  public HelloBean1() {
    System.out.println("HelloBean1 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring05;

public class HelloBean2 {
  public HelloBean2() {
    System.out.println("HelloBean2 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}
```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring05.HelloBean1" scope="prototype"></bean>
  <!-- scope 속성의 값으로 prototype을 준다 -->
  <bean name="helloBean2" class="com.exam.spring05.HelloBean2" scope="prototype"></bean>
  
</beans>
```

```java
// App.java
package com.exam.spring05;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    GenericXmlApplicationContext ctx 
    = new GenericXmlApplicationContext("classpath:com/exam/spring05/context.xml");
    
    HelloBean1 helloBean1 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean1.sayHello("홍길동1");
    
    HelloBean1 helloBean3 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean3.sayHello("홍길동2");
    
    System.out.println(helloBean1);
    System.out.println(helloBean3);
    // 같은 클래스의 객체를 호출하지만 prototype은 필요할때마다 객채를 생성하기 때문에 서로 다른 객체를 참조한다
    
    HelloBean2 helloBean2 = (HelloBean2)ctx.getBean("helloBean2");
    
    helloBean2.sayHello("박문수");
    
    ctx.close();
  }

}

```

##### singleton
- bean 태그의 scope 속성 값으로, 프로그램 실행 시 미리 객체를 생성하고, 그 객체를 계속 사용한다


```java
// HelloBean1.java
package com.exam.spring06;

public class HelloBean1 {
  public HelloBean1() {
    System.out.println("HelloBean1 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring06;

public class HelloBean2 {
  public HelloBean2() {
    System.out.println("HelloBean2 생성자 호출");
  }
  
  public void sayHello(String name) {
    System.out.println(name + " 님, 안녕하세요");
  }
}
```

```xml
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring06.HelloBean1" scope="singleton"></bean>
  <bean name="helloBean2" class="com.exam.spring06.HelloBean2"></bean>
  <!-- scope 속성 값을 따로 지정하지 않은 경우에 객체 생성 방식은 singleton 이다  -->
  
</beans>

```

```java
// App.java
package com.exam.spring06;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    GenericXmlApplicationContext ctx 
    = new GenericXmlApplicationContext("classpath:com/exam/spring06/context.xml");
    
    HelloBean1 helloBean1 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean1.sayHello("홍길동1");
    
    HelloBean1 helloBean3 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean3.sayHello("홍길동2");
    
    System.out.println(helloBean1);
    System.out.println(helloBean3);
    // singleton은 프로그램 실행시 객체 생성을 하고 필요할 때마다 그 객체를 계속 사용한다 
    
    HelloBean2 helloBean2 = (HelloBean2)ctx.getBean("helloBean2");
    
    helloBean2.sayHello("박문수");
    
    ctx.close();
  }

}

```

#### 멤버필드 초기화

##### 생성자 주입을 통한 초기화 방식
- constructor-arg 태그를 이용한다

```java
// HelloBean.java
package com.exam.spring07;

public class HelloBean {
  private String name;
  
  public HelloBean() {
    System.out.println("HelloBean() 호출");
    this.name = "홍길동";
  }
  
  public HelloBean(String name) {
    System.out.println("HelloBean(String name) 호출");
    this.name = name;
  }
  
  public HelloBean(String firstname, String lastName) {
    System.out.println("HelloBean(String firstname, String lastName) 호출");
    this.name = lastName + " " + firstname;
  }
  
  public void sayHello() {
    System.out.println(this.name + "님, 안녕하세요");
  };
}

```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring07.HelloBean" scope="prototype"></bean>
  <bean name="helloBean2" class="com.exam.spring07.HelloBean" scope="prototype">
    <!--
    <constructor-arg>
      <value>박문수</value>
    </constructor-arg> 
    -->
    <constructor-arg value="이몽룡"></constructor-arg>
  </bean>
  <bean name="helloBean3" class="com.exam.spring07.HelloBean" scope="prototype">
    <!-- 
    <constructor-arg>
      <value>문수</value>
    </constructor-arg>
    <constructor-arg>
      <value>박</value>
    </constructor-arg>
    -->	
    <constructor-arg value="문수"></constructor-arg>
    <constructor-arg value="박"></constructor-arg>
  </bean>

</beans>

```

```java
// App.java
package com.exam.spring07;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring07/context.xml");
    
    HelloBean helloBean1 = (HelloBean)ctx.getBean("helloBean1");
    helloBean1.sayHello();
    
    HelloBean helloBean2 = (HelloBean)ctx.getBean("helloBean2");
    helloBean2.sayHello();
    
    HelloBean helloBean3 = (HelloBean)ctx.getBean("helloBean3");
    helloBean3.sayHello();
    
    ctx.close();
  }

}

```

----------

```java
// BoardTO.java
package com.exam.spring08;

public class BoardTO {
  public BoardTO() {
    System.out.println("BoardTO() 호출");
  }
}

// WriteAction.java
package com.exam.spring08;

public class WriteAction {
  private BoardTO to;
  
  public WriteAction() {
    System.out.println("WriteAction() 호출");
    this.to = new BoardTO();
  }
  
  public WriteAction(BoardTO to) {
    System.out.println("WriteAction(BoardTO to) 호출");
    this.to = to;
  }
  
  public void execute() {
    System.out.println("execute() 호출");
  }
}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="writeAction1" class="com.exam.spring08.WriteAction" scope="prototype"></bean>
  
  <bean name="writeAction2" class="com.exam.spring08.WriteAction" scope="prototype">
    <constructor-arg>
      <bean class="com.exam.spring08.BoardTO"></bean>
    </constructor-arg>
  </bean>
  
  <bean name="to" class="com.exam.spring08.BoardTO"></bean>
  <bean name="writeAction3" class="com.exam.spring08.WriteAction" scope="prototype">
    <constructor-arg>
      <ref bean="to"/>
    </constructor-arg>
  </bean>
  
</beans>



```
```java
// App.java
package com.exam.spring08;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {

  public static void main(String[] args) {
    WriteAction writeAction1 = new WriteAction();
    writeAction1.execute();
    
    BoardTO to = new BoardTO();
    WriteAction writeAction2 = new WriteAction(to);
    writeAction2.execute();
  }

}
```
```java
// App2.java
package com.exam.spring08;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App2 {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring08/context.xml");
    
    WriteAction writeAction1 = (WriteAction)ctx.getBean("writeAction1");
    writeAction1.execute();
    
    WriteAction writeAction2 = (WriteAction)ctx.getBean("writeAction2");
    writeAction2.execute();
    
    WriteAction writeAction3 = (WriteAction)ctx.getBean("writeAction3");
    writeAction3.execute();		
    
    ctx.close();
  }
}
```

----------
```java
// BoardTO.java
package com.exam.spring09;

public class BoardTO {
  private String seq;
  private String subject;
  
  public String getSeq() {
    return seq;
  }
  
  public String getSubject() {
    return subject;
  }
  
  public BoardTO(String seq, String suject) {
    System.out.println("BoardTO() 호출");
    this.seq = seq;
    this.subject = suject;
  }
}

// ListAction.java
package com.exam.spring09;

public class ListAction {
  private BoardTO to;
  
  public ListAction(BoardTO to) {
    System.out.println("ListAction(BoardTO to) 호출");
    this.to = to;
  }
  
  public void execute() {
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
  }
}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="to" class="com.exam.spring09.BoardTO">
    <constructor-arg>
      <value>1</value>
    </constructor-arg>
    <constructor-arg>
      <value>제목 1</value>
    </constructor-arg>
  </bean>
  <bean name="listAction1" class="com.exam.spring09.ListAction" scope="prototype">
    <constructor-arg>
      <ref bean="to"/>
    </constructor-arg>
  </bean>
  
</beans>

```
```java
// App.java
package com.exam.spring09;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring09/context.xml");
    
    ListAction listAction1 = (ListAction)ctx.getBean("listAction1");
    listAction1.execute();
    
    ctx.close();
  }
}

```


##### setter를 통한 초기화 방식
- property 태그를 이용한다

  <small>!! 클래스의 기본 생성자가 없는 경우, 오류가 생긴다</small>

```java
// BoardTO.java
package com.exam.spring02;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    System.out.println("setSeq(int seq) 호출");
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    System.out.println("setSubject(String subject) 호출");
    this.subject = subject;
  }
  
}

```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="to" class="com.exam.spring02.BoardTO" scope="prototype">
    <property name="seq" value="1"></property>
    <property name="subject" value="제목1"></property>
  </bean>
</beans>

```

```java
// App2.java
package com.exam.spring02;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App2 {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring02/context.xml");
    
    BoardTO to = (BoardTO)ctx.getBean("to");
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
    
    to.setSeq(2);
    to.setSubject("제목2");
    // 인스턴스화 됐기 때문에 기본 객체처럼 활용할 수 있다
    
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
    
    ctx.close();
  }
}

```

----------

```java
// BoardTO.java
package com.exam.spring02;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    System.out.println("setSeq(int seq) 호출");
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    System.out.println("setSubject(String subject) 호출");
    this.subject = subject;
  }
  
  
}

// WriteAction.java
package com.exam.spring02;

public class WriteAction {
  private BoardTO to;
  
  public WriteAction(BoardTO to) {
    System.out.println("WriteAction(BoardTO to) 호출");
    
    this.to = to;
  }
  
  public void execute() {
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
  }
}

// ListAction.java
package com.exam.spring02;

public class ListAction {
  private BoardTO to;
  
  public BoardTO getTo() {
    return to;
  }

  public void setTo(BoardTO to) {
    this.to = to;
  }

  
  public ListAction(BoardTO to) {
    System.out.println("ListAction(BoardTO to) 호출");
    
    this.to = to;
  }
  
  public ListAction() {
    System.out.println("기본 생성자 호출");
  }
  // setter 메서드를 사용해 초기화할 경우 클래스에 기본 생성자가 없으면 에러가 난다
  
  public void execute() {
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
  }
}

```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="to" class="com.exam.spring02.BoardTO" scope="prototype">
    <property name="seq" value="1"></property>
    <property name="subject" value="제목1"></property>
  </bean>
  
  <bean name="writeAction1" class="com.exam.spring02.WriteAction" scope="prototype">
    <constructor-arg>
      <ref bean="to"/>
    </constructor-arg>
  </bean>
  
  <bean name="writeAction2" class="com.exam.spring02.WriteAction" scope="prototype">
    <constructor-arg>
      <bean class="com.exam.spring02.BoardTO" scope="prototype">
        <property name="seq" value="2"></property>
        <property name="subject" value="제목2"></property>
      </bean>
    </constructor-arg>
  </bean>
  
  <bean name="listAction1" class="com.exam.spring02.ListAction">
    <property name="to" ref="to"></property>
  </bean>
  
  <bean name="listAction2" class="com.exam.spring02.ListAction">
    <property name="to">
      <bean class="com.exam.spring02.BoardTO" scope="prototype">
        <property name="seq" value="2"></property>
        <property name="subject" value="제목2"></property>
      </bean>
    </property>
  </bean>
</beans>

```
```java
// App3.java
package com.exam.spring02;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App3 {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring02/context.xml");
    
    WriteAction writeAction1 = (WriteAction)ctx.getBean("writeAction1");
    writeAction1.execute();
    
    WriteAction writeAction2 = (WriteAction)ctx.getBean("writeAction2");
    writeAction2.execute();
    
    ListAction listAction1 = (ListAction)ctx.getBean("listAction1");
    listAction1.execute();
    
    ListAction listAction2 = (ListAction)ctx.getBean("listAction2");
    listAction2.execute();
    
    ctx.close();
  }
}

```

----------

```java
// BoardTO.java
package com.exam.spring03;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    System.out.println("setSeq(int seq) 호출");
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    System.out.println("setSubject(String subject) 호출");
    this.subject = subject;
  }
  
  
}

```
```xml
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  
  xmlns:p="http://www.springframework.org/schema/p"

  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean id="to1" class="com.exam.spring03.BoardTO" scope="prototype">
    <property name="seq" value="1"></property>
    <property name="subject" value="제목1"></property>
  </bean>
  
  <bean id="to2" class="com.exam.spring03.BoardTO" p:seq="2" p:subject="제목2" scope="prototype"></bean>
  <!-- 이름공간을 이용해서 setter 이용하는 방식 -->
</beans>

```
```java
// App.java
package com.exam.spring03;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.util.SystemPropertyUtils;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx 
    = new GenericXmlApplicationContext("classpath:com/exam/spring03/context.xml");
    
    BoardTO to1 = (BoardTO)ctx.getBean("to1");
    System.out.println(to1.getSeq());
    System.out.println(to1.getSubject());
    
    BoardTO to2 = (BoardTO)ctx.getBean("to2");
    System.out.println(to2.getSeq());
    System.out.println(to2.getSubject());
    
    ctx.close();
  
  }
}

```
----------
- 인수로 List를 사용하는 경우 property 태그 안에서 list 태그를 이용한다

- 인수로 HashMap을 사용하는 경우 property 태그 안에서 map 태그를 이용한다

```java
// BoardTO.java
package com.exam.spring04;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    System.out.println("setSeq(int seq) 호출");
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    System.out.println("setSubject(String subject) 호출");
    this.subject = subject;
  }
  
}

// BoardListTO.java
package com.exam.spring04;

import java.util.ArrayList;
import java.util.HashMap;

public class BoardListTO {
  private ArrayList<String> userList;
  private ArrayList<BoardTO> boardList;
  private HashMap<String, String> userMap;
  private HashMap<String, BoardTO> boardMap;
  
  public ArrayList<String> getUserList() {
    return userList;
  }
  public void setUserList(ArrayList<String> userList) {
    this.userList = userList;
  }
  public ArrayList<BoardTO> getBoardList() {
    return boardList;
  }
  public void setBoardList(ArrayList<BoardTO> boardList) {
    this.boardList = boardList;
  }
  public HashMap<String, String> getUserMap() {
    return userMap;
  }
  public void setUserMap(HashMap<String, String> userMap) {
    this.userMap = userMap;
  }
  public HashMap<String, BoardTO> getBoardMap() {
    return boardMap;
  }
  public void setBoardMap(HashMap<String, BoardTO> boardMap) {
    this.boardMap = boardMap;
  }


}


```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean id="listTO1" class="com.exam.spring04.BoardListTO">
    <property name="userList">
      <list>
        <value>홍길동</value>
        <value>박문수</value>
      </list>
    </property>
    <property name="boardList">
      <list>
        <bean class="com.exam.spring04.BoardTO">
          <property name="seq" value="1"></property>
          <property name="subject" value="제목1"></property>
        </bean>
        <bean class="com.exam.spring04.BoardTO">
          <property name="seq" value="2"></property>
          <property name="subject" value="제목2"></property>
        </bean>
      </list>
    </property>
  </bean>

  <bean id="to1" class="com.exam.spring04.BoardTO">
    <property name="seq" value="1"></property>
    <property name="subject" value="제목1"></property>
  </bean>

  <bean id="to2" class="com.exam.spring04.BoardTO">
    <property name="seq" value="2"></property>
    <property name="subject" value="제목2"></property>
  </bean>

  <bean id="listTO2" class="com.exam.spring04.BoardListTO">
    <property name="userList">
      <list>
        <value>홍길동</value>
        <value>박문수</value>
      </list>
    </property>
    <property name="boardList">
      <list>
        <ref bean="to1"/>
        <ref bean="to2"/>
      </list>
    </property>
  </bean>
  
  <bean id="mapTO" class="com.exam.spring04.BoardListTO">
    <property name="userMap">
      <map>
        <entry key="key1">
          <value>홍길동</value>
        </entry>
        <entry key="key2">
          <value>박문수</value>
        </entry>
      </map>
    </property>
  </bean>
  
  <bean id="boardMapTO" class="com.exam.spring04.BoardListTO">
    <property name="boardMap">
      <map>
        <entry key="key1">
          <bean class="com.exam.spring04.BoardTO">
            <property name="seq" value="1"></property>
            <property name="subject" value="제목1"></property>
          </bean>
        </entry>
        <entry key="key2">
          <bean class="com.exam.spring04.BoardTO">
            <property name="seq" value="2"></property>
            <property name="subject" value="제목2"></property>
          </bean>
        </entry>
      </map>
    </property>
  </bean>

</beans>

```
```java
// App2.java
package com.exam.spring04;

import org.springframework.context.support.GenericXmlApplicationContext;

public class App2 {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring04/context.xml");
    
    BoardListTO listTO1 = (BoardListTO)ctx.getBean("listTO1");
    /* BoardListTO listTO1 = (BoardListTO)ctx.getBean("listTO2"); */
    
    for(String user : listTO1.getUserList()) {
      System.out.println(user);
    }
    
    BoardListTO listTO2 = (BoardListTO)ctx.getBean("listTO1");
    /* BoardListTO listTO2 = (BoardListTO)ctx.getBean("listTO2"); */
    
    for(BoardTO to : listTO2.getBoardList()) {
      System.out.println(to.getSeq());
      System.out.println(to.getSubject());
    }
    
    BoardListTO mapTO = (BoardListTO)ctx.getBean("mapTO");
    
    for(String user : mapTO.getUserMap().values()) {
      System.out.println(user);
    }
    
    BoardListTO boardMapTO = (BoardListTO)ctx.getBean("boardMapTO");
    
    for(BoardTO to : boardMapTO.getBoardMap().values()) {
      System.out.println(to.getSeq());
      System.out.println(to.getSubject());
    }
    
    ctx.close();
  }
}

```
- Properties 클래스를 이용해 HashMap처럼 사용할 수도 있다
```java
// BoardPropertiesTO.java
package com.exam.spring05;

import java.util.Properties;

public class BoardPropertiesTO {
  private Properties configs;

  public Properties getConfigs() {
    return configs;
  }

  public void setConfigs(Properties configs) {
    this.configs = configs;
  }
  
}

// App.java
package com.exam.spring05;

import java.util.Properties;

public class App {
  public static void main(String[] args) {
    Properties configs = new Properties();
    configs.put("server", "192.168.1.100");
    configs.put("connectionTime", "5000");
    
    BoardPropertiesTO configsTO = new BoardPropertiesTO();
    configsTO.setConfigs(configs);
    
    Properties newConfigs = configsTO.getConfigs();
    
    System.out.println(newConfigs.getProperty("server"));
    System.out.println(newConfigs.getProperty("connectionTime"));
  }
}
```
----------
MVC(model2) 게시판 리스트 구현하기
```java
// BoardDAO.java
package com.exam.spring.model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
  private Connection conn;
  
  public BoardDAO() {
    String url = "jdbc:mariadb://localhost:3306/board";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      this.conn = DriverManager.getConnection(url, user, password);
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<String> boardList(){
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    List<String> list = new ArrayList();
    
    String sql = "select * from board1 limit 0, 5";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        String data = String.format("%s [%s] %s", rs.getString("seq"), rs.getString("writer"), rs.getString("subject"));

        list.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return list;
  }
}
```
```java
// Action.java
package com.exam.spring.model2;

public interface Action {
  public abstract void execute();
}

// ListAction.java
package com.exam.spring.model2;

import java.util.List;

import com.exam.spring.model1.BoardDAO;

public class ListAction implements Action {
  private BoardDAO dao;
  
  public ListAction(BoardDAO dao) {
    this.dao = dao;
  }
  
  @Override
  public void execute() {
    List<String> list = dao.boardList();
    
    for(String data : list) {
      System.out.println(data);
    }
  }

}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean id="dao" class="com.exam.spring.model1.BoardDAO" scope="prototype"></bean>
  <bean id="action" class="com.exam.spring.model2.ListAction" scope="prototype">
    <constructor-arg ref="dao"></constructor-arg>
  </bean>
  
</beans>

```
```java
// App2.java
package com.exam.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.spring.model2.Action;

public class App2 {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring/context.xml");
    
    Action action = (Action)ctx.getBean("action");
    action.execute();
    
    ctx.close();
  }
}

```

### annotaion
- Spring Bean Configuration File을 사용하는 대신 annotation을 이용할 수 있다

```java
// Hello.java
package com.exam.spring01.model;

public interface Hello {
  public abstract void sayHello(String name);
}

// HelloBean1.java
package com.exam.spring01.model;

public class HelloBean1 implements Hello {

  public HelloBean1() {
    System.out.println("HelloBean1() 호출");
  }
  
  @Override
  public void sayHello(String name) {
    System.out.println(name + "님, 안녕하세요");
  }

}

// HelloBean2.java
package com.exam.spring01.model;

public class HelloBean2 implements Hello {

  public HelloBean2() {
    System.out.println("HelloBean2() 호출");
  }
  
  @Override
  public void sayHello(String name) {
    System.out.println(name + "님, 안녕하세요");
  }

}

```
```java
// BeanConfig.java
package com.exam.spring02.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring01.model.Hello;
import com.exam.spring01.model.HelloBean1;
import com.exam.spring01.model.HelloBean2;

@Configuration
public class BeanConfig {
  
  @Bean
  @Scope("prototype")
  // 기본값은 singleton이다
  public HelloBean1 helloBean1() {
    System.out.println("helloBean1() 호출");
    return new HelloBean1();
  }
  
  @Bean("helloBean")
  // bean의 id를 설정한다
  // id를 따로 설정하지 않은 경우 메서드 이름이 id가 된다
  @Scope("prototype")
  public HelloBean2 helloBean2() {
    System.out.println("helloBean2() 호출");
    return new HelloBean2();
  }
  
  @Bean
  public Hello hello1() {
    return new HelloBean1();
  }
  
  @Bean
  public Hello hello2() {
    return new HelloBean2();
  }
  
}

```
```java
// App.java
package com.exam.spring01;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.spring01.model.Hello;
import com.exam.spring02.config.BeanConfig;

public class App {
  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx
    = new AnnotationConfigApplicationContext(BeanConfig.class);
    
    Hello helloBean1 = (Hello)ctx.getBean("helloBean1");
    helloBean1.sayHello("홍길동");
    
    Hello helloBean2 = (Hello)ctx.getBean("helloBean");
    helloBean2.sayHello("박문수");
    
    Hello hello1 = (Hello)ctx.getBean("hello1");
    hello1.sayHello("이몽룡");
    Hello hello2 = (Hello)ctx.getBean("hello2");
    hello2.sayHello("임꺽정");
    
    ctx.close();
  }
}

```
#### 멤버필드 초기화

##### 생성자 주입을 통한 초기화
```java
// HelloBean.java
package com.exam.spring02.model;

public class HelloBean {
  private String name;
  
  public HelloBean() {
    System.out.println("HelloBean() 호출");
    this.name = "홍길동";
  }
  
  public HelloBean(String name) {
    System.out.println("HelloBean() 호출");
    this.name = name;
  }
  
  public void sayHello() {
    System.out.println(name + "님, 안녕하세요");
  }
}

// BeanConfig.java
package com.exam.spring02.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring02.model.HelloBean;

@Configuration
@Scope("prototype")
public class BeanConfig {

  @Bean
  public HelloBean helloBean1() {
    return new HelloBean();
  }
  
  @Bean
  public HelloBean helloBean2() {
    return new HelloBean("박문수");
    // 생성자 주입 방법
  }
}

```
```java
// App.java
package com.exam.spring02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.spring02.model.HelloBean;

public class App {
  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx
    = new AnnotationConfigApplicationContext(com.exam.spring02.config.BeanConfig.class);
    
    HelloBean helloBean = (HelloBean)ctx.getBean("helloBean2");
    helloBean.sayHello();
  }
}

```
----------
```java
// BoardTO.java
package com.exam.spring03.model;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  
}

// Action.java
package com.exam.spring03.model;

public interface Action {
  public abstract void execute();
}

// WriteAction.java
package com.exam.spring03.model;

public class WriteAction implements Action {
  private BoardTO to;
  
  public WriteAction() {
    System.out.println("WriteAction 기본 생성자");
  }
  
  public WriteAction(BoardTO to) {
    System.out.println("WriteAction(BoardTO to) 호출");
    this.to = to;
  }
  
  @Override
  public void execute() {
    System.out.println("execute() 호출");
  }

}


```
```java
// BoardConfig.java
package com.exam.spring03.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring03.model.Action;
import com.exam.spring03.model.BoardTO;
import com.exam.spring03.model.WriteAction;

@Configuration
@Scope("prototype")
public class BoardConfig {
  
  public BoardTO boardTO() {
    return new BoardTO();
  }
  // 클래스 내부에서만 사용할 것이기 때문에 애노테이션을 따로 주지 않아도 된다
  
  @Bean
  public Action writeAction1(){
    return new WriteAction();
  }
  
  @Bean
  public Action writeAction2(){
    // BoardTO to = new BoardTO();
    // return new WriteAction(to);
    return new WriteAction(boardTO());
  }
}

```
```java
// App.java

package com.exam.spring03;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.spring03.config.BoardConfig;
import com.exam.spring03.model.Action;

public class App {
  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx
    = new AnnotationConfigApplicationContext(BoardConfig.class);
    
    Action action = (Action)ctx.getBean("writeAction1");
    action.execute();
  }
}

```


##### setter를 통한 초기화
```java
// BoardTO.java
package com.exam.spring04.model;

public class BoardTO {
  private int seq;
  private String subject;
  
  public int getSeq() {
    return seq;
  }
  public void setSeq(int seq) {
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  
}
```
```java
// BeanConfig.java
package com.exam.spring04.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring03.model.BoardTO;

@Configuration
@Scope("prototype")
public class BeanConfig {

  @Bean
  public BoardTO boardTO() {
    BoardTO to = new BoardTO();
    
    to.setSeq(1);
    to.setSubject("제목");
    
    return to;
  }
}

```
```java
// App.java
package com.exam.spring04;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.spring03.model.BoardTO;
import com.exam.spring04.config.BeanConfig;

public class App {
  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx
    = new AnnotationConfigApplicationContext(BeanConfig.class);
    
    BoardTO to = (BoardTO)ctx.getBean("boardTO");
    System.out.println(to.getSeq());
    System.out.println(to.getSubject());
    
    ctx.close();
  }
}

```
----------
게시판 출력하기 
```java
// BoardTO.java
package com.exam.model1;

public class BoardTO {
  private String seq;
  private String writer;
  private String subject;
  
  public String getSeq() {
    return seq;
  }
  public void setSeq(String seq) {
    this.seq = seq;
  }
  public String getWriter() {
    return writer;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
}

// BoardDAO.java
package com.exam.model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public BoardDAO() {
    String url = "jdbc:mariadb://localhost:3306/board";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      this.conn = DriverManager.getConnection(url, user, password);
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
    
  }
  
  public List<BoardTO> boardList(){
    
    List<BoardTO> list = new ArrayList();
    
    String sql = "select * from board1 limit 0, 5";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        BoardTO data = new BoardTO();
        data.setSeq(rs.getString("seq"));
        data.setWriter(rs.getString("writer"));
        data.setSubject(rs.getString("subject"));
        
        list.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return list;
  }
}

```
```java
// Action.java
package com.exam.model2;

public interface Action {
  public abstract void execute();
}

// ListAction.java
package com.exam.model2;

import java.util.List;

import com.exam.model1.BoardDAO;
import com.exam.model1.BoardTO;

public class ListAction implements Action {

  @Override
  public void execute() {
    BoardDAO dao = new BoardDAO();
    
    List<BoardTO> list = dao.boardList();
    
    for(BoardTO data : list) {
      String str = String.format("[%s] %s %s", data.getSeq(), data.getSubject(), data.getWriter());
      System.out.println(str);
    }
    
  }

}

```
```java
// BeanConfig.java
package com.exam.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.model2.Action;
import com.exam.model2.ListAction;

@Configuration
@Scope("prototype")
public class BeanConfig {

  @Bean
  public Action listAction() {
    return new ListAction();
  }
}

```
```java
// App.java
package com.exam;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.config.BeanConfig;
import com.exam.model2.Action;

public class App {
  public static void main(String[] args) {
    AnnotationConfigApplicationContext ctx
    = new AnnotationConfigApplicationContext(BeanConfig.class);
    
    Action action = (Action)ctx.getBean("listAction");
    action.execute();
  }
}

```
<hr>

```java
// HelloBean1.java
package com.exam.spring01.model;

public class HelloBean1 {
  
  public void sayHello(String name) {
    System.out.println(name + "님, 안녕하세요");
  }
}

// HelloBean2.java
package com.exam.spring01.model;

public class HelloBean2 {
  
  public void sayHello(String name) {
    System.out.println("Hello " + name);
  }
}

```
```java
// BeanConfig1.java
package com.exam.spring01.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring01.model.HelloBean1;

@Configuration
@Scope("prototype")
public class BeanConfig1 {
  
  @Bean
  public HelloBean1 helloBean1() {
    return new HelloBean1();
  }
  
}

// BeanConfig2.java
package com.exam.spring01.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.exam.spring01.model.HelloBean2;

@Configuration
@Scope("prototype")
public class BeanConfig2 {
  
  @Bean
  public HelloBean2 helloBean2() {
    return new HelloBean2();
  }
  
}

// BeanConfig.java
package com.exam.spring01.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({BeanConfig1.class, BeanConfig2.class})
// Import annotation으로 다른 클래스 파일을 import 할 수 있다
public class BeanConfig {

}

```
```java
// App.java
package com.exam.spring01;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.exam.spring01.config.BeanConfig;
import com.exam.spring01.config.BeanConfig1;
import com.exam.spring01.config.BeanConfig2;
import com.exam.spring01.model.HelloBean1;
import com.exam.spring01.model.HelloBean2;

public class App {
  
  public static void main(String[] args) {
    
    AnnotationConfigApplicationContext ctx
    // = new AnnotationConfigApplicationContext(BeanConfig1.class, BeanConfig2.class);
    // 가변인자를 받기 때문에 위와 같이 쓸 수 있다
    = new AnnotationConfigApplicationContext(BeanConfig.class);
    
    HelloBean1 helloBean1 = (HelloBean1)ctx.getBean("helloBean1");
    helloBean1.sayHello("홍길동");
    
    HelloBean2 helloBean2 = (HelloBean2)ctx.getBean("helloBean2");
    helloBean2.sayHello("박문수");
    
    ctx.close();
  }
}

```

### 객체 lifecycle
<small>https://dct-wonjung.tistory.com/entry/Spring-%EB%B9%88-%EB%9D%BC%EC%9D%B4%ED%94%84%EC%82%AC%EC%9D%B4%ED%81%B4 참조</small>

<small>https://blog.naver.com/edy5016/221280377077 참조</small>

- Spring container가 bean(java 객체)의 lifecycle을 관리한다

- lifecycle 흐름
```java
// Action.java
package com.exam.lifecycle.model;

public interface Action {
  public abstract void execute();
}

// WriteAction.java
package com.exam.lifecycle.model;

public class WriteAction implements Action {
  
  private String writer;
  
  public WriteAction() {
    System.out.println("1. 빈의 생성자 실행");
  }
  
  public void setWriter(String writer) {
    System.out.println("2. setWriter(String writer) 호출");
    this.writer = writer;
  }
  
  @Override
  public void execute() {
    System.out.println("*. execute() 호출");
  }

}

```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean id="action" class="com.exam.lifecycle.model.WriteAction" scope="prototype">
    <property name="writer" value="Hello Bean"></property>
  </bean>
  
</beans>

```
```java
// App.java
package com.exam.lifecycle;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.lifecycle.model.Action;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/lifecycle/context.xml");
    
    Action action = (Action)ctx.getBean("action");
    action.execute();
    
    ctx.close();
  }
}

```
- 객체 관리 인터페이스와 직접 작성한 커스텀 메서드를 통해서 자세한 흐름을 파악할 수 있다

  - InitializingBean : 객체 생성
  - DisposableBean : 객체 소멸

  - ApplicationContextAware : 객체 초기화 
  - BeanNameAware : 빈의 이름 초기화

```java
// Action.java
package com.exam.lifecycle.model;

public interface Action {
  public abstract void execute();
}

// WriteAction.java
package com.exam.lifecycle.model;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanClassLoaderAware;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class WriteAction implements Action, InitializingBean, DisposableBean, ApplicationContextAware, BeanNameAware,
    BeanClassLoaderAware, BeanFactoryAware {

  private String writer;
  private String beanName;
  private BeanFactory beanFactory;
  

  public WriteAction() {
    System.out.println("1. 빈의 생성자 실행");
  }

  public void setWriter(String writer) {
    System.out.println("2. setWriter(String writer) 호출");
    this.writer = writer;
  }

  @Override
  public void execute() {
    System.out.println("*. execute() 호출");
  }

  @Override
  public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
    System.out.println("5. setBeanFactory(BeanFactory beanFactory) 호출");
    
    System.out.println("beanFactory : " + beanFactory);
  }

  @Override
  public void setBeanClassLoader(ClassLoader classLoader) {
    System.out.println("4. setBeanClassLoader(ClassLoader classLoader) 호출");
  }

  @Override
  public void setBeanName(String name) {
    System.out.println("3. setBeanName(String name) 호출");
    
    System.out.println("beanName : " + name);
    this.beanName = name;
  }

  @Override
  public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
    System.out.println("6. setApplicationContext(ApplicationContext applicationContext) 호출");
  }

  @Override
  public void destroy() throws Exception {
    System.out.println("11. destroy() 호출");
  }

  @Override
  public void afterPropertiesSet() throws Exception {
    System.out.println("8. afterPropertiesSet() 호출");
    
    if(writer == null) {
      System.out.println("writer의 값이 없습니다");
    }else {
      System.out.println("writer의 값이 있습니다");
    }
  }
  
  // 커스텀 메서드
  public void init_method() {
    System.out.println("9. init_method() 호출");
  }
  
  public void destroy_method() {
    System.out.println("12. destroy_method() 호출");
  }

}

// CustomBeanPostProcessor.java
package com.exam.lifecycle;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;

public class CustomBeanPostProcessor implements BeanPostProcessor {

  @Override
  public Object postProcessBeforeInitialization(Object bean, String beanName) throws BeansException {
    System.out.println("7. postProcessBeforeInitialization(Object bean, String beanName) 호출");
    return bean;
  }

  @Override
  public Object postProcessAfterInitialization(Object bean, String beanName) throws BeansException {
    System.out.println("10. postProcessAfterInitialization(Object bean, String beanName) 호출");
    return bean;
  }

}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean id="action" class="com.exam.lifecycle.model.WriteAction"
    scope="singleton" init-method="init_method"
    destroy-method="destroy_method">
    <property name="writer" value="Hello Bean"></property>
  </bean>
  <!-- scope 속성 값으로 singleton을 써야 객체 소멸까지 확인 가능하다 -->

  <bean class="com.exam.lifecycle.CustomBeanPostProcessor"></bean>
</beans>

```

```java
// App.java
package com.exam.lifecycle;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.lifecycle.model.Action;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/lifecycle/context.xml");
    
    Action action = (Action)ctx.getBean("action");
    action.execute();
    
    ctx.close();
  }
}

```


### AOP(Aspect Oriented Programming)

- 관점 지향 프로그래밍이라고 하며, 핵심기능 ,공통기능을 분리해서
 재사용성을 높여준다

#### DI를 이용하는 경우
 ```java
//  WriteAction.java
 package com.exam.spring.model;

public class WriteAction {
  private String writer;
  
  public WriteAction() {
    System.out.println("WriteAction() 호출");
  }
  
  public void setWriter(String writer) {
    this.writer = writer;
  }
  
  // 핵심기능(core concern) 
  public void execute() {
    System.out.println("execute() 호출");
  }
}

```
```java
// BasicAdvice1.java
package com.exam.spring.advice;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;

public class BasicAdvice1 implements MethodInterceptor {

  @Override
  public Object invoke(MethodInvocation invocation) throws Throwable {
    
    // 전처리 구간
    System.out.println("전처리 구간 : " + invocation.getMethod().getName());
    System.out.println(invocation.getMethod().getName() + "메서드 시작");
    
    StopWatch stopWatch = new StopWatch();
    stopWatch.start(invocation.getMethod().getName());
    
    Object rtnObj = invocation.proceed();
    // 후처리 구간
    System.out.println("후처리 구간");
    stopWatch.stop();
    
    System.out.println("처리 시간 : " + stopWatch.getTotalTimeMillis());
    
    return rtnObj;
  }

}

// BasicAdvice2.java
package com.exam.spring.advice;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

public class BasicAdvice2 implements MethodInterceptor {

  @Override
  public Object invoke(MethodInvocation invocation) throws Throwable {
    
    System.out.println("전처리 구간 2");
    Object rtnObj = invocation.proceed();
    System.out.println("후처리 구간 2");
    
    return rtnObj;
  }

}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <!-- AOP -->
  <bean id="basicAdvice1" class="com.exam.spring.advice.BasicAdvice1"></bean>
  <bean id="pointcutAdvice1" class="org.springframework.aop.support.DefaultPointcutAdvisor">
    <property name="advice">
      <ref bean="basicAdvice1"/>
    </property>
    <property name="pointcut">
      <bean class="org.springframework.aop.support.JdkRegexpMethodPointcut">
        <property name="pattern">
          <value>.*execute.*</value>
        </property>
      </bean>
    </property>
  </bean>
  <bean id="pointcutAdvice2" class="org.springframework.aop.support.DefaultPointcutAdvisor">
    <property name="advice">
      <bean class="com.exam.spring.advice.BasicAdvice2"></bean>
    </property>
    <property name="pointcut">
      <bean class="org.springframework.aop.support.JdkRegexpMethodPointcut">
        <property name="pattern">
          <value>.*execute.*</value>
        </property>
      </bean>
    </property>
  </bean>

  <bean id="action1" class="com.exam.spring.model.WriteAction" scope="prototype"></bean>
  <bean id="action2" class="com.exam.spring.model.WriteAction" scope="prototype">
    <property name="writer">
      <value>홍길동</value>
    </property>
  </bean>
  
  <!-- AOP 적용 -->
  <bean id="proxy" class="org.springframework.aop.framework.ProxyFactoryBean">
    <property name="target" ref="action1"></property>
    <property name="interceptorNames">
      <list>
        <value>pointcutAdvice1</value>
        <value>pointcutAdvice2</value>
        <!-- 위에서부터 차례로 전처리, 후처리 순서가 정해진다 -->
      </list>
    </property>
  </bean>
</beans>

```

```java
package com.exam.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.spring.model.WriteAction;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring/context.xml");
    
    // WriteAction action = (WriteAction)ctx.getBean("action1");
    // 전처리, 후처리 없이 핵심 기능만 수행된다

    WriteAction action = (WriteAction)ctx.getBean("proxy");
    
    // 전처리
    action.execute();
    // 후처리
    // 전처리, 후처리 순서를 주의깊게 보자
    
    ctx.close();
  }
}

```
#### AspectJ를 이용하는 경우

- pom.xml를 이용해 관련 라이브러리를 추가해준다 (Maven)
```xml
<!-- AspectJ -->
<dependency>
  <groupId>org.aspectj</groupId>
  <artifactId>aspectjrt</artifactId>
  <version>1.9.19</version>
</dependency>
<dependency>
  <groupId>org.aspectj</groupId>
  <artifactId>aspectjweaver</artifactId>
  <version>1.9.19</version>
</dependency>
```
<hr>

```java
// WriteAction.java
package com.exam.spring.model;

public class WriteAction {
  private String writer;
  
  public WriteAction() {
    System.out.println("WriteAction() 호출");
  }
  
  public void setWriter(String writer) {
    this.writer = writer;
  }
  
  public void execute1() {
    System.out.println("execute1() 호출");
  }
  
  public void execute2() {
    System.out.println("execute2() 호출");
  }
}


```
```java
// BasicAdvice1.java
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;

// POJO
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;

// POJO
public class BasicAdvice1 {

  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
    
    System.out.println("전처리 구간 1");
    Object rtnObj = joinPoint.proceed();
    System.out.println("후처리 구간 1");
    
    return rtnObj;
  }
  
  public void before() throws Throwable{
    System.out.println("전처리 구간 1");
  }
  
  public void after() throws Throwable{
    System.out.println("후처리 구간 1");
  }
}


// BasicAdvice2.java
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;

// POJO
public class BasicAdvice2 {

  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
    
    System.out.println("전처리 구간 2");
    Object rtnObj = joinPoint.proceed();
    System.out.println("후처리 구간 2");
    
    return rtnObj;
  }
}

```
```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:aop="http://www.springframework.org/schema/aop"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd">

  <bean id="action1" class="com.exam.spring.model.WriteAction" scope="prototype"></bean>
  <bean id="action2" class="com.exam.spring.model.WriteAction" scope="prototype">
    <property name="writer">
      <value>홍길동</value>
    </property>
  </bean>
  
  <bean id="basicAdvice1" class="com.exam.spring.advice.BasicAdvice1" scope="prototype"></bean>
  <bean id="basicAdvice2" class="com.exam.spring.advice.BasicAdvice2" scope="prototype"></bean>
  
  <!-- AOP 설정 -->
  <aop:config>
    <aop:aspect ref="basicAdvice1" order="2">
      <aop:pointcut id="pointCut" expression="execution(* execute*())" />
      <!-- <aop:around method="logAround" pointcut-ref="pointCut"/>  -->
      <!-- 전처리, 후처리 구간 모두 설정 -->
      <!-- <aop:before method="before" pointcut-ref="pointCut"/> -->
      <!-- 전처리 구간만 설정 -->
      <aop:after method="after" pointcut-ref="pointCut"/>
      <!-- 후처리 구간만 설정 -->
    </aop:aspect>
    
    <aop:aspect ref="basicAdvice2" order="1">
      <aop:pointcut id="pointCut" expression="execution(* execute2())" />
      <aop:around method="logAround" pointcut-ref="pointCut"/> 
    </aop:aspect>
  </aop:config>

</beans>

```
```java
// App.java
package com.exam.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.spring.model.WriteAction;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring/context.xml");
    
    WriteAction writeAction = (WriteAction)ctx.getBean("action1");
    
    writeAction.execute1();
    writeAction.execute2();
    // 객체가 아닌 메서드 단위로 실행된다
    
    ctx.close();
  }
}

```

<hr>

annotation을 이용하는 경우

```java
// WriteAction.java
package com.exam.spring.model;

public class WriteAction {
  private String writer;
  
  public WriteAction() {
    System.out.println("WriteAction() 호출");
  }
  
  public void setWriter(String writer) {
    this.writer = writer;
  }
  
  public void execute1() {
    System.out.println("execute1() 호출");
  }
  
  public void execute2() {
    System.out.println("execute2() 호출");
  }
}

```
```java
// BasicAdvice1.java
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class BasicAdvice1 {
  
  @Pointcut("execution(* execute1())")
  private void myTarget() {}
  
  /*
  @Around("myTarget()")
  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
    
    System.out.println("전처리 구간 1");
    Object rtnObj = joinPoint.proceed();
    System.out.println("후처리 구간 1");
    
    return rtnObj;
  }
  */
  
  @Before("myTarget()")
  public void before() throws Throwable {
    System.out.println("전처리 구간 1");
  }

}


// BasicAdvice2.java
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class BasicAdvice2 {
  
  @Pointcut("execution(* execute2())")
  private void myTarget() {}
  
  /*
  @Around("myTarget()")
  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
    
    System.out.println("전처리 구간 2");
    Object rtnObj = joinPoint.proceed();
    System.out.println("후처리 구간 2");
    
    return rtnObj;
  }
  */
  
  @After("myTarget()")
  public void after() {
    System.out.println("후처리 구간 2");
  }
  
}


```
```xml
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:aop="http://www.springframework.org/schema/aop"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd">

  <bean id="action1" class="com.exam.spring.model.WriteAction" scope="prototype"></bean>
  <bean id="basicAdvice1" class="com.exam.spring.advice.BasicAdvice1" scope="prototype"></bean>
  <bean id="basicAdvice2" class="com.exam.spring.advice.BasicAdvice2" scope="prototype"></bean>
  
  <aop:aspectj-autoproxy></aop:aspectj-autoproxy>	
  <!-- annotation을 찾아서 자동으로 적용시킨다 -->
</beans>

```
```java
// App.java
package com.exam.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.spring.model.WriteAction;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring/context.xml");
    
    WriteAction writeAction = (WriteAction)ctx.getBean("action1");
    
    writeAction.execute1();
    writeAction.execute2();
    
    ctx.close();
  }
}

```

<hr>

1 ~ 100,000 더하기 시간 측정

```java
// CountAction.java
package com.exam.spring.model;

public class CountAction {
  
  public void execute() {
    int sum = 0;
    for(int i = 1; i <= 100000; i++) {
      sum += i;
    }
  }
}

```
```java
// CountAdvice.java
package com.exam.spring.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.util.StopWatch;

@Aspect
public class CountAdvice {

  @Pointcut("execution(* execute())")
  public void myTarget() {}
  
  @Around("myTarget()")
  public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable{
    
    StopWatch stopWatch = new StopWatch();
    stopWatch.start("count");
    Object rtnObj = joinPoint.proceed();
    stopWatch.stop();
    
    System.out.println("처리시간 : " + stopWatch.getTotalTimeMillis());
    
    return rtnObj;
  }
}

```

```xml
<!-- context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:aop="http://www.springframework.org/schema/aop"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-4.3.xsd">

  <bean id="count" class="com.exam.spring.model.CountAction" scope="prototype"></bean>
  <bean class="com.exam.spring.advice.CountAdvice" scope="prototype"></bean>
  
  <aop:aspectj-autoproxy></aop:aspectj-autoproxy>	
</beans>

```
```java
// App.java
package com.exam.spring;

import org.springframework.context.support.GenericXmlApplicationContext;

import com.exam.spring.model.CountAction;

public class App {
  public static void main(String[] args) {
    GenericXmlApplicationContext ctx
    = new GenericXmlApplicationContext("classpath:com/exam/spring/context.xml");
    
    CountAction countAction = (CountAction)ctx.getBean("count");

    countAction.execute();
    
    ctx.close();
  }
}

```

## 웹 앱

- 웹 앱 구성 방법

  - Maven Project 

  - Dynamic Web Project + web.xml &rarr; Maven Project (*)

### 웹 앱 구성 기본 (Spring)

- pom.xml을 통해 web 앱 구성에 관련된 라이브러리를 추가시킨다

```xml
<modelVersion>4.0.0</modelVersion>
<groupId>com.spring</groupId>
<artifactId>template01</artifactId>
<packaging>war</packaging>
<version>0.0.1-SNAPSHOT</version>
<name>template01 Maven Webapp</name>
<url>http://maven.apache.org</url>
<properties>
  <!-- Generic properties -->
  <java.version>11</java.version>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
  
  <!-- Web -->
  <jsp.version>2.2</jsp.version>
  <jstl.version>1.2</jstl.version>
  <servlet.version>2.5</servlet.version>
  
  <!-- Spring -->
  <spring-framework.version>5.2.8.RELEASE</spring-framework.version>
  <!-- Hibernate / JPA -->
  <hibernate.version>5.6.9.Final</hibernate.version>
  <!-- Logging -->
  <logback.version>1.2.11</logback.version>
  <slf4j.version>1.7.36</slf4j.version>
  <!-- Test -->
  <junit.version>4.11</junit.version>
</properties>

<dependencies>

  <!-- Spring MVC -->
  <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>${spring-framework.version}</version>
  </dependency>
  
  <!-- Other Web dependencies -->
  <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
    <version>${jstl.version}</version>
  </dependency>
  <dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>servlet-api</artifactId>
    <version>${servlet.version}</version>
    <scope>provided</scope>
  </dependency>
  <dependency>
    <groupId>javax.servlet.jsp</groupId>
    <artifactId>jsp-api</artifactId>
    <version>${jsp.version}</version>
    <scope>provided</scope>
  </dependency>

  <!-- Spring and Transactions -->
  <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-tx</artifactId>
    <version>${spring-framework.version}</version>
  </dependency>
  <!-- Logging with SLF4J & LogBack -->
  <dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>${slf4j.version}</version>
    <scope>compile</scope>
  </dependency>
  <dependency>
    <groupId>ch.qos.logback</groupId>
    <artifactId>logback-classic</artifactId>
    <version>${logback.version}</version>
    <scope>runtime</scope>
  </dependency>
  <!-- Hibernate -->
  <dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-entitymanager</artifactId>
    <version>${hibernate.version}</version>
  </dependency>
  
  <!-- Test Artifacts -->
  <dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-test</artifactId>
    <version>${spring-framework.version}</version>
    <scope>test</scope>
  </dependency>
  <dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>${junit.version}</version>
    <scope>test</scope>
  </dependency>
</dependencies>	

```

- servlet 파일을 통해 웹 페이지를 실행시키는 것이 아닌 미리 설정해둔 xml 파일을 이용해 웹 페이지을 실행시킨다

```xml
<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>web01</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  
  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  
  <!-- servlet 설정 -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/servlet-context.xml</param-value>
      <!-- <param-value>/WEB-INF/servlet-context2.xml</param-value> -->
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
   <!-- 
    MVC(model2)
    list1.do -> list1.jsp
    list2.do -> list2.jsp
    list3.do -> list2.jsp
    list4.do -> list4.jsp
    list5.do -> list5.jsp
   -->
   <bean name="/list1.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="/listview1.jsp"></property>
   </bean>
   <bean name="/list2.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="/listview2.jsp"></property>
   </bean>
   <bean name="/list3.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="/listview3.jsp"></property>
   </bean>
   <bean name="/list4.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="/WEB-INF/views/listview4.jsp"></property>
   </bean>
   <bean name="/board/list5.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="/WEB-INF/views/listview5.jsp"></property>
   </bean>
   
</beans>

<!-- servlet-context2.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
   <bean name="/list5.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="listview5"></property>
   </bean>
   <bean name="/list6.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
     <property name="viewName" value="listview6"></property>
   </bean>
   
   <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
     <property name="prefix" value="/WEB-INF/views/"></property>
     <property name="suffix" value=".jsp"></property>
   </bean>
   
</beans>
```

<hr>

model2를 이용하는 방법

```java
// Form.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Form implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    System.out.println("Form 호출");
    
    return new ModelAndView("form");
  }

}

// Form_ok.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Form_ok implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    System.out.println("Form_ok 호출 : " + request.getParameter("data"));
    
    // request.setAttribute("data", request.getParameter("data"));
    // 데이터를 받아오고, 값을 설정하는 전통적인 방식
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    modelAndView.addObject("data", request.getParameter("data"));
    
    return modelAndView;
  }

}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <!--
  <bean name="/form.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
    <property name="viewName" value="form"></property>
  </bean>
  
  <bean name="/form_ok.do" class="org.springframework.web.servlet.mvc.ParameterizableViewController">
    <property name="viewName" value="form_ok"></property>
  </bean>
  -->
  
  <bean name="/form.do" class="model2.Form"></bean>
  <bean name="/form_ok.do" class="model2.Form_ok"></bean>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>
```

### Spring MVC

- Spring DI, AOP가 내장되어 있다

- 방식

  - Java Project &rarr; Maven Project + Spring Framework + 기타 설정

  - STS(Spring Tool Suite)

    - 기존 버전(X)

    - 새로운 버전(Spring Boot)

- 핵심 구성 요소

<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcqLXaP%2FbtqyYpzex8h%2FiKH7ZnGu62bWKsBBDe9puK%2Fimg.png" width="700">

- Spring MVC project 구성 순서

  1. Dynamic Web Project &rarr; Maven Project

  2. 필요한 라이브러리를 사용할 수 있도록 pom.xml 구성

  3. model2 패키지 및 클래스 구성
  
  4. view 페이지 생성

  4. 생성한 클래스에 맞게 context 파일 구성

  5. context 파일을 참조할 수 있도록 web.xml 구성

Spring MVC 우편번호 검색기

```xml
<!-- lombok 사용을 위한 라이브러리 추가 -->
<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
<dependency>
  <groupId>org.projectlombok</groupId>
  <artifactId>lombok</artifactId>
  <version>1.18.28</version>
  <scope>provided</scope>
</dependency>
```

```java
// ZipcodeTO.java
package model1;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ZipcodeTO {
  private String zipcode;/
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;

}

// ZipcodeDAO.java
package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ZipcodeDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public ZipcodeDAO() {
    String url = "jdbc:mariadb://localhost:3306/project";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      this.conn = DriverManager.getConnection(url, user, password);
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<ZipcodeTO> zipcodeList(ZipcodeTO input){
    List<ZipcodeTO> datas = new ArrayList();
    
    String sql = "select * from zipcode where dong like ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getDong() + "%");
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        ZipcodeTO data = new ZipcodeTO();
        
        data.setZipcode(rs.getString("zipcode"));
        data.setSido(rs.getString("sido"));
        data.setGugun(rs.getString("gugun"));
        data.setDong(rs.getString("dong"));
        data.setRi(rs.getString("ri"));
        data.setBunji(rs.getString("bunji"));
        
        datas.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return datas;
  }
}

```
```java
// ZipcodeAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ZipcodeAction implements Controller{

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    return new ModelAndView("zipcode");
  }

}

// ZipcodeOkAction.java
package model2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.ZipcodeDAO;
import model1.ZipcodeTO;

public class ZipcodeOkAction implements Controller{

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    String strDong = request.getParameter("dong");
    ZipcodeTO input = new ZipcodeTO();
    input.setDong(strDong);
    
    ZipcodeDAO dao = new ZipcodeDAO();
    List<ZipcodeTO> datas = dao.zipcodeList(input);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("zipcode_ok");
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }

}

```

```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean name="/zipcode.daum" class="model2.ZipcodeAction"></bean>
  <bean name="/zipcode_ok.daum" class="model2.ZipcodeOkAction"></bean>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  id="WebApp_ID" version="4.0">
  <display-name>web04</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.daum</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/servlet-context.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.daum</url-pattern>
  </servlet-mapping>
</web-app>
```



```jsp
<!-- zipcode.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
zipcode.jsp
<br><br>
<form action="zipcode_ok.daum" method="post">
  동이름 <input type="text" name="dong">

  <input type="submit" value="주소 검색">
</form>
</body>
</html>

<!-- zipcode_ok.jsp -->
<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  List<ZipcodeTO> datas = (List)request.getAttribute("datas");
  
  StringBuilder sbHtml = new StringBuilder();
  
  sbHtml.append("<table border='1' width='800'>");
  sbHtml.append("<tr>");	
  sbHtml.append("<th>우편번호</th>");
  sbHtml.append("<th>시도</th>");
  sbHtml.append("<th>구군</th>");
  sbHtml.append("<th>동</th>");
  sbHtml.append("<th>리</th>");
  sbHtml.append("<th>번지</th>");
  sbHtml.append("</tr>");	
  for(ZipcodeTO data : datas){
    sbHtml.append("<tr>");
    sbHtml.append("<td>" + data.getZipcode() + "</td>");
    sbHtml.append("<td>" + data.getSido() + "</td>");
    sbHtml.append("<td>" + data.getGugun() + "</td>");
    sbHtml.append("<td>" + data.getDong() + "</td>");
    sbHtml.append("<td>" + data.getRi() + "</td>");
    sbHtml.append("<td>" + data.getBunji() + "</td>");
    sbHtml.append("</tr>");
  }
  sbHtml.append("</table>");
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
zipcode_ok.jsp
<br><br>
<%= sbHtml %>
</body>
</html>
```

jstl 이용해서 zipcode_ok view 구성하기

```xml
<!-- jstl 사용을 위한 jstl 라이브러리와 taglib 디렉티브 -->
<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
  <version>1.2</version>
</dependency>
<!-- https://mvnrepository.com/artifact/taglibs/standard -->
<dependency>
  <groupId>taglibs</groupId>
  <artifactId>standard</artifactId>
  <version>1.1.2</version>
</dependency>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("utf-8");
  List<ZipcodeTO> datas = (List)request.getAttribute("datas");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
zipcode_ok.jsp
<br><br>
<table border='1' width='800'>
  <tr>
    <th>우편번호</th>
    <th>시도</th>
    <th>구군</th>
    <th>동</th>
    <th>리</th>
    <th>번지</th>
  </tr>
  <c:forEach var="data" items="${ datas }">
    <tr>
      <td>${ data.zipcode }</td>
      <td>${ data.sido }</td>
      <td>${ data.gugun }</td>
      <td>${ data.dong }</td>
      <td>${ data.ri }</td>
      <td>${ data.bunji }</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
```
<hr>

Spring MVC 기본 게시판 만들기
```java
// BoardTO.java
package model1;

public class BoardTO {
  private String seq;
  private String subject;
  private String writer;
  private String password;
  private String content;
  private String email;
  private String hit;
  private String wdate;
  private String wip;
  private String wgap;
  
  public String getSeq() {
    return seq;
  }
  public void setSeq(String seq) {
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getWriter() {
    return writer;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getHit() {
    return hit;
  }
  public void setHit(String hit) {
    this.hit = hit;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public String getWip() {
    return wip;
  }
  public void setWip(String wip) {
    this.wip = wip;
  }
  public String getWgap() {
    return wgap;
  }
  public void setWgap(String wgap) {
    this.wgap = wgap;
  }
  
}

// BoardDAO.java
package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public BoardDAO() {
    
    String url = "jdbc:mariadb://localhost:3306/board";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      this.conn = DriverManager.getConnection(url, user, password);
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<BoardTO> boardList(){
    List<BoardTO> lists = new ArrayList<>();
    
    String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";
  
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        BoardTO data = new BoardTO();
        
        data.setSeq(rs.getString("seq"));
        data.setSubject(rs.getString("subject"));
        data.setWriter(rs.getString("writer"));
        data.setWdate(rs.getString("wdate"));
        data.setHit(rs.getString("hit"));
        data.setWgap(rs.getString("wgap"));
        
        lists.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
      
    return lists;
  }
  
  public int boardWrite(BoardTO to) {
    int flag = 1;
    
    String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, now(), ?)";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSubject());
      pstmt.setString(2, to.getWriter());
      pstmt.setString(3, to.getPassword());
      pstmt.setString(4, to.getContent());
      pstmt.setString(5, to.getEmail());
      pstmt.setString(6, to.getWip());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
  
  public BoardTO boardView(BoardTO to) {
    
    try {
      String sql = "update board1 set hit = hit + 1 where seq = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      pstmt.executeUpdate();
      
      sql = "select * from board1 where seq = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setSubject(rs.getString("subject"));
        to.setWriter(rs.getString("writer"));
        to.setEmail(rs.getString("email"));
        to.setWip(rs.getString("wip"));
        to.setWdate(rs.getString("wdate"));
        to.setHit(rs.getString("hit"));
        to.setContent(rs.getString("content"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return to;
  }
  
  public BoardTO boardDelete(BoardTO to) {
    
    String sql = "select * from board1 where seq = ?";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setSubject(rs.getString("subject"));
        to.setWriter(rs.getString("writer"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return to;
  }
  
  public int boardDeleteOk(BoardTO to) {
    int flag = 2;
    
    String sql = "delete from board1 where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      pstmt.setString(2, to.getPassword());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }else {
        flag = 1;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
  
  public BoardTO boardModify(BoardTO to) {
    
    String sql = "select * from board1 where seq = ?";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setWriter(rs.getString("writer"));
        to.setSubject(rs.getString("subject"));
        to.setContent(rs.getString("content"));
        to.setEmail(rs.getString("email"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }finally {
      if(rs != null) try {rs.close();}catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
      if(conn != null) try {conn.close();}catch(SQLException e) {}
    }
    
    return to;
  }
  
  public int boardModifyOk(BoardTO to) {
    int flag = 2;
    
    String sql = "update board1 set subject = ?, content = ?, email = ? where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSubject());
      pstmt.setString(2, to.getContent());
      pstmt.setString(3, to.getEmail());
      pstmt.setString(4, to.getSeq());
      pstmt.setString(5, to.getPassword());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }else {
        flag = 1;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
}

```
```java
// BoardListAction.java
package model2;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardListAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_list1");
    
    BoardDAO dao = new BoardDAO();
    List<BoardTO> datas = dao.boardList();
    
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }

}

// BoardWriteAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class BoardWriteAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1");
    
    return modelAndView;
  }

}

// BoardWriteOkAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardWriteOkAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String password = request.getParameter("password");
    String content = "";
    if(request.getParameter("content") != null && !request.getParameter("content").equals("")) {
      content = request.getParameter("content").replaceAll("\n", "<br>");
    }
    String email = "";
    if(request.getParameter("mail1") != null && !request.getParameter("mail1").equals("") && request.getParameter("mail1") != null && !request.getParameter("mail1").equals("")) {
      email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
    }
    String wip = request.getRemoteAddr();
    
    BoardTO to = new BoardTO();
    to.setWriter(writer);
    to.setSubject(subject);
    to.setPassword(password);
    to.setContent(content);
    to.setEmail(email);
    to.setWip(wip);
    
    BoardDAO dao = new BoardDAO();
    int flag = dao.boardWrite(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }

}

// BoardViewAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardViewAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    BoardTO data = dao.boardView(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_view1");
    modelAndView.addObject("to", to);
    
    return modelAndView;
  }

}

// BoardDeleteAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardDeleteAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    BoardTO data = dao.boardDelete(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1");
    modelAndView.addObject("data", data);
    
    return modelAndView;
  }

}

// BoardDeleteOkAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardDeleteOkAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    to.setPassword(request.getParameter("password"));
    
    BoardDAO dao = new BoardDAO();
    int flag = dao.boardDeleteOk(to); 
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }

}

// BoardModifyAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardModifyAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    BoardTO data = dao.boardModify(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_modify1");
    modelAndView.addObject("data", data);
    
    return modelAndView;
  }

}

// BoardModifyOkAction.java
package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardModifyOkAction implements Controller {

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    to.setSubject(request.getParameter("subject"));
    to.setPassword(request.getParameter("password"));
    to.setContent(request.getParameter("content"));
    to.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));

    BoardDAO dao = new BoardDAO();
    int flag = dao.boardModifyOk(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_modify1_ok");
    modelAndView.addObject("flag", flag);
    modelAndView.addObject("seq", request.getParameter("seq"));
    
    return modelAndView;
  }

}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean name="/list.do" class="model2.BoardListAction"></bean>
  <bean name="/write.do" class="model2.BoardWriteAction"></bean>
  <bean name="/write_ok.do" class="model2.BoardWriteOkAction"></bean>
  <bean name="/view.do" class="model2.BoardViewAction"></bean>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

<!-- servlet-context2.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean name="/delete.do" class="model2.BoardDeleteAction"></bean>
  <bean name="/delete_ok.do" class="model2.BoardDeleteOkAction"></bean>
  <bean name="/modify.do" class="model2.BoardModifyAction"></bean>
  <bean name="/modify_ok.do" class="model2.BoardModifyOkAction"></bean>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  id="WebApp_ID" version="4.0">
  <display-name>SpringBoard</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>
        /WEB-INF/servlet-context.xml
        /WEB-INF/servlet-context2.xml
      </param-value>
      <!-- 참조할 context 파일을 여러개로 나눠 쓸 수도 있다 -->
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```
```jsp
<!-- board_list1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardDAO dao = new BoardDAO();
  
  List<BoardTO> lists = dao.boardList();
  StringBuilder sbHtml = new StringBuilder();
  for(BoardTO data : lists){
    sbHtml.append("<tr>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("<td>" + data.getSeq() + "</td>");
    if(data.getWgap().equals("0")){
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'></td>");
    }else{
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;</td>");
    }
    sbHtml.append("<td>" + data.getWriter() + "</td>");
    sbHtml.append("<td>" + data.getWdate() + "</td>");
    sbHtml.append("<td>" + data.getHit() + "</td>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("</tr>");
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <div class="board_top">
      <div class="bold">총 <span class="txt_orange">1</span>건</div>
    </div>

    <!--게시판-->
    <div class="board">
      <table>
      <tr>
        <th width="3%">&nbsp;</th>
        <th width="5%">번호</th>
        <th>제목</th>
        <th width="10%">글쓴이</th>
        <th width="17%">등록일</th>
        <th width="5%">조회</th>
        <th width="3%">&nbsp;</th>
      </tr>
      <%= sbHtml %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("wbtn").onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 이용에 동의해주세요');
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert('글쓴이를 입력해주세요');
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.wfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="write_ok.do" method="post" name="wfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
        
        <table>
        <tr>
          <br />
          <td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
            <div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
            <div style="padding-left:10px;">
              <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
              </div>
            </div>
            <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
              <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
        </div>
        <div class="align_right">
          <input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_write1_ok.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='list.do'");
  }else{
    out.println("alert('글쓰기 실패');");
    out.println("history.back()");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_view1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO to = new BoardTO();
  to = (BoardTO)request.getAttribute("to");
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <!--게시판-->
    <div class="board_view">
      <table>
      <tr>
        <th width="10%">제목</th>
        <td width="60%"><%= to.getSubject() %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= to.getWdate() %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= to.getWriter() %>(<%= to.getEmail() %>)(<%= to.getWip() %>)</td>
        <th>조회</th>
        <td><%= to.getHit() %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= to.getContent() %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>


<!-- board_delete1.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO data = new BoardTO();
  data = (BoardTO)request.getAttribute("data");
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.dfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="delete_ok.do" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1_ok.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 삭제 성공');");
    out.println("location.href='list.do';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀립니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 삭제 실패');");
    out.println("hirtory.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_modify1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO data = new BoardTO();
  
  data = (BoardTO)request.getAttribute("data");
  String mail1 = "";
  String mail2 = "";
  if(data.getEmail() != null && !data.getEmail().equals("")){
    String[] mailArr = data.getEmail().split("@");
    mail1 = mailArr[0];
    mail2 = mailArr[1];
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="modify_ok.do" method="post" name="mfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= data.getContent() %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_modify1_ok.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='view.do?seq=" + request.getAttribute("seq") + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀렸습니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정 실패');");
    out.println("history.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

#### 애노테이션으로 Spring MVC 구현하기
```java
// ConfigController.java
package config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConfigController {
  
  @RequestMapping("/list1.do")
  public String handleRequest1() {
    System.out.println("handleRequest1() 호출");
    return "listview1";
  }
  
  @RequestMapping("/list2.do")
  public String handleRequest2() {
    System.out.println("handleRequest2() 호출");
    return "listview2";
  }
  
}

// ConfigController2.java
package config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConfigController2 {

  @RequestMapping("/list3.do")
  public ModelAndView handleRequest3() {
    System.out.println("handleRequest3() 호출");
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("listview3");
    
    return modelAndView;
  }
  
  @RequestMapping("/list4.do")
  public ModelAndView handleRequest4() {
    System.out.println("handleRequest4() 호출");
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("listview4");
    
    return modelAndView;
  }
}


```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean class="cofig.ConfigController"></bean>
  <bean class="cofig.ConfigController2"></bean>
  <!-- 여러 컨트롤러 참조가 가능하다 -->
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

```

<hr>

```xml
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation
  ="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <!--	
  <bean class="config.ConfigController"></bean>
  <bean class="config.ConfigController2"></bean>
  -->
  
  <context:component-scan base-package="config"></context:component-scan>
  <!-- 자동으로 config에 필요한 클래스를 찾아준다 -->
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

```

<hr>

```java
package config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @RequestMapping("/board")
public class ConfigController3 {

  @RequestMapping("/board/list1.do")
  // 실제로 존재하지 않은 가상 경로 설정도 가능하다
  // @RequestMapping("/list1.do")
  // RequestMapping 애노테이션으로 경로를 미리 설정해준 경우 위와 같이 경로를 다 쓰지 않는다
  // 메서드마다 매핑되는 파일의 경로가 겹칠 때 사용하면 유용하다
  public String handleRequest1() {
    return "listview1";
  }
  
  @RequestMapping("/board/list2.do")
  // @RequestMapping("/list2.do")
  public String handleRequest2() {
    return "listview2";
  }
}

```
##### 데이터

- HttpServletResponse, HttpServletResponse를 이용해 데이터를 주고 받을 수 있다

```jsp
<!-- form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
form.jsp
<br><br>
<form action="form_ok.do" method="get">
  데이터 <input type="text" name="data">
  <input type="submit" value="전송">
</form>

<form action="form_ok.do" method="post">
  데이터1 <input type="text" name="data1"><br>
  데이터2 <input type="text" name="data2">
  <input type="submit" value="전송">
</form>
</body>
</html>

```

```java
package config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConfigController4 {

  @RequestMapping("/form.do")
  public ModelAndView handleRequest1() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form");
    return modelAndView;
  }
  
  /*
  @GetMapping("/form_ok.do")
  // @RequestMapping(value= "/form_ok.do", method = RequestMethod.GET)
  public ModelAndView form_get_ok() {
    System.out.println("form_get_ok() 호출");
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    return modelAndView;
  }
  
  @PostMapping("/form_ok.do")
  // @RequestMapping(value= "/form_ok.do", method = RequestMethod.POST)
  public ModelAndView form_post_ok() {
    System.out.println("form_post_ok() 호출");
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    return modelAndView;
  }
  */
  // 위와 같이 나눠 쓸 수 있지만, 동일한 방식으로 처리하는 경우가 많기 때문에 보통은 한번에 처리한다
  
  /*
  @RequestMapping(value= "/form_ok.do")
  public ModelAndView form_ok(HttpServletRequest request, HttpServletResponse response) {
    System.out.println("form_ok() 호출 : " + request.getParameter("data"));
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    return modelAndView;
  }
  */
  // 기본적으로 HttpServletResponse, HttpServletResponse를 사용하지만, 사용하지 않아도 데이터를 주고 받을 수 있다
  /*
  @RequestMapping(value= "/form_ok.do")
  public ModelAndView form_ok(String data1, String data2) {
    System.out.println("form_ok() 호출 : " + data1);
    System.out.println("form_ok() 호출 : " + data2);
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    return modelAndView;
  }
  */
  
  /*
  @RequestMapping(value= "/form_ok.do")
  public ModelAndView form_ok(@RequestParam("data1") String pdata1) {
  // 애노테이션을 이용해 특정 데이터를 지정해서, 메서드 내에서 사용할 이름을 자유롭게 설정할 수 있다
    System.out.println("form_ok() 호출 : " + pdata1);
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    return modelAndView;
  }
  */
  
  /*
  @RequestMapping(value= "/form_ok.do")
  public String form_ok(HttpServletRequest request) {
    
    request.setAttribute("data1", request.getParameter("data1"));
    return "form_ok";
  }
  */
  
  /*
  @RequestMapping(value= "/form_ok.do")
  public ModelAndView form_ok(HttpServletRequest request) {
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    modelAndView.addObject("data2", request.getParameter("data2"));
    return modelAndView;
  }
  */
  
  @RequestMapping(value= "/form_ok.do")
  public String form_ok(HttpServletRequest request, Model model) {

    model.addAttribute("data1", request.getParameter("data1"));
    
    return "form_ok";
  }
  
}

```
<hr>

annotation을 이용해 Spring MVC 기본 게시판 구현하기

<small> !! model2 패키지에 여러 클래스가 하나의 컨트롤러 클래스에서 각각의 메서드로 구현된다</small> 

```java
// BoardTO.java
package model1;

public class BoardTO {
  private String seq;
  private String subject;
  private String writer;
  private String password;
  private String content;
  private String email;
  private String hit;
  private String wdate;
  private String wip;
  private String wgap;
  
  public String getSeq() {
    return seq;
  }
  public void setSeq(String seq) {
    this.seq = seq;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getWriter() {
    return writer;
  }
  public void setWriter(String writer) {
    this.writer = writer;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getHit() {
    return hit;
  }
  public void setHit(String hit) {
    this.hit = hit;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  public String getWip() {
    return wip;
  }
  public void setWip(String wip) {
    this.wip = wip;
  }
  public String getWgap() {
    return wgap;
  }
  public void setWgap(String wgap) {
    this.wgap = wgap;
  }
  
}

// BoardDAO.java
package model1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public BoardDAO() {
    
    String url = "jdbc:mariadb://localhost:3306/board";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      this.conn = DriverManager.getConnection(url, user, password);
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<BoardTO> boardList(){
    List<BoardTO> lists = new ArrayList<>();
    
    String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";
  
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        BoardTO data = new BoardTO();
        
        data.setSeq(rs.getString("seq"));
        data.setSubject(rs.getString("subject"));
        data.setWriter(rs.getString("writer"));
        data.setWdate(rs.getString("wdate"));
        data.setHit(rs.getString("hit"));
        data.setWgap(rs.getString("wgap"));
        
        lists.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
      
    return lists;
  }
  
  public int boardWrite(BoardTO to) {
    int flag = 1;
    
    String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, now(), ?)";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSubject());
      pstmt.setString(2, to.getWriter());
      pstmt.setString(3, to.getPassword());
      pstmt.setString(4, to.getContent());
      pstmt.setString(5, to.getEmail());
      pstmt.setString(6, to.getWip());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
  
  public BoardTO boardView(BoardTO to) {
    
    try {
      String sql = "update board1 set hit = hit + 1 where seq = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      pstmt.executeUpdate();
      
      sql = "select * from board1 where seq = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setSubject(rs.getString("subject"));
        to.setWriter(rs.getString("writer"));
        to.setEmail(rs.getString("email"));
        to.setWip(rs.getString("wip"));
        to.setWdate(rs.getString("wdate"));
        to.setHit(rs.getString("hit"));
        to.setContent(rs.getString("content"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return to;
  }
  
  public BoardTO boardDelete(BoardTO to) {
    
    String sql = "select * from board1 where seq = ?";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setSubject(rs.getString("subject"));
        to.setWriter(rs.getString("writer"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return to;
  }
  
  public int boardDeleteOk(BoardTO to) {
    int flag = 2;
    
    String sql = "delete from board1 where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      pstmt.setString(2, to.getPassword());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }else {
        flag = 1;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
  
  public BoardTO boardModify(BoardTO to) {
    
    String sql = "select * from board1 where seq = ?";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSeq());
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        to.setWriter(rs.getString("writer"));
        to.setSubject(rs.getString("subject"));
        to.setContent(rs.getString("content"));
        to.setEmail(rs.getString("email"));
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }finally {
      if(rs != null) try {rs.close();}catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();}catch(SQLException e) {}
      if(conn != null) try {conn.close();}catch(SQLException e) {}
    }
    
    return to;
  }
  
  public int boardModifyOk(BoardTO to) {
    int flag = 2;
    
    String sql = "update board1 set subject = ?, content = ?, email = ? where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, to.getSubject());
      pstmt.setString(2, to.getContent());
      pstmt.setString(3, to.getEmail());
      pstmt.setString(4, to.getSeq());
      pstmt.setString(5, to.getPassword());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }else {
        flag = 1;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }finally {
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return flag;
  }
}

```

```java
// BoardController.java
package config;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.checkerframework.checker.units.qual.radians;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model1.BoardDAO;
import model1.BoardTO;

@Controller
public class BoardController {

  @RequestMapping(value = "/list.do")
  public ModelAndView listAction() {
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_list1");
    
    BoardDAO dao = new BoardDAO();
    List<BoardTO> datas = dao.boardList();
    
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/write.do")
  public String writeAction() {
    
    return "board_write1";
  }
  
  @RequestMapping(value="/write_ok.do")
  public ModelAndView writeOkAction(HttpServletRequest request) {
    
    String writer = request.getParameter("writer");
    String subject = request.getParameter("subject");
    String password = request.getParameter("password");
    String content = "";
    if(request.getParameter("content") != null && !request.getParameter("content").equals("")) {
      content = request.getParameter("content").replaceAll("\n", "<br>");
    }
    String email = "";
    if(request.getParameter("mail1") != null && !request.getParameter("mail1").equals("") && request.getParameter("mail1") != null && !request.getParameter("mail1").equals("")) {
      email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
    }
    String wip = request.getRemoteAddr();
    
    BoardTO to = new BoardTO();
    to.setWriter(writer);
    to.setSubject(subject);
    to.setPassword(password);
    to.setContent(content);
    to.setEmail(email);
    to.setWip(wip);
    
    BoardDAO dao = new BoardDAO();
    int flag = dao.boardWrite(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/view.do")
  public ModelAndView viewAction(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    to = dao.boardView(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_view1");
    modelAndView.addObject("to", to);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/delete.do")
  public ModelAndView deleteAction(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    BoardTO data = dao.boardDelete(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1");
    modelAndView.addObject("data", data);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/delete_ok.do")
  public ModelAndView deleteOkAction(HttpServletRequest request) {

    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    to.setPassword(request.getParameter("password"));
    
    BoardDAO dao = new BoardDAO();
    int flag = dao.boardDeleteOk(to); 
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/modify.do")
  public ModelAndView modifyAction(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    BoardDAO dao = new BoardDAO();
    BoardTO data = dao.boardModify(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_modify1");
    modelAndView.addObject("data", data);
    
    return modelAndView;
  }
  
  @RequestMapping(value="/modify_ok.do")
  public ModelAndView modifyOkAction(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    to.setSubject(request.getParameter("subject"));
    to.setPassword(request.getParameter("password"));
    to.setContent(request.getParameter("content"));
    to.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));

    BoardDAO dao = new BoardDAO();
    int flag = dao.boardModifyOk(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_modify1_ok");
    modelAndView.addObject("flag", flag);
    modelAndView.addObject("seq", request.getParameter("seq"));
    
    return modelAndView;
  }
  
}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <context:component-scan base-package="config"></context:component-scan>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  id="WebApp_ID" version="4.0">
  <display-name>board02</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>
      /WEB-INF/servlet-context.xml
      </param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```

```jsp
<!-- board_list1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardDAO dao = new BoardDAO();
  
  List<BoardTO> lists = dao.boardList();
  StringBuilder sbHtml = new StringBuilder();
  for(BoardTO data : lists){
    sbHtml.append("<tr>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("<td>" + data.getSeq() + "</td>");
    if(data.getWgap().equals("0")){
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'></td>");
    }else{
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;</td>");
    }
    sbHtml.append("<td>" + data.getWriter() + "</td>");
    sbHtml.append("<td>" + data.getWdate() + "</td>");
    sbHtml.append("<td>" + data.getHit() + "</td>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("</tr>");
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <div class="board_top">
      <div class="bold">총 <span class="txt_orange">1</span>건</div>
    </div>

    <!--게시판-->
    <div class="board">
      <table>
      <tr>
        <th width="3%">&nbsp;</th>
        <th width="5%">번호</th>
        <th>제목</th>
        <th width="10%">글쓴이</th>
        <th width="17%">등록일</th>
        <th width="5%">조회</th>
        <th width="3%">&nbsp;</th>
      </tr>
      <%= sbHtml %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("wbtn").onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 이용에 동의해주세요');
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert('글쓴이를 입력해주세요');
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.wfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="write_ok.do" method="post" name="wfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
        
        <table>
        <tr>
          <br />
          <td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
            <div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
            <div style="padding-left:10px;">
              <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
              </div>
            </div>
            <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
              <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
        </div>
        <div class="align_right">
          <input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_write1_ok.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='list.do'");
  }else{
    out.println("alert('글쓰기 실패');");
    out.println("history.back()");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_view1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO to = new BoardTO();
  to = (BoardTO)request.getAttribute("to");
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <!--게시판-->
    <div class="board_view">
      <table>
      <tr>
        <th width="10%">제목</th>
        <td width="60%"><%= to.getSubject() %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= to.getWdate() %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= to.getWriter() %>(<%= to.getEmail() %>)(<%= to.getWip() %>)</td>
        <th>조회</th>
        <td><%= to.getHit() %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= to.getContent() %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>


<!-- board_delete1.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO data = new BoardTO();
  data = (BoardTO)request.getAttribute("data");
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.dfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="delete_ok.do" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1_ok.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 삭제 성공');");
    out.println("location.href='list.do';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀립니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 삭제 실패');");
    out.println("hirtory.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_modify1.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO data = new BoardTO();
  
  data = (BoardTO)request.getAttribute("data");
  String mail1 = "";
  String mail2 = "";
  if(data.getEmail() != null && !data.getEmail().equals("")){
    String[] mailArr = data.getEmail().split("@");
    mail1 = mailArr[0];
    mail2 = mailArr[1];
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="modify_ok.do" method="post" name="mfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= data.getContent() %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_modify1_ok.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='view.do?seq=" + request.getAttribute("seq") + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀렸습니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정 실패');");
    out.println("history.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

###### 공유 데이터
- 개발자가 임의로 생성한 공유데이터 클래스를 이용해서 서로 다른 페이지끼리 데이터를 공유할 수 있다

```java
// ShareClass.java
package share;

public class ShareClass {
  private String shareData;
  
  public ShareClass() {
    System.out.println("ShareClass() 호출");
  }

  public String getShareData() {
    System.out.println("getShareData1() 호출");
    return shareData;
  }

  public void setShareData(String shareData1) {
    System.out.println("setShareData1() 호출");
    this.shareData = shareData1;
  }
  
}


```
```java
// ListAction1.java
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import share.ShareClass;

public class ListAction1 implements Controller {
  private ShareClass shareClass;
  
  public void setShareClass(ShareClass shareClass) {
    this.shareClass = shareClass;
  }

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    System.out.println("ListAction()1 호출");
    
    System.out.println("shareClass : " + shareClass);
    System.out.println("shareData1 : " + shareClass.getShareData());
    
    shareClass.setShareData("난 ListAction1에서 변경된 데이터");
    
    return new ModelAndView("listview1");
  }

}

// ListAction2.java
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import share.ShareClass;

public class ListAction2 implements Controller {
  private ShareClass shareClass;
  
  public void setShareClass(ShareClass shareClass) {
    this.shareClass = shareClass;
  }

  @Override
  public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
    System.out.println("ListAction()2 호출");
    
    System.out.println("shareClass : " + shareClass);
    System.out.println("shareData : " + shareClass.getShareData());
    
    shareClass.setShareData("난 ListAction2에서 변경된 데이터");
    
    return new ModelAndView("listview2");
  }

}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean name="/list1.do" class="controller.ListAction1">
    <property name="shareClass" ref="shareClass"></property>
  </bean>
  <bean name="/list2.do" class="controller.ListAction2">
    <property name="shareClass" ref="shareClass"></property>
  </bean>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

<!-- root-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean id="shareClass" class="share.ShareClass">
    <property name="shareData" value="난 공유자료"></property>
  </bean>
  
</beans>

<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  id="WebApp_ID" version="4.0">
  <display-name>web06</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  
  <!-- share data -->
  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/root-context.xml</param-value>
  </context-param>
  
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  
  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/servlet-context.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```

```jsp
<!-- listview1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
listview1.jsp
</body>
</html>

<!-- listview2.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
listview2.jsp
</body>
</html>
```

<hr>
@Autowired 애노테이션을 이용할 수도 있다

```java
// ConfigController.java
package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import share.ShareClass;

@Controller
public class ConfigController {
  
  @Autowired
  private ShareClass shareClass;
  
  @RequestMapping("/list1.do")
  public String listAction1() {
    System.out.println("listAction1() shareClass : " + shareClass);
    System.out.println("listAction1() shareClass : " + shareClass.getShareData());
    
    return "listview1"; 
  }
  
  @RequestMapping("/list2.do")
  public String listAction2() {
    System.out.println("listAction2() shareClass : " + shareClass);
    System.out.println("listAction2() shareClass : " + shareClass.getShareData());
    
    return "listview2"; 
  }
}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <context:component-scan base-package="config"></context:component-scan>
  <!-- <bean class="config.ConfigController"></bean> -->
  <!-- 위와 같이 bean을 개발자가 직접 지정해주는 방식은 @Autowired를 사용하면 스프링 컨테이너가 값을 제대로 지정해주지 못해서 null 오류가 생길 수 있다 -->
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

```


#### Spring JDBC
- Spring JDBC 라이브러리를 이용하면 context 파일 없이 바로 jdbc 사용이 가능하다

- 라이브러리
```xml
<!-- Spring jdbc -->
<dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-jdbc</artifactId>
  <version>${spring-framework.version}</version>
</dependency>
```

<hr>

```xml
<!-- root-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.mariadb.jdbc.Driver"></property>
    <property name="url" value="jdbc:mariadb://localhost:3306/sample"></property>
    <property name="username" value="root"></property>
    <property name="password" value="123456"></property>
  </bean>
  
</beans>

```
```java
// ExampleDAO.java
package model1;


import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
// @Autowired 애노테이션을 사용하기 위해선 스프링 컨테이너에 클래스 객체가 등록되어야 한다
public class ExampleDAO {

  @Autowired
  private DataSource dataSource;

  public ExampleDAO() {
    System.out.println("ExampleDAO() 호출 : " + dataSource);
  }
}

```
```java
// ConfigController.java
package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model1.ExampleDAO;

@Controller
public class ConfigController {
  
  @Autowired
  private ExampleDAO dao;
  
  @RequestMapping("/write1.do")
  public String write1() {
    System.out.println("write1() 호출 : " + dao);
    
    return "writeview1";
  }
}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <context:component-scan base-package="config"></context:component-scan>
  <context:component-scan base-package="model1"></context:component-scan>
  <!-- 직접 주입 방식을 사용할 시에 @Autowired로 매핑하면 null 오류가 생긴다 -->
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>
```
```xml
<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>web09</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  
  <!-- root-context 사용을 위해 지정 -->
  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/root-context.xml</param-value>
  </context-param>
  
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>

  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/servlet-context.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```


##### JDBC Template

- ORM (Object Relational Mapping)

- 프로그램이 바로 jdbc에 접근한다
```xml
<!-- root-context -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="org.mariadb.jdbc.Driver"></property>
    <property name="url" value="jdbc:mariadb://localhost:3306/project"></property>
    <property name="username" value="root"></property>
    <property name="password" value="123456"></property>
  </bean>
  
  <bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
  <!-- jdbc템플릿을 사용하기 위해 dataSource 빈을 생성자의 파라미터로 사용한다 -->
    <constructor-arg ref="dataSource"></constructor-arg>
  </bean>
  
</beans>

```

```java
// ExampleDAO.java
package model1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ExampleDAO {

  @Autowired
  private JdbcTemplate jdbcTemplate;

  public String selectNow() {
    
    String result = jdbcTemplate.queryForObject("select now() as now", String.class);
    
    return result;
  }
}

// DeptTO.java
package model1;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeptTO {
  private String deptno;
  private String dname;
  private String loc;
  
}

// EmpTO.java
package model1;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmpTO {
  private String empno;
  private String ename;
  private String job;
  private String mgr;
  private String hiredate;
  private String sal;
  private String comm;
  private String deptno;
}

```
```java
// ConfigController.java
package config;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model1.DeptTO;
import model1.EmpTO;
import model1.ExampleDAO;

@Controller
public class ConfigController {
  
  @Autowired
  private ExampleDAO dao;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @RequestMapping("/write1.do")
  public String write1() {
    
    System.out.println("결과 : " + dao.selectNow());
    
    return "writeview1";
  }
  
  @RequestMapping("/write2.do")
  public String write2() {
    
    DeptTO to = jdbcTemplate.queryForObject("select * from dept where deptno = 10", new BeanPropertyRowMapper<DeptTO>(DeptTO.class));
    
    System.out.println(to.getDeptno());
    System.out.println(to.getDname());
    System.out.println(to.getLoc());
    
    return "writeview1";
  }
  
  @RequestMapping("/write3.do")
  public String write3() {
    
    DeptTO to = jdbcTemplate.queryForObject("select * from dept where deptno = ?", new BeanPropertyRowMapper<DeptTO>(DeptTO.class), "20");
    // 가변인자이기 때문에 더 많은 값을 인자로 받을수 있다
    // API 확인하는 습관을 가지자
    
    System.out.println(to.getDeptno());
    System.out.println(to.getDname());
    System.out.println(to.getLoc());
    
    return "writeview1";
  }
  
  @RequestMapping("/write4.do")
  public String write4() {
    
    DeptTO to = jdbcTemplate.queryForObject("select * from dept where deptno = ?", new Object[] {"30"},new BeanPropertyRowMapper<DeptTO>(DeptTO.class));
    
    System.out.println(to.getDeptno());
    System.out.println(to.getDname());
    System.out.println(to.getLoc());
    
    return "writeview1";
  }
  
  @RequestMapping("/write5.do")
  public String write5() {
    
    DeptTO to = jdbcTemplate.queryForObject("select * from dept where deptno = ?", new Object[] {"30"},new RowMapper<DeptTO>() {
      @Override
      public DeptTO mapRow(ResultSet rs, int rowNum) throws SQLException {
        DeptTO to = new DeptTO();
        
        to.setDeptno(rs.getString(rs.getString("deptno")));
        to.setDname(rs.getString(rs.getString("dname")));
        to.setLoc(rs.getString(rs.getString("loc")));
        
        return to;
      }
      // 개발자가 필요한 데이터만 사용할 수 있다
    });
    
    System.out.println(to.getDeptno());
    System.out.println(to.getDname());
    System.out.println(to.getLoc());
    
    return "writeview1";
  }
  
  @RequestMapping("/write6.do")
  public String write6() {
    
    List<DeptTO> datas = jdbcTemplate.query("select * from dept", new BeanPropertyRowMapper<DeptTO>(DeptTO.class));
    for(DeptTO data : datas) {
      System.out.println(data.getDeptno());
      System.out.println(data.getDname());
      System.out.println(data.getLoc());
    }
    return "writeview1";
  }
  
  @RequestMapping("/write7.do")
  public String write7() {
    
    List<EmpTO> datas = jdbcTemplate.query("select * from emp where deptno = ? and job = ?", new BeanPropertyRowMapper<EmpTO>(EmpTO.class), "30", "salesman");
    for(EmpTO data : datas) {
      System.out.println(data.getDeptno());
      System.out.println(data.getEname());
    }
    return "writeview1";
  }
  
  @RequestMapping("/write8.do")
  public String write8() {
    
    List<EmpTO> datas = jdbcTemplate.query("select * from emp where ename like ?", new BeanPropertyRowMapper<EmpTO>(EmpTO.class), "S%");
    for(EmpTO data : datas) {
      System.out.println(data.getDeptno());
      System.out.println(data.getEname());
    }
    return "writeview1";
  }
  
  @RequestMapping("/write9.do")
  public String write9() {
    
    int result = jdbcTemplate.update("insert into dept2 values(11, '연구부', '서울')");
    
    System.out.println("결과 : "  + result);
    return "writeview1";
  }
  
  @RequestMapping("/write10.do")
  public String write10() {
    
    int result = jdbcTemplate.update("insert into dept2 values(?, ?, ?)", "12", "홍보부", "제주");
    
    System.out.println("결과 : "  + result);
    return "writeview1";
  }
}

```
```xml

<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <context:component-scan base-package="config"></context:component-scan>
  <context:component-scan base-package="model1"></context:component-scan>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

```
<hr>
jdbc 템플릿 우편번호 검색기 

```java
// ZipcodeTO.java
package model1;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ZipcodeTO {

  private String zipcode;
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;
}

```
```java
// ZipcodeController.java
package config;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model1.ZipcodeTO;

@Controller
public class ZipcodeController {
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @RequestMapping("/zipcode.do")
  public String zipcode() {
    
    return "zipcode";
  }
  
  @RequestMapping("zipcode_ok.do")
  public ModelAndView zipcodeOk(HttpServletRequest request) {
    
    String dong = request.getParameter("dong");
    
    List<ZipcodeTO> datas = jdbcTemplate.query("select * from zipcode where dong like ?", new BeanPropertyRowMapper<ZipcodeTO>(ZipcodeTO.class), dong + "%");
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("zipcode_ok");
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }
}

```
```xml
<!-- root-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">

  <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
     <property name="driverClassName" value="org.mariadb.jdbc.Driver"></property>
     <property name="url" value="jdbc:mariadb://localhost:3306/project"></property>
     <property name="username" value="root"></property>
     <property name="password" value="123456"></property>
  </bean>
  
  <bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
    <constructor-arg ref="dataSource"></constructor-arg>
  </bean>
</beans>

<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
  
  <context:component-scan base-package="config"></context:component-scan>
  
  <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>
</beans>

```
```xml
<!-- web.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://xmlns.jcp.org/xml/ns/javaee"
  xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
  id="WebApp_ID" version="4.0">
  <display-name>jdbc02</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.jsp</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>default.html</welcome-file>
    <welcome-file>default.jsp</welcome-file>
    <welcome-file>default.htm</welcome-file>
  </welcome-file-list>
  
  <!-- root-context 사용 설정 -->
  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/root-context.xml</param-value>
  </context-param>

  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>

  <!-- encoding -->
  <filter>
    <filter-name>encodingFilter</filter-name>
    <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
    <init-param>
      <param-name>encoding</param-name>
      <param-value>utf-8</param-value>
    </init-param>
  </filter>
  <filter-mapping>
    <filter-name>encodingFilter</filter-name>
    <url-pattern>*.do</url-pattern>
  </filter-mapping>
  <!-- dispatcher -->
  <servlet>
    <servlet-name>appServlet</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
    <init-param>
      <param-name>contextConfigLocation</param-name>
      <param-value>/WEB-INF/servlet-context.xml</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
  </servlet>
  <servlet-mapping>
    <servlet-name>appServlet</servlet-name>
    <url-pattern>*.do</url-pattern>
  </servlet-mapping>
</web-app>
```

## 파일 업로드


### Apache Common Fileupload

<small> https://m.blog.naver.com/javaking75/140203390797 참조</small>

- 필요한 라이브러리
```xml
<!-- https://mvnrepository.com/artifact/commons-fileupload/commons-fileupload -->
<dependency>
  <groupId>commons-fileupload</groupId>
  <artifactId>commons-fileupload</artifactId>
  <version>1.4</version>
</dependency>
<!-- https://mvnrepository.com/artifact/commons-io/commons-io -->
<dependency>
  <groupId>commons-io</groupId>
  <artifactId>commons-io</artifactId>
  <version>2.8.0</version>
</dependency>
```

```java
// ConfigController.java
package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class ConfigController {

  @RequestMapping("/form.do")
  public String formAction() {

    return "form";
  }

  @RequestMapping("/form_ok.do")
  public String formOkAction(@RequestParam("upload") MultipartFile multipartFile) {
    
    // Apache Common Fileupload는 DefaultFileRenamePolicy를 개발자가 따로 만들어줘야한다
    
    String uploadPath = "C:/Java/Spring_workspace/upload01/src/main/webapp/upload";
    
    System.out.println("파일명 : " + multipartFile.getName());
    System.out.println("파일명 : " + multipartFile.getOriginalFilename());
    System.out.println("크기 : " + multipartFile.getSize());
    
    FileOutputStream fos = null;
    try {
      fos = new FileOutputStream(uploadPath + "/" + multipartFile.getOriginalFilename());
      fos.write(multipartFile.getBytes());
    } catch (FileNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (IOException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(fos != null) try {fos.close();} catch(IOException e) {}
    }
    
    return "form_ok";
  }
  
  @RequestMapping("/form_ok2.do")
  public String formOkAction2(MultipartFile upload, String data) {
  // 파라미터의 이름을 같게 하면 @RequestParam을 따로 설정하지 않아도 된다
    
    String uploadPath = "C:/Java/Spring_workspace/upload01/src/main/webapp/upload";
    
    System.out.println("파일명 : " + upload.getName());
    System.out.println("파일명 : " + upload.getOriginalFilename());
    System.out.println("크기 : " + upload.getSize());
    
    System.out.println("데이터 : " + data);

    return "form_ok";
  }
}

```
```xml
<!-- servlet-context.xml -->
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:context="http://www.springframework.org/schema/context"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd
  http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">

  <context:component-scan
    base-package="controller"></context:component-scan>

  <bean
    class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/"></property>
    <property name="suffix" value=".jsp"></property>
  </bean>

  <!-- file upload -->
  <bean id="multipartResolver"
    class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
    <property name="defaultEncoding" value="utf-8" />
    <property name="maxUploadSize" value="20000000" />
  </bean>
</beans>

```

# Spring boot

- Spring에서 라이브러리 환경 설정을 위한 tool

- Spring inintializr

  - 웹 (https://start.spring.io/) : 프로젝트 구성을 다운로드 받아서 사용 (VScode, intellij)

  - Spring Tool
    - eclipse + Spring Tool 4  

      <small> https://spring.io/tools 참조 </small>

    - eclipse + sts(plug-in) (*)

      - 설정 : marketplace &rarr; sts 검색 &rarr; tool4 install

        <small> !! eclipse + sts + 전자정부프레임워크 라이브러리 &rarr; 전자정부프레임워크 개발환경</small>

- 프로젝트 구성 설정
  - spring 사용 가능 언어
    - java : jsp

    - kotlin : android

    - groovy

  - jdk 버전 별 spring boot 호응 버전

    <small> jdk 11 ~ spring boot 2.x.x<br>jdk 17 ~ spring boot 3.x.x</small>

- 제작할 수 있는 프로그램

  - Window Application(CUI, GUI)

  - Web Application

## Window Application

```java
package com.example.ex01;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Ex01Application implements CommandLineRunner {

  public static void main(String[] args) {
    SpringApplication.run(Ex01Application.class, args);
    
    // System.out.println("Hello Spring Boot1 !");
    // main 함수에 실행 함수를 직접 작성하지 않는다
  }
  
  // window application 시작
  @Override
  public void run(String... args) throws Exception {
    
    System.out.println("Hello Spring Boot2 !");
    
    for(String arg : args) {
      System.out.println("arg : " + arg);
    }
  }

}

```
```java
package com.example.ex02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Ex02Application implements CommandLineRunner {

  public static void main(String[] args) {
    SpringApplication.run(Ex02Application.class, args);
  }

  @Override
  public void run(String... args){
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String url = "jdbc:mariadb://localhost:3306/sample";
    String user = "root";
    String password = "123456";
    
    try {
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);
      
      System.out.println("연결 성공");
      
      String query = "select now() as now";
      pstmt = conn.prepareStatement(query);
      rs = pstmt.executeQuery();
      rs.next();
      System.out.println("현재시간 : " + rs.getString("now"));
      
    } catch (ClassNotFoundException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
  }

}

```
- 프로젝트 구성 완료 후 라이브러리 추가하기

  <b> 프로젝트 오른쪽 클릭 &rarr; Spring &rarr; Add starters </b>

### JDBC API 

  - src\main\resources\application.properties 통해서 연결 설정을 한다

    <small>!! 연결 설정을 하지 않을 경우 jdbc를 사용하지 않더라도 오류가 생긴다</small> 

```java
# MariaDB
// application.properties
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/sample
spring.datasource.username=root
spring.datasource.password=123456
```
```java
package com.example.ex03;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class Ex03Application implements CommandLineRunner {
  @Autowired
  private DataSource dataSource;

  public static void main(String[] args) {
    SpringApplication.run(Ex03Application.class, args);
  }
  @Override
  public void run(String... args) throws Exception {
    System.out.println("dataSource : " + dataSource);

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
      conn = this.dataSource.getConnection();

      System.out.println("연결 성공");

      String query = "select now() as now";
      pstmt = conn.prepareStatement(query);
      rs = pstmt.executeQuery();
      rs.next();
      System.out.println("현재시간 : " + rs.getString("now"));

    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
  }
}
```
### JDBC template 
```java
package com.example.ex03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class Ex03Application implements CommandLineRunner {

  // @Autowired
  // private DataSource dataSource;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public static void main(String[] args) {
    SpringApplication.run(Ex03Application.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    System.out.println("jdbcTemplate : " + jdbcTemplate);
    
    String result = jdbcTemplate.queryForObject("select now() as now", String.class);
    System.out.println("현재시간 : " + result); 
  }

}

```
<hr>

JdbcTemplate으로 database, table 목록 출력하기
```java
package com.example.ex03;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class Ex03Application implements CommandLineRunner {

  // @Autowired
  // private DataSource dataSource;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public static void main(String[] args) {
    SpringApplication.run(Ex03Application.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    System.out.println("jdbcTemplate : " + jdbcTemplate);
    
    List<Map<String, Object>> results = jdbcTemplate.queryForList("show databases");
    for(Map<String, Object> result : results) {
      System.out.println(result.get("database"));
    }
    
  }

}

```

```java
package com.example.ex03;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class Ex03Application implements CommandLineRunner {

  // @Autowired
  // private DataSource dataSource;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public static void main(String[] args) {
    SpringApplication.run(Ex03Application.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    System.out.println("jdbcTemplate : " + jdbcTemplate);
    
    List<Map<String, Object>> results = jdbcTemplate.queryForList("show tables");
    for(Map<String, Object> result : results) {
      System.out.println(result.get("Tables_in_sample"));
    }
    
  }

}

```

<hr>

우편번호 검색기
```java
// ZipcodeTO.java
package com.example.model1;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ZipcodeTO {
  private String zipcode;
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;
}

// ZipcodeDAO.java
package com.example.model1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ZipcodeDAO {
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public List<ZipcodeTO> zipcodeList(String dongName){
    
    List<ZipcodeTO> datas 
    = jdbcTemplate.query("select * from zipcode where dong like ?", new BeanPropertyRowMapper<ZipcodeTO>(ZipcodeTO.class), dongName + "%");
    
    return datas;
  }
}

```
```java
// ZipcodeApplication.java
package com.example.zipcode;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.example.model1.ZipcodeDAO;
import com.example.model1.ZipcodeTO;

@SpringBootApplication
@ComponentScan({"com.example.model1"})
public class ZipcodeApplication implements CommandLineRunner{

  @Autowired
  private ZipcodeDAO dao;
  
  public static void main(String[] args) {
    SpringApplication.run(ZipcodeApplication.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    
    String dongName = "쌍문";
    
    List<ZipcodeTO> datas = dao.zipcodeList(dongName);
    
    System.out.println(datas.size());
  }

}

```
### Mybatis 
```java
// application.properties
# MariaDB
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/sample
spring.datasource.username=root
spring.datasource.password=123456
```

```xml
<!-- mapper.xml -->
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="mybatis">
  <select id="select" resultType="String">
    select now() as now
  </select>
</mapper>
```

```java
package com.example.ex04;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@SpringBootApplication
public class Ex04Application implements CommandLineRunner {
  
  @Autowired
  private DataSource dataSource;
  @Autowired
  private ApplicationContext applicationContext;
  // mybatis 설정을 가져온다

  public static void main(String[] args) {
    SpringApplication.run(Ex04Application.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    
    sqlSessionFactoryBean.setDataSource(dataSource);
    sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mappers/mapper.xml"));
    
    SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBean.getObject();
    
    SqlSession sqlSession = sqlSessionFactory.openSession(true);
    System.out.println(sqlSession);
    
    String result = sqlSession.selectOne("select");
    System.out.println("현재시간 : " + result);
  }

}

```

<hr>
다른파일에 미리 설정하고 설정 내용 가져와 사용만하도록 할 수 있다

```java
// DatabaseConfiguration.java
package com.example.ex05;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DatabaseConfiguration {

  @Autowired
  private ApplicationContext applicationContext;
  
  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
    System.out.println("sqlSessionFactory(DataSource dataSource) 호출");
      
    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    sqlSessionFactoryBean.setDataSource(dataSource);
    sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mappers/mapper.xml"));	
      
    return sqlSessionFactoryBean.getObject();
  }
  
  @Bean
  public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
    System.out.println("sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) 호출");
    return new SqlSessionTemplate(sqlSessionFactory);
  }
}

```
```java
// Ex05Application.java
package com.example.ex05;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Ex05Application implements CommandLineRunner{
  
  @Autowired
  private SqlSession sqlSession;
  
  public static void main(String[] args) {
    SpringApplication.run(Ex05Application.class, args);
  }

  @Override
  public void run(String... args) throws Exception {
    System.out.println("sqlSession : " + sqlSession);
    
    String result = sqlSession.selectOne("select");
    System.out.println("현재시간 : " + result);
  }
  
}

```
## Web Application

- spring Web 라이브러리 설정을 하면 tomcat을 따로 설정할 필요가 없다

```html
<!-- \src\main\resources\static\index.html -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello index.html
</body>
</html>
```
<hr>
jsp 파일은 해석하지 못하기 때문에 다운로드 된다

```jsp
<!-- \src\main\resources\static\index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello index.jsp
</body>
</html>
```
<hr>

### Controller 

```xml
<!-- 필요한 라이브러리 추가 -->
<dependency>
  <groupId>org.apache.tomcat.embed</groupId>
  <artifactId>tomcat-embed-jasper</artifactId>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
</dependency>
```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# MariaDB
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/sample
spring.datasource.username=root
spring.datasource.password=123456

```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```
```java
// ConfigController.java
package com.example.web01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RestController
// @Controller
public class ConfigController {

  @RequestMapping("/")
  // @ResponseBody
  // @RestController를 사용할 경우 웹페이지가 아닌 문자열 자체로 받아들이기 때문에 @ResponseBody 생략가능
  public String index() {
    return "Hello html";
  }
  
  @RequestMapping("/hello")
  // @ResponseBody
  // @RestController를 사용할 경우 웹페이지가 아닌 문자열 자체로 받아들이기 때문에 @ResponseBody 생략가능
  public String hello() {
    return "<h1>Hello html</h1>";
  }

  @RequestMapping("/hello1")
  public ModelAndView hello1() {
    return new ModelAndView("hello1");
  }
  
}
```
```jsp
<!-- \src\main\webapp\WEB-INF\views\hello1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello hello1.jsp
</body>
</html>
```
```java
package com.example.web01;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Web01Application {

  public static void main(String[] args) {
    SpringApplication.run(Web01Application.class, args);
  }
  // 실행 파일은 건들지 않는다
}
```
<hr>

```xml
<!-- pom.xml -->
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.7.12</version>
    <relativePath/> <!-- lookup parent from repository -->
  </parent>
  <groupId>com.example</groupId>
  <artifactId>web02</artifactId>
  <version>0.0.1-SNAPSHOT</version>
  <name>web02</name>
  <description>Demo project for Spring Boot</description>
  <properties>
    <java.version>11</java.version>
  </properties>
  <dependencies>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-devtools</artifactId>
      <scope>runtime</scope>
      <optional>true</optional>
    </dependency>
    <dependency>
      <groupId>org.projectlombok</groupId>
      <artifactId>lombok</artifactId>
      <optional>true</optional>
    </dependency>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-test</artifactId>
      <scope>test</scope>
    </dependency>
    <dependency>
      <groupId>org.apache.tomcat.embed</groupId>
      <artifactId>tomcat-embed-jasper</artifactId>
      <scope>provided</scope>
    </dependency>
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>jstl</artifactId>
    </dependency>
    
  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
        <configuration>
          <excludes>
            <exclude>
              <groupId>org.projectlombok</groupId>
              <artifactId>lombok</artifactId>
            </exclude>
          </excludes>
        </configuration>
      </plugin>
    </plugins>
  </build>

</project>

```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```
```jsp
<!-- \src\main\webapp\WEB-INF\views\form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
form.jsp
<br><br>
<form action="form_ok.do" method="get">
데이터 : <input type="text" name="data">
<input type="submit" value="전송"> 
</form>

<form action="form_ok.do" method="post">
데이터 : <input type="text" name="data">
<input type="submit" value="전송"> 
<!-- post 방식으로 보내더라도 한글이 깨지지 않는다 -->
</form>
</body>
</html>

<!-- \src\main\webapp\WEB-INF\views\form_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
form_ok.jsp
<br><br>
data : ${ data }
</body>
</html>
```
```java
package com.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConfigController {

  @RequestMapping("/form.do")
  public ModelAndView form() {
    return new ModelAndView("form");
  }
  
  @RequestMapping("/form_ok.do")
  public ModelAndView formOk(HttpServletRequest request) {
    System.out.println("data : " + request.getParameter("data"));
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    modelAndView.addObject("data", request.getParameter("data"));
    
    return modelAndView;
  }

  /*
  @RequestMapping("/form_ok.do")
  public String formOk(HttpServletRequest request, Model model) {
    System.out.println("data : " + request.getParameter("data"));
    
    model.addAttribute("data", request.getParameter("data"));
    
    return "form_ok";
  }
  */

}

```

<hr>

#### Controller, JDBC 템플릿으로 기본 게시판 구현하기
```xml
<!-- jsp 파일 사용을 위한 라이브러리 추가 -->
<dependency>
  <groupId>org.apache.tomcat.embed</groupId>
  <artifactId>tomcat-embed-jasper</artifactId>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
</dependency>
```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# MariaDB
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/board
spring.datasource.username=root
spring.datasource.password=123456
```
```java
// BoardTO.java
package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
    private String seq;
    private String subject;
    private String writer;
    private String password;
    private String content;
    private String email;
    private String hit;
    private String wdate;
    private String wip;
    private int wgap;
}

// BoardDAO.java
package com.example.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public List<BoardTO> boardList(){
    List<BoardTO> datas = new ArrayList<>();
    
    String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";
    datas = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class));
    
    return datas;
  }
  
  public int boardWriteOk(BoardTO input) {
    int flag = 1;
    
    String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, now(), ?)";
    
    int result = jdbcTemplate.update(sql, input.getSubject(), input.getWriter(), input.getPassword(), input.getContent(), input.getEmail(), input.getWip());
    
    if(result == 1) {
      flag = 0;
    }
    
    return flag;
  }
  
  public BoardTO boardView(BoardTO to) {
    String sql = "update board1 set hit = hit + 1 where seq = ?";
    jdbcTemplate.update(sql, to.getSeq());
    
    sql = "select * from board1 where seq = ?";
    to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq());
    
    return to;
  }
  
  public BoardTO boardDelete(BoardTO to) {
    String sql = "select * from board1 where seq = ?";
    
    to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq());
    
    return to;
  }
  
  public int boardDeleteOk(BoardTO to) {
    int flag = 2;
      
      String sql = "delete from board1 where seq = ? and password = ?";
      
      int result = jdbcTemplate.update(sql, to.getSeq(), to.getPassword());
      if(result == 1) {
         flag = 0;
      }else {
         flag = 1;
      }
      
    return flag;
  }
  
  public BoardTO boardModify(BoardTO to) {
    String sql = "select * from board1 where seq = ?";
    
    to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq());
    
    return to;
  }
  
  public int boardModifyOk(BoardTO to) {
    int flag = 2;
      
      String sql = "update board1 set subject = ?, content = ?, email = ? where seq = ? and password = ?";
      
      int result = jdbcTemplate.update(sql, to.getSubject(), to.getContent(), to.getEmail(), to.getSeq(), to.getPassword());
      if(result == 1) {
        flag = 0;
    }else {
      flag = 1;
    }
      
      return flag;
  }
}

```
```java
// BoardController.java
package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BoardDAO;
import com.example.model.BoardTO;

@RestController
public class BoardController {

  @Autowired
  private BoardDAO dao;
  
  @RequestMapping("/")
  public ModelAndView index(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_index1");
    
    return modelAndView;
  }
  
  @RequestMapping("/list.do")
  public ModelAndView list(HttpServletRequest request) {
    
    List<BoardTO> datas = dao.boardList();
    System.out.println("데이터 갯수 : " + datas.size());
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_list1");
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }
  
  @RequestMapping("/write.do")
  public ModelAndView write(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1");
    
    return modelAndView;
  }
  @RequestMapping("/write_ok.do")
  public ModelAndView write_ok(HttpServletRequest request) {
    String writer = request.getParameter("writer");
      String subject = request.getParameter("subject");
      String password = request.getParameter("password");
      String content = "";
      if(request.getParameter("content") != null && !request.getParameter("content").equals("")) {
        content = request.getParameter("content").replaceAll("\n", "<br>");
      }
      String email = "";
      if(request.getParameter("mail1") != null && !request.getParameter("mail1").equals("") && request.getParameter("mail1") != null && !request.getParameter("mail1").equals("")) {
        email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
      }
      String wip = request.getRemoteAddr();
      
      BoardTO to = new BoardTO();
      to.setWriter(writer);
      to.setSubject(subject);
      to.setPassword(password);
      to.setContent(content);
      to.setEmail(email);
      to.setWip(wip);
      
      int flag = dao.boardWriteOk(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }
  
  @RequestMapping("/view.do")
  public ModelAndView view(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      to = dao.boardView(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_view1");
      modelAndView.addObject("to", to);
      
      return modelAndView;
  }
  
  @RequestMapping("/delete.do")
  public ModelAndView delete(HttpServletRequest request) {
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    to = dao.boardDelete(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1");
    modelAndView.addObject("to", to);
    
    return modelAndView;
  }
  
  @RequestMapping("/delete_ok.do")
  public ModelAndView delete_ok(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setPassword(request.getParameter("password"));
      
      int flag = dao.boardDeleteOk(to); 
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_delete1_ok");
      modelAndView.addObject("flag", flag);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify.do")
  public ModelAndView modify(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      BoardTO data = dao.boardModify(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1");
      modelAndView.addObject("data", data);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify_ok.do")
  public ModelAndView modify_ok(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setSubject(request.getParameter("subject"));
      to.setPassword(request.getParameter("password"));
      to.setContent(request.getParameter("content"));
      to.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
      
      int flag = dao.boardModifyOk(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1_ok");
      modelAndView.addObject("flag", flag);
      modelAndView.addObject("seq", request.getParameter("seq"));
      
      return modelAndView;
  }
  
}

```
```java
// BootJdbcTemplateBoard1Application.java
package com.example.bootjdbctemplateboard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.bootjdbctemplateboard", "com.example.controller", "com.example.model"})
public class BootJdbcTemplateBoard1Application {

  public static void main(String[] args) {
    SpringApplication.run(BootJdbcTemplateBoard1Application.class, args);
  }

}
```
```jsp
<!-- board_list1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  List<BoardTO> lists = (List)request.getAttribute("datas");
  StringBuilder sbHtml = new StringBuilder();
  for(BoardTO data : lists){
    sbHtml.append("<tr>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("<td>" + data.getSeq() + "</td>");
    if(data.getWgap() == 0){
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'></td>");
    }else{
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;</td>");
    }
    sbHtml.append("<td>" + data.getWriter() + "</td>");
    sbHtml.append("<td>" + data.getWdate() + "</td>");
    sbHtml.append("<td>" + data.getHit() + "</td>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("</tr>");
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <div class="board_top">
      <div class="bold">총 <span class="txt_orange">1</span>건</div>
    </div>

    <!--게시판-->
    <div class="board">
      <table>
      <tr>
        <th width="3%">&nbsp;</th>
        <th width="5%">번호</th>
        <th>제목</th>
        <th width="10%">글쓴이</th>
        <th width="17%">등록일</th>
        <th width="5%">조회</th>
        <th width="3%">&nbsp;</th>
      </tr>
      <%= sbHtml %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("wbtn").onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 이용에 동의해주세요');
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert('글쓴이를 입력해주세요');
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.wfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="write_ok.do" method="post" name="wfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
        
        <table>
        <tr>
          <br />
          <td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
            <div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
            <div style="padding-left:10px;">
              <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
              </div>
            </div>
            <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
              <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
        </div>
        <div class="align_right">
          <input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_write1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='list.do'");
  }else{
    out.println("alert('글쓰기 실패');");
    out.println("history.back()");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_view1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO to = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <!--게시판-->
    <div class="board_view">
      <table>
      <tr>
        <th width="10%">제목</th>
        <td width="60%"><%= to.getSubject() %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= to.getWdate() %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= to.getWriter() %>(<%= to.getEmail() %>)(<%= to.getWip() %>)</td>
        <th>조회</th>
        <td><%= to.getHit() %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= to.getContent() %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO data = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.dfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="delete_ok.do" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 삭제 성공');");
    out.println("location.href='list.do';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀립니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 삭제 실패');");
    out.println("hirtory.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_modify1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO data = new BoardTO();
  
  data = (BoardTO)request.getAttribute("data");
  String mail1 = "";
  String mail2 = "";
  if(data.getEmail() != null && !data.getEmail().equals("")){
    String[] mailArr = data.getEmail().split("@");
    mail1 = mailArr[0];
    mail2 = mailArr[1];
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="modify_ok.do" method="post" name="mfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= data.getContent() %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_modify1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='view.do?seq=" + request.getAttribute("seq") + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀렸습니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정 실패');");
    out.println("history.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```
<hr>

#### Controller, Mybatis로 기본 게시판 구현하기

```xml
<!-- jsp 파일 사용을 위한 라이브러리 추가 -->
<dependency>
  <groupId>org.apache.tomcat.embed</groupId>
  <artifactId>tomcat-embed-jasper</artifactId>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
</dependency>
```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# MariaDB
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/board
spring.datasource.username=root
spring.datasource.password=123456
```
```xml
<!-- /src/main/resources/mappers/board.xml -->
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.example.bootmybatisboard">
<select id="boardList" resultType="com.example.model.BoardTO">
  select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap 
  from board1 
  order by seq desc
</select>
<insert id="boardWriteOk" parameterType="com.example.model.BoardTO">
  insert into board1 values (0, #{subject}, #{writer}, #{password}, #{content}, #{email}, 0, now(), #{wip})
</insert>
<update id="boardUpHit" parameterType="com.example.model.BoardTO">
  update board1 set hit = hit + 1 where seq = #{seq}
</update>
<select id="boardView" resultType="com.example.model.BoardTO" parameterType="com.example.model.BoardTO">
  select * from board1 where seq = #{seq}
</select>

<select id="boardDelete" resultType="com.example.model.BoardTO" parameterType="com.example.model.BoardTO">
  select * from board1 where seq = #{seq}
</select>

<delete id="boardDeleteOk" parameterType="com.example.model.BoardTO">
  delete from board1 where seq = #{seq} and password = #{password}
</delete>

<select id="boardModify" resultType="com.example.model.BoardTO" parameterType="com.example.model.BoardTO">
  select * from board1 where seq = #{seq}
</select>

<update id="boardModifyOk" parameterType="com.example.model.BoardTO">
  update board1 set subject = #{subject}, content = #{content}, email = #{email} where seq = #{seq} and password = #{password}
</update>

</mapper>
```
```java
// DatabaseConfiguration.java
package com.example.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DatabaseConfiguration {

  @Autowired
  private ApplicationContext applicationContext;
  
  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
    
    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    sqlSessionFactoryBean.setDataSource(dataSource);
    sqlSessionFactoryBean.addMapperLocations(applicationContext.getResources("classpath:/mappers/board.xml"));
    
    return sqlSessionFactoryBean.getObject();
  }
  
  @Bean
  public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
    return new SqlSessionTemplate(sqlSessionFactory);
  }
}
```
```java
// BoardController.java
package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BoardDAO;
import com.example.model.BoardTO;

@RestController
public class BoardController {

  @Autowired
  private BoardDAO dao;
  
  @RequestMapping("/")
  public ModelAndView index(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_index1");
    
    return modelAndView;
  }
  
  @RequestMapping("/list.do")
  public ModelAndView list(HttpServletRequest request) {
    
    List<BoardTO> datas = dao.boardList();
    System.out.println("데이터 갯수 : " + datas.size());
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_list1");
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }
  
  @RequestMapping("/write.do")
  public ModelAndView write(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1");
    
    return modelAndView;
  }
  @RequestMapping("/write_ok.do")
  public ModelAndView write_ok(HttpServletRequest request) {
    String writer = request.getParameter("writer");
      String subject = request.getParameter("subject");
      String password = request.getParameter("password");
      String content = "";
      if(request.getParameter("content") != null && !request.getParameter("content").equals("")) {
        content = request.getParameter("content").replaceAll("\n", "<br>");
      }
      String email = "";
      if(request.getParameter("mail1") != null && !request.getParameter("mail1").equals("") && request.getParameter("mail1") != null && !request.getParameter("mail1").equals("")) {
        email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
      }
      String wip = request.getRemoteAddr();
      
      BoardTO to = new BoardTO();
      to.setWriter(writer);
      to.setSubject(subject);
      to.setPassword(password);
      to.setContent(content);
      to.setEmail(email);
      to.setWip(wip);
      
      int flag = dao.boardWriteOk(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }
  
  @RequestMapping("/view.do")
  public ModelAndView view(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      to = dao.boardView(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_view1");
      modelAndView.addObject("to", to);
      
      return modelAndView;
  }
  
  @RequestMapping("/delete.do")
  public ModelAndView delete(HttpServletRequest request) {
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    to = dao.boardDelete(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1");
    modelAndView.addObject("to", to);
    
    return modelAndView;
  }
  
  @RequestMapping("/delete_ok.do")
  public ModelAndView delete_ok(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setPassword(request.getParameter("password"));
      
      int flag = dao.boardDeleteOk(to); 
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_delete1_ok");
      modelAndView.addObject("flag", flag);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify.do")
  public ModelAndView modify(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      BoardTO data = dao.boardModify(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1");
      modelAndView.addObject("data", data);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify_ok.do")
  public ModelAndView modify_ok(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setSubject(request.getParameter("subject"));
      to.setPassword(request.getParameter("password"));
      to.setContent(request.getParameter("content"));
      to.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
      
      int flag = dao.boardModifyOk(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1_ok");
      modelAndView.addObject("flag", flag);
      modelAndView.addObject("seq", request.getParameter("seq"));
      
      return modelAndView;
  }
  
}
```

```java
// BoardTO.java
package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
    private String seq;
    private String subject;
    private String writer;
    private String password;
    private String content;
    private String email;
    private String hit;
    private String wdate;
    private String wip;
    private int wgap;
}

// BoardDAO.java
package com.example.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

  @Autowired
  private SqlSession sqlSession;
  
  public List<BoardTO> boardList(){
    List<BoardTO> datas = new ArrayList<>();
    
    datas = sqlSession.selectList("boardList");
    
    return datas;
  }
  
  public int boardWriteOk(BoardTO input) {
    int flag = 1;
    
    int result = sqlSession.insert("boardWriteOk", input);
    
    if(result == 1) {
      flag = 0;
    }
    
    return flag;
  }
  
  public BoardTO boardView(BoardTO to) {
    sqlSession.update("boardUpHit");
    
    to = sqlSession.selectOne("boardView", to);
    
    return to;
  }
  
  public BoardTO boardDelete(BoardTO to) {
    to = sqlSession.selectOne("boardDelete", to);
    
    return to;
  }
  
  public int boardDeleteOk(BoardTO to) {
    int flag = 2;
      
      int result = sqlSession.delete("boardDelete");
      
      if(result == 1) {
         flag = 0;
      }else {
         flag = 1;
      }
      
    return flag;
  }
  
  public BoardTO boardModify(BoardTO to) {
    
    to = sqlSession.selectOne("boardModify", to);
    
    return to;
  }
  
  public int boardModifyOk(BoardTO to) {
    int flag = 2;
      
      int result = sqlSession.update("boardModifyOk", to);
      if(result == 1) {
        flag = 0;
    }else {
      flag = 1;
    }
      
      return flag;
  }
}

```
```java
// BootMyBatisBoardApplication.java
package com.example.bootmybatisboard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.bootmybatisboard", "com.example.config", "com.example.controller", "com.example.model"})
public class BootMyBatisBoardApplication {

  public static void main(String[] args) {
    SpringApplication.run(BootMyBatisBoardApplication.class, args);
  }

}

```
```jsp
<!-- board_list1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  List<BoardTO> lists = (List)request.getAttribute("datas");
  StringBuilder sbHtml = new StringBuilder();
  for(BoardTO data : lists){
    sbHtml.append("<tr>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("<td>" + data.getSeq() + "</td>");
    if(data.getWgap() == 0){
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'></td>");
    }else{
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;</td>");
    }
    sbHtml.append("<td>" + data.getWriter() + "</td>");
    sbHtml.append("<td>" + data.getWdate() + "</td>");
    sbHtml.append("<td>" + data.getHit() + "</td>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("</tr>");
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <div class="board_top">
      <div class="bold">총 <span class="txt_orange">1</span>건</div>
    </div>

    <!--게시판-->
    <div class="board">
      <table>
      <tr>
        <th width="3%">&nbsp;</th>
        <th width="5%">번호</th>
        <th>제목</th>
        <th width="10%">글쓴이</th>
        <th width="17%">등록일</th>
        <th width="5%">조회</th>
        <th width="3%">&nbsp;</th>
      </tr>
      <%= sbHtml %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("wbtn").onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 이용에 동의해주세요');
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert('글쓴이를 입력해주세요');
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.wfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="write_ok.do" method="post" name="wfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
        
        <table>
        <tr>
          <br />
          <td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
            <div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
            <div style="padding-left:10px;">
              <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
              </div>
            </div>
            <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
              <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
        </div>
        <div class="align_right">
          <input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_write1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='list.do'");
  }else{
    out.println("alert('글쓰기 실패');");
    out.println("history.back()");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_view1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO to = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <!--게시판-->
    <div class="board_view">
      <table>
      <tr>
        <th width="10%">제목</th>
        <td width="60%"><%= to.getSubject() %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= to.getWdate() %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= to.getWriter() %>(<%= to.getEmail() %>)(<%= to.getWip() %>)</td>
        <th>조회</th>
        <td><%= to.getHit() %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= to.getContent() %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO data = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.dfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="delete_ok.do" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 삭제 성공');");
    out.println("location.href='list.do';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀립니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 삭제 실패');");
    out.println("hirtory.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_modify1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO data = new BoardTO();
  
  data = (BoardTO)request.getAttribute("data");
  String mail1 = "";
  String mail2 = "";
  if(data.getEmail() != null && !data.getEmail().equals("")){
    String[] mailArr = data.getEmail().split("@");
    mail1 = mailArr[0];
    mail2 = mailArr[1];
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="modify_ok.do" method="post" name="mfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= data.getContent() %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_modify1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='view.do?seq=" + request.getAttribute("seq") + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀렸습니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정 실패');");
    out.println("history.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

##### Mybatis Annotaiton을 이용해 기본 게시판 구현하기

- Mapper 인터페이스를 사용하면서 Configuration 파일이 없어진다
```xml
<!-- jsp 사용을 위한 라이브러리 추가 -->
<dependency>
  <groupId>org.apache.tomcat.embed</groupId>
  <artifactId>tomcat-embed-jasper</artifactId>
  <scope>provided</scope>
</dependency>
<dependency>
  <groupId>javax.servlet</groupId>
  <artifactId>jstl</artifactId>
</dependency>
```
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# MariaDB
spring.datasource.driver-class-name=org.mariadb.jdbc.Driver
spring.datasource.url=jdbc:mariadb://localhost:3306/board
spring.datasource.username=root
spring.datasource.password=123456
```
```java
// BoardMapper.java
package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.example.model.BoardTO;

@Mapper
@Repository
public interface BoardMapper {
  
  @Select("select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc")
  public List<BoardTO> boardList();
  
  @Insert("insert into board1 values (0, #{subject}, #{writer}, #{password}, #{content}, #{email}, 0, now(), #{wip})")
  public int boardWriteOk(BoardTO to);
  
  @Update("update board1 set hit = hit + 1 where seq = #{seq}")
  public int boardUpHit(BoardTO to);
  
  @Select("select * from board1 where seq = #{seq}")
  public BoardTO boardView(BoardTO to);
  
  @Select("select * from board1 where seq = #{seq}")
  public BoardTO boardDelete(BoardTO to);
  
  @Delete("delete from board1 where seq = #{seq} and password = #{password}")
  public int boardDeleteOk(BoardTO to);
  
  @Select("select * from board1 where seq = #{seq}")
  public BoardTO boardModify(BoardTO to);
  
  @Update("update board1 set subject = #{subject}, content = #{content}, email = #{email} where seq = #{seq} and password = #{password}")
  public int boardModifyOk(BoardTO to);
}

```
```java
// BoardTO.java
package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
    private String seq;
    private String subject;
    private String writer;
    private String password;
    private String content;
    private String email;
    private String hit;
    private String wdate;
    private String wip;
    private int wgap;
}

// BoardDAO.java
package com.example.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.BoardMapper;

@Repository
@MapperScan("com.example.mapper")
public class BoardDAO {
  
  @Autowired
  private BoardMapper mapper;
  
  public List<BoardTO> boardList(){
    List<BoardTO> datas = new ArrayList<>();
    
    datas = mapper.boardList();
    
    return datas;
  }
  
  public int boardWriteOk(BoardTO input) {
    int flag = 1;
    
    int result = mapper.boardWriteOk(input);
    
    if(result == 1) {
      flag = 0;
    }
    
    return flag;
  }
  
  public BoardTO boardView(BoardTO to) {
    mapper.boardUpHit(to);
    
    to = mapper.boardView(to);
    
    return to;
  }
  
  public BoardTO boardDelete(BoardTO to) {
    to = mapper.boardDelete(to);
    
    return to;
  }
  
  public int boardDeleteOk(BoardTO to) {
    int flag = 2;
      
      int result = mapper.boardDeleteOk(to);
      
      if(result == 1) {
         flag = 0;
      }else {
         flag = 1;
      }
      
    return flag;
  }
  
  public BoardTO boardModify(BoardTO to) {
    
    to = mapper.boardModify(to);
    
    return to;
  }
  
  public int boardModifyOk(BoardTO to) {
    int flag = 2;
      
      int result = mapper.boardModifyOk(to);
      if(result == 1) {
        flag = 0;
    }else {
      flag = 1;
    }
      
      return flag;
  }
}

```
```java
package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.BoardDAO;
import com.example.model.BoardTO;

@RestController
public class BoardController {

  @Autowired
  private BoardDAO dao;
  
  @RequestMapping("/")
  public ModelAndView index(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_index1");
    
    return modelAndView;
  }
  
  @RequestMapping("/list.do")
  public ModelAndView list(HttpServletRequest request) {
    
    List<BoardTO> datas = dao.boardList();
    System.out.println("데이터 갯수 : " + datas.size());
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_list1");
    modelAndView.addObject("datas", datas);
    
    return modelAndView;
  }
  
  @RequestMapping("/write.do")
  public ModelAndView write(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1");
    
    return modelAndView;
  }
  @RequestMapping("/write_ok.do")
  public ModelAndView write_ok(HttpServletRequest request) {
    String writer = request.getParameter("writer");
      String subject = request.getParameter("subject");
      String password = request.getParameter("password");
      String content = "";
      if(request.getParameter("content") != null && !request.getParameter("content").equals("")) {
        content = request.getParameter("content").replaceAll("\n", "<br>");
      }
      String email = "";
      if(request.getParameter("mail1") != null && !request.getParameter("mail1").equals("") && request.getParameter("mail1") != null && !request.getParameter("mail1").equals("")) {
        email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
      }
      String wip = request.getRemoteAddr();
      
      BoardTO to = new BoardTO();
      to.setWriter(writer);
      to.setSubject(subject);
      to.setPassword(password);
      to.setContent(content);
      to.setEmail(email);
      to.setWip(wip);
      
      int flag = dao.boardWriteOk(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_write1_ok");
    modelAndView.addObject("flag", flag);
    
    return modelAndView;
  }
  
  @RequestMapping("/view.do")
  public ModelAndView view(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      to = dao.boardView(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_view1");
      modelAndView.addObject("to", to);
      
      return modelAndView;
  }
  
  @RequestMapping("/delete.do")
  public ModelAndView delete(HttpServletRequest request) {
    BoardTO to = new BoardTO();
    to.setSeq(request.getParameter("seq"));
    
    to = dao.boardDelete(to);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("board_delete1");
    modelAndView.addObject("to", to);
    
    return modelAndView;
  }
  
  @RequestMapping("/delete_ok.do")
  public ModelAndView delete_ok(HttpServletRequest request) {
    
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setPassword(request.getParameter("password"));
      
      int flag = dao.boardDeleteOk(to); 
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_delete1_ok");
      modelAndView.addObject("flag", flag);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify.do")
  public ModelAndView modify(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      
      BoardTO data = dao.boardModify(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1");
      modelAndView.addObject("data", data);
      
      return modelAndView;
  }
  
  @RequestMapping("/modify_ok.do")
  public ModelAndView modify_ok(HttpServletRequest request) {
    BoardTO to = new BoardTO();
      to.setSeq(request.getParameter("seq"));
      to.setSubject(request.getParameter("subject"));
      to.setPassword(request.getParameter("password"));
      to.setContent(request.getParameter("content"));
      to.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
      
      int flag = dao.boardModifyOk(to);
      
      ModelAndView modelAndView = new ModelAndView();
      modelAndView.setViewName("board_modify1_ok");
      modelAndView.addObject("flag", flag);
      modelAndView.addObject("seq", request.getParameter("seq"));
      
      return modelAndView;
  }
  
}
```
```java
// BootMyBatisAnnotationBoardApplication.java
package com.example.bootmybatisannotationboard;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.bootmybatisboard", "com.example.controller", "com.example.model", "com.example.mapper"})
public class BootMyBatisAnnotationBoardApplication {

  public static void main(String[] args) {
    SpringApplication.run(BootMyBatisAnnotationBoardApplication.class, args);
  }

}

```

```jsp
<!-- board_list1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  List<BoardTO> lists = (List)request.getAttribute("datas");
  StringBuilder sbHtml = new StringBuilder();
  for(BoardTO data : lists){
    sbHtml.append("<tr>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("<td>" + data.getSeq() + "</td>");
    if(data.getWgap() == 0){
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;<img src='./images/icon_new.gif' alt='NEW'></td>");
    }else{
      sbHtml.append("<td class='left'><a href='view.do?seq=" + data.getSeq() + "'>" + data.getSubject() + "</a>&nbsp;</td>");
    }
    sbHtml.append("<td>" + data.getWriter() + "</td>");
    sbHtml.append("<td>" + data.getWdate() + "</td>");
    sbHtml.append("<td>" + data.getHit() + "</td>");
    sbHtml.append("<td>&nbsp;</td>");
    sbHtml.append("</tr>");
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <div class="board_top">
      <div class="bold">총 <span class="txt_orange">1</span>건</div>
    </div>

    <!--게시판-->
    <div class="board">
      <table>
      <tr>
        <th width="3%">&nbsp;</th>
        <th width="5%">번호</th>
        <th>제목</th>
        <th width="10%">글쓴이</th>
        <th width="17%">등록일</th>
        <th width="5%">조회</th>
        <th width="3%">&nbsp;</th>
      </tr>
      <%= sbHtml %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("wbtn").onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 이용에 동의해주세요');
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert('글쓴이를 입력해주세요');
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.wfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="write_ok.do" method="post" name="wfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
        
        <table>
        <tr>
          <br />
          <td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
            <div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
            <div style="padding-left:10px;">
              <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
              </div>
            </div>
            <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
              <input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
        </div>
        <div class="align_right">
          <input type="button" id="wbtn" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_write1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='list.do'");
  }else{
    out.println("alert('글쓰기 실패');");
    out.println("history.back()");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_view1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO to = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <div class="contents_sub">
    <!--게시판-->
    <div class="board_view">
      <table>
      <tr>
        <th width="10%">제목</th>
        <td width="60%"><%= to.getSubject() %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= to.getWdate() %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= to.getWriter() %>(<%= to.getEmail() %>)(<%= to.getWip() %>)</td>
        <th>조회</th>
        <td><%= to.getHit() %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= to.getContent() %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='modify.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='delete.do?seq=<%= to.getSeq() %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='write.do'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO data = (BoardTO)request.getAttribute("to");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.dfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="delete_ok.do" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="dbtn" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_delete1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 삭제 성공');");
    out.println("location.href='list.do';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀립니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 삭제 실패');");
    out.println("hirtory.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- board_modify1.jsp -->
<%@page import="com.example.model.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO data = new BoardTO();
  
  data = (BoardTO)request.getAttribute("data");
  String mail1 = "";
  String mail2 = "";
  if(data.getEmail() != null && !data.getEmail().equals("")){
    String[] mailArr = data.getEmail().split("@");
    mail1 = mailArr[0];
    mail2 = mailArr[1];
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
</head>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="modify_ok.do" method="post" name="mfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= data.getWriter() %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= data.getSubject() %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= data.getContent() %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?seq=<%= data.getSeq() %>'" />
        </div>
        <div class="align_right">
          <input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
          <input type="hidden" name="seq" value="<%= data.getSeq() %>">
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

<!-- board_modify1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  int flag = (Integer)request.getAttribute("flag");
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='view.do?seq=" + request.getAttribute("seq") + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호가 틀렸습니다');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정 실패');");
    out.println("history.back();");
  }
  out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
```

### Mail
- 프로젝트 구성할 때 Java Mail Sender dependency를 추가한다
```xml
<!-- jsp 사용을 위한 라이브러리 추가 -->
<dependency>
    <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jstl</artifactId>
</dependency>
```

```java
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# Java Mail
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.amil.smtp.transfer.protocol=smtp
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.properties.mail.smtp.auth=true
spring.mail.username=eogh7204@gmail.com
spring.mail.password=oghnqnlmpdrdsdkd
```

```java
// MailController.java
package com.example.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MailController {

  @Autowired
  private JavaMailSender javaMailSender;
  
  @RequestMapping("/mail.do")
  public ModelAndView mail() {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("mail");
    return modelAndView;
  }
  
  @RequestMapping("/mail_ok.do")
  public ModelAndView mail_ok() {
    
    System.out.println("javaMailSender :" + javaMailSender);
    
    String toEmail = "qkreogh0@icloud.com";
    String toName = "테스터";
    String subject = "테스트 제목";
    String content = "<h1>테스트 내용</h1>";
    
    mailSenderText(toEmail, toName, subject, content);
    
    mailSenderHtml(toEmail, toName, subject, content);
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("mail_ok");
    return modelAndView;
  }
  
  public void mailSenderText(String toEmail, String toName, String subject, String content) {
    SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

    simpleMailMessage.setTo(toEmail);
    simpleMailMessage.setSubject(subject);
    simpleMailMessage.setText(content);
    simpleMailMessage.setSentDate(new java.util.Date());
    
    javaMailSender.send(simpleMailMessage);
    
    System.out.println("전송완료");
  }
  
  public void mailSenderHtml(String toEmail, String toName, String subject, String content) {
    MimeMessage mimeMessage = javaMailSender.createMimeMessage();
    
    try {
      mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(toEmail, toName, "utf-8"));
      mimeMessage.setSubject(subject, "utf-8");
      mimeMessage.setText(content, "utf-8", "html");
      
      mimeMessage.setSentDate(new java.util.Date());
    } catch (UnsupportedEncodingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (MessagingException e) {
      System.out.println("에러 : " + e.getMessage());
    }
    
    javaMailSender.send(mimeMessage);
    
    System.out.println("전송완료");
    
  }
}

```
```java
// BootMailApplication.java
package com.example.bootmail;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.bootmail", "com.example.controller"})
public class BootMailApplication {

  public static void main(String[] args) {
    SpringApplication.run(BootMailApplication.class, args);
  }

}

```
### Fileupload
```java
// application.properties
# View Pages
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp

# Multipart Config
spring.servlet.multipart.enabled=true
spring.servlet.multipart.location=C:/Java/boot-workspace/FileUpload/src/main/webapp/upload
spring.servlet.multipart.max-file-size=10MB
spring.servlet.multipart.max-request-size=50MB
```
```java
// UploadController.java
package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class UploadController {

  @RequestMapping("/form.do")
  public ModelAndView form(HttpServletRequest request) {
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form");
    
    return modelAndView;
  }
  
  @RequestMapping("/form_ok.do")
  public ModelAndView form_ok(MultipartFile upload) {
    System.out.println(upload.getOriginalFilename());
    System.out.println(upload.getSize());
    
    try {
      String ext = upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf("."));
      String fileName = upload.getOriginalFilename().substring(0, upload.getOriginalFilename().indexOf(ext));
      
      upload.transferTo(new File(fileName + "_" + System.currentTimeMillis() + ext));
    } catch (IllegalStateException e) {
      System.out.println("에러 :" + e.getMessage());
    } catch (IOException e) {
      System.out.println("에러 :" + e.getMessage());
    }
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    
    return modelAndView;
  }
  
  // 다중파일 업로드
  @RequestMapping("/form_ok2.do")
  public ModelAndView form_ok_multiple(MultipartFile[] uploads) {
    // uploads는 form에서의 태그 이름과 같아야 한다
    
    System.out.println(uploads.length);
    
    for(MultipartFile upload : uploads) {
      System.out.println(upload.getOriginalFilename());
      String ext = upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf("."));
      String fileName = upload.getOriginalFilename().substring(0, upload.getOriginalFilename().indexOf(ext));
      
      try {
        upload.transferTo(new File(fileName + "_" + System.currentTimeMillis() + ext));
      } catch (IllegalStateException e) {
        System.out.println("에러 : " + e.getMessage() );
      } catch (IOException e) {
        System.out.println("에러 : " + e.getMessage() );
      }
    }
    
    ModelAndView modelAndView = new ModelAndView();
    modelAndView.setViewName("form_ok");
    
    return modelAndView;
  }
  

}

```
```java
// FileUploadApplication.java
package com.example.fileupload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.example.controller"})
public class FileUploadApplication {

  public static void main(String[] args) {
    SpringApplication.run(FileUploadApplication.class, args);
  }

}
```
```jsp
<!-- form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
form.jsp
<br><br>
<form action="form_ok.do" method="post" enctype="multipart/form-data">
파일 <input type="file" name="upload">
<input type="submit" value="파일업로드">
</form>
<br><br>
<form action="form_ok2.do" method="post" enctype="multipart/form-data">
파일 <input type="file" name="uploads" multiple="multiple">
<input type="submit" value="파일업로드">
</form>
</body>
</html>

<!-- form_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  alert("파일 전송 완료");
</script>
</head>
<body>
form_ok.jsp
</body>
</html>
```
#### album comment 게시판 

- sql

  - 테이블 생성
  ```sql
  create table albumList(
    seq int primary key auto_increment,
    subject varchar(150) not null,
    writer varchar(12) not null,
    mail varchar(50),
    password varchar(12) not null,
    content varchar(2000),
    cmt int not null,
    cmtyes char(1),
    hit int not null,
    wip varchar(15) not null,
    wdate datetime not null
  );

  create table albumComment(
    seq int primary key auto_increment,
    pseq int not null,
    writer varchar(12) not null,
    password varchar(12) not null,
    content varchar(2000) not null,
    wdate datetime not null
  );

  create table albumFile(
    seq int primary key auto_increment,
    pseq int not null,
    filename varchar(200) not null,
    filesize int not null,
    latitude varchar(12) not null,
    longitude varchar(12) not null,
    wdate datetime not null
  );
  ```

  - 데이터 입력 

  ```sql
  insert into albumList values(0, '제목', '글쓴이', 'test@test.com', '123456', '내용', 0, 'O', 0, '000.000.000.000', now())

  insert into albumComment values(0, '1', '악플러', '123456', '내용', now());

  insert into albumFile values(0, 1, 'Chrysanthemum11.jpg', 0, '000.00', '000.00', now());
  ```

- 구현하기
```xml
<!-- jsp 사용을 위한 라이브러리 추가 -->
<dependency>
      <groupId>org.apache.tomcat.embed</groupId>
    <artifactId>tomcat-embed-jasper</artifactId>
    <scope>provided</scope>
  </dependency>
  <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>jstl</artifactId>
  </dependency>
```
```java
// ListMapper.java
package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.ListTO;

@Mapper
public interface ListMapper {
  
  @Select("select seq, subject, writer, cmt, date_format(wdate,'%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from albumList order by seq desc")
  public List<ListTO> list();
  
  @Insert("insert into albumList values(0, #{subject}, #{writer}, #{mail}, #{password}, #{content}, 0, #{cmtyes}, 0, #{wip}, now())")
  public int writeOk(ListTO to);
  
  @Select("select seq from albumList order by seq desc limit 1")
  public int getSeq();
  
  @Update("update albumList set hit = hit + 1 where seq = #{seq}")
  public int upHit(ListTO to);
  
  @Select("select * from albumList where seq = #{seq}")
  public ListTO view(ListTO to);
  
  @Update("update albumList set cmt = cmt + 1 where seq = #{seq}")
  public int upCmt(ListTO to);
  
  @Update("update albumList set cmt = cmt - 1 where seq = #{seq}")
  public int downCmt(ListTO to);
  
  @Select("select * from albumList where seq = #{seq}")
  public ListTO delete(ListTO to);
  
  @Delete("delete from albumList where seq = #{seq} and password = #{password}")
  public int deleteOk(ListTO to);
  
  @Select("select * from albumList where seq = #{seq}")
  public List<ListTO> modify(ListTO to);
  
  @Update("update albumList set subject = #{subject}, content = #{content}, mail = #{mail} where seq = #{seq} and password = #{password}")
  public int modifyOk(ListTO to);
  
}

// FileMapper.java
package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.FileTO;

@Mapper
public interface FileMapper {
  
  @Select("select pseq, filename from albumFile where pseq = #{pseq} limit 1")
  public FileTO list(FileTO to);
  
  @Insert("insert into albumFile values(0, #{pseq}, #{filename}, #{filesize}, #{latitude}, #{longitude}, now())")
  public int writeOk(FileTO to);
  
  @Select("select * from albumFile where pseq = #{pseq}")
  public List<FileTO> view(FileTO to);
  
  @Delete("delete from albumFile where pseq = #{pseq}")
  public int deleteOk(FileTO to);
  
  @Select("select filename, latitude, longitude from albumFile where pseq = #{pseq}")
  public List<FileTO> modify(FileTO to);
  
  @Insert("insert into albumFile values(0, #{pseq}, #{filename}, #{filesize}, #{latitude}, #{longitude}, now())")
  public int modifyOk(FileTO to);
}

// CommentMapper.java
package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.model.CommentTO;

@Mapper
public interface CommentMapper {
  
  @Select("select count(*) from albumComment where pseq = #{pseq}")
  public int commentCount(CommentTO to);
  
  @Select("select * from albumComment where pseq = #{pseq}")
  public List<CommentTO> commentList(CommentTO to);
  
  @Insert("insert into albumComment values(0, #{pseq}, #{writer}, #{password}, #{content}, now())")
  public int writeOk(CommentTO to);
  
  @Delete("delete from albumComment where seq = #{seq}")
  public int deleteOk(CommentTO to);
  
  @Delete("delete from albumComment where pseq = #{pseq}")
  public int deleteAll(CommentTO to);
}

```



## Template Engine

- view page로 jsp 파일을 사용하지 않고, el, jstl의 방식을 이용해 MVC 모델의 데이터를 치환해서 html 문서를 사용한다

- boot starter에서 Thymeleaf 라이브러리를 추가한다
  
  <small> !! https://www.thymeleaf.org/ 참조</small>

- 기본 
```java
// application.properties
// 기본설정
# Template Engine
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
spring.thymeleaf.check-template-location=true
spring.thymeleaf.cache=false
```

```html
<!-- \src\main\resources\templates\view1.html -->
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
view1.html
<br><br>
<h3>Hello Thymeleaf</h3>
<h3 th:text="hello">Hello Thymeleaf</h3>
<!-- hello가 태그의 내용을 가리고 나타난다 -->
<!-- 처음은 hello를 변수에서 찾고 없다면, 값으로 읽는다 -->

<div th:with="value1=${'data1'}, value2=${'data2'}">
  <h3 th:text="${value1}"></h3>
  <h3 th:text="${value2}"></h3>
  <!-- 부모 태그에서 선언한 변수를 사용한다 -->
  <h3 th:text="${value3}"></h3>
  <!-- 선언된 변수가 아니기 때문에 출력되지 않는다 -->
</div> 

<div th:with="value=${'값'}">
  <h3 th:text="${value == ''? '빈 값' : '값'}"></h3>
  <!-- 비교연산자는 모두 사용 가능하다 -->
  <!-- 단, 부등호는 태그 부호와 충돌이 날 수도 있기 때문에 (gt), (lt)로 쓰기도 한다 -->
  <!-- ==(eq), !=(ne) -->
  <h3 th:if="${value != ''}" th:text="${'value'}"></h3>
  <h3 th:unless="${value == ''}" th:text="${'value'}"></h3>
</div>

<div th:with="data=${10}" th:switch="${data}">
  <h3 th:case="10">10</h3>
  <h3 th:case="20">20</h3>
  <h3 th:case="*">기타</h3><!-- switch문의 default와 같다 -->
</div>

</body>
</html>
```
<hr>

```java
// BoardTO.java
package com.example.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardTO {
  private String seq;
  private String subject;
}

```
```html
<!-- \src\main\resources\templates\view2.html -->
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
view2.html
<br><br>
<h3 th:text="${data1}"></h3>

<h3 th:text="${to.seq}"></h3>
<h3 th:text="${to.getSeq()}"></h3>
<h3 th:text="${to.subject}"></h3>
<h3 th:text="${to.getSubject()}"></h3>
<!-- 모두 에러 없이 출력된다 -->

<table border="1">
<tr>
  <th>seq</th><th>subject</th>
</tr>
<tr th:each="to : ${list}">
  <td th:text="${to.seq}"></td>
  <td th:text="${to.subject}"></td>
</tr>
</table>

</body>
</html>
```

#### 전자정부프레임워크

<small> https://www.egovframe.go.kr/home/main.do 참조</small>
- 공공기관에서 사용한다

- Spring MVC + tomcat을 사용한다 (구형 template)

- 전자정부프레임워크 사이트 개발환경에서 다운 받은 파일을 압축해제하면 개발에 사용할 eclipse, workspace 디렉터리가 있다

- egov web project example 

  <small> 데이터베이스로 hsql을 사용하기 때문에 mariadb를 사용하도록 미리 설정한다 </small>


  1. pom.xml에 mariadb 사용을 위한 dependency 추가
  ```xml
  <dependency>
	    <groupId>org.mariadb.jdbc</groupId>
	    <artifactId>mariadb-java-client</artifactId>
	    <version>3.1.4</version>
	</dependency>
  ```

  2. /src/main/resources/egovframework/egovProps/globals.properties 수정

  3. /src/main/resources/egovframework/spring/com/context-datasource.xml 수정

- egov template project example

  <small> 데이터베이스로 hsql을 사용하기 때문에 mariadb를 사용하도록 미리 설정한다 </small>


  1. pom.xml에 mariadb 사용을 위한 dependency 추가
  ```xml
  <dependency>
	    <groupId>org.mariadb.jdbc</groupId>
	    <artifactId>mariadb-java-client</artifactId>
	    <version>3.1.4</version>
	</dependency>
  ```

  2. /src/main/resources/egovframework/egovProps/globals.properties 수정

  3. /src/main/resources/egovframework/spring/com/context-datasource.xml 수정



- 전자정부프레임워크의 ER diagram을 이용해 erd를 쉽게 구현할 수 있다
  
  <small>!! https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:dev:imp:editor:erd_editor 참조</small>

  - forward engineering 
  
    diagram &rarr; forward engineering &rarr; database 
    
  - reverse engineering

    database &rarr; reverse engineering &rarr; diagram </small>

  - import : 프로젝트에 사용한 데이터베이스를 가져와 er diagram을 구성한다 (reverse engineering)

  - export : er diagram을 이용해 데이터베이스를 구성할 수 있는 ddl 파일을 만든다
