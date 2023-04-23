# JSP

- Java 언어를 이용해 동적 웹사이트를 제작하게 하는 프로그램

  - 정적 웹페이지 : 요청할때마다 같은 페이지를 보여준다 

    <sup> ex) html</sup>

  - 동적 웹페이지 : 요청에 따라 다른 페이지를 보여준다  
  
    <sup>ex) 웹프로그램, 라이브러리를 이용</sup>


- 전송방식
  - get : url에 보내는 데이터가 보인다

  - post : 데이터가 헤더에 숨겨져 url에 보이지 않는다




- java를 이용해 동적 웹페이지를 만드는 웹 프로그램

  - sevlet

  - jsp (Java Server Page)

- WAS (Web Application Server) : 프로그램 해석기가 달린 웹서버

  <sup> ex) apache-tomcat, resin, OC4J, ... </sup>

  |웹프로그램의 종류  | 기본언어 | 플랫폼 | 기타
  |--| --| --|--|
  | jsp/ sevelet| java| 모든 플랫폼| WAS (Web Application Server)|
  |php| php|모든 플랫폼|apache|
  |python|python|모든 플랫폼|자체|
  |js|js|모든 플랫폼|자체|
  |ASP.net|윈도용 언어|윈도우|iis|
- 파일 확장자 : .jsp

- java는 출력을 통해서 문자열을 보여주지만 jsp는 .html / .css / .js 파일을 보여준다


