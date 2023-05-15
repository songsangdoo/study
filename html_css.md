# html(Hyper Text Markup Lang.)

- 데이터의 구조(형식), 문법적 에러가 나지 않음
  ```html
  <html><head></html></head>
  <!--원래 구조와 다르지만 에러가 나지 않는다-->
  ```
- 논문 형식의 문서를 www(World Wide Web)에서 공유하려고 생김

- Hyper Text - 링크 : 클릭에 의한 다음페이지 이동
- Markup Lang.: 태그를 이용해 내용을 기능을 준다<br>

  - <기능>내용</기능><br>
  - <기능/>(내용없고 효과만)
  - <기능 속성 = "값">내용</기능>

  <small> !! 여기서 기능, 속성은 대소문자 구분없는 영어</small>

---

## html 규정 (권고사항)

- w3c(world wide web Consortium) : https://www.w3.org

- 강제가 아닌 권고사항이므로 브라우저마다 다른 화면을 보일 수 있음

- 브라우저 별 html(version html5) 지원율은 https://html5test.com/ 에서 확인

---

## html 에디터

- 메모장

- VS code
- 문서 확인은 웹 브라우저<sup>[1]</sup>에서 한다<br>

  <small>[1] 웹 브라우저 : html 해석기로 랜더링을 하는 랜더러</small>

- 주석

```html
<!-- 주석은 이렇게 작성하며 브라우저가 랜더링을 하지 않는다 -->
```

---

## html 문서 기본 구성

```html
<!DOCTYPE html>
<html>
  <head>
    <!--문서 전체 선언적 내용-->
  </head>
  <body>
    <!-- 문서 전체 내용 -->
  </body>
</html>
```

---

## html 기본

- \&nbsp; : 여러번 띄어쓰기를 하더라도 브라우저가 한번의 띄어쓰기처럼 랜더링하므로 여러번 띄어쓰기를 할 때 사용한다

- \<br> : 줄바꿈을 할 때 사용한다
- 제목

  - \<h1> 제목 \</h1> 형태

  - h1 ~ h6 까지 사용할 수 있으며 숫자가 커질수록 크기가 화면상의 크기가 작게 보인다

- 문단

  - \<div> 내용 \</div> : 내용 마지막에 엔터키 한번이 들어간다

  - \<p> 내용 \</p> : 내용 마지막에 엔터키 두번이 들어간다
  - \<span> 내용 \</span> : 엔터키가 들어가지 않는다
  - \<pre> 내용 \</pre> : 태그 사이에 있는 내용에 적용한 여백, 줄바꿈이 모두 그대로 드러난다
  - \<blockquote> 내용 \</blockquote> : 인용한 내용에 사용한다

- 글씨

  - \<b> : 진한 글씨

  - \<i> : 기울어진 글씨
  - \<sub> 내용 \</sub> : 아래첨자
  - \<sup> 내용 \</sup> : 위첨자

- 목록

  - 순서가 있는 목록

  ```html
  <ol type="i" start="5">
    <!-- type, start 속성으로 순서 기호, 시작지점 변경 가능 -->
    <li>사과</li>
    <li>참외</li>
    <li>수박</li>
    <li>딸기</li>
  </ol>
  ```

  - 순서가 없는 목록

  ```html
  <ul type="square">
    <!-- type 속성으로 목록 옆의 모양을 바꿀 수 있다 -->
    <li>사과</li>
    <li>참외</li>
    <li>수박</li>
    <li>딸기</li>
  </ul>
  ```

  - 사전식

  ```html
  <dl>
    <!-- 단어리스트 -->
    <dt>사과</dt>
    <!-- 단어명 -->
    <dd>사과는 맛있다</dd>
    <!-- 단어설명 -->
    <dt>참외</dt>
    <dd>참외는 맛있다</dd>
    <dt>수박</dt>
    <dd>수박은 맛있다</dd>
  </dl>
  ```

  <small>!! 목록을 중첩시켜 사용할 수도 있다</small>

---

## table

- 표의 기본

```html
<table border="1" width="500" height="200">
  <!-- border 속성으로 경계선 설정할 수 있고 width, height 속성으로 크기 설정할 수 있다(단위는 px) -->
  <tr>
    <!-- 행 -->
    <td>1행 1열</td>
    <!-- 열 -->
    <td width="100">1행 2열</td>
    <!-- 하나의 행, 열에도 width, height로 각각 크기 설정 가능하지만 각 셀마다 따로 크기 지정은 불가능-->
    <td>1행 3열</td>
  </tr>
  <tr>
    <th>2행 1열</th>
    <!-- <th>도 열을 나타낼 수 있고 <td>와 달리 중앙정렬된 진한 글씨로 표현된다 -->
    <th>2행 2열</th>
    <th>2행 3열</th>
  </tr>
  <tr>
    <td>3행 1열</td>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>
```

- align , valign : table, tr, th, td 태그 안에 사용해 글자를 정렬할 수 있게하는 속성

```html
<tr>
  <td align="center">2행 1열</td>
  <!-- align 속성으로 가로 글자 정렬 -->
  <td align="left">2행 2열</td>
  <td align="right">2행 3열</td>
</tr>
<tr>
  <td valign="top">3행 1열</td>
  <!-- valign 속성으로 세로 글자 정렬 -->
  <td valign="middle">3행 2열</td>
  <td valign="bottom">3행 3열</td>
</tr>
```

