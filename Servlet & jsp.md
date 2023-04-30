# JSP


- Java 언어를 이용해 동적 웹사이트를 제작하게 하는 프로그램

  - 정적 웹페이지 : 요청할때마다 같은 페이지를 보여준다 

    <sup> ex) html</sup>

  - 동적 웹페이지 : 요청에 따라 다른 페이지를 보여준다  
  
    <sup>ex) 웹프로그램, 라이브러리를 이용</sup>


- 데이터 전송방식
  - get 
    - url에 보내는 데이터가 보인다

    - 개발자가 의도한 방식으로 데이터가 전송된다
    - \<a\>의 데이터 전송 방식

  - post 
    - 데이터가 헤더에 숨겨져 url에 보이지 않는다

    - 사용자의 입력을 기다린 후 데이터가 전송된다
    - \<form\>에서는 주로 post 방식으로 데이터를 전송한다


- java를 이용해 웹 프로그래밍을 할 수 있는 방법

  <small>!! java는 출력을 통해서 문자열을 보여주지만 jsp는 .html / .css / .js 파일을 보여준다</small>

  - sevlet : class를 이용

  - jsp (Java Server Page) : html 문서 작성과 유사한 방법을 이용한다

- WAS (Web Application Server) : 프로그램 해석기가 달린 웹서버

  <sup> ex) apache-tomcat, resin, OC4J, ... </sup>

  |웹프로그램의 종류  | 기본언어 | 플랫폼 | 기타
  |--| --| --|--|
  | jsp/ sevelet| java| 모든 플랫폼| WAS (Web Application Server)|
  |php| php|모든 플랫폼|apache|
  |python|python|모든 플랫폼|자체|
  |js|js|모든 플랫폼|자체|
  |ASP.net|윈도용 언어|윈도우|iis|

- 웹 프로그래밍 실행환경 

  <b>클라이언트(브라우저) &rarr; 요청 &rarr; 서버 + WAS &larr;&rarr; jsp / servlet
  </b>

- 파일 확장자 : .jsp


- 환경 설정
  - 개발 환경 : Window (Mac) + JDK + apache-tomcat + Eclipse(intellij)

  - 서비스 환경 : Linux (Unix) + JDK + apache-tomcat

  <small>!! 개발 환경에서 서비스 환경으로의 배포(deployment)를 위해서는 서비스 환경을 중심으로 jdk, apache-tomcat 버전을 맞춰야한다</small>

- 서버에서 실행할 문서는 src &rarr; main &rarr; webapp 디렉터리에 있어야 한다





- jsp 페이지 내부 
  - directive : jsp문서 전체에 대한 규정 (필수 요소)


    - 디렉티브 이름 
      - page
        - languuage

        - contentType

        - pageEncoding
        - import : java의 라이브러리를 사용할 때 사용한다

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
    - 선언부  

    ```jsp
    <%! 멤버필드, 메서드 선언%>
    ```

    - scriptlet : java 소스
    ```jsp
    <% java 소스 %>
    ```
    - expression : 출력 부분
    ```jsp
    <%= 출력 %>
    ```
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


## JSP 기본

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
  // get 방식과 달리 post 방식은 한글이 깨진 상태로 전송되는데 위의 전처리 구문을 적어주면 한글이 깨지지 않는다 
  // get 방식 post 방식 모두 위의 전처리 구문을 적어주자!!
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
##### 구구단 출력하기
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

##### 달력 출력하기
<small>!! 되도록이면 html 문서와 java 소스가 분리되도록 코딩해서 관리하기 쉽게 만들자</small>

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
!! 자바스크립트를 이용해 전송값의 유효성 검사를 할 수 있다
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function(){
      alert('버튼 클릭');
      if(document.frm.year.value.trim() == ''){
        alert('년도를 입력해주세요');
        return;
      }
      if(document.frm.month.value.trim() == ''){
        alert('월을 입력해주세요');
        return;
      } 
      if(Number(document.frm.month.value) < 0 || Number(document.frm.month.value) > 12){
        alert('월 값을 확인해 주세요');
        return;
      } 
      document.frm.submit();
      // 버튼에 전송 기능을 준다
    };
  }
</script>
</head>
<body>
<form action="calendar_ok.jsp" method="get" name='frm'>
연도 : <input type="text" name="year"	>
월 : <input type="text" name="month">
<input type="button" id='btn' value="달력 출력">
</form>
</body>
</html>

<!-- calendar_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
  request.setCharacterEncoding("utf-8");
  int year = Integer.parseInt(request.getParameter("year"));
  int month = Integer.parseInt(request.getParameter("month"));

  Calendar startDay = Calendar.getInstance();
  Calendar endDay = Calendar.getInstance();

  startDay.set(year, month - 1, 1);
  endDay.set(year, month, 1-1);

  int startDayOfWeek = startDay.get(Calendar.DAY_OF_WEEK);
  int endDayOfWeek = endDay.get(Calendar.DAY_OF_WEEK);
  int endDayDate = endDay.get(Calendar.DATE);

  StringBuilder sbHtml = new StringBuilder();

  sbHtml.append("<table width='800', border='1'>");
  sbHtml.append("<tr>");
  sbHtml.append("<td colspan=7>" + year + "년 " + month + "월</td>");
  sbHtml.append("</tr>");
  sbHtml.append("<tr>");
  sbHtml.append("<td id='sunday'>일</td>");
  sbHtml.append("<td>월</td>");
  sbHtml.append("<td>화</td>");
  sbHtml.append("<td>수</td>");
  sbHtml.append("<td>목</td>");
  sbHtml.append("<td>금</td>");
  sbHtml.append("<td id='saturday'>토</td>");
  sbHtml.append("</tr>");
  sbHtml.append("<tr>");
  for(int i = 1; i < startDayOfWeek; i++){
    sbHtml.append("<td></td>");
  }
  for(int i = 1, n = startDayOfWeek; i <= endDayDate; i++, n++){
    if(n % 7 == 0){
      sbHtml.append("<td id='saturday'>" + i + "</td>");
      sbHtml.append("</tr>");
    }else if(n % 7 == 1){
      sbHtml.append("<tr>");
      sbHtml.append("<td id='sunday'>" + i + "</td>");
    }else {
      sbHtml.append("<td>" + i + "</td>");
    }
  }
  for(int i = endDayOfWeek; i <= 6; i++){
    sbHtml.append("<td></td>");
  }
  sbHtml.append("</tr>");
  sbHtml.append("</table>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  #sunday{
    color : red;
  }
  #saturday{
    color : blue;
  }
</style>
<title>Insert title here</title>
</head>
<body>
<%= sbHtml.toString() %>
</body>
</html>
```

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="calendar_ok.jsp" method='post'>
년도	
<select name='year'>
<option value='2022'> 2022년	</option>	
<option value='2023' selected> 2023년 </option>	
<option value='2024'> 2024년	</option>	
</select>
월
<select name='month'>
  <option value='1' selected> 1월 </option>
  <option value='2'> 2월 </option>
  <option value='3'> 3월 </option>
  <option value='4'> 4월 </option>
  <option value='5'> 5월 </option>
  <option value='6'> 6월 </option>
  <option value='7'> 7월 </option>
  <option value='8'> 8월 </option>
  <option value='9'> 9월 </option>
  <option value='10'> 10월 </option>
  <option value='11'> 11월 </option>
  <option value='12'> 12월 </option>
</select>
<input type='submit' value='달력 보기'>
</form>
</body>
</html>

<!-- calendar_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
  request.setCharacterEncoding("utf-8");
  int year = Integer.parseInt(request.getParameter("year"));
  int month = Integer.parseInt(request.getParameter("month"));

  Calendar startDay = Calendar.getInstance();
  Calendar endDay = Calendar.getInstance();

  startDay.set(year, month - 1, 1);
  endDay.set(year, month, 1-1);

  int startDayOfWeek = startDay.get(Calendar.DAY_OF_WEEK);
  int endDayOfWeek = endDay.get(Calendar.DAY_OF_WEEK);
  int endDayDate = endDay.get(Calendar.DATE);

  StringBuilder sbHtml = new StringBuilder();

  sbHtml.append("<table width='800', border='1'>");
  sbHtml.append("<tr>");
  sbHtml.append("<td colspan=7>" + year + "년 " + month + "월</td>");
  sbHtml.append("</tr>");
  sbHtml.append("<tr>");
  sbHtml.append("<td id='sunday'>일</td>");
  sbHtml.append("<td>월</td>");
  sbHtml.append("<td>화</td>");
  sbHtml.append("<td>수</td>");
  sbHtml.append("<td>목</td>");
  sbHtml.append("<td>금</td>");
  sbHtml.append("<td id='saturday'>토</td>");
  sbHtml.append("</tr>");
  sbHtml.append("<tr>");
  for(int i = 1; i < startDayOfWeek; i++){
    sbHtml.append("<td></td>");
  }
  for(int i = 1, n = startDayOfWeek; i <= endDayDate; i++, n++){
    if(n % 7 == 0){
      sbHtml.append("<td id='saturday'>" + i + "</td>");
      sbHtml.append("</tr>");
    }else if(n % 7 == 1){
      sbHtml.append("<tr>");
      sbHtml.append("<td id='sunday'>" + i + "</td>");
    }else {
      sbHtml.append("<td>" + i + "</td>");
    }
  }
  for(int i = endDayOfWeek; i <= 6; i++){
    sbHtml.append("<td></td>");
  }
  sbHtml.append("</tr>");
  sbHtml.append("</table>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
  #sunday{
    color : red;
  }
  #saturday{
    color : blue;
  }
</style>
<title>Insert title here</title>
</head>
<body>
<%= sbHtml.toString() %>
</body>
</html>
```

