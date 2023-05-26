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

- Maven Project (Gradle Project)

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

### 웹 앱 구성 기본

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
	 	<property name="viewName" value="/listview2.jsp"></property>
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
		// 데이터를 받아오는 전통적인 방식
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("form_ok");
		modelAndView.addObject("data", request.getParameter("data"));
		
		return new ModelAndView("form_ok");
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