- colspan, rowpan : th, td 태그에 사용해 열 또는 행을 합칠 수 있게 하는 속성

```html
<table border="1" width="500" height="400">
  <tr>
    <td colspan="2">1행 1열</td>
    <!-- colspan 속성으로 열 합치기 가능 -->
    <td>1행 2열</td>
  </tr>
  <tr>
    <td colspan="3">2행 1열</td>
  </tr>
  <tr>
    <td>3행 1열</td>
    <td>3행 2열</td>
    <td>3행 3열</td>
  </tr>
</table>
<table border="1" width="500" height="400">
  <tr>
    <td>1행 1열</td>
    <td rowspan="2">1행 2열</td>
    <!-- rowspan 속성으로 행 합치기 가능 -->
    <td rowspan="3">1행 3열</td>
  </tr>
  <tr>
    <td>2행 1열</td>
  </tr>
  <tr>
    <td>3행 1열</td>
    <td>3행 2열</td>
  </tr>
</table>
```

---

## html(Hyper Text Markup Lang.)

- 태그를 통해서 구조 표현

- 왜 html을 사용할까? 인터넷 상에 문서를 공개하기 위해서

---

## html 문서 전송 흐름

1. html 작성

1. 클라이언트(브라우저)가 서버(웹 서버<sup>[1]</sup>)로 url을 이용해 웹 페이지 요청
1. 서버가 요청받은 html 파일 검색해서 클라이언트에 반환

   <sup>[1] 웹 서버 : html을 공개해주는 서버</sup>

---

## url

- ex) http://www.naver.com/*.html

1. protocol(http://) : 전송규약(hyper-text transfer protoco)

1. 도메인(www.naver.com) : 아이피

1. 경로 + 문서명(\*.html)

---

## 웹 서버 구축방법

    !! 서버는 안정적이어야 하기 때문에 jdk, tomcat 모두 최신 버전보다 패치가 많이 된 버전을 설치해야 한다.

- jdk(자바 개발 도구) - jdk 11

1. 설치 : 오라클 &rarr; 자바 아카이브 &rarr; jdk 11 window x64

2. 환경 설정 : 시스템 환경변수 편집

- JAVA_HOME(리눅스는 대소문자 구분하기 때문에 반드시 대문자 사용) &rarr; 새로 만들기(C:\Program Files\Java\jdk-11.0.17)

  <sup>!! 설정 후에 명령 프롬프트에서 echo %JAVA_HOME% 으로 경로 확인하기 </sup>

- java 실행파일 경로 Path &rarr; 편집 &rarr; 추가(C:\Program Files\Java\jdk-11.0.17\bin)<br><br>

- apache-tomcat(웹 서버) : 보안을 해제시켜서 서버에 접근을 가능하게 한다 - tomcat 9

1.  시작

    1. 명령 프롬프트에 cd C:\html\apache-tomcat-9.0.71\bin\catatlin.bat run 입력

       <small>!! cd C:\html\apache-tomcat-9.0.71\bin\ start.bat 입력해도 된다</small>

    1. 브라우저에 url(http://127.0.0.1:8080/) 입력해서 확인

       <small> !! https는 보안 방식이라 tomcat이 작동하지 않으므로 https는 사용 불가능하다</small>

    1. C:\html\apache-tomcat-9.0.71\webapps\ROOT 에 문서를 넣고 브라우저로 확인 가능

       <sup>ex) lcoalhost:8080/tomcat.svg, 192.168.0.87:8080/ex01.html</sup>

2.  종료 : 명령 프롬프트 창에서 ctrl + c

    <sup> 브라우저에 url(http://127.0.0.1:8080/) 입력하면 시작 때와는 달리 서버에 연결할 수 없음 페이지가 나온다 </sup>

---

## 내 컴퓨터 아이피(Internet Protocol) 확인

1.  명령 프롬프트(cmd)에 ipconfig 입력
2.  IPv4(0\~255.0\~255.0\~255.0\~255) 확인

    <sup>ex) 192.168.0.87</sup>

    <sup>!! 127.0.0.1 ? <br>
    loop back(점검용 아이피)이라고 하며 내가 만든 것을 확인할 때 이 아이피를 이용한다<br>
    127.0.0.1 대신 localhost 입력해도 된다</sup>

    <sup> !! IPv4 는 외부용 아이피</sup><br>
    <sup> !! 8080 는 포트라고 하며 도메인이 아파트 한 동을 의미한다면 포트는 아파트 호수를 의미한다 </sup>

---

## table

- table 태그는 표로 사용할 수도 있지만 Layout에도 사용할 수 있다<br>
  그러나 요즘은 Layout에 div + css을 주로 사용한다

- table, tr, th, td 태그에서 cellpading 속성을 이용해서 셀안의 여백 크기, cellspacing 속성을 이용해서 셀 간의 경계선 간격을 조절할 수 있다

  <sup>ex)<table border="1"cellpadding="10" cellspacing="0"></sup>

---

## 배경색, 전경색(글자색) 설정 방법

- 영문 색상으로 색을 설정 가능

  <sup>ex) red, blue, ...</sup>

- R(0\~255)G(0\~255)B(0\~255)(16진수)로 색을 설정 가능

  <sup>ex) #ff00ff, rgb(0, 0, 255)</sup>

---