### JDBC와 연동하기
- 스크립틀릿을 이용해 java 프로그램에서처럼 JDBC와 연동이 가능하다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='java.sql.DriverManager' %>
<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  String url = "jdbc:mariadb://localhost:3306/sample";
  String user = "root";
  String password = "123456";

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
  Class.forName("org.mariadb.jdbc.Driver");
  conn = DriverManager.getConnection(url, user, password);

  String sql = "select * from dept";
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();

  out.print("<table width=800 border=1>");
  out.print("<tr>");
  out.print("<th>");
  out.print("부서번호");
  out.print("</th>");
  out.print("<th>");
  out.print("부서이름");
  out.print("</th>");
  out.print("<th>");
  out.print("지역");
  out.print("</th>");
  out.print("</tr>");
  while(rs.next()){
    out.print("<tr>");
    out.print("<td>");
    out.print(rs.getString("deptno"));
    out.print("</td>");
    out.print("<td>");
    out.print(rs.getString("dname"));
    out.print("</td>");
    out.print("<td>");
    out.print(rs.getString("loc"));
    out.print("</td>");
    out.print("</tr>");
  }
    out.print("</table>");

  }catch(ClassNotFoundException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(pstmt != null) pstmt.close();
    if(rs != null) rs.close();
    if(conn != null) conn.close();
  }