- jsp 페이지 내부 
  - directive : 문서 전체에 대한 규정 (필수 요소)

    - 디렉티브 이름 
      - page

      - include

      - taglib

  ```jsp
  <%@ 디렉티브이름 속성1="값1" 속성2="값2" ... %>
  ```

  ```jsp
  <%@ page language='java' contentType ='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
  <!-- 윗 줄은 프로그램적으로 해석하는데 사용되므로 웹페이지 소스 보기를 통해서는 볼 수 없다 -->
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  </head>
  <body>
    Hello JSP
  </body>
  </html>
  ```

    - 스크립트(프로그램) 

    - 선언부 : 메서드 선언

    - scriptlet : java 소스
    ```jsp
    <% java 소스 %>
    ```
    - expression : 출력 부분

    ```jsp
    <%@ page language='java' contentType ='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
    </head>
    <body>
      Hello JSP
      <% 
      System.out.println("Hello JSP");
      // consol.log가 콘솔에만 출력결과가 나오는 것과 비슷하게 tomcat 실행파일에만 출력 결과가 나온다
      out.println("hello JSP"); 
      // Document.write와 같이 웹브라우저에 출력 결과가 나오고, 태그 사용도 가능하다
      %>
    </body>
    </html>
    ```
    
    구구단 출력
    ```jsp
    <%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
    </head>
    <body>
    <%
      StringBuilder data = new StringBuilder();
      data.append("<table width='800' border='1'>");
      data.append("<tr>");
      data.append("<td></td>");
      for(int i = 1; i <= 9; i++){
        data.append("<td> X " + i + "</td>");
      }
      data.append("</tr>"); 
      for(int i = 1; i <= 9; i++){
        data.append("<tr>");
        data.append("<td> " + i + " 단 </td>");
        for(int j = 1; j <= 9; j++){
          data.append("<td> " + i + " X " + j + " = " + i * j + " </td>");
        }
        data.append("</tr>");
      }
      data.append("</table>");  
      out.print(data);
    %>
    </body>
    </html>
    ```
    Java 라이브러리도 사용 가능하다
    ```jsp
    <%@ page language='java' contentType ='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
    <%@ page import="java.util.Date" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
    </head>
    <body>
    <%
      // java.util.Date date = new java.util.Date(); 
      out.println(date.toLocaleString());
    %>
    </body>
    </html>
    ```
    달력 출력해보기
    ```jsp
    <%@ page language='java' contentType ='text/html;charset=UTF-8' pageEncoding='UTF-8' %>
    <%@ page import='java.util.Calendar' %>
    <!-- 선언부를 이용해 Java 패키지 import 방법 -->
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
    </head>
    <body>
    <%
      Calendar startCalendar = Calendar.getInstance();
      Calendar endCalendar = Calendar.getInstance();

      int year = 2023;
      int month = 3;
      startCalendar.set(year, month - 1, 1);
      endCalendar.set(year, month, 1 - 1);

      int startDayOfWeek = startCalendar.get(Calendar.DAY_OF_WEEK);
      int endDate = endCalendar.get(Calendar.DATE);

      out.println(" SU MO TU WE TH FR SA<br>");
      for (int i = 1; i < startDayOfWeek; i++) {
        out.print("   ");
      }
      for (int i = 1, n = startDayOfWeek; i <= endDate; i++, n++) {
        String date = (i < 10) ? "  " + i : " " + i;
        out.print(date);
        if(n % 7 == 0) {
          out.println("<br>");
        }
      };
    %>
    </body>
    </html>
    ```
    ```jsp
    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ page import="java.util.Calendar" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <style>
        #sunday {
          color : red;
        } 

        #saturday {
          color : blue;
        }
      </style>
    </head>
    <body>
    <%
      Calendar nDay = Calendar.getInstance(); 
      int year = nDay.get( Calendar.YEAR );
      int month = nDay.get( Calendar.MONTH ) + 1; 
      
      Calendar sDay = Calendar.getInstance();
      Calendar eDay = Calendar.getInstance(); 

      sDay.set( year, month-1, 1 );
      eDay.set( year, month, 1-1 ); 

      int startDayOfWeek = sDay.get( Calendar.DAY_OF_WEEK );
      int endDayOfWeek = eDay.get( Calendar.DAY_OF_WEEK );
      int endDay = eDay.get( Calendar.DATE ); 

      out.println( "<table width='800' border='1'>" );
      out.println( "<tr>" );
      out.println( "<td colspan='7'>" + year + "년" + month + "월</td>" );
      out.println( "</tr>" );
      out.println( "<tr>" );
      out.println( "<td style='color:red'>SU</td><td>MO</td><td>TU</td><td>WE</td><td>TH</td><td>FR</td><td id='saturday'>SA</td>" );
      out.println( "</tr>" ); 
      out.println( "<tr>" );
      for( int i=1 ; i<startDayOfWeek ; i++ ) {
        out.println( "<td></td>" );
      } 
      for( int i=1, n=startDayOfWeek ; i<=endDay ; i++, n++ ) {
        if( n % 7 == 1 ) {
        out.println( "<tr>" );
        out.println( "<td id='sunday'>" + i + "</td>" );
        }else{
          if( n % 7 == 0){
            out.println( "<td id='saturday'>" + i + "</td>" );
            out.println( "</tr>" );
          }else{
            out.println( "<td>" + i + "</td>" );
          }
        }
      } 
      for( int i=endDayOfWeek ; i<=6 ; i++ ) {
        out.println( "<td></td>" );
      }
      out.println( "</tr>" ); 
      out.println( "</table>" );
    %>	
    </body>
    </html>
    ```
## JSP 개발

- 개발환경 : Window + JDK + apache-tomcat + Eclipse

- 서비스환경 : Linux (Unix) + JDK + apache-tomcat

  <small>!! 배포(deployment)를 위해서는 서비스 환경을 중심으로 jdk, apache-tomcat 버전을 맞춰야한다</small>

- 서버에서 실행할 문서는 src &rarr; main &rarr; webapp 디렉터리에 있어야 한다

### expression

```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  // 전처리 구간
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  // UI와 결함된 데이터 출력
%>

<%
  String data = "Hello JSP<br>";
  out.println("Hello JSP<br>");
%>
<%= "Hello JSP" %>
<!-- out.print()와 같이 웹브라우저에 출력한다 -->
<!-- 단순히 변수의 값을 출력할 때 자주 사용한다 -->
<br>
<%= data %>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%!
  // 선언구역
  public int multiply(int a, int b){
    int result = a * b;
  return result;
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  int a = 10;
  int b = 20;
  int result = multiply(a, b);
  out.print(result + "<br>");
%>

10 * 20 = <%= multiply(10, 20) %> <br>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%!
  public int add(int a, int b){
    return a + b;
  } 

  public int subtract(int a, int b){
    return a - b;	
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  int val1 = 3;
  int val2 = 9;

  int addVal = add(val1, val2);
  int subVal = subtract(val1, val2);
%>

<%= val1 %> + <%= val2 %> = <%= addVal %>
<br>
<%= val1 %> - <%= val2 %> = <%= subVal %>
</body>
</html>
```
### JSP에서 사용되는 기본 객체
- 이미 인스턴스화가 되어 있기 때문에 인스턴스화를 따로 하지 않는다