## 이미지

```html
<img src="파일경로" />
```

- 파일 경로를 입력해줘야 한다

  1.  절대 경로 - 드라이브명 ~ 현재파일의 위치까지 모두 적는다.

      <sup>ex) C:\html\apache-tomcat-9.0.71\webapps\ROOT\images\tomcat.png

  2.  상대 경로 - 작업위치부터 작업파일의 위치까지 적는다.

      - . : 현재 작업위치

        <sup> ex) ./images/tomcat.png<br></sup>

      - .. : 현재 작업위치의 부모 <br>
      - 웹 경로

        <sup>ex) https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BBYyvk2?w=0&h=0&q=60&m=6&f=jpg&u=t</sup>

- 이미지 형식

  - jpg - 사진

  - gif - 아이콘
  - 요즘은 png 형식 주로 사용

---

## hyper text = link

```html
<a href="경로">링크문구</a>
```

- 링크문구를 클릭하면 href에 지정된 경로로 연결된다.

  <small>!! 이때, 경로는 문서, 이미지, 압축파일 등 모두 해당된다<br>!! 브라우저 자체에서 처리가 가능한 이미지나 텍스트 형식이라면 브라우저의 뷰어로 내용을 보여주고 처리할 수 없는 경우에는 다운로드가 된다</small>

- href 속성의 값에는 절대경로, 상대경로, 웹경로 모두 사용 가능하다.
- target 속성의 \_blank 값으로 새 페이지에서 문서가 열리게 할 수 있다.

```html
<a href="https://www.naver.com" target="_blank">링크문구</a>
<!-- 링크문구를 클릭하면 새 페이지에서 네이버가 열린다 -->
```

---

## iframe

- iframe 태그를 이용해서 문서 페이지 내에서 다른 문서를 불러올 수 있다.

```html
<iframe
  src="https://www.etnews.com/"
  width="800"
  height="600"
  frameborder="0"
></iframe>
<!-- frameborder 속성으로 테두리 형태를 조절할 수 있다 -->
```

- iframe 태그 내에 name 속성 값을 주고 그 값을 a 태그의 target 속성의 값으로 입력해서 연결되는 문서가 iframe에서 열리게 할 수 있다

```html
<iframe
  name="child"
  src="https://www.naver.com/"
  width="800"
  height="600"
  frameborder="0"
></iframe>
<a href="https://www.naver.com" target="child">네이버</a>
<a href="https://www.daum.net" target="child">다음</a>
```

---

## form