%>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='java.sql.DriverManager' %>
<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>
<%
  String url = "jdbc:mariadb://localhost:3306/sample";
  String user = "root";
  String password = "123456";

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  StringBuilder sbHTML = new StringBuilder();

  try{
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    String sql = "select * from dept";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    sbHTML.append("<table width=800 border=1>");
    sbHTML.append("<tr>");
    sbHTML.append("<th>");
    sbHTML.append("부서번호");
    sbHTML.append("</th>");
    sbHTML.append("<th>");
    sbHTML.append("부서이름");
    sbHTML.append("</th>");
    sbHTML.append("<th>");
    sbHTML.append("지역");
    sbHTML.append("</th>");
    sbHTML.append("</tr>");
    while(rs.next()){
      sbHTML.append("<tr>");
      sbHTML.append(String.format("<td>%s</td>", rs.getString("deptno")));
      sbHTML.append(String.format("<td>%s</td>", rs.getString("dname")));
      sbHTML.append(String.format("<td>%s</td>", rs.getString("loc")));
      sbHTML.append("</tr>");
  }

  }catch(ClassNotFoundException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(pstmt != null) pstmt.close();
    if(rs != null) rs.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= sbHTML.toString() %>
</body>
</html>
```
- jsp를 이용한 우편번호 검색기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='java.sql.SQLException' %>
<%@ page import='java.sql.DriverManager' %>
<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%
  request.setCharacterEncoding("utf-8");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  StringBuilder sbHTML = new StringBuilder(); 

  if(request.getParameter("dongName") != null){
    String url = "jdbc:mariadb://localhost:3306/project";
    String user = "root";
    String password = "123456";

    String dongName = request.getParameter("dongName");

    try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);

      String sql = "select * from zipcode where dong like ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dongName + "%");
      rs = pstmt.executeQuery();

      sbHTML.append("<table width=800 border=1>");
      sbHTML.append("<tr>");
      sbHTML.append(String.format("<th>우편번호</th>"));
      sbHTML.append(String.format("<th>시도</th>"));
      sbHTML.append(String.format("<th>구군</th>"));
      sbHTML.append(String.format("<th>동</th>"));
      sbHTML.append(String.format("<th>리</th>"));
      sbHTML.append(String.format("<th>번지</th>"));
      sbHTML.append("</tr>");
      while(rs.next()){
        sbHTML.append("<tr>");
        sbHTML.append(String.format("<td>%s</td>", rs.getString("zipcode")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("sido")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("gugun")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("dong")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("ri")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("bunji")));
        sbHTML.append("</tr>");
      }
      sbHTML.append("</table>");
    }catch(ClassNotFoundException e){
      System.out.println("에러 : " + e.getMessage()	);
    }catch(SQLException e){
      System.out.println("에러 : " + e.getMessage());
    }finally{
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(conn != null) conn.close();
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="postSearch.jsp" method='post'>
  <fieldset>
    <legend>우편번호 검색</legend>
    <label for="dongName">동이름 입력</label>
    <input type='text' id="dongName" name="dongName" size='40' placeholder="동이름 입력">
    <input type='submit' id= 'btn' value="우편번호 검색">
  </fieldset>
</form>
<%= sbHTML%>
</body>
</html>
```
#### 데이터베이스 풀링

- 미리 만들어 놓은 데이터베이스와의 연결을 사용하는 것

- 데이터베이스 풀링 사용 순서

  <small> !! tomcat 시작시 풀링 생성 &rarr; JNDI &rarr; 프로그램으로 접근해서 사용</small>
  
- JNDI (Java Naming Directory Interface) 설정 방법

  <small>webapp &rarr; META-INF &rarr; context.xml 파일 생성</small>
```xml
<!-- context.xml -->
<?xml version="1.0" encoding="utf-8" ?>
<Context>
  <Resource name="jdbc/mariadb1"
            auth="Container"
            <!-- "Container"를 자원관리자로 한다 -->
            type="javax.sql.DataSource"
            driverClassName="org.mariadb.jdbc.Driver"
            url="jdbc:mariadb://localhost:3306/sample"
            username="root"
            password="123456"/>
  <Resource name="jdbc/mariadb2"
            auth="Container"
            type="javax.sql.DataSource"
            driverClassName="org.mariadb.jdbc.Driver"
            url="jdbc:mariadb://localhost:3306/project"
            username="project"
            password="1234"/>
<!-- sample, project 데이터베이스에 접근할 수 있는 풀 생성 -->
<!-- 대소문자에 주의하자 -->
</Context>
```
- 커넥션 풀에 있는 데이터베이스 풀 사용하기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;  
  
  try{
  Context initCtx = new InitialContext();
  Context envCtx = (Context)initCtx.lookup("java:comp/env");
  // "java:comp/env"는 자바 실행 환경을 의미한다
  DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb1");
  conn = dataSource.getConnection();
  System.out.println("데이터베이스 연결 성공");

  String sql = "select * from dept";
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();
  while(rs.next()){
    out.print(String.format("%s %s %s<br>", rs.getString("deptno"), rs.getString("dname"), rs.getString("loc")));
  }
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(conn != null) conn.close();
  }
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
!! 데이터 풀링을 이용한 우편번호 검색기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>
<%@ page import='javax.sql.DataSource' %>
<%@ page import='java.sql.SQLException' %>
<%@ page import='java.sql.DriverManager' %>
<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%
  request.setCharacterEncoding("utf-8");
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  StringBuilder sbHTML = new StringBuilder(); 
  String dongName = request.getParameter("dongName");
  if(request.getParameter("dongName") != null){
    try{
      Context initCtx = new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2"); 
      conn = dataSource.getConnection();
      String sql = "select * from zipcode where dong like ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dongName + "%");
      rs = pstmt.executeQuery();  
      sbHTML.append("<table width=800 border=1>");
      sbHTML.append("<tr>");
      sbHTML.append(String.format("<th>우편번호</th>"));
      sbHTML.append(String.format("<th>시도</th>"));
      sbHTML.append(String.format("<th>구군</th>"));
      sbHTML.append(String.format("<th>동</th>"));
      sbHTML.append(String.format("<th>리</th>"));
      sbHTML.append(String.format("<th>번지</th>"));
      sbHTML.append("</tr>");
      while(rs.next()){
        sbHTML.append("<tr>");
        sbHTML.append(String.format("<td>%s</td>", rs.getString("zipcode")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("sido")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("gugun")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("dong")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("ri")));
        sbHTML.append(String.format("<td>%s</td>", rs.getString("bunji")));
        sbHTML.append("</tr>");
      }
      sbHTML.append("</table>");
    }catch(NamingException e){
      System.out.println("에러 : " + e.getMessage()	);
    }catch(SQLException e){
      System.out.println("에러 : " + e.getMessage());
    }finally{
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(conn != null) conn.close();
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="PostSearch.jsp" method='post'>
  <fieldset>
    <legend>우편번호 검색</legend>
    <label for="dongName">동이름 입력</label>
    <input type='text' id="dongName" name="dongName" size='40' placeholder="동이름 입력">
    <input type='submit' id= 'btn' value="우편번호 검색">
  </fieldset>
</form>
<%= sbHTML%>
</body>
</html>
```

## 웹 프로그램 기획
- 디자인 기획
  - html / css / js 를 이용해 페이지 간의 링크까지 구현한다

- 프로그램 기획
  - 디자인 기획을 기준으로 프로그램화 한다

  - UML
  - ERD

  - DFD (Data Flow Diagram)

      - 페이지 사이의 흐름

      - 페이지 내부의 흐름(알고리즘)

        <small> https://terms.naver.com/entry.naver?docId=3532935&cid=58528&categoryId=58528 참조</small>


### CRUD 게시판 만들기

- 기본 테이블 생성 구문
```sql
create table board1(
  seq int not null primary key auto_increment,
  subject varchar(150) not null,
  writer varchar(12) not null,
  mail varchar(50),
  password varchar(12) not null,
  content varchar(2000),
  hit int not null,
  wip varchar(15) not null,
  wdate datetime not null
);
```
- 기본 디자인

```jsp
<!-- board_list1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
      <tr>
        <td>&nbsp;</td>
        <td>1</td>
        <td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img src="../../images/icon_new.gif" alt="NEW"></td>
        <td>asdfa</td>
        <td>2017-01-31</td>
        <td>6</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>1</td>
        <td class="left"><a href="board_view1.jsp">adfas</a>&nbsp;<img src="../../images/icon_new.gif" alt="NEW"></td>
        <td>asdfa</td>
        <td>2017-01-31</td>
        <td>6</td>
        <td>&nbsp;</td>
      </tr>
      </table>
    </div>	  
    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_write.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_menu"></div>
<div class="con_txt">
  <form action="" method="post" name="">
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
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_view1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
        <td width="60%">제목입니다.</td>
        <th width="10%">등록일</th>
        <td width="20%">2017.01.31 09:57</td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td>작성자(test@test.com)(000.000.000.000)</td>
        <th>조회</th>
        <td>3</td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%">내용입니다.</td>
      </tr>
      </table>
    </div>  
    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_modify1.jsp'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_delete1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="" method="post" name="">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>

      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_modify1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="" method="post" name="">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" readonly/></td>
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
      </div>

      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
#### 기본 게시판

- board1 테이블 컬럼 정의

  - 번호 : seq int not null primary key auto_increment

  - 제목 : subject varchar(150) not null 
  - 글쓴이 : writer varchar(12) not null
  - 비밀번호 : password varchar(12) not null
  - 내용 : content varchar(2000) 
  - 이메일 : email varchar(50) 
  - 조회수 : hit int not null
  - 등록일 : wdate datetime not null
  - 아이피 : wip varchar(15) not null

- 페이지 흐름 (page navigation)
  - 테이블 명
    - 글 목록 : board_list1.jsp

    - 글 작성 : board_write1.jsp
    - 글 자세히 보기 : board_view1.jsp
    - 글 수정 : board_modify1.jsp
    - 글 삭제 : board_delete1.jsp

  - 흐름도
    - board_list1.jsp

        - board_write1.jsp
          - board_write_ok1.jsp : 데이터베이스에 작성한 글을 저장하는 페이지 (입력 내용)

            - board_list1.jsp

        - board_view1.jsp (seq)
          - board_modify1.jsp (seq)

            - board_modify1_ok.jsp : 수정한 글을 저장하는 페이지 (seq, 수정 내용)

              - board_view1.jsp (seq)

          - board_delete1.jsp (seq)
            - board_delete1_ok.jsp (seq, 비밀번호)

              - board_list1.jsp

- 암호화
  - 비밀번호를 암호화 시켜줘야 한다
  
  - java 또는 mariadb를 이용해 암호화 시킨다
  - 기법 : md5, sha, ...

```java
MariaDB [board]> select '1234', password('1234');
+------+-------------------------------------------+
| 1234 | password('1234')                          |
+------+-------------------------------------------+
| 1234 | *A4B6157319038724E3560894F7F932C8886EBFCF |
+------+-------------------------------------------+
1 row in set (0.008 sec)

MariaDB [board]> select '1234', md5('1234');      
+------+----------------------------------+
| 1234 | md5('1234')                      |
+------+----------------------------------+
| 1234 | 81dc9bdb52d04dc20036dbd8313ed055 |
+------+----------------------------------+
1 row in set (0.009 sec)

MariaDB [board]> select '1234', md5('1234'), length(md5('1234'));
+------+----------------------------------+---------------------+
| 1234 | md5('1234')                      | length(md5('1234')) |
+------+----------------------------------+---------------------+
| 1234 | 81dc9bdb52d04dc20036dbd8313ed055 |                  32 |
+------+----------------------------------+---------------------+
1 row in set (0.000 sec)

MariaDB [board]> select '12345', md5('12345'), length(md5('12345')); 
+-------+----------------------------------+----------------------+
| 12345 | md5('12345')                     | length(md5('12345')) |
+-------+----------------------------------+----------------------+
| 12345 | 827ccb0eea8a706c4c34a16891f84e7b |                   32 |
+-------+----------------------------------+----------------------+
1 row in set (0.000 sec)
```

- 구현하기

  <small>!! 구현의 시작은 글쓰기 페이지부터 하는 것이 좋다</small>
```jsp
<!-- board_write1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('wbtn').onclick = function() {
      // alert('click');
      if(document.wfrm.info.checked == false){
        alert("개인정보 이용에 동의해주세요");
        return false;
      }
      if(document.wfrm.writer.value.trim() == ''){
        alert("글쓴이를 입력해주세요");
        return false;
      }
      if(document.wfrm.subject.value.trim() == ''){
        alert("제목을 입력해주세요");
        return false;
      }
      if(document.wfrm.password.value.trim() == ''){
        alert("비밀번호를 입력해주세요");
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
  <form action="board_write1_ok.jsp" method="post" name="wfrm">
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
          <	d><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
        </t	
        </t	bl			
        <tabl		
        <tr	
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
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" id='wbtn' value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```

```jsp
<!-- board_write1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<% 
  request.setCharacterEncoding("utf-8");

  String subject = request.getParameter("subject");
  String writer = request.getParameter("writer");
  String password = request.getParameter("password");
  String email = "";
  if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  String content = request.getParameter("content");
  String wip = request.getRemoteAddr(); // 클라이언트의 ip를 반환한다
  
  /*
  System.out.println(subject);
  System.out.println(writer);
  System.out.println(password);
  System.out.println(email);
  System.out.println(content);
  System.out.println(wip);
  */
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  int flag = 1; 
  // 0 이면 정상 1이면 에러를 나타내는 변수 선언 및 초기화
  
  try{
    Context initCtx = new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "insert into board1 values (0, ?, ?, ?, ?, ?, 0, now(), ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, subject);
    pstmt.setString(2, writer);
    pstmt.setString(3, password);
    pstmt.setString(4, content);
    pstmt.setString(5, email);
    pstmt.setString(6, wip);
    
    int result = pstmt.executeUpdate();
    if(result == 1){
      System.out.println("성공");
      flag = 0;
    }else{
      System.out.println("실패");
    }
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  // 페이지 이동을 위해 javascript를 사용한다
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공');");
    out.println("location.href='board_list1.jsp';");
  }else{
    out.println("alert('글쓰기 실패')");
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
```jsp
<!-- board_list1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  
  StringBuilder sbHTML = new StringBuilder();
  
  int count = 0;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env")
        ;
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";
    
    pstmt = conn.prepareStatement(sql);
    
    rs = pstmt.executeQuery();
    
    rs.last();
    // 커서를 마지막으로 이동시킨다
    count = rs.getRow();
    // 커서가 가리키는 행의 값을 저장시킨다
    rs.beforeFirst();
    // 커서를 제일 처음의 상태로 되돌린다
    
    while(rs.next()){
      String seq = rs.getString("seq");
      String subject = rs.getString("subject");
      String writer = rs.getString("writer");
      String wdate = rs.getString("wdate");
      String hit = rs.getString("hit");
      
      int wgap = rs.getInt("wgap");
       
      sbHTML.append("<tr>");
      sbHTML.append("<td>&nbsp;</td>");
      sbHTML.append("<td>" + seq + "</td>");
      sbHTML.append("<td class='left'>");
      sbHTML.append("<a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>");
      if(wgap ==0){
        sbHTML.append("&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>");
      }
      sbHTML.append("</td>");
      sbHTML.append("<td>" + writer + "</td>");
      sbHTML.append("<td>" + wdate + "</td>");
      sbHTML.append("<td>" + hit + "</td>");
      sbHTML.append("<td>&nbsp;</td>");
      sbHTML.append("</tr>");

    }
    
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
      <div class="bold">총 <span class="txt_orange"><%= count %></span>건</div>
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
      <%= sbHTML %>
      </table>
    </div>	

    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_view1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%
  request.setCharacterEncoding("utf-8");

  String seq = request.getParameter("seq");
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  String subject = "";
  String writer = "";
  String mail = "";
  String wip = "";
  String wdate = "";
  String hit = "";
  String content = "";
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "update board1 set hit=hit+1 where seq=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    
    pstmt.executeUpdate();
    // 조회수 증가
    
    sql = "select subject, writer, wip, email, hit, content, wdate from board1 where seq=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    
    rs = pstmt.executeQuery();
    if(rs.next()){
      subject = rs.getString("subject");
      writer = rs.getString("writer");
      mail = rs.getString("email");
      wip = rs.getString("wip");
      wdate = rs.getString("wdate");
      hit = rs.getString("hit");
      content = rs.getString("content").replaceAll("\n", "<br>");
      // 줄 바꿈을 위해서 엔터키를 <br>태그로 바꾼다
    }
    
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage()); 
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage()); 
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
        <td width="60%"><%= subject %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= wdate %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= String.format("%s(%s)(%s)", writer, mail, wip) %></td>
        <th>조회</th>
        <td><%= hit %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= content %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
      </div>
      <div class="align_right">
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_modify1.jsp?seq=<%= seq %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp?seq=<%= seq %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_delete1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<% 
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  System.out.println(seq);
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  String subject = "";
  String writer = "";
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select subject, writer from board1 where seq=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    
    rs = pstmt.executeQuery();
    if(rs.next()){
      subject = rs.getString("subject");
      writer = rs.getString("writer");
    }
    
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage()); 
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage()); 
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("dbtn").onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert("비밀번호를 입력하셔야 합니다");
        return false;
      }
      docoument.dfrm.submit();
    }
  }
</script>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="board_delete1_ok.jsp" method="post" name="dfrm">
    <input type='hidden' name="seq" value="<%= seq %>">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= writer %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= subject %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" id='dbtn' value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>
