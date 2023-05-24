# Spring
<small> https://spring.io/ 참조</small>

- 객체를 다루는 다양한 기능을 제공해서 웹 개발에 도움을 준다

- DI(Dependency Injection, 의존 주입), aop를 이용해 mvc를 구현한다

  <small>https://blog.naver.com/a5019999/223085608461 참조</small>

  <small>https://blog.naver.com/mindalpong_/222280700011 참조</small>

- 필요한 라이브러리가 많기 때문에 maven 프로젝트를 주로 이용한다

## Spring 기본

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
    // 객체 생성을 프로그래머가 담당
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
    // 프로그래머가 변수가 참조하는 객체를 직접 변경시켜준다
  }

}
```

### Spring Bean Configuration File(Assembler)

- Spring은 미리 설정한 xml 파일을 이용해 객체를 생성하고 사용한다

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
    // 프로그래머가 직접 객체생성을 하지 않는다
    // close() 메서드로 닫아주는 것 잊지 말자
  }
  
}

```
----------

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

#### prototype
- bean 태그의 scope 속성 값 중 하나로 필요할 때마다 객체를 생성한다

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

#### singleton
- bean 태그의 scope 속성 값 중 미리 객체를 생성하고, 그 객체를 계속 사용한다

```xml
<?xml version="1.0" encoding= "UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-4.3.xsd">
  
  <bean name="helloBean1" class="com.exam.spring06.HelloBean1" scope="singleton"></bean>
  <bean name="helloBean2" class="com.exam.spring06.HelloBean2"></bean>
  
</beans>

```
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
    // singleton은 필요하지 않더라도 처음에 객체 생성을 하고 그 객체를 계속 사용한다 
    
    HelloBean2 helloBean2 = (HelloBean2)ctx.getBean("helloBean2");
    
    helloBean2.sayHello("박문수");
    
    ctx.close();
  }

}

```

#### 객체 초기화


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