- input 태그의 type 속성의 값으로 여러가지 형식의 값을 입력 받을 수 있다

  ### input 태그의 type 속성의 값들

  - text : 한 줄의 텍스트를 입력받는다

  ```html
  <input
    type="text"
    size="50"
    maxlength="20"
    placeholder="숫자 입력"
    value="초기값"
  />
  <!-- size로 입력받는 박스의 크기
    maxlength로 입력받을 수 있는 최대 글자수
    placeholder로 입력할 값의 힌트
    value로는 초깃값을 정할수 있다  -->
  ```

  - password : 비밀번호를 입력받는다(입력하는 값이 보이지 않는다)

  ```html
  <input type="password" />
  ```

  - submit : 입력받은 값을 action 속성에서 정한 문서로 전달하는 버튼을 만든다

  ```html
  <form action="proc.html" method="get">
    <!-- action 속성의 값은 전달 받은 값을 처리할 문서이고 method 속성의 값은 입력받은 값을 전달하는 방식이다 -->
    아이디 <input type="text" name="id" /><br />
    비밀번호 <input type="password" name="password" />
    <!-- input 태그 안에 반드시 name 속성의 값을 정해줘야 값을 입력받은 값을 문서에 제대로 전달할 수 있다-->
    <input type="submit" value="전송하기" />
    <!--value 속성의 값은 버튼에 보여 줄 텍스트 이다-->
  </form>
  ```

  ***

  !! method 속성은 입력받은 값을 처리할 문서로 전달하는 방식인데 총 4가지 방식이 있다

  - get : 입력받은 값이 url에 보이는 방식

    ex) https://www.google.com/search?q=귀멸의칼날 <br>
    이때 q 뒤에 오는 값이 입력받은 값

  - post : 입력받은 값이 전송 header에 포함돼 그 값이 url에 보이지 않는 방식(입력받은 값이 암호화 되는 것은 아니다)
  - update, delete : 잘 사용되지 않는 방식

  !! https://search.naver.com/search.naver?where=nexearch&query=%EA%B7%80%EB%A9%B8%EC%9D%98%EC%B9%BC%EB%82%A0 일 때, 중간에 보이는 "?", "&"는 뭘 의마할까?

  - ?
    <br>값을 처리하는 문서(https://search.naver.com/search.naver)와 처리해야되는 값(where=nexearch&query=%EA%B7%80%EB%A9%B8%EC%9D%98%EC%B9%BC%EB%82%A0)을 구분하는 문자
  - & <br>
    처리해야 되는 값은 "키(값을 저장하는 상자) = 값(입력한 값)" 의 형태로 보내지는데, 그 값의 쌍들을 구분하는 문자

  ***

  - checkbox : 다중 선택을 하게 하는 속성 값

  ```html
  <input type="checkbox" />사과<br />
  <!-- checkbox 값으로 다중선택 -->
  <input type="checkbox" />참외<br />
  <input type="checkbox" checked />귤<br />
  <!-- checked 속성으로 기본 선택값 정할 수 있다 -->
  <input type="checkbox" />수박<br />
  ```

  - radio : 단일 선택을 하게 하는 속성 값

  ```html
  <input type="radio" name="radio" />사과<br />
  <input type="radio" name="radio" />참외<br />
  <input type="radio" name="radio" />귤<br />
  <input type="radio" name="radio" />수박<br />
  <!-- name 속성으로 같은 값이 주어진 input 태그에 관해서 단일 선택을 하게 한다 -->
  ```

  - file : 파일 선택을 하게 하는 속성 값

  ```html
  <input type="file" />
  ```

  - color : 색상 선택을 하게 하는 속성 값

  ```html
  <input type="color" value="yellow" />
  <!-- value 속성에 값을 넣어 초기값을 정할 수 있다 -->
  ```

  - date : 날짜 선택을 하게 하는 속성 값

  ```html
  <input type="date" value="2023-02-23" />
  <!-- value 속성에 값을 넣어 초기값을 정할 수 있다 -->
  ```

  - number : 숫자를 선택하게 하는 속성 값

  ```html
  <input type="number" max="20" step="2" min="0" />
  <!-- max, min 속성으로 최대, 최소 값을 정할 수 있고 step 속성으로 값의 증감 정도를 정할 수 있다 -->
  ```

  - range : 숫자를 선택하게 하는 속성 값으로 브라우저 상에 바 형태로 나타난다

  ```html
  <input type="range" max="20" min="0" />
  <!-- max, min 속성으로 최대, 최소 값을 정할 수 있고 step 속성으로 값의 이동 범위를 정할 수 있다 -->
  ```

  - datalist : input 태그와 함께 쓰여 선택 제시어를 제공해주는 태그

  ```html
  <input type="text" list="browsers" />
  <datalist id="browsers">
    <option value="Internet Explorer" label="인터넷 익스플로러"></option>
    <option value="FireFox" label="파이어폭스"></option>
    <!-- label 속성으로 선택지의 설명글을 적을 수도 있다 -->
    <option value="Chrome" label="크롬"></option>
    <option value="Opera" label="오페라"></option>
    <option value="Safari" label="사파리"></option>
  </datalist>
  ```

### textarea : 여러 줄의 텍스트를 입력받는다

```html
<textarea cols="30" rows="10">초기값</textarea>
<!-- cols, rows 속성의 값으로 텍스트 박스의 열과 행의 값을 정할 수 있고 초기값은 위와 같은 방식으로 지정할 수 있다 -->
```

### fieldset

```html
<fieldset>
  <legend>정보설정</legend>
  <!-- legend 태그를 이용해 fieldset 에 속한 부분에 이름을 보여줄 수 있다 -->
  <ul>
    <li>
      <label for="name">이름</label>
      <input type="text" id="name" />
      <!-- label 태그의 for 속성에 있는 값을 input 태그의 id 속성의 값과 같게 해서 입력 받는 값의 이름을 정할 수 있다 -->
    </li>
    <li>
      <label for="email">이메일</label>
      <input type="text" id="email" />
    </li>
    <li>
      <label for="password">비밀번호</label>
      <input type="password" id="password" />
    </li>
  </ul>
</fieldset>
```

---

## video

- 비디오 파일을 웹에서 볼 수 있게 해주는 태그

```html
<video width="320" height="240" controls>
  <!-- controls 속성으로 재생시키고 중단시킬 수 있다 -->
  <source src="./videos/mov_bbb.mp4" type="video/mp4" />
  <source src="./videos/mov_bbb.ogv" type="video/ogv" />
  <!-- 위에 있는 mp4파일이 동작하지 않을 시에 아래에 ogv 파일을 재생시킨다 -->
</video>
```

---

## 간단한 그림 그리기

1. svg(scalable vector graphics) 태그
   : 간단한 차트나 도형을 그릴 수 있다

   <small>https://www.w3schools.com/graphics/svg_intro.asp 참조</small>

```html
  <svg width="500" height="200">
   <rect x="10" y="10" width="400" height="100" fill="yellow">
  </svg>
  <!-- 직사각형 그리기 -->
  <svg width="500" height="200">
   <circle cx="50" cy="50" r="40" fill="yellow" stroke="black" stroke-width="3">
  </svg>
  <!-- 원 그리기-->
```

2. canvas + javascript (프로그램)

# CSS (Cascading Style Sheet)

- html 문서에 디자인을 준다 (문서 꾸미기)

  - 적용 방법

    - inline : 태그 옆에 쓰여서 효과를 주는 방법

    ```html
    <body style="background-color: green;">
      <!-- background-color은 배경색, color은 글자색을 지정한다 -->
    </body>
    ```

    - internal : head 태그안에 미리 정의한 후 적용

    ```html
    <head>
      <meta charset="UTF-8" />
      <style type="text/css">
        body { <!-- 여기서 body는 선택자다 -->
          background-color: green;
        }
      </style>
    </head>
    ```

    - external : 외부의 css파일을 연결시켜 적용

    ```css
    body {
      background-color: blue;
    }
    /* 위와 같이 default.css 파일을 만들고 */
    ```

    ```html
    <head>
      <meta charset="UTF-8" />
      <link rel="stylesheet" type="text/css" href="./default.css" />
    </head>
    <!-- html 파일의 head 태그 속 link 태그를 이용해서 외부의 css 파일과 연결시킨다 -->
    ```

  - 적용 우선순위

    1<sup>st</sup>. inline<br><br>
    2<sup>st</sup>. internal<br><br>
    3<sup>st</sup>. external

---

## selector(선택자)<br><br>

<img src="https://www.w3schools.com/css/img_selector.gif"><br>

### \* : 전체 선택자

```css
* {
  color: red;
}
```

### 태그 선택자

```css
p {
  color: blue;
}
div {
  color: black;
  background-color: aqua;
}
p {
  color: green;
  /* 같은 태그를 선택자로 사용했을 때는 나중에 쓰인 것이 우선으로 적용된다 */
}
```

### 클래스 선택자 : 다른 태그들에게 같은 디자인 효과를 주고 싶을 때 사용

```html
<head>
  <style type="text/css">
    .c1 {
      color: red;
    }
    .c2 {
      color: blue;
    }
    .c3 {
      color: black;
    }
    div.c1 {
      /* div 태그 중 c1 클래스에 해당되는 곳에 디자인 효과를 준다*/
      color: aqua;
    }
  </style>
</head>
<body>
  <p class="c1">Hello CSS</p>
  <div class="c1">Hello CSS</div>
  <p class="c2">Hello CSS</p>
  <div class="c2">Hello CSS</div>
  <p class="c3">Hello CSS</p>
  <div class="c3">Hello CSS</div>
</body>
```

### 아이디 선택자 : 클래스와 비슷하지만 한 페이지 내에서 한 요소에만 사용이 가능

```html
  <head>
    <style type="text/css">
      #i1 {
        color: red;
      }
      #i2, #i3 { /* 쉼표를 이용해 한번에 지정할 수도 있다 */
        color: green;
      }
    </style>
  </head>
  <body>
    <p id="i1">Hello CSS</p>
    <div id="i1">Hello CSS</div>
    <p id="i2">Hello CSS</p>
    <div id="i2">Hello CSS</div>
    <p id=ic3">Hello CSS</p>
    <div id="i3">Hello CSS</div>
  </body>
```

### 복합선택자

<small>!! DOM(Document Object Model) Tree : 계층구조를 나타내는 트리</small>

#### 자손선택자 <br>

```css
div > p {
  color: blue;
} /* 바로 아래 자손에게만 효과를 준다 */
div:first-child {
  color: red;
} /* 첫번째 자손에게만 효과를 준다 */
div:last-child {
  color: green;
} /* 마지막 자손에게만 효과를 준다 */
div:ntn-child(2) {
  color: blue;
} /* 괄호 안 순서의 자손에게만 효과를 준다 */
div: ntn-child(2n) {
  color: red;
} /* 짝수번째의 자손에게만 효과를 준다 */
```

#### 후손선택자 : 아래의 모든 후손(자손들의 자손까지)에게 디자인 효과를 준다<br>

```css
div p {
  color: blue;
  /* 단순히 띄어쓰기이므로 css 작성할 때는 띄어쓰기에 주의해야한다 */
}
```

#### 아우 선택자 : 후손이 아닌 뒤에 오는 선택자에게 효과를 준다<br>

```css
div + p {
  color: red;
} /* 바로 뒤의 아우에게만 효과를 준다 */
div ~ p {
  color: red;
} /* 뒤에 오는 모든 아우에게 효과를 준다 */
```

#### pseudo class : ":"을 이용하고 태그의 특정상태일 때를 지정한다

```css
a:link {
  color: #ff0000;
} /* 처음에 링크가 걸려있는 상태 */
a:visited {
  color: #00ff00;
} /* 링크를 이용한 이후의 상태*/
a:hover {
  color: #ff00ff;
} /* 링크 위에 마우스가 올려진 상태*/
a:active {
  color: #0000ff;
} /* 링크를 클릭할 때의 상태 */
```

<small>https://www.w3schools.com/css/css_pseudo_classes.asp 참조</small>

#### pseudo element : "::"를 이용하고 태그의 특정요소에만 영향을 준다

```css
div::first-line {
  color: #ff0000;
} /* 텍스트의 첫 줄에만 효과를 준다 (브라우저 창의 크기에 따라 첫 줄의 길이가 달라지므로 효과 받는 영역이 달라진다)*/
div::first-letter {
  color: #ff6600;
  font-size: xx-large;
} /* 텍스트의 첫 글자에만 효과를 준다 */
```

<small>https://www.w3schools.com/css/css_pseudo_elements.asp 참조</small>

#### Attribute Selector : 대괄호([, ])를 이용하고 특정속성을 사용하는 태그에 영향을 준다

```css
a[target] {
  background-color: blue;
} /* 특정 속성을 이용하는 태그에 디자인 효과를 준다 */
a[target="_blank"] {
  background-color: blue;
} /* 특정 속성의 값을 이용하는 태그에 디자인 효과를 준다 */
```

<small>https://www.w3schools.com/css/css_attribute_selectors.asp 참조</small>

---

## background

### background-color

```css
body {
  background-color: #0000ff;
  /* background-color: rgb(0, 0, 255); */
}
```

### background-image

```css
body {
  background-image: url("../images/daum.png");
  /* background-image: url('../images/daum.png'), url('../images/img_flwr.gif);
      로 써서 여러 개의 이미지를 중첩시킬수도 있다 */
}
```

### background-repeat

```css
body {
  background-repeat: no-repeat;
  /* 디폴트값은 repeat */
  /* 두개의 이미지를 중첩시킨 경우에는 쉼표를 이용해서 값을 줄 수 있다 */
}
```

### background-position

```css
body {
  background-position: right top;
  /* 두개의 이미지를 중첩시킨 경우에는 쉼표를 이용해서 값을 줄 수 있다 */
}
```

### background-attachment

```css
body {
  background-attachment: fixed;
  /* 두개의 이미지를 중첩시킨 경우에는 쉼표를 이용해서 값을 줄 수 있다 */
}
```

!! 위의 속성들을 아래와 같이 한번에 쓰는 것도 가능하다

```css
body {
  background: #0000ff url("../images/daum.png") no-repeat right top fixed;
}
```

---

## font

### font-family : 브라우저에서 지원하는 기본 폰트를 주로 사용한다

```css
#i1 {
  font-family: "굴림체";
}
```

!! 구글에서 지원하는 폰트를 사용할 수도 있다

<sup>ex) https://developers.google.com/fonts?hl=ko</sup>