- 자주 쓰이는 기본 객체 
  - out 
  - request 
  - response 
  - session 
  
  - application
#### request
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  out.println(request.getRemoteAddr() + "<br>");
  <!-- 클라이언트 IP -->
  out.println(request.getContextPath() + "<br>");
  out.println(request.getRequestURI() + "<br>");
  out.println(request.getRequestURL() + "<br>");
  out.println(request.getServerName() + "<br>");
  <!-- 서버 IP -->
  out.println(request.getServerPort() + "<br>");
%>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  Enumeration headerEnum = request.getHeaderNames();
  while(headerEnum.hasMoreElements()){
    String headerName = (String)headerEnum.nextElement();
    String headerValue = request.getHeader(headerName);
%>
<%= headerName %> = <%= headerValue %><br>
<%
  }
%>

</body>
</html>
```
```jsp
<!-- request.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="request_ok.jsp" method="get">
  데이터 <input type="text" name="data1">
  <br>
  데이터 <input type="text" name="data2">
  <br>
  <input type="submit" value="전송">
</form>
</body>
</html>
<!-- request_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  out.print("data1 : " + request.getParameter("data1") + "<br>");
  out.print("data2 : " + request.getParameter("data2") + "<br>");
%>
</body>
</html>
```
```jsp
<!-- request.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% 
  request.setCharacterEncoding("utf-8");
  <!-- get 방식과 달리 post 방식은 한글이 깨진 상태로 전송되는데 위의 전처리 구문을 적어주면 한글이 깨지지 않는다 -->
  <!-- get 방식 post 방식 모두 위의 전처리 구문을 적어주자!! -->
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="request_ok.jsp" method="post">
  데이터 <input type="text" name="data1">
  <br>
  데이터 <input type="text" name="data2">
  <br>
  <input type="submit" value="전송">
</form>

<a href="request_ok.jsp?data1=값1&data2=값2">전송</a>
<!-- a태그는 무조건 get 방식이다 -->
</body>
</html>
<!-- request_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  out.print("data1 : " + request.getParameter("data1") + "<br>");
  out.print("data2 : " + request.getParameter("data2") + "<br>");
%>
</body>
</html>
```
```jsp
<!-- form.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>폼 생성</title>
</head>
<body>
  <form action="viewParameter.jsp" method="post">
  이름: <input type="text" name="name" size="10"><br>
  주소: <input type="text" name="address" size="30"> <br>

  좋아하는 동물 : 
  <input type="checkbox" name="pet" value="dog">강아지
  <input type="checkbox" name="pet" value="cat">고양이
  <input type="checkbox" name="pet" value="pig">돼지
  <br>
  <input type="submit" value="전송">
  </form>
</body>
</html>
<!-- viewParameter.jsp -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Map" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<b>request.getParameter() 메서드 사용</b><br>
name 파라미터 = <%= request.getParameter("name") %>
address 파라미터 = <%= request.getParameter("address") %>
<p>
<b>request.getParameter() 메서드 사용</b><br>
<%
  String[] values = request.getParameterValues("pet");
  if(values != null){
    for(int i = 0; i < values.length; i++){
%>
  <%= values[i] %>
<%
    }
  }
%>
<p>
<b>request.getParameterNames()메서드 사용</b><br>
<%
  Enumeration paramEnum = request.getParameterNames();
  while(paramEnum.hasMoreElements()){
    String name = (String)paramEnum.nextElement();
%>
  <%= name %>
<%
  }