```
```jsp
<!-- board_delete1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  String password = request.getParameter("password");
  

  System.out.println(seq);
  System.out.println(password);

  
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  int flag = 2;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "delete from board1 where seq = ? and password= ?";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    pstmt.setString(2, password);
    
    int result = pstmt.executeUpdate();
    
    if(result == 1){
      flag = 0;
    }else if(result == 0 ){
      flag = 1;
      // 비밀번호가 틀린 경우
    }
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage()); 
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage()); 
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글삭제 성공');");
    out.println("location.href='board_list1.jsp';");
  }else if(flag == 1){
    out.println("alert('비밀번호 오류');");
    out.println("history.back();");
  }else{
    out.println("alert('글삭제에 실패');");
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
```jsp
<!-- board_modify1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>

<%
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  String writer = "";
  String subject = "";
  String content = "";
  String email1 = "";
  String email2 = "";
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from board1 where seq = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
      writer = rs.getString("writer");
      subject = rs.getString("subject");
      content = rs.getString("content");
      String[] emailArr = null;
      if(rs.getString("email").equals("")){
        emailArr = new String[]{"", ""};
      }else{
        emailArr = rs.getString("email").split("@");
        email1 = emailArr[0];
        email2 = emailArr[1];
      }
    }
    
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('mbtn').onclick = function() {
      if(document.mfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      if(document.mfrm.password.value.trim() == ''){
        alert('비밀번호를 입력해주세요');
        return false;
      }
      document.mfrm.submit();
    };
  };
</script>
<body>
<!-- 상단 디자인 -->
<div class="con_title">
  <h3>게시판</h3>
  <p>HOME &gt; 게시판 &gt; <strong>게시판</strong></p>
</div>
<div class="con_txt">
  <form action="board_modify1_ok.jsp" method="post" name="mfrm">
    <input type='hidden' name='seq' value='<%= seq %>'>
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= writer %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= subject %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= content %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= email1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= email2 %>" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" id='mbtn' value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->
```
```jsp
<!-- board_modify1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  String subject = request.getParameter("subject");
  String email = "";
  if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  String password = request.getParameter("password");
  String content = request.getParameter("content");
  
  Connection conn = null;
  PreparedStatement pstmt = null;

  int flag = 2;

  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "update board1 set subject=?, content=? where seq=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, subject);
    pstmt.setString(2, content);
    pstmt.setString(3, seq);
    pstmt.setString(4, password);
    
    int result = pstmt.executeUpdate();
    
    if(result == 1){
      flag = 0;
    }else if(result == 0){
      flag = 1;
    }
    
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage()); 
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage()); 
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='board_view1.jsp?seq=" + seq + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호 오류');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정에 실패');");
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
#### 이모티콘이 포함된 게시판
- emot_table 컬럼 정의

  - 번호 : seq int not null primary key auto_increment

  - 제목 : subject varchar(150) not null 
  - 글쓴이 : writer varchar(12) not null
  - 비밀번호 password varchar(12) not null
  - 내용 : content varchar(2000) 
  - 이메일 : email varchar(50) 
  - 조회수 : hit int not null
  - 등록일 : wdate datetime not null
  - 아이피 : wip varchar(15) not null
  - 이모티콘 : emot char(2) not null  

- 이모티콘 포함된 게시판 구현하기
```jsp
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
<link rel="stylesheet" type="text/css" href="../../css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('wbtn').onclick = function() {
      if(document.wfrm.info.checked == false){
        alert('개인정보 수집에 동의해주세요');
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
<div class="con_txt">
  <form action="board_write_ok.jsp" method="post" name="wfrm">
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
        <tr>
          <th>이모티콘</th>
          <td align="center">
            <table>
            <tr>
              <td>
                <img src="../../images/emoticon/emot01.png" width="25"/><br />
                <input type="radio" name="emot" value="emot01" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot02.png" width="25" /><br />
                <input type="radio" name="emot" value="emot02" class="input_radio" checked="checked"/>
              </td>
              <td>
                <img src="../../images/emoticon/emot03.png" width="25" /><br />
                <input type="radio" name="emot" value="emot03" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot04.png" width="25" /><br />
                <input type="radio" name="emot" value="emot04" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot05.png" width="25" /><br />
                <input type="radio" name="emot" value="emot05" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot06.png" width="25" /><br />
                <input type="radio" name="emot" value="emot06" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot07.png" width="25" /><br />
                <input type="radio" name="emot" value="emot07" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot08.png" width="25" /><br />
                <input type="radio" name="emot" value="emot08" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot09.png" width="25" /><br />
                <input type="radio" name="emot" value="emot09" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot10.png" width="25" /><br />
                <input type="radio" name="emot" value="emot10" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot11.png" width="25"/><br />
                <input type="radio" name="emot" value="emot11" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot12.png" width="25" /><br />
                <input type="radio" name="emot" value="emot12" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot13.png" width="25" /><br />
                <input type="radio" name="emot" value="emot13" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot14.png" width="25" /><br />
                <input type="radio" name="emot" value="emot14" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot15.png" width="25" /><br />
                <input type="radio" name="emot" value="emot15" class="input_radio" />
              </td>
            </tr>
            <tr>
              <td>
                <img src="../../images/emoticon/emot16.png" width="25"/><br />
                <input type="radio" name="emot" value="emot16" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot17.png" width="25" /><br />
                <input type="radio" name="emot" value="emot17" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot18.png" width="25" /><br />
                <input type="radio" name="emot" value="emot18" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot19.png" width="25" /><br />
                <input type="radio" name="emot" value="emot19" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot20.png" width="25" /><br />
                <input type="radio" name="emot" value="emot20" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot21.png" width="25" /><br />
                <input type="radio" name="emot" value="emot21" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot22.png" width="25" /><br />
                <input type="radio" name="emot" value="emot22" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot23.png" width="25" /><br />
                <input type="radio" name="emot" value="emot23" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot24.png" width="25" /><br />
                <input type="radio" name="emot" value="emot24" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot25.png" width="25"/><br />
                <input type="radio" name="emot" value="emot25" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot26.png" width="25" /><br />
                <input type="radio" name="emot" value="emot26" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot27.png" width="25" /><br />
                <input type="radio" name="emot" value="emot27" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot28.png" width="25" /><br />
                <input type="radio" name="emot" value="emot28" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot29.png" width="25" /><br />
                <input type="radio" name="emot" value="emot29" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot30.png" width="25" /><br />
                <input type="radio" name="emot" value="emot30" class="input_radio" />
              </td>
            </tr>
            <tr>
              <td>
                <img src="../../images/emoticon/emot31.png" width="25"/><br />
                <input type="radio" name="emot" value="emot31" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot32.png" width="25" /><br />
                <input type="radio" name="emot" value="emot32" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot33.png" width="25" /><br />
                <input type="radio" name="emot" value="emot33" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot34.png" width="25" /><br />
                <input type="radio" name="emot" value="emot34" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot35.png" width="25" /><br />
                <input type="radio" name="emot" value="emot35" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot36.png" width="25" /><br />
                <input type="radio" name="emot" value="emot36" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot37.png" width="25" /><br />
                <input type="radio" name="emot" value="emot37" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot38.png" width="25" /><br />
                <input type="radio" name="emot" value="emot38" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot39.png" width="25" /><br />
                <input type="radio" name="emot" value="emot39" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot40.png" width="25"/><br />
                <input type="radio" name="emot" value="emot40" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot41.png" width="25" /><br />
                <input type="radio" name="emot" value="emot41" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot42.png" width="25" /><br />
                <input type="radio" name="emot" value="emot42" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot43.png" width="25" /><br />
                <input type="radio" name="emot" value="emot43" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot44.png" width="25" /><br />
                <input type="radio" name="emot" value="emot44" class="input_radio" />
              </td>
              <td>
                <img src="../../images/emoticon/emot45.png" width="25" /><br />
                <input type="radio" name="emot" value="emot45" class="input_radio" />
              </td>
            </tr>
            </table>
          </td>
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
              <input type="checkbox" id='info' name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
            </div>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
        </div>
        <div class="align_right">
          <input type="submit" id='wbtn' value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

```

```jsp
<!-- board_write_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.SQLException' %>

<%
  request.setCharacterEncoding("utf-8");
  
  String writer = request.getParameter("writer");
  String subject = request.getParameter("subject");
  String password = request.getParameter("password");
  String content = request.getParameter("content");
  String email = "";
  if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  String emot = request.getParameter("emot").substring(4);
  String wip = request.getRemoteAddr();
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  int flag = 1;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "insert into emot_table values(0, ?, ?, ?, ?, ?, ?, 0, now(), ?)";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, subject);
    pstmt.setString(2, writer);
    pstmt.setString(3, password);
    pstmt.setString(4, content);
    pstmt.setString(5, emot);
    pstmt.setString(6, email);
    pstmt.setString(7, wip);
    
    int result = pstmt.executeUpdate();
    
    if(result == 1){
      flag = 0;
    }
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  System.out.println(flag);
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글쓰기 성공')");	
    out.println("location.href='board_list1.jsp'");	
  }else{
    out.println("alert('글쓰기 실패')");
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
```

```jsp
<!-- board_list1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>

<% 
  request.setCharacterEncoding("utf-8");

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  StringBuilder sbHTML = new StringBuilder();
  
  int count = 0;
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select emot, seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from emot_table";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    while(rs.next()){
      count++;
      String emot = rs.getString("emot");
      String seq = rs.getString("seq");
      String subject = rs.getString("subject");
      String writer = rs.getString("writer");
      String wdate = rs.getString("wdate");
      String hit = rs.getString("hit");
      
      int wgap = rs.getInt("wgap");
      
      sbHTML.append("<tr>");
      sbHTML.append("<td><img src='../../images/emoticon/emot" + emot + ".png' width='15'/></td>");
      sbHTML.append("<td>" + seq + "</td>");
      sbHTML.append("<td class='left'><a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>");
      if(wgap == 0){
        sbHTML.append("&nbsp;<img src='../../images/icon_new.gif' alt='NEW'></td>");
      }
      sbHTML.append("<td>" + writer + "</td>");
      sbHTML.append("<td>" + wdate + "</td>");
      sbHTML.append("<td>" + hit + "</td>");
      sbHTML.append("<td>&nbsp;</td>");
      sbHTML.append("</tr>");
    }
  
  }catch(NamingException e){
    System.out.println("에러 : "  + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
      <div class="bold">총 <span class="txt_orange"><%= count %></span>건</div>
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
      
      <%= sbHTML %>

      </table>
    </div>	
    <div class="btn_area">
      <div class="align_right">
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>
    <!--//게시판-->
  </div>
</div>
<!--//하단 디자인 -->

</body>
</html>

```

```jsp
<!-- board_view1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>

<%
  request.setCharacterEncoding("utf-8");

  String seq = request.getParameter("seq");
  String emot = "";
  String subject = "";
  String writer = "";
  String email = "";
  String wdate = "";
  String wip = "";
  String hit = "";
  String content = "";
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from emot_table where seq=?";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    
    rs = pstmt.executeQuery();
    
    if(rs.next()){
      emot = rs.getString("emot");
      subject = rs.getString("subject");
      writer = rs.getString("writer");
      wdate = rs.getString("wdate");
      email = rs.getString("email");
      wip = rs.getString("wip");
      hit = rs.getString("hit");
      content = rs.getString("content").replaceAll("\n", "<br>");
    }
    
  }catch(NamingException e){
    System.out.println("에러 : "  + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : "  + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
        <td width="60%">(<img src="../../images/emoticon/emot<%= emot %>.png" width="15"/>)&nbsp;<%= subject %></td>
        <th width="10%">등록일</th>
        <td width="20%"><%= wdate %></td>
      </tr>
      <tr>
        <th>글쓴이</th>
        <td><%= writer %>(<%= email %>)(<%= wip %>)</td>
        <th>조회</th>
        <td><%= hit %></td>
      </tr>
      <tr>
        <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%= content %></td>
      </tr>
      </table>
    </div>

    <div class="btn_area">
      <div class="align_left">
        <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
      </div>
      <div class="align_right">
        <input type='hidden' name='seq' value='<%= seq %>'>
        <input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_modify1.jsp?seq=<%=seq %>'" />
        <input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp?seq=<%=seq %>'" />
        <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
      </div>
    </div>	
    <!--//게시판-->
  </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>

```

```jsp
<!-- board_delete1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>

<%
  request.setCharacterEncoding("utf-8");

  String seq = request.getParameter("seq");
  String writer = "";
  String subject = "";
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from emot_table where seq = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
      writer = rs.getString("writer");
      subject = rs.getString("subject");
    }
    
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage()	);
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.dfrm.delbtn.onclick = function() {
      if(document.dfrm.password.value.trim() == ''){
        alert("비밀번호를 입력해주세요");
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
  <form action="board_delete1_ok.jsp" method="post" name="dfrm">
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= writer %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= subject %>" class="board_view_input" readonly/></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type='hidden' name='seq' value='<%= seq %>'>
          <input type="button" name='delbtn' value="삭제" class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

```

```jsp
<!-- board_delete1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.SQLException' %>

<%
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  String password = request.getParameter("password");
    
  Connection conn = null;
  PreparedStatement pstmt = null;
  
  int flag = 2;
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "delete from emot_table where seq=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    pstmt.setString(2, password);
    
    int result = pstmt.executeUpdate();
    
    if(result == 1){
      flag = 0;
    }else {
      flag = 1;
    }
    
  }catch(NamingException e){
    System.out.print("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage());
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println("<script type=text/javascript>");
  if(flag == 0){
    out.println("alert('삭제 성공');");
    out.println("location.href = 'board_list1.jsp'");
  }else if(flag == 1){
    out.println("alert('비밀번호를 확인해주세요');");
    out.println("history.back();");
  }else {
    out.println("alert('삭제 실패');");
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

```jsp
<!-- board_modify1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
<%@ page import='javax.naming.Context' %>
<%@ page import='javax.naming.InitialContext' %>
<%@ page import='javax.naming.NamingException' %>

<%@ page import='javax.sql.DataSource' %>

<%@ page import='java.sql.Connection' %>
<%@ page import='java.sql.PreparedStatement' %>
<%@ page import='java.sql.ResultSet' %>
<%@ page import='java.sql.SQLException' %>

<%
  request.setCharacterEncoding("utf-8");

  String seq = request.getParameter("seq");
  String writer = "";
  String subject = "";
  String content = "";
  String mail1 = "";
  String mail2 = "";
  String emot = "";
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from emot_table where seq=?";
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, seq);
    
    rs = pstmt.executeQuery();
    
    if(rs.next()){
      writer = rs.getString("writer");
      subject = rs.getString("subject");
      content = rs.getString("content");
      
      if(!rs.getString("email").equals("")){
        String[] mailArr = rs.getString("email").split("@");
        mail1 = mailArr[0];
        mail2 = mailArr[1];
      }
      emot = rs.getString("emot");
    }
    
    
  }catch(NamingException e){
    System.out.println("에러 : " + e.getMessage());
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("mbtn").onclick = function() {
      if(document.mfrm.subject.value.trim() == ''){
        alert('제목을 입력해주세요');
        return false;
      }
      
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
  <form action="board_modify1_ok.jsp" method="post" name="mfrm">
  <input type='hidden' name='seq' value='<%= seq %>'>
    <div class="contents_sub">	
      <!--게시판-->
      <div class="board_write">
        <table>
        <tr>
          <th class="top">글쓴이</th>
          <td class="top"><input type="text" name="writer" value="<%= writer %>" class="board_view_input_mail" maxlength="5" readonly/></td>
        </tr>
        <tr>
          <th>제목</th>
          <td><input type="text" name="subject" value="<%= subject %>" class="board_view_input" /></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" name="password" value="" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea name="content" class="board_editor_area"><%= content %></textarea></td>
        </tr>
        <tr>
          <th>이메일</th>
          <td><input type="text" name="mail1" value="<%= mail1 %>" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="<%= mail2 %>" class="board_view_input_mail"/></td>
        </tr>
        <tr>
          <th>이모티콘</th>
          <td align="center">
            <table>
            <tr>
              <td>
                <img src="../../images/emoticon/emot01.png" width="25"/><br />
                <input type="radio" name="emot" value="emot01" class="input_radio" <%= emot.equals("01")? "checked" : "" %> />
              </td>
              <td>
                <img src="../../images/emoticon/emot02.png" width="25" /><br />
                <input type="radio" name="emot" value="emot02" class="input_radio" <%= emot.equals("02")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot03.png" width="25" /><br />
                <input type="radio" name="emot" value="emot03" class="input_radio" <%= emot.equals("03")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot04.png" width="25" /><br />
                <input type="radio" name="emot" value="emot04" class="input_radio" <%= emot.equals("04")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot05.png" width="25" /><br />
                <input type="radio" name="emot" value="emot05" class="input_radio" <%= emot.equals("05")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot06.png" width="25" /><br />
                <input type="radio" name="emot" value="emot06" class="input_radio" <%= emot.equals("06")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot07.png" width="25" /><br />
                <input type="radio" name="emot" value="emot07" class="input_radio" <%= emot.equals("07")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot08.png" width="25" /><br />
                <input type="radio" name="emot" value="emot08" class="input_radio" <%= emot.equals("08")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot09.png" width="25" /><br />
                <input type="radio" name="emot" value="emot09" class="input_radio" <%= emot.equals("09")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot10.png" width="25" /><br />
                <input type="radio" name="emot" value="emot10" class="input_radio" <%= emot.equals("10")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot11.png" width="25"/><br />
                <input type="radio" name="emot" value="emot11" class="input_radio" <%= emot.equals("11")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot12.png" width="25" /><br />
                <input type="radio" name="emot" value="emot12" class="input_radio" <%= emot.equals("12")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot13.png" width="25" /><br />
                <input type="radio" name="emot" value="emot13" class="input_radio" <%= emot.equals("13")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot14.png" width="25" /><br />
                <input type="radio" name="emot" value="emot14" class="input_radio" <%= emot.equals("14")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot15.png" width="25" /><br />
                <input type="radio" name="emot" value="emot15" class="input_radio" <%= emot.equals("15")? "checked" : "" %>/>
              </td>
            </tr>
            <tr>
              <td>
                <img src="../../images/emoticon/emot16.png" width="25"/><br />
                <input type="radio" name="emot" value="emot16" class="input_radio" <%= emot.equals("16")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot17.png" width="25" /><br />
                <input type="radio" name="emot" value="emot17" class="input_radio" <%= emot.equals("17")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot18.png" width="25" /><br />
                <input type="radio" name="emot" value="emot18" class="input_radio" <%= emot.equals("18")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot19.png" width="25" /><br />
                <input type="radio" name="emot" value="emot19" class="input_radio" <%= emot.equals("19")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot20.png" width="25" /><br />
                <input type="radio" name="emot" value="emot20" class="input_radio" <%= emot.equals("20")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot21.png" width="25" /><br />
                <input type="radio" name="emot" value="emot21" class="input_radio" <%= emot.equals("21")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot22.png" width="25" /><br />
                <input type="radio" name="emot" value="emot22" class="input_radio" <%= emot.equals("22")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot23.png" width="25" /><br />
                <input type="radio" name="emot" value="emot23" class="input_radio" <%= emot.equals("23")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot24.png" width="25" /><br />
                <input type="radio" name="emot" value="emot24" class="input_radio" <%= emot.equals("24")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot25.png" width="25"/><br />
                <input type="radio" name="emot" value="emot25" class="input_radio" <%= emot.equals("25")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot26.png" width="25" /><br />
                <input type="radio" name="emot" value="emot26" class="input_radio" <%= emot.equals("26")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot27.png" width="25" /><br />
                <input type="radio" name="emot" value="emot27" class="input_radio" <%= emot.equals("27")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot28.png" width="25" /><br />
                <input type="radio" name="emot" value="emot28" class="input_radio" <%= emot.equals("28")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot29.png" width="25" /><br />
                <input type="radio" name="emot" value="emot29" class="input_radio" <%= emot.equals("29")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot30.png" width="25" /><br />
                <input type="radio" name="emot" value="emot30" class="input_radio" <%= emot.equals("30")? "checked" : "" %>/>
              </td>
            </tr>
            <tr>
              <td>
                <img src="../../images/emoticon/emot31.png" width="25"/><br />
                <input type="radio" name="emot" value="emot31" class="input_radio" <%= emot.equals("31")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot32.png" width="25" /><br />
                <input type="radio" name="emot" value="emot32" class="input_radio" <%= emot.equals("32")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot33.png" width="25" /><br />
                <input type="radio" name="emot" value="emot33" class="input_radio" <%= emot.equals("33")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot34.png" width="25" /><br />
                <input type="radio" name="emot" value="emot34" class="input_radio" <%= emot.equals("34")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot35.png" width="25" /><br />
                <input type="radio" name="emot" value="emot35" class="input_radio" <%= emot.equals("35")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot36.png" width="25" /><br />
                <input type="radio" name="emot" value="emot36" class="input_radio" <%= emot.equals("36")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot37.png" width="25" /><br />
                <input type="radio" name="emot" value="emot37" class="input_radio" <%= emot.equals("37")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot38.png" width="25" /><br />
                <input type="radio" name="emot" value="emot38" class="input_radio" <%= emot.equals("38")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot39.png" width="25" /><br />
                <input type="radio" name="emot" value="emot39" class="input_radio" <%= emot.equals("39")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot40.png" width="25"/><br />
                <input type="radio" name="emot" value="emot40" class="input_radio" <%= emot.equals("40")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot41.png" width="25" /><br />
                <input type="radio" name="emot" value="emot41" class="input_radio" <%= emot.equals("41")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot42.png" width="25" /><br />
                <input type="radio" name="emot" value="emot42" class="input_radio" <%= emot.equals("42")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot43.png" width="25" /><br />
                <input type="radio" name="emot" value="emot43" class="input_radio" <%= emot.equals("43")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot44.png" width="25" /><br />
                <input type="radio" name="emot" value="emot44" class="input_radio" <%= emot.equals("44")? "checked" : "" %>/>
              </td>
              <td>
                <img src="../../images/emoticon/emot45.png" width="25" /><br />
                <input type="radio" name="emot" value="emot45" class="input_radio" <%= emot.equals("45")? "checked" : "" %>/>
              </td>
            </tr>
            </table>
          </td>
        </tr>
        </table>
      </div>
      
      <div class="btn_area">
        <div class="align_left">
          <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
          <input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'" />
        </div>
        <div class="align_right">
          <input type="button" value="수정" id='mbtn' class="btn_write btn_txt01" style="cursor: pointer;" />
        </div>
      </div>
      <!--//게시판-->
    </div>
  </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>

```

```jsp
<!-- board_modify1_ok.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
  request.setCharacterEncoding("utf-8");
  
  String seq = request.getParameter("seq");
  String subject = request.getParameter("subject");
  String email = "";
  if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  String password = request.getParameter("password");
  String content = request.getParameter("content");
  String emot = request.getParameter("emot").replaceAll("emot", "");
  
  System.out.println(seq);
  System.out.println(password);
  
  Connection conn = null;
  PreparedStatement pstmt = null;

  int flag = 2;
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");
    
    conn = dataSource.getConnection();
    
    String sql = "update emot_table set subject=?, content=?, emot=? where seq=? and password=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, subject);
    pstmt.setString(2, content);
    pstmt.setString(3, emot);
    pstmt.setString(4, seq);
    pstmt.setString(5, password);
    
    int result = pstmt.executeUpdate();
    
    if(result == 1){
      flag = 0;
    }else if(result == 0){
      flag = 1;
    }
    
  }catch(NamingException e){
    
  }catch(SQLException e){
    System.out.print("에러 : " + e.getMessage()); 
  }finally{
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println("<script type='text/javascript'>");
  if(flag == 0){
    out.println("alert('글 수정 성공');");
    out.println("location.href='board_view1.jsp?seq=" + seq + "';");
  }else if(flag == 1){
    out.println("alert('비밀번호 오류');");
    out.println("history.back();");
  }else{
    out.println("alert('글 수정에 실패');");
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

#### 페이지 블록이 포함된 게시판


- 페이징 필수 요소
  - 페이지별 게시물 출력

  - 전체 페이지에 해당하는 링크 생성
  - 페이지 블록 생성
- 페이지 흐름도
  
  -	board_list1.jsp
  
    - board_write1.jsp (cpage)
  
      - board_write1_ok.jsp
  
        - board_list1.jsp
    - board_view1.jsp (cpage)
      - board_modify1.jsp (cpage)
        - board_modify1_ok.jsp (cpage)

          - board_view1.jsp (cpage)

      - board_delete1.jsp (cpage)

        - board_delete1_ok.jsp

          - board_list1.jsp
- 기본틀
```jsp
<!--페이지넘버-->
<div class="paginate_regular">
  <div align="absmiddle">
    <span><a>&lt;&lt;</a></span>
    &nbsp;
    <span><a>&lt;</a></span>
    &nbsp;&nbsp;
    <span><a>[ 1 ]</a></span>
    <span><a href="board_list1.jsp">2</a></span>
    <span><a href="board_list1.jsp">3</a></span>
    &nbsp;&nbsp;
    <span><a>&gt;</a></span>
    &nbsp;
    <span><a>&gt;&gt;</a></span>
  </div>
</div>
<!--//페이지넘버-->
```
```jsp
<!-- board_list1.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%@ page import="javax.sql.DataSource"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
int cpage = 1; // 현재 페이지 번호를 저장하는 변수

if (request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
  cpage = Integer.parseInt(request.getParameter("cpage"));
} // request.getParameter("cpage") != null 조건이 먼저 나와야 에러가 생기지 않는다

int recordPerPage = 10;

int totalPage = 1;

int startNum = (cpage - 1) * recordPerPage;

int blockPerPage = 5;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

StringBuilder sbHTML = new StringBuilder();

int count = 0;

try {
  Context initCtx = (Context) new InitialContext();
  Context envCtx = (Context) initCtx.lookup("java:comp/env");
  DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb3");

  conn = dataSource.getConnection();

  String sql = "select seq, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from board1 order by seq desc";

  pstmt = conn.prepareStatement(sql);

  rs = pstmt.executeQuery();

  rs.last();
  // 커서를 마지막으로 이동시킨다
  count = rs.getRow();
  // 커서가 가리키는 행번호를 저장시킨다
  rs.beforeFirst();
  // 커서를 제일 처음의 상태로 되돌린다
  
  totalPage = (count - 1) / recordPerPage + 1;

  int skip = (cpage - 1) * recordPerPage;
  
  if (skip != 0) rs.absolute(skip);
  

  for (int i = 0; i < recordPerPage && rs.next(); i++) {
    String seq = rs.getString("seq");
    String subject = rs.getString("subject");
    String writer = rs.getString("writer");
    String wdate = rs.getString("wdate");
    String hit = rs.getString("hit");

    int wgap = rs.getInt("wgap");

    sbHTML.append("<tr>");
    sbHTML.append("<td>&nbsp;</td>");
    sbHTML.append("<td>" + seq + "</td>");
    sbHTML.append("<td class='left'>");
    sbHTML.append("<a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>");
    if (wgap == 0) {
      sbHTML.append("&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>");
    }
    sbHTML.append("</td>");
    sbHTML.append("<td>" + writer + "</td>");
    sbHTML.append("<td>" + wdate + "</td>");
    sbHTML.append("<td>" + hit + "</td>");
    sbHTML.append("<td>&nbsp;</td>");
    sbHTML.append("</tr>");

  }

} catch (NamingException e) {
  System.out.print("에러 : " + e.getMessage());
} catch (SQLException e) {
  System.out.print("에러 : " + e.getMessage());
} finally {
  if (rs != null)
    rs.close();
  if (pstmt != null)
    pstmt.close();
  if (conn != null)
    conn.close();
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
</head>

<body>
  <input type='hidden' name='cpage' value=<%= cpage %>>
  <!-- 상단 디자인 -->
  <div class="con_title">
    <h3>게시판</h3>
    <p>
      HOME &gt; 게시판 &gt; <strong>게시판</strong>
    </p>
  </div>
  <div class="con_txt">
    <div class="contents_sub">
      <div class="board_top">
        <div class="bold">
          총 <span class="txt_orange"><%=count%></span>건
        </div>
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
          <%=sbHTML%>
        </table>
      </div>

      <div class="btn_area">
        <div class="align_right">
          <input type="button" value="쓰기" class="btn_write btn_txt01"
            style="cursor: pointer;"
            onclick="location.href='board_write1.jsp?cpage=<%= cpage %>'" />
        </div>
      </div>
      <!--//게시판-->
      <!--페이지넘버-->
      <div class="paginate_regular">
        <div align="absmiddle">
          <%	
            int startBlock = cpage - (cpage - 1) % blockPerPage;
            int endBlock = cpage - (cpage - 1) % blockPerPage + blockPerPage - 1;
            
            if(endBlock >= totalPage){
              endBlock = totalPage;
            }
            if(startBlock == 1){
              out.println("<span><a>&lt;&lt;</a></span>");
            }else{
            out.println("<span><a href='board_list1.jsp?cpage=" + (startBlock - blockPerPage) + "'>&lt;&lt;</a></span>");
            }
            out.println("&nbsp;");
            if(cpage == 1){
              out.println("<span><a>&lt;</a></span>");	
            }else{
              out.println("<span><a href='board_list1.jsp?cpage=" + (cpage - 1) + "'>&lt;</a></span>");
            }
            out.println("&nbsp;&nbsp;");
            for(int i = startBlock; i <= endBlock; i++){
              
              if(i == cpage){
                out.println("<span><a>[" + i + "]</a></span>");
              }else{
              out.println("<span><a href='board_list1.jsp?cpage=" + i + "'>" + i + "</a></span>");
              }
            }
            out.println("&nbsp;&nbsp;");
            if(cpage == totalPage){
              out.println("<span><a>&gt;</a></span>");
            }else{
              out.println("<span><a href='board_list1.jsp?cpage=" + (cpage + 1) + "'>&gt;</a></span>");
            }
            out.println("&nbsp;");
            out.println("<span><a href='board_list1.jsp?cpage=" + (startBlock + blockPerPage) + "'>&gt;&gt;</a></span>");
          %>
        </div>
      </div>
      <!--//페이지넘버-->

    </div>
  </div>
  <!--//하단 디자인 -->

</body>
</html>
```
#### 답변글 게시판
- 게시판 종류

  - 글에 대한 답글 (Reply형 게시판)

    - 글 목록에서 표현됨
    
  - 글에 대한 댓글 (Comment형 게시판)

    - view에서 표현됨

- Reply형 게시판 구현하기

    - 기본 테이블에 컬럼을 추가 정의해서 구현한다

      - grp : 글 그룹

      - grps : 글 그룹 내의 순서

      - grpl : 글 그룹 내의 깊이

    - 모글 작성
      - grp : seq와 동일하다
      - grps : 0

      - grpl : 0

    - 답글 작성
      - grp 
        - 모글의 grp
      - grps 
        - 모글과 같은 grp 내부에서 

          - 모글의 grps보다 큰 grps가 있다면 그 grps는 무조건 + 1
          
          - 자신은 모글의 grps + 1
      - grpl

        - 자신은 모글의 grpl + 1
        
      ||seq | grp| grps|grpl|
      |--|--|--|--|--|
      |모글 1|1|1|0|0|
      |모글 2|2|2|0|0|
      |답글 1-1|3|1|4|1|
      |답글 1-2|4|1|2|1|
      |답글 1-3|5|1|1|1|
      |답글 1-1-1|6|1|6|2|
      |답글 1-1-2|7|1|5|2|
      |답글 1-2-1|8|1|3|2|
      |답글 2-1|9|2|1|1|

      - order by grp desc, grps asc

      ```
      모글 2

        답글 2-1 

      모글 1

        답글 1-3

        답글 1-2

          답글 1-2-1

        답글 1-1

          답글 1-1-2

          답글 1-1-1
      ```
      - rep_table 생성

      ```sql
      create table rep_board1(
        seq int not null primary key auto_increment,
        grp int not null,
        grps int not null,
        grpl int not null,
        subject varchar(150) not null,
        writer varchar(12) not null,
        mail varchar(50),
        password varchar(12) not null,
        content varchar(2000),
        hit int not null,
        wip varchar(15) not null,
        wdate datetime not null
      );
      ```

      ```sql
      select last_insert_id() from rep_board1;
      <!-- 테이블의 마지막 auto_increment 값을 리턴한다 -->
      ```
      ```jsp
      <!-- board_list1.jsp -->
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

      <%@ page import="javax.naming.Context" %>
      <%@ page import="javax.naming.InitialContext" %>
      <%@ page import="javax.naming.NamingException" %>

      <%@ page import="javax.sql.DataSource" %>

      <%@ page import="java.sql.Connection" %>
      <%@ page import="java.sql.PreparedStatement" %>
      <%@ page import="java.sql.ResultSet" %>
      <%@ page import="java.sql.SQLException" %>

      <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;


        StringBuilder sbHTML = new StringBuilder();

        int count = 0;

        try{
          Context initCtx = (Context)new InitialContext();
          Context envCtx = (Context)initCtx.lookup("java:comp/env");
          DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");

          conn = dataSource.getConnection();

          String sql = "select seq, grpl, subject, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from rep_board1 order by grp desc, grps asc";

          pstmt = conn.prepareStatement(sql);

          rs = pstmt.executeQuery();

          rs.last();
          count = rs.getRow();
          rs.beforeFirst();

          while(rs.next()){
            int grpl = rs.getInt("grpl");
            String strGrpl = "";
            for(int j = 1; j <= grpl; j++){
              strGrpl += "&nbsp;&nbsp;";
            }

            String seq = rs.getString("seq");
            String subject = rs.getString("subject");
            String writer = rs.getString("writer");
            String wdate = rs.getString("wdate");
            String hit = rs.getString("hit");

            int wgap = rs.getInt("wgap");

            sbHTML.append("<tr>");
            sbHTML.append("<td>&nbsp;</td>");
            sbHTML.append("<td>" + seq + "</td>");
            sbHTML.append("<td class='left'>");

            if(grpl != 0){
              sbHTML.append(strGrpl + "<img src='../../images/icon_re1.gif'/>");
            }
            sbHTML.append("<a href='board_view1.jsp?seq=" + seq + "'>" + subject + "</a>");
            if(wgap ==0){
            sbHTML.append("&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>");
            }
            sbHTML.append("</td>");
            sbHTML.append("<td>" + writer + "</td>");
            sbHTML.append("<td>" + wdate + "</td>");
            sbHTML.append("<td>" + hit + "</td>");
            sbHTML.append("<td>&nbsp;</td>");
            sbHTML.append("</tr>");

          }

        }catch(NamingException e){
          System.out.print("에러 : " + e.getMessage());
        }catch(SQLException e){
          System.out.print("에러 : " + e.getMessage());
        }finally{
          if(rs != null) rs.close();
          if(pstmt != null) pstmt.close();
          if(conn != null) conn.close();
        }
      %>
      <!DOCTYPE html>
      <html lang="ko">
      <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="../../css/board.css">
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
            <div class="bold">총 <span class="txt_orange"><%= count %></span>건</div>
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
            <%= sbHTML %>
            </table>
          </div>	

          <div class="btn_area">
            <div class="align_right">
              <input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
            </div>
          </div>
          <!--//게시판-->
        </div>
      </div>
      <!--//하단 디자인 -->

      </body>
      </html>

      ```
      ```jsp
      <!-- board_reply1.jsp -->
      <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

      <%
        request.setCharacterEncoding("utf-8");

        String seq = request.getParameter("seq");
      %>
      <!DOCTYPE html>
      <html lang="ko">
      <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="../../css/board.css">
      <script type="text/javascript">
        window.onload = function() {
          document.getElementById('wbtn').onclick = function() {
            // alert('click');
            if(document.wfrm.info.checked == false){
              alert("개인정보 이용에 동의해주세요");
              return false;
            }
            if(document.wfrm.writer.value.trim() == ''){
              alert("글쓴이를 입력해주세요");
              return false;
            }
            if(document.wfrm.subject.value.trim() == ''){
              alert("제목을 입력해주세요");
              return false;
            }
            if(document.wfrm.password.value.trim() == ''){
              alert("비밀번호를 입력해주세요");
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
        <form action="board_reply1_ok.jsp" method="post" name="wfrm">
          <input type='hidden' name='seq' value=<%= seq %>> 
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
                <input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'" />
              </div>
              <div class="align_right">
                <input type="button" id='wbtn' value="답글쓰기" class="btn_write btn_txt01" style="cursor: pointer;" />
              </div>
            </div>
            <!--//게시판-->
          </div>
        </form>
      </div>
      <!-- 하단 디자인 -->

      </body>
      </html>

      ```
      ```jsp
      <!-- board_reply1_ok.jsp -->
      <%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>

      <%@ page import="javax.naming.Context" %>
      <%@ page import="javax.naming.InitialContext" %>
      <%@ page import="javax.naming.NamingException" %>

      <%@ page import="javax.sql.DataSource" %>

      <%@ page import="java.sql.Connection" %>
      <%@ page import="java.sql.PreparedStatement" %>
      <%@ page import="java.sql.ResultSet" %>
      <%@ page import="java.sql.SQLException" %>

      <% 
        request.setCharacterEncoding("utf-8");

        String seq = request.getParameter("seq"); // 모글의 seq

        String subject = request.getParameter("subject");
        String writer = request.getParameter("writer");
        String password = request.getParameter("password");
        String email = "";
        if(!request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
          email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
        }
        String content = request.getParameter("content");
        String wip = request.getRemoteAddr(); 

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int flag = 1; 

        try{
          Context initCtx = new InitialContext();
          Context envCtx = (Context)initCtx.lookup("java:comp/env");
          DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb3");

          conn = dataSource.getConnection();

          // 모글에 대한 정보
          String sql = "select grp, grps, grpl from rep_board1 where seq = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, seq);
          rs = pstmt.executeQuery();

          int grp = 0;
          int grps = 0;
          int grpl = 0;

          if(rs.next()){
            grp = rs.getInt("grp");
            grps = rs.getInt("grps");
            grpl = rs.getInt("grpl");
          }

          // 모글의 grps 보다 큰 grps를 가진 데이터의 grps + 1
          sql = "update rep_board1 set grps = grps + 1 where grp = ? and grps > ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, grp);
          pstmt.setInt(2, grps);

          pstmt.executeUpdate();

          sql = "insert into rep_board1 values (0, ?, ?, ?, ?, ?, ?, ?, ?, 0, ?, now())";
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, grp);
          pstmt.setInt(2, grps + 1);
          pstmt.setInt(3, grpl + 1);

          pstmt.setString(4, subject);
          pstmt.setString(5, writer);
          pstmt.setString(6, email);
          pstmt.setString(7, password);
          pstmt.setString(8, content);
          pstmt.setString(9, wip);

          int result = pstmt.executeUpdate();
          if(result == 1){
            System.out.println("성공");
            flag = 0;
          }else{
            System.out.println("실패");
          }
        }catch(NamingException e){
          System.out.println("에러 : " + e.getMessage());
        }catch(SQLException e){
          System.out.println("에러 : " + e.getMessage());
        }finally{
          if(pstmt != null) pstmt.close();
          if(conn != null) conn.close();
        }

        // 페이지 이동을 위해 javascript를 사용한다
        out.println("<script type='text/javascript'>");
        if(flag == 0){
          out.println("alert('답글쓰기 성공');");
          out.println("location.href='board_list1.jsp';");
        }else{
          out.println("alert('답글쓰기 실패')");
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

### 내장객체

- redirect
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // response.sendRedirect("https://www.daum.net");
  // jsp를 이용한 특정 url로의 이동

  out.println("<script type='text/javascript'>");	
  out.println("alert('성공 후 실행')");	
  out.println("location.href='https://www.daum.net';");	
  out.println("</script>");	
  // javascript를 이용한 특정 url로의 이동
%>
```
- jsp 처리과정 

<img src='https://miro.medium.com/v2/resize:fit:640/0*72KBQpvzlWcREOhz' width=600>


!! jsp파일의 컴파일된 class 파일 저장 경로
- eclipse - C:\Java\jsp_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\BoardEx01\org\apache\jsp

- tomcat - C:\Java\apache-tomcat-9.0.74\work\Catalina\localhost\ROOT\org\apache\jsp


- 버퍼
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="1kb" autoFlush="true"%>
<%
  out.println("버퍼 크기 : " + out.getBufferSize() + "<br>"); 
  out.println("버퍼 남은 크기 : " + out.getRemaining()+ "<br>"); 
  
  for(int i = 1; i < 100; i++){
    out.println(i + "Hello JSP<br>");
    if(i % 20 == 0){
      out.println("버퍼 남은 크기 : " + out.getRemaining()+ "<br>"); 
    }
  }
%>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
  out.println(out.getRemaining() + "<br>");
  out.println("1<br>");
  out.println("2<br>");
  out.println("3<br>");
  
  out.clearBuffer(); // 버퍼에 있는 내용을 지운다
  out.println(out.getRemaining() + "<br>");
  
  out.println("4<br>");
  out.println("5<br>");
  out.println("6<br>");
  
  out.flush(); // 버퍼에 있는 내용을 출력하면서 비운다
  out.println(out.getRemaining() + "<br>");
  
  out.println("7<br>");
  out.println("8<br>");

  out.close(); // 뒤에 출력 내용이 있더라도 출력 스트림을 해제한다

  out.println("9<br>");
  out.println("10<br>");
%>
```
#### include

- include
  - <%@ include file="" > : 프로그램적인 포함에 사용한다

    - a <- b
      - a + b => compile

  
  - <jsp: include page=""> : 디자인적인 포함에 사용한다

    - a => compileA
      , b => compileB

      => compileA + compileB (출력 결과만 결합시킨다)

```jsp
<!-- include.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  int i = 2;
%>
<%@ include file="./include1/include3.jspf" %>
</body>
</html>

<!-- include3.jspf -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  out.println("i : " + i);
  // 선언을 하지 않았지만 include.jsp에 포함되어 컴파일 되는 것과 같으므로 
  // include.jsp에 선언된 변수 i를 사용할 수 있다
  // 하지만 include3.jsp 파일 자체로는 에러가 생기므로 확장자 명을 .jspf로 바꿔줘서 에러 경고가 뜨는 것을 막아주자
%>
```


```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- include 이전<br>
<%
  // pageContext.include("./include1/include.jsp");
  // 페이지에 include.jsp 내용을 포함시킨다
  pageContext.forward("./include1/include.jsp");
  // 페이지 내용이 include.jsp로 바뀐다
%>
-- include 이후<br>
</body>
</html>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- include 이전<br>
<jsp:include page="./include1/include.jsp"></jsp:include>
-- include 이후<br>
</body>
</html>
```

```jsp
<!-- include.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- include 이전<br>
<%
  int i = 2;
%>
<jsp:include page="./include1/include2.jsp">
  <jsp:param name="data1" value="value1"/>
  <jsp:param name="data2" value="<%= i %>"/>
</jsp:include>
-- include 이후<br>
</body>
</html>

<!-- include2.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  out.println("Hello include2.jsp<br>");
  // 출력만 있는 미완성 구문
  out.println("data1 : " + request.getParameter("data1")+"<br>");
  out.println("data2 : " + request.getParameter("data2")+"<br>");
%>
```
#### forward
```jsp
<!-- forwardEx.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- forward 전
<jsp:forward page="./forward1/forward.jsp"></jsp:forward>
<!-- 현재의 페이지가 아닌 forward.jsp 페이지가 보인다 -->
-- forward 후
</body>
</html>

<!-- forward.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello forward.jsp
</body>
</html>
```
위의 코드는 아래와 같이 쓸 수도 있다
```jsp
<!-- forwardEx2.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
-- forward 전<br>
<%
  RequestDispatcher dispatcher = request.getRequestDispatcher("./forward1/forward.jsp");
  dispatcher.forward(request, response);
%>
-- forward 후<br>
</body>
</html>

<!-- forward.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Hello forward.jsp
</body>
</html>
```

### JSP에서 모델 호출
- TO (java beans), DAO를 이용한다
```jsp
package pack1;

public class MemberTO {
  private String id;
  private String password;
  
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pack1.MemberTO" %>
<%
  MemberTO to = new MemberTO();
  to.setId("tester");
  to.setPassword("1234");
  
  out.println(to.getId() + "<br>");
  out.println(to.getPassword() + "<br>");
%>
```
아래와 같이 액션태그를 이용할 수도 있다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="to" class="pack1.MemberTO"></jsp:useBean>
<% 
  to.setId("tester");
  to.setPassword("1234");
  
  out.println(to.getId() + "<br>");
  out.println(to.getPassword() + "<br>");
%>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="to" class="pack1.MemberTO"></jsp:useBean>
<jsp:setProprety name="to" property="id" value="tester"></jsp:setProprety>
<jsp:setProprety name="to" property="password" value="1234"></jsp:setProprety>
<% 
  out.println(to.getId() + "<br>");
  out.println(to.getPassword() + "<br>");
%>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="to" class="pack1.MemberTO"></jsp:useBean>
<jsp:setProperty name="to" property="id" value="tester"></jsp:setProperty>
<jsp:setProperty name="to" property="password" value="1234"></jsp:setProperty>
<jsp:getProperty name="to" property="id"></jsp:getProperty><br>
<jsp:getProperty name="to" property="password"></jsp:getProperty>
```

#### JSP 모듈화
- 페이지 모듈화
  - include / forward : 페이지의 일부분을 분리 후 호출해서 사용한다
  
    <small>!! 이때, 디자인적 분리(include 액션태그), 소스적인 분리(include 디렉티브)인가에 따라 달리 사용된다</small>

- 구분

  - 모델1 : 프로그램 소스에 대한 고도화 된 분리로 swing에서 처럼 DAO, TO를 이용한다

  - 모델 2

##### 기본 게시판 모듈화
- 게시판 문서에는 JDBC에 연결시키기 위한 코드가 많기 때문에 include를 사용해 모듈화 시킬 수 있다

- 소스적 분리이기 때문에 디렉티브를 사용한다

- JDBC 연결을 위한 문서 
```xml
<!-- context.xml -->
<?xml version="1.0" encoding="utf-8"?>
<Context>
  <Resource 
    name="jdcb/mariadb1"
    auth="Container"
    type="javax.sql.DataSource" 
    driverClassName="org.mariadb.jdbc.Driver"
    url="jdbc:mariadb://localhost:3306/board"
    username="root"
    password="123456"
    />
</Context>
```
```jsp
<!-- include.jspf -->
<!-- 파일 확장자를 .jsp로 할 경우 에러가 생기기 때문에 .jspf를 파일 확장자로 한다 -->
<%@ page language="java" contentType="text/html;charset=UTF-8 pageEncoding="UTF-8" %>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%@ page import="javax.sql.DataSource"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
    Context initCtx = (Context)new InitialCotext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb1");

    conn = dataSource.getConnection();
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }
%>
```
```jsp
<!-- board_list1.jsp -->
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="./include/include.jspf" %>
<%
  StringBuilder sb = new StringBuilder();

  int totalRecord = 0;

  try{
    String sql = "select seq, subject, writer, datd_format(wdate, '%Y-%m-%d') wdate, hit, datediff(wdate, now()) wgap from board order by seq desc";
    pstmt = conn.prepareStatement(sql);

    rs = pstmt.executeQuery();

    rs.last();
    totalRecord = rs.getRow();
    rs.beforFirst();

    while(rs.next()){
      String seq = rs.getString("seq");
      String subject = rs.getString("subject");
      String writer = rs.getString("writer");
      String wdate = rs.getString("wdate");
      String hit = rs.getString("hit");

      int wgap = rs.getInt("wgap");

      sb.append("<tr>");
      sb.append("<td>&nbsp;</td>");
      sb.append("<td>" + seq + "</td>");

      sb.append("<td class='left'>");
      sb.append("<a href='board_view1.jsp?seq=" + seq + "'" + subject + "</a>");
      if(wgap == 0){
        sb.appned("&nbsp;<img src='../../images/icon_new.gif' alt='NEW'>");
      }
      sb.append("</td>");

      sb.append("<td>" + writer + "</td>");
      sb.append("<td>" + wdate + "</td>");
      sb.append("<td>" + hit + "</td>");
      sb.append("<td>&nbsp;</td>");
      sb.append("</tr>");
    }

  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/board.css">
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
			<div class="bold">총 <span class="txt_orange"><%= totalRecord %></span>건</div>
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
			<%= sb %>
			</table>
		</div>	

		<div class="btn_area">
			<div class="align_right">
				<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'" />
			</div>
		</div>
		<!--//게시판-->
	</div>
</div>
<!--//하단 디자인 -->

</body>
</html>

```
  