```html
<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
  <!-- url에서 family 키 뒤에 오는 "Sofia"가 사용할 글씨체 -->
  <style type="text/css">
    #i1 {
      font-family: "Sofia", "굴림체";
      /* "굴림체"는 "Sofia" 사용이 안될 때 사용할 글씨체 */
    }
  </style>
</head>
```

### web font

- ttf, otf, woff, eot, svg 파일 형식이 있고 접속이 느려질 수 있다

```html
<style type="text/css">
  @font-face {
    font-family: myFont1; /* 폰트 이름 지정 */
    src: url("./fonts/sansation_light.woff");
  }
  #i1 {
    font-family: myFont1; /* 위에서 지정한 이름으로 글꼴 사용 */
  }
</style>
```

### font-size : 기본 사이즈는 16px

```css
#i1 {
  font-family: "궁서체";
  font-size: 12px;
  /* font-size: 2em; 기본 사이즈(16px)에 대해 두배 */
  /* font-size: 200%; 기본 사이즈(16px)에 대해 두배 */
}
```

### font-style : 기본 값은 normal

```css
#i1 {
  font-family: "궁서체";
  font-size: 12px;
  font-style: italic; /* 이탤릭체 */
}
```

### font-weight : 글씨 두께 조절

```css
#i1 {
  font-family: "궁서체";
  font-size: 12px;
  font-style: italic;
  font-weight: bold; /* 두껍게 */
}
```