%>
<p>
<b>request.getParameterMap() 메서드 사용</b> <br>
<%
  Map parmeterMap = request.getParameterMap();
  String[] nameParam = (String[])parmeterMap.get("name");
  if(nameParam != null){
%>
name = <%= nameParam[0] %>
<%
  }
%>
</p>
</body>
</html>
```
jsp를 이용해 구구단 출력하기
```jsp
<!-- gugudan.jsp -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<form action="gugudan_ok.jsp" method="post">
시작단 : <input type="text" name="startDan"><br>
끝단 : <input type="text" name="endDan"><br>
<input type="submit" value="구구단 출력">
</form>
</body>
</html>

<!-- gugudan_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  request.setCharacterEncoding("utf-8");

  String strStartDan = request.getParameter("startDan");
  String strEndDan = request.getParameter("endDan");
  System.out.println(strStartDan);
  System.out.println(strEndDan);
  
  int startDan = Integer.parseInt(strStartDan);
  int endDan = Integer.parseInt(strEndDan);
  
  StringBuilder sbHtml = new StringBuilder();
  
  sbHtml.append("<table width='800' border='1'>");
  for(int i = startDan; i <= endDan; i++){
    sbHtml.append("<tr>");
    for(int j = 1; j <= 9; j++){
      sbHtml.append("<td>" + i + "X" + j + "=" + i * j + "</td>");
    }
    sbHtml.append("</tr>");
  }
  sbHtml.append("<table>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%= sbHtml.toString() %>
</body>
</html>
```

달력 출력하기
```jsp
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import='java.util.Calendar' %>
<% 
  request.setCharacterEncoding("utf-8");
  
  int year = 0;
  int month = 0;
  StringBuilder sbHTML = new StringBuilder();

  if(request.getParameter("year") != null && request.getParameter("month") != null){
    year = Integer.parseInt(request.getParameter("year"));
    month = Integer.parseInt(request.getParameter("month"));
    System.out.println(year + ":" + month);

    Calendar sDay = Calendar.getInstance();
    Calendar eDay = Calendar.getInstance();

    sDay.set(year, month - 1, 1);
    eDay.set(year, month, 1 - 1);

    int startDayOfWeek = sDay.get(Calendar.DAY_OF_WEEK);
    int endDayOfWeek = eDay.get(Calendar.DAY_OF_WEEK);
    int endDate = eDay.get(Calendar.DATE);

    sbHTML.append("<table width='800' border='1'>");	
    sbHTML.append("<tr>");
    sbHTML.append(String.format("<th colspan='7'>%d년 %d월</th>", year, month));
    sbHTML.append("</tr>");
    sbHTML.append("<tr>");
    sbHTML.append("<th id='sunday'>SUN</th>");
    sbHTML.append("<th>MON</th>");
    sbHTML.append("<th>TUS</th>");
    sbHTML.append("<th>WEN</th>");
    sbHTML.append("<th>THU</th>");
    sbHTML.append("<th>FRI</th>");
    sbHTML.append("<th id='saturday'>SAT</th>");
    sbHTML.append("</tr>");
    sbHTML.append("<tr>");
    for(int i = 1; i < startDayOfWeek; i++){
      sbHTML.append("<td></td>");
    }

    for(int i = 1, n = startDayOfWeek; i <= endDate; i++, n++){
      if(n % 7 == 1){
        sbHTML.append("<tr>");
        sbHTML.append(String.format("<td id='sunday'>%d</td>", i));
      }else if(n % 7 == 0){
        sbHTML.append(String.format("<td id='saturday'>%d</td>", i));
        sbHTML.append("</tr>");
      }else{
        sbHTML.append(String.format("<td>%d</td>", i));
      }
    }

    for(int i = endDayOfWeek; i <= 6; i++){
      sbHTML.append("<td></td>");
    }
    sbHTML.append("</tr>");

    sbHTML.append("</table>");	
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
<form action="calendar.jsp" method='get'>
<input type="text" name="year"> 년	<input type="text" name="month">월	
<input type="submit" value="달력 출력">
</form>


<%
	if(year != 0 && month != 0){
	  out.print("<hr>");
		out.print(sbHTML.toString());
	}
%>
</body>
</html>
```