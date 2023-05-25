# Spring
<small> https://spring.io/ 참조</small>

- 객체를 다루는 다양한 기능을 제공해서 웹 개발에 도움을 준다

- DI(Dependency Injection, 의존성 주입), AOP를 이용해 MVC(model 2)를 구현한다

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