!! 위의 속성들을 아래와 같이 한번에 쓰는 것도 가능하다

```css
#i3 {
  font: bold 20px "궁서체";
}
```

---

## Icon

<small>!! https://www.w3schools.com/css/css_icons.asp 참조</small>

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script
      src="https://kit.fontawesome.com/a076d05399.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <i class="fas fa-cloud"></i>
    <i class="fas fa-heart"></i>
    <i class="fas fa-car"></i>
    <i class="fas fa-file"></i>
    <i class="fas fa-bars"></i>
  </body>
</html>
```

---

## Cursor

```css
#i1 {
  cursor: default;
}
#i2 {
  cursor: help;
}
#i3 {
  cursor: crosshair;
}
```

---

## CSS를 이용해 목록의 순서, 기호 표현 문자 바꾸기

### 순서없는 목록의 기호 바꾸기

```html
<head>
  <meta charset="UTF-8" />
  <style type="text/css">
    ul.a {
      list-style-type: square;
      <!-- a 클래스 목록의 기호를 작은 사각형으로 바꾼다 -->
    }
  </style>
</head>
<body>
  <ul class="a">
    <li>참외</li>
    <li>수박</li>
    <li>사과</li>
    <li>귤</li>
  </ul>
</body>
```

!! 이미지를 가져와 목록의 기호 바꾸기

```html
<head>
  <meta charset="UTF-8">
  <style type="text/css">
    ul.a {
      list-style-image: url('../images/purple.gif');
      <!-- a 클래스 목록의 기호를 이미지로 바꾼다 -->
    }
  </style>
</head>
<body>
  <ul class="a">
    <li>참외</li>
    <li>수박</li>
    <li>사과</li>
    <li>귤</li>
  </ol>
</body>
```

### 순서있는 목록의 순서 표현 기호 바꾸기

```html
<head>
  <meta charset="UTF-8" />
  <style type="text/css">
    ol.a {
      list-style-type: lower-alpha;
      <!-- a 클래스 목록의 순서 표현 기호를 영어 소문자로 바꾼다 -->
    }
  </style>
</head>
<body>
  <ol class="a">
    <li>참외</li>
    <li>수박</li>
    <li>사과</li>
    <li>귤</li>
  </ol>
</body>
```

---

## Box Model(영역)

- 블록 태그 ( + CSS )

  - p

  - div

  <small>!! span 태그는 inline 태그로 엔터키가 들어가지 않는다<br>

  !! inline 태그는 width, height, margin, padding 속성을 쓰더라도 적용되지 않는다</small>

  ```css
  span.a {
    display: inline;
    width: 100px;
    height: 100px;
    padding: 5px;
    border: 1px solid blue;
    background-color: yellow;
    /* width, height, padding, margin의 값이 적용되지 않는다 */
  }
  span.b {
    display: inline-block;
    width: 100px;
    height: 100px;
    padding: 5px;
    border: 1px solid blue;
    background-color: yellow;
  }
  span.c {
    display: block;
    width: 100px;
    height: 100px;
    padding: 5px;
    border: 1px solid blue;
    background-color: yellow;
  }
  ```

  !! https://www.w3schools.com/css/css_inline-block.asp 참조

### border

```css
#i1 {
  border-width: 1px;
  border-color: red;
  border-style: solid;
  border-radius: 10px; /* 기본 모양은 사각형이지만 모서리 값으로 준 거리에 곡률을 줄 수 있다 */
}
```

!! 위의 속성들을 아래와 같이 한번에 쓰는 것도 가능하다

```css
#i1 {
  border: 2px solid red;
}
```

!! 경계선 상하좌우(top, bottom, left, right) 따로 디자인을 줄 수도 있다

```css
#i1 {
  border-bottom-width: 2px;
  border-bottom-color: green;
  border-bottom-style: solid;
  /* border-bottom : 2px solid green; */
  /* 2px의 초록색 실선 */
}
```

### width / height

```css
#i1 {
  border: 2px dotted blue; /* 2px의 파란색 점선 */
  width: 100px; /* 가로 */
  height: 100px; /* 세로 */
}
```

### padding / margin

```css
div {
  border: 2px solid blue;
  padding: 20px;
  /* 내부 여백 */
  padding-left: 20px;
  padding-top: 20px;
  /* 상하좌우 따로 지정할 수 있다 */
  padding: 25px 50px 75px 100px;
  /* top right bottom left 순서로 한번에 적어줄 수 있다 */
  margin: 10px;
  /* 외부 여백 */
  /* padding 처럼 상하좌우 따로 지정할 수 있고,
        top, right, bottom, left(시계방향) 순서로 한번에 적어줄 수 있다 */
}
```

### display

```css
#i1 {
  display: none;
  /* 영역 자체를 완전 없앤다
    (visibility 속성의 hidden과 비교) */
}
```

```css
p {
  display: inline;
  /* 블록 태그의 속성을 inline 태그로 바꾼다 */
}
```

```css
span {
  display: block;
  /* inline 태그의 속성을 블록 태그로 바꾼다 */
}
```

```css
div {
  display: inline-block;
  /* inline 태그와 달리 width, height, margin, padding 속성을 사용할 수 있고 
  블록 태그와 달리 엔터키가 들어가지 않는다 */
}
```

### visibility

```css
#i1 {
  visibility: hidden;
  /* 영역은 남아있고, 디자인만 안 보이게 숨긴다
    (display 속성의 none과 비교) */
}
```

### float

!! https://www.w3schools.com/css/css_float.asp 참조

```css
img {
  width: 170px;
  height: 170px;
  float: left; /* 이미지를 왼쪽에 위치하게 한다 */
  margin-right: 20px;
}
```

---

## 통신 프로토콜 + 포트

- http - 일반 웹서버 요청 - 80 포트 사용(생략 가능) / 톰캣은 8080 포트 사용

- https - 보안 웹서버 요청 - 437 포트 사용(생략가능)

  <small>!! 포트는 변경시킬 수 있다</small>

---

## Box Model 이용해 button 만들기

!! https://cssbuttongenerator.com/ 참조

---

## text

!! https://www.w3schools.com/css/css_text.asp 참조

### text-align : 기본값은 left

```css
#p1 {
  text-align: center;
}
#p2 {
  text-align: left;
}
#pr {
  text-align: right;
}
```

### vertical-align : 기본값은 baseline

```css
#i1 {
  vertical-align: baseline;
}
#i2 {
  vertical-align: text-top;
}
#i3 {
  vertical-align: text-bottom;
}
```

### text-decoration

```css
#i1 {
  text-decoration: overline;
}
#i2 {
  text-decoration: underline;
}
#i3 {
  text-decoration: line-through;
  text-decoration-color: red;
  text-decoration-style: dotted;
}
```

### text-transform

```css
#i1 {
  text-transform: uppercase;
}
#i2 {
  text-transform: lowercase;
}
#i3 {
  text-transform: capitalize;
  /* 각 단어의 첫 글자를 대문자로 만든다 */
}
```

### text-indent : 들여쓰기

```css
#i1 {
  text-indent: 50px;
}
```

### letter-spacing : 글자간 간격 조절

```css
#i2 {
  letter-spacing: 3px;
}
#i3 {
  letter-spacing: -3px;
}
```

### word-spacing : 단어간 간격 조절

```css
#i2 {
  word-spacing: 3px;
}
```

### line-height : 줄간의 간격 조절

```css
#i3 {
  line-height: 0.8;
}
```

### text-shadow : 글자 음영 주기

```css
h1 {
  text-shadow: 2px 2px 5px red;
  /* 2px, 2px 만큼씩 뒤로가서 5px 만큼의 빨간 블러효과를 준다 */
  /* 쉼표로 구분해 여러가지 색의 효과를 줄 수도 있다 */
}
```

### box-shadow : box-model의 테두리에 음영 주기

```css
h1 {
  width: 300px;
  height: 100px;
  padding: 15px;
  background-color: coral;
  box-shadow: 10px 10px 5px lightblue;
}
```

### overflow : 주어진 영역을 벗어나게 텍스트가 있을 때 사용하는 명령어

```css
#i1 {
  background-color: #eee;
  width: 200px;
  height: 65px;
  border: 1px solid black;
  overflow: visible;
  /* 기본값 */
}
#i2 {
  background-color: #eee;
  width: 200px;
  height: 65px;
  border: 1px solid black;
  overflow: hidden;
  /* 영역을 벗어난 부분을 숨긴다 */
}
#i3 {
  background-color: #eee;
  width: 200px;
  height: 65px;
  border: 1px solid black;
  overflow: scroll;
  /* 텍스트 크기를 줄여서 영역 안에 다 들어가도 스크롤은 남아있다 */
}
#i4 {
  background-color: #eee;
  width: 200px;
  height: 65px;
  border: 1px solid black;
  overflow: auto;
  /* 영역이 벗어나는 경우에는 스크롤이 생기고, 벗어나지 않으면 생기지 않는다 */
}
```

---

## table

### border-collapse : 표를 만들면 셀마다 경계선이 각각 생기는데, 이 속성을 이용하면 한 줄로 합칠 수 있다

```css
table {
  width: 600px;
  border: 1px solid black;
  border-collapse: collapse;
}
td,
th {
  border: 1px solid black;
}
```

---

## layer

- table 태그를 사용할 수도 있지만, 요즘은 잘 사용하지 않는다

### positon

<small>!! https://www.w3schools.com/css/css_positioning.asp 참조</small>

```css
#i1 {
  position: absolute;
  top: 0px;
  left: 0px;
  /* positon 속성은 값을 주고 top, left, bottom, right 속성을 추가해 layer를 조절할 수 있다 */
  /* absolute 값은 가장 가까운 조상을 기준으로 위치를 지정한다 */
  background-color: red;
  z-index: 3;
  /* z-index 속성을 통해 겹치는 순서를 조절할 수 있다 (이 때, 속성 값은 상대적인 값이다) */
}
#i2 {
  position: absolute;
  top: 50px;
  left: 50px;
  background-color: green;
  z-index: 2;
}
#i3 {
  position: absolute;
  top: 100px;
  left: 100px;
  background-color: blue;
  z-index: 1;
}
```

```css
#i1 {
  position: relative;
  /* relative 값은 원래 위치를 기준으로 위치를 지정한다 */
  top: 0px;
  left: 0px;
  background-color: red;
}
#i2 {
  position: relative;
  top: 50px;
  left: 50px;
  background-color: green;
}
#i3 {
  position: relative;
  top: 100px;
  left: 100px;
  background-color: blue;
}
```

```css
#i1 {
  position: fixed;
  /* fixed 값은 위치를 고정시킨다 */
  bottom: 0px;
  right: 0px;
  width: 300px;
  border: 1px solid black;
}
```

```css
#i1 {
  position: sticky;
  top: 5px;
  /* top 속성에 해당되는 값일 때부터 위치를 고정시킨다(스크롤을 내려 5px 인 시점부터 위치를 고정) */
  padding: 5px;
  background-color: #cae8ca;
}
```

---

## tansform 속성의 속성 값

### tanslate

```css
#i2 {
  transform: translate(-50px, 100px);
  /* 원래 위치에서 왼쪽으로 50px, 아래로 100px 만큼 이동 */
}
```

### rotate

```css
#i2 {
  transform: rotate(90deg);
  /* 시계방향으로 90deg 만큼 회전 */
}
```

!! transition 속성과 함께 쓰여 시간을 지연시킬 수도 있다

```css
div {
  width: 100px;
  height: 100px;
  border: 1px solid black;
  transition: transform 2s;
}
#i1:hover {
  transform: rotate(180deg);
}
/* 2초에 걸쳐 180도 회전 */
```

```css
div {
  width: 100px;
  height: 100px;
  border: 1px solid black;
  transition: width 3s, height 2s;
}
#i1:hover {
  width: 300px;
  height: 300px;
}
/* 가로 3초, 세로 2초에 걸쳐 가로, 세로 300px 까지 커진다 */
```

---

## animation

!! https://www.w3schools.com/css/css3_animations.asp 참조

```css
@keyframes anim {
  from {
    /* 처음 */
    background-color: red;
  }
  to {
    /* 끝 */
    background-color: yellow;
  }
}
#i1 {
  widows: 100px;
  height: 100px;
  background-color: red;
  animation-name: anim;
  animation-duration: 4s;
  /* 4초에 걸쳐 빨간색의 배경이 노란색으로 변한다 */
}
```

```css
@keyframes anim {
  0% {
    /* 시작 */
    background-color: red;
    left: 0px;
    top: 0px;
  }
  25% {
    /* 4분의 1 지점 */
    background-color: yellow;
    left: 200px;
    top: 0px;
  }
  50% {
    /* 중간 */
    background-color: blue;
    left: 200px;
    top: 200px;
  }
  100% {
    /* 끝 */
    background-color: green;
    left: 0px;
    top: 0px;
  }
  /* 변경 지점을 백분율로 정할 수도 있다 */
}
#i1 {
  widows: 100px;
  height: 100px;
  background-color: red;
  animation-name: anim;
  animation-duration: 8s;
  position: relative;
}
/* position 속성과 함께 쓰여 움직이는 것도 가능하다 */
```

---

