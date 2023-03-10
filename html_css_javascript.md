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

# 프로그래밍 언어란?

- 컴퓨터에게 작업을 지시

  - 지시는 수학적인 마인드로 이루어져 있고 절차적이다

  - 작업이 잘못되면 지시를 잘못한 것이다

- 영어를 쓰기 때문에 기본으로 암기해야될 내용이 있다

- 프로그램 언어 종류

  - 컴파일 언어 : 소스코드를 컴파일해서 실행코드를 먼저 만들고 실행시킨다(속도가 빠르다)

    <small> ex) C / Java</small>

  - 스크립트 언어 : 컴파일 과정없이 소스코드로 바로 실행시킨다(편리)

    <small> ex) Javascript / Python </small>

- 문법을 반드시 지켜야 한다

  - 저장 공간

    - 변수(variable) : 내용 변경이 가능한 저장공간

    - 상수(constant) : 내용 변경이 불가능한 저장공간

  - 자료형

    - 진리값(boolean / bool) : true 또는 false 값만을 가질 수 있다

    - 숫자

      - 정수(integer)

      - 실수(float / double)

    - 문자(character)

      - javascript에는 문자열로 통합되어 있다
        <br><br>

    - 문자열(String)
    - 정의 되지 않은 자료형(undfined)
    - 생성되지 않은 자료형(null)

  - 함수(function)
  - 객체(object)

- 프로그래밍 언어로 만들 수 있는 프로그램

  - 윈도우즈 프로그램 :
    Windows / linux /macOS 에 인스톨(압축해제)해서 실행하는 프로그램

    - CUI(Character User Interface) : 명령프롬프트에서 실행(기본적인 프로그램)

    - GUI(Graphic User Interface) : 메모장, 브라우저같은 프로그램

  - 웹 프로그램 : 브라우저 내부에서 실행되는 프로그램

    - HTML / Javascript<br><br>

  - 모바일 프로그램 : 스마트폰용 프로그램(요즘은 윈도우즈 프로그램과 병합되는 추세다)

---

# Javascript

- 웹 프로그램과 윈도우즈 프로그램 모두 만들 수 있는 언어

- w3c 를 기준으로 한다
- ecmascriptdml 표준사양을 따른다
- 브라우저 내에 Javascript 해석 엔진(v8)이 있다 : 브라우저를 OS 처럼 사용한다
- 브라우저 콘솔창을 사용해 간단한 소스의 결과를 바로 확인할 수 있다

  <small>!! REPL(Read Eval Print Loop) : 한 줄씩 행단위로 실행을 해보는 것으로 공부를 하거나 에러를 확인할 때 많이 사용한다</small>

- html 문서 내에서 script 태그를 이용해 사용할 수 있다

```js
<script type="text/javascript">
  alert("Hello javascript!"); // 화면에 내용을 알림창으로 띄어준다
  console.log("Hello javascript!"); // 디버깅을 위한 출력
</script>
```

```js
  <script type="text/javascript">
    document.write("Hello javascript!");
    // html 출력으로 html 태그의 효과가 들어간다
    document.write("<table border='1'>");
    // 큰따옴표 안에는 큰따옴표가 쓰일 수 없고 작은따옴표를 써야한다
    document.write("<tr>");
    document.write("<td>");
    document.write("<1열>");
    document.write("</td>");
    document.write("</tr>");
    document.write("</table>");
  </script>
```

- script 태그는 head , body 태그 상관없이 여러 곳에서 동시에 쓰일 수 있다(출력의 순서 때문에 여러 곳에서 쓰일 수 있다)

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script>
      console.log("1");
    </script>
  </head>
  <body>
    <script>
      console.log("2");
    </script>
    <br /><br />
    <script>
      console.log("3");
    </script>
  </body>
</html>
<!-- 위에서 아래방향으로 보여진다 -->
```

- head 태그에는 주로 선언적인 내용이 쓰인다

- body 태그에는 주로 출력할 내용이 쓰인다

- html 문서 외부에서 불러오는 방법도 있다

```js
console.log("hello Javascript!");
// default.js 파일
```

```js
<script type="text/javascript" src="./default.js"></script>
// default.js 파일을 연결시킨다
```

- 주석

```js
<script type="text/javascript">// 한 줄 주석 /* 여러 줄 주석 */</script>
```

- 한줄이 끝나고 세미콜론(;)을 붙여주는 것이 좋다

- 대소문자 구분한다

---

## 문법용어 기본(암기)

- 자료형

  - typeof() : 변수의 자료형을 알 수 있다

  ```js
  typeof data;
  // console.log(typeof data); 이렇게 쓰는 것도 가능하다
  ```

  - 진리값(boolean / bool) : true 또는 false 값만을 가질 수 있다

  ```js
  let bool1 = true;
  let bool2 = false;
  console.log(bool1);
  console.log(bool2);
  ```

  ```js
  let bool = True; // 에러!! True는 진리값이 아니다
  ```

  - 숫자(number)

    - 정수(integer)

    - 실수(float / double)

  ```js
  let num1 = 10; // 정수 표현
  let num2 = 3.14; // 실수 표현
  let num3 = 3.14e3; // 지수 표현
  ```

  ```js
  let num1 = 0b101; // 2진수
  let num2 = 0o73; // 8진수
  let num3 = 0x2a; // 16진수
  ```

  - 문자(Character) : javascript 에는 문자 자료형은 없다

  - 문자열(String)

  ```js
  let str1 = "Hello String"; // 큰따옴표 사용가능
  let str2 = "Hello String"; // 작은따옴표 사용가능
  ```

  - 정의 되지 않은 자료형(undfined)

  - 생성되지 않은 자료형(null)

- 저장 공간 : 자료형을 가지고 저장공간을 만든다

  - 변수(variable) : 내용 변경이 가능한 저장공간

    - 선언은 let 을 이용한다

    ```js
    let data1; // 변수의 선언
    data1 = 10; // 값의 할당(대입)
    // let data1 = 10; 이렇게 한번에 쓸 수도 있다
    console.log(data1); // 변수 내용 출력
    ```

    ```js
    let data = 10;
    let data = 15; // 에러!! 재선언은 불가능하다
    ```

    ```js
    let one = 1,
      two = 2,
      three;
    three = 3;
    // 위와 같이 여러 변수를 한번에 선언, 할당할 수 있다
    ```

    - 변수의 값에 따라서 변수의 자료형태는 자동 결정된다

  - 상수(constant) : 내용 변경이 불가능한 저장공간

    - 선언은 const 를 이용한다

    ```js
    const DATA = 10;
    // DATA 상수를 선언 및 할당
    ```

    ```js
      const DATA; // 에러!! 상수는 선언하는 동시에 값을 할당해야 한다
      DATA = 10;
      console.log(DATA)
    ```

    ```js
    const DATA = 10;
    DATA = 20; // 에러!! 상수는 값 변경이 불가능한 저장공간이다
    ```

    - let, const 없이 선언할 수도 있다

    ```js
    data1 = 10;
    // 이렇게 아무것도 붙이지 않고 선언해도 에러가 나지 않지만 지양하자
    console.log(data1);

    var data2 = 20; // var 를 사용해 변수 선언할 수도 있다
    console.log(data2);
    ```

    ```js
    "use strict"; // 'use strict' 를 먼저 쓰면, 아래와 같이 let, const, var 가 없을 시에 에러가 발생한다
    data1 = 10;
    console.log(data1);
    ```

  - 할당(대입)은 대입연산자(=)의 오른쪽에서 왼쪽으로 이루어진다

  ```js
  let data = 10; // 10이 data 변수에 할당된다
  ```

  - 저장공간의 이름을 식별자라 하고 아래의 규칙을 반드시 지켜야 한다(지키지 않으면 에러가 생긴다)

  1. 대소문자를 구분

  2. 예약어는 사용불가
  3. 숫자만 사용하면 안됨
  4. 공백문자 사용불가
  5. 특수문자는 \_ , $만 사용가능하다

  !! 식별자 표기법(규칙은 아니지만 지키는 것이 좋다)

  https://namu.wiki/w/%EC%BD%94%EB%94%A9%20%EC%8A%A4%ED%83%80%EC%9D%BC#s-3 참조

  1. 변수는 카멜 표기법(파스칼 표기법) + 헝가리안 표기법

  2. 상수는 Screaming Snake Case 표기법 사용

- 함수(function)

- 객체(object)

- 특수 기호 표현하기

```js
let str1 = "Hello\nString"; // 한 줄 띄어쓰기
console.log(str1);
let str2 = "Hello\tString"; // 탭 하기
console.log(str2);
let str3 = "'Hello String'"; // 작은따옴표 표현하기(큰 따옴표도 마찬가지다)
console.log(str3);
```

- 템플릿 리터럴 : `(백팃)을 사용하며 ` 안의 문자, 형식을 그대로 보여준다

```js
let str1 = `Hello
            String`;
console.log(str1);
// \n(줄바꿈 문자)를 사용하지 않았는데, 줄바꿈 한 것처럼 표현된다
let str2 = "백두산";
let str3 = "205";
console.log(str1 + "님, " + str2 + "강의실에 입장하세요");
console.log(`${str1}님, ${str2}강의실에 입장하세요`);
// 변수의 이름을 써서 직접 문자열을 표현할 수 있다(윗 줄과 비교)
// 백두산님, 205 강의실에 입장해 주세요
```

- undefined : 선언되지 않거나, 선언은 되었으나 값이 할당되지 않은 경우의 자료형 또는 값(프로그래머의 실수로 발생하는 경우가 많다)

- null : 특정자료형이 아니라 null(미정)로 초기화되었을 때의 자료형 또는 값(아직 변수에 넣을 자료형을 정하지 않은 상태라 프로그래머가 의도적으로 집어넣는 경우가 많다)

---

## 형변환

- 자동 형변환(묵시적 형변환) : javascript 는 자동으로 상황에 따라 자동으로 형변환이 일어난다

```js
console.log(10 + "10"); // 문자와 숫자를 더하는 경우, 숫자가 문자열로 형변환 되어 합쳐진 문자열이 결과로 나온다
```

```js
console.log(10 - "10"); // 문자와 숫자를 빼는 경우, 문자열이 숫자로 형변환 되어 뺄셈을 한 숫자가 결과로 나온다
```

- 직접 형변환(강제적 형변환) : 특정 함수들을 이용해 강제로 형변환 시킬 수도 있다

```js
console.log(10 + Number("10"));
// Number() 함수를 이용해 강제 형변환을 했기 때문에 결과가 문자열이 아닌 숫자로 나온다
```

---

## 연산자

- 산술 연산자

```js
console.log(10 + 10);
console.log(10 - 10);
console.log(10 * 10);
console.log(14 / 10); // 결과 1.4
```

```js
console.log(14 % 10);
// 나머지 연산으로 결과는 4
console.log(1 % 2); // 1
console.log(2 % 2); // 0
console.log(3 % 2); // 1
console.log(4 % 2); // 0
console.log(5 % 2); // 1
// 위와 같이 나머지 연산은 나누어지는 값들을 그룹화 시킬 때 사용한다
```

```js
console.log(10 ** 2); // 결과 100 (거듭 제곱)
```

```js
console.log(10 + "10");
// 결과가 문자열로 나오는데, 이때는 산술연산자가 아닌 문자 연결 연산자다(연산자는 상황에 따라 다른 역할로 사용될 수 있다)
```

```js
let num1 = 1;
++num1; // 변수의 값에 1 더한 값을 변수에 다시 할당한다
// num1++; 위의 식과 같다
console.log(num1); // 결과 2
```

```js
let num1 = 1;
let num2 = 1;
let num11 = num1++;
// num1 의 값을 num11 에 먼저 할당하고 그 후에 num1의 값이 1 커진다
let num21 = ++num2;
// num2 의 값이 1 커지고 그 값을 num21에 할당한다
console.log(num1 + " : " + num11);
console.log(num2 + " : " + num21);
```

- 할당(대입) 연산자

```js
let num1 = 10;
// = 의 오른쪽의 값을 = 왼쪽의 변수에 할당시킨다
```

```js
let num1 = 10;
num1 += 10;
// += 오른쪽의 값을 왼쪽 변수의 값과 더하고, 그 값을 변수에 할당시킨다
// 덧셈연산자를 이용한 위와 같이 사칙연산, 나머지 연산자를 이용해서 할당 연산자를 이용할 수 있다
```

```js
let sum1 = 1 + 2 + 3 + 4 + 5;

let sum2 = 1;
sum2 = sum2 + 2;
sum2 = sum2 + 3;
sum2 = sum2 + 4;
sum2 = sum2 + 5;

let sum2 = 1;
sum2 += 2;
sum2 += 3;
sum2 += 4;
sum2 += 5;
// 1 부터 5 까지의 합
```

```js
document.write("<table boder = '1' width = '150'>");
document.write("<tr>");
document.write("<td>Hello String</td>");
document.write("</tr>");
document.write("</table>");
// 위의 내용을 아래와 같이 쓸 수 있다
let html1 = "<table boder = '1' width = '150'>";
html1 += "<tr>";
html1 += "<td>Hello String</td>";
html1 += "</tr>";
html1 += "</table>";
document.write(html1);

let html2 = `<table boder = '1' width = '150'>
                <tr>
                  <td>Hello String</td>
                </tr>
             </table>
            `;
document.write(html2);
```

- 비교 연산자

```js
console.log(3 == "3"); // 자료형 상관없이 값이 같으면 true
// 결과 true
console.log(3 != "3"); // 자료형 상관없이 값이 다르면 false
// 결과 false
console.log(3 === "3"); // 자료형, 값이 모두 같아야 true
// 결과 false
console.log(3 !== "3"); // 자료형 또는 값이 다르면 true
// 결과 true
```

```js
console.log(0 == false); // 결과 true
// 0 과 false 의 값은 같다고 여겨진다
console.log("" == false); // 결과 true
// ''(빈문자열)과 false 의 값은 같다고 여겨진다
console.log(0 === false); // 자료형이 다르므로 false
console.log("" === false); // 자료형이 다르므로 false
```

```js
console.log("a" > "b"); // 문자열은 아스키코드 값으로 크기를 비교한다
// 결과 false
```

```js
console.log("abcd" > "bacd");
// 문자열 안의 값이 여러개 일 경우 제일 앞의 문자를 비교하고, 만약 그 값이 같을 경우 그 다음의 값으로 비교를 한다
// 결과 false
```

- 논리 연산자 : 진리형(boolean)

```js
console.log(!("a" > "b")); // ! 는 피연산자와 반대의 값을 가지게 한다
// 결과 true
```

- AND 연산자 : && 기호를 사용하며 비교되는 피연산자들이 '그리고' 로 연결될 때 사용한다
- OR 연산자 : || 기호를 사용하며 비교되는 피연산자들이 '또는' 으로 연결될 때 사용한다

  |  op1  |  op2  | op1 \|\| op2 | op1 && op2 | !op1  |
  | :---: | :---: | :----------: | :--------: | :---: |
  | false | false |    false     |   false    | true  |
  | false | true  |     true     |   false    | true  |
  | true  | false |     true     |   false    | false |
  | true  | truen |     true     |    true    | false |

---

## 제어

<small>!! 조건(true / false) : 비교연산자 또는 논리연산자의 결과 값(boolean)으로 수학적인 사고가 중요하다</small>

### 조건의 의한 분기

- 아래의 그림과 같이 flow chart를 먼저 생각해본다

  <img src="https://blog.kakaocdn.net/dn/bPi9L3/btq59OHPH5a/tEZeNzaEUtKPzEdxRqvYmK/img.png" alt="flow chart">

- 단순 분기

```js
let num = parseInt(prompt("숫자를 입력하시오"));
if (num % 3 === 0) {
  alert("3의 배수");
}
```

```js
let num = parseInt(prompt("숫자를 입력하시오"));
if (num % 2 === 0) {
  alert("짝수");
} else {
  alert("홀수");
}
// 기준(처음오는 조건문)을 먼저 정하고 그 나머지(else 조건문)의 경우 해야할 일을 생각한다 (이분법적인 사고!!)
```

```js
let hour = parseInt(prompt("시간을 입력하시오"));
if (hour <= 12) {
  if (hour <= 9) {
    alert("아침");
  } else {
    alert("아점");
  }
} else {
  if (hour <= 18) {
    alert("오후");
  } else {
    alert("저녁");
  }
}
```

- 중첩 분기

```js
let score = prompt("점수를 입력하세요");
if (score < 60) {
  alert("F");
} else {
  if (score < 70) {
    alert("D");
  } else {
    if (score < 80) {
      alert("C");
    } else {
      if (score < 90) {
        alert("B");
      } else {
        alert("A");
      }
    }
  }
}
```

위의 코드는 아래와 같이 쓸 수 있다

```js
let score = prompt("점수를 입력하세요");
if (score < 60) {
  alert("F");
} else if (score < 70) {
  alert("D");
} else if (score < 80) {
  alert("C");
} else if (score < 90) {
  alert("B");
} else {
  alert("A");
}
```

- 조건 연산자(삼항 연산자) : 조건이 복잡하지 않고 true, false 가 명확한 경우 사용할 수 있다

```js
let num = prompt("숫자를 입력하시오");
let result = num > 10 ? "10보다 많다" : "10보다 작거나 같다";
alert(result);
```

위의 코드는 아래와 같이 쓸 수 있다

```js
let num = prompt("숫자를 입력하시오");
num > 10 ? alert("10보다 많다") : alert("10보다 작거나 같다");
```

```js
let num = prompt("숫자를 입력하시오");
let result = num % 2 === 0 ? "짝수" : "홀수";
alert(result);
```

- switch : 확인해야 할 조건값이 많을 때 사용하는 조건문

```js
let num = 20;
switch (num) {
  case 10:
    console.log("10");
  case 20:
    console.log("20");
  case 30:
    console.log("30");
  default:
    console.log("기타");
}
// 결과로 "20", "30", "기타" 가 나온다
```

따라서 아래와 같이 중간에 빠져나올 수 있게 break 문을 적어주어야 한다

```js
let num = 20;
switch (num) {
  case 10:
    console.log("10");
    break;
  case 20:
    console.log("20");
    break;
  case 30:
    console.log("30");
    break;
  default:
    console.log("기타");
}
// 결과로 "20"만 출력된다
```

```js
let score = prompt("점수를 입력하시오");
switch (true) {
  case score >= 90:
    alert("A");
    break;
  case score >= 80:
    alert("B");
    break;
  case score >= 70:
    alert("C");
    break;
  case score >= 60:
    alert("D");
    break;
  default:
    alert("F");
}
```

### 조건에 의한 반복

<br>

  <img src="https://postfiles.pstatic.net/MjAyMjA5MjVfMTAg/MDAxNjY0MTA5OTI3OTAw.Do3QzC2vDH_Mz1Y6mypdNbGM1EdoSqR8KTJjhZKNt18g.ukUVyYU-_uoETh97QvYV92GSj4OlXrwcbtlhsq7FLM8g.PNG.minu3357/%EC%BA%A1%EC%B2%98.PNG?type=w773">

- for : for(초기값; 조건식; 증가식) { 실행문 } 의 형태로 반복횟수 파악 및 설정이 중요하다

  1<sub>st</sub> . 초기값을 조건식과 비교

  2<sub>nd</sub> . 위의 값이 ture 일 경우 실행문, false 면 for 문 다음 문장 실행

  3<sub>rd</sub> . 증가식

  4<sub>th</sub> . 증가식을 거친 값을 가지고 조건식과 비교

  5<sub>th</sub> . 위의 값이 true 일 경우 반복, false 면 반복 중지

```js
for (let i = 1; i <= 5; i++) {
  // 반복횟수 총 5회
  console.log("loop");
}
```

```js
for (let i = 1; i <= 5; i++) {
  // 반복횟수 총 5회
  console.log(i);
}
// 1부터 5까지 출력한다
```

```js
for (let i = 1; i <= 5; i++) {
  // 반복회수 총 5회
  let num = 2 * i - 1;
  console.log(num);
}
// 10이하의 홀수를 모두 출력한다
```

위의 코드를 아래와 같이 쓸 수 있다

```js
for (let i = 1; i <= 10; i++) {
  if (i % 2 == 1) {
    console.log("i");
  }
}
```

```js
let sum = 0;
// 반복문 밖에 선언해야 에러가 나지 않는다(let으로 선언하면 재선언 불가)
for (let i = 1; i <= 10; i++) {
  sum += i;
}
console.log(sum);
// 1부터 10까지의 합계 출력
```

```js
let sum = 0;
for (let i = 1; i <= 100; i++) {
  if (i % 3 == 0) {
    sum += i;
  }
}
console.log(sum);
// 1부터 100사이에 있는 3의배수들의 합
```

```js
document.write("<table border = '1'>");
for (let j = 1; j <= 5; j++) {
  document.write("<tr>");
  for (let i = 1; i <= 10; i++) {
    // for 문의 중첩도 가능하다
    document.write("<td>" + i + "</td>");
  }
  document.write("</tr>");
}
document.write("</table>");
// 5행 10열의 표 출력
```

```js
for (let j = 1; j <= 10; j++) {
  console.log("**********");
}
```

위의 코드를 아래와 같이 쓸 수도 있다

```js
for (let row = 1; row <= 10; row++) {
  let result = "";
  for (let col = 1; col <= 10; col++) {
    result += "*";
  }
  console.log(result);
  //console.log()는 엔터키가 들어가는 것 유의하기
}
```

---

## 모듈(라이브러리)

- 재사용을 위해 사용

- 종류

  - 함수

  - 객체(자료형의 확장형)

---

## 연산자

- 단항연산자(피연산자 1개)

  - 부호연산자 : + / -

  - 증감연산자 : ++ / --

- 이항연산자(피연산자 2개)

  - 산술연산자

  - 비교연산자
  - 대입연산자
  - 논리연산자

- 삼항연산자(피연산자 3개)

  - 조건연산자 : (조건)? 명령1 : 명령2;<br><br>

- 연산자 우선순위 : 되도록이면 괄호로 묶어 확실하게 표시해주는 것이 좋다.

---

## 자료형 형변환

- 묵시적 형변환 : 상황에 따라 다르지만 보통 " 작은 자료형 &rarr; 큰 자료형 " 의 형태로 일어난다

- 강제 형변환 : 형변환함수를 이용한다

---

# 제어

## 조건에 의한 분기

- flowchart 먼저 생각하기

### if

- 단순조건

```js
  if (조건) {
    조건이 참일 때, 실행할 내용
  }
```

```js
  if (조건) {
    조건이 참일 때, 실행할 내용
  } else {
    조건이 거짓일 때, 실행할 내용
  }
```

- 선택조건

```js
  if (조건1) {
    조건1이 참일 때, 실행할 내용
  } else if (조건2) {
    조건1이 거짓이고, 조건2가 참일 때 실행할 내용
  } else {
    조건1, 조건2가 모두 거짓일 때, 실행할 내용
  }
```

### switch : 선택조건의 단순화 형태

```js
switch (변수) {
  case 값:
    실행문;
    break;
  case 값:
    실행문;
    break;
  case 값:
    실행문;
    break;
  default:
    실행문;
}
```

### 조건연산자

```js
조건 ? 명령1 : 명령2;
```

---

## 조건에 의한 반복

### for

- 반복횟수 파악이 중요하다

```js
for (초기값; 조건; 증감식) {
  실행문;
}
```

```js
for (초기값; 조건; 증감식) {
  실행문;
  for (초기값; 조건; 증감식) {
    실행문;
  }
  실행문;
}
```

```js
let sum = 0;
for (let i = 1; i <= 100; i++) {
  if (i % 2 == 0) {
    sum += i;
  }
}
```

위의 코드를 아래와 같이 쓸 수 있다

```js
let sum = 0;
for (let i = 2; i <= 100; i += 2) {
  sum += i;
}
console.log(`sum : ${sum}`);
// 위의 코드는 100번을 수행하지만, 이 코드는 50번을 수행하기 때문에 더 효율적이다
// 잔머리 쓰기
```

!! for 문의 개수에 따라 나타내는 차원 : 별찍기, 구구단 연습해보기<br> - 1개 : 1차원(행)<br> - 2개 : 2차원(행과 열)<br> - 3개 : 3차원

```js
let result = "";
result += "<table>";
result += "<tr>";
result += "<td></td>";
for (out = 1; out <= 9; out++) {
  result += "<th>X " + out + "</th>";
}
result += "</tr>";
for (let dan = 1; dan <= 9; dan++) {
  result += "<tr>";
  result += "<th>" + dan + "단 </th>";
  for (let num = 1; num <= 9; num++) {
    result += "<td>" + dan + "X" + num + "=" + dan * num + "</td>";
  }
  result += "</tr>";
}
result += "</table>";
document.write(result);
// 구구단 출력
```

위의 코드를 아래와 같이 조건문을 이용해 쓸 수도 있다

```js
let result = "";
result += "<table>";
for (let dan = 0; dan <= 9; dan++) {
  result += "<tr>";
  for (let num = 0; num <= 9; num++) {
    if (dan == 0) {
      if (dan == 0 && num == 0) {
        result += "<td></td>";
      } else {
        result += "<td>" + "X " + num + "</td>";
      }
    } else {
      if (num == 0) {
        result += "<td>" + dan + "단" + "</td>";
      } else {
        result += "<td>" + dan + "X" + num + "=" + dan * num + "</td>";
      }
    }
  }
  result += "</tr>";
}
result += "</table>";
document.write(result);
```

```js
<script>
  let rowNum = 10;
  let html = "";
  for (let i = 0; i < 10; i++) {
    for (let j = 0; j < 10 - i; j++) {
      html += "*";
    }
    html += "<br>";
  }
  document.write(html);
</script>
// 별 역순으로 찍기
```

```js
<script>
  let rowNum = 10;
  let html = "";
  for (let i = 0; i < rowNum; i++) {
    for (let blank = 0; blank < 10 - i; blank++) {
      html += "&nbsp;";
    }
    for (let star = 0; star < 2 * i + 1; star++) {
      html += "*";
    }
    html += "<br>";
  }
  document.write(html);
</script>
// 별 피라미드 찍기
```

### while

```js
while (조건식) {
  실행문;
  증감식;
}
```

```js
let i = 1;
while (i <= 10) {
  console.log("Hello, World!");
  i++;
}
```

```js
let html = "";
let dan = 1;
let num = 1;
html += "<table>";
while (dan <= 9) {
  html += "<tr>";
  num = 1;
  while (num <= 9) {
    html += "<td>" + dan + "X" + num + "=" + dan * num + "</td>";
    num++;
  }
  html += "</tr>";
  dan++;
}
html += "</table>";
document.write(html);
// while 문을 이용한 구구단
```

### do ~ while

- while 문은 조건에 따라 한번도 실행되지 않을 수 있지만 do ~ while 문은 한번은 무조건 실행된다

```js
초기값;
do {
  실행문;
  증감식;
} while (조건식); // 마지막 세미콜론(;) 유의하기
```

```js
let i = 1;
do {
  console.log("Hello, loop");
  i++;
} while (i <= 10);
```

- continue : 한번 건너뛰기

```js
for (let i = 1; i <= 5; i++) {
  if (i == 3) {
    continue; // i 가 3일 때, 건너뛰게 한다
  }
  console.log(i);
}
```

```js
for (let i = 1; i <= 5; i++) {
  for (let j = 1; j <= 5; j++) {
    if (j == 2) {
      continue; // 안쪽 for문에만 영향을 준다
    }
    console.log(i + " : " + j);
  }
}
```

```js
loopA : // 바깥쪽 반복문의 이름을 준다(여기서는 loopA)
  for(let i = 1; i <= 5; i++){
    for(let j = 1; j <= 5; j++){
      if (j == 2){
        continue aloop; // 안쪽 뿐만 아니라 바깥쪽에도 영향을 준다
      }
      console.log(i + " : " + j);
    }
  }
```

- break : 반복 중지

```js
for (let i = 1; i <= 5; i++) {
  if (i == 3) {
    break; // i 가 3일 때, 반복문을 빠져나온다
  }
  console.log(i);
}
```

```js
for (let i = 1; i <= 5; i++) {
  for (let j = 1; j <= 5; j++) {
    if (j == 2) {
      break; // 안쪽 for문에만 영향을 줘서 바깥쪽 for문은 계속 실행된다
    }
    console.log(i + " : " + j);
  }
}
```

```js
loopA : // 바깥쪽 반복문의 이름을 준다(여기서는 loopA)
  for(let i = 1; i <= 5; i++){
    for(let j = 1; j <= 5; j++){
      if (j == 2){
        break aloop; // 안쪽 뿐만 아니라 바깥쪽에도 영향을 주서 반복문을 아예 빠져나오게 된다
      }
      console.log(i + " : " + j);
    }
  }
```

---

# 함수

<small>!! 함수의 모임을 '라이브러리'라고 한다</small>

- 함수의 종류

  - 사용자 정의 함수 : 개발자가 선언하는 함수

  - 내장함수 : 프로그램에서 제공하는 함수

- 함수의 선언 : 함수의 이름과 그 내용을 정의한다(선언만 한다고 함수가 실행되는 건 아니다)

- 함수의 호출 : 함수는 호출이 돼야 실행이 된다

### 함수의 구조

```js
function doFunc1() {
  console.log("Hello Function");
} // 함수이름은 보통 동사로 식별자 규칙을 따르고 글의 첫글자는 소문자로 한다
```

```js
function doFunc1() {
  console.log("Hello, Function");
  let num1 = 10; // num1 은 특히 지역변수라고 불린다(지역변수는 함수의 중괄호 내에서만 사용 가능하다)
  console.log("Hello, Function : " + num1);
}
```

```js
function doFunc2(data1) {
  console.log("Hello, Funtion : " + data1); // data1을 통해 값을 받아 사용할 수 있다 (이때, data1을 인자라고 한다)
}
```

```js
function doFunc3(data1, data2) {
  console.log("Hello, Funtion : " + data1 + ", " + data2); // 이처럼 여러개의 값을 전달 받을 수 있다
}
```

```html
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <script>
      function gugudan(dan) {
        // 여기서 dan 은 매개변수라고 한다
        for (let num = 1; num <= 9; num++) {
          console.log(dan + " X " + num + "=" + dan * num);
        }
      } // 이 부분은 함수의 선언에 속한다
    </script>
    <title>구구단 콘솔창에 출력</title>
  </head>
  <body>
    <script>
      let num = parseInt(prompt("몇 단?"));
      gugudan(num); // 이 부분은 함수의 호출에 속하는데, 이때 num은 인수라고 하고 함수에 값을 전달하는데 쓰인다
    </script>
  </body>
</html>
```

```js
function doFunc3(data1, data2) {
  let sum = data1 + data2;
  return sum; // data1, data2를 이용해 값을 전달받아 사용해 나온 값을 return을 통해 호출한곳으로 돌려줄 수도 있다
}
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script>
      function maxNum(num1, num2, num3) {
        let maxNumber = num1;
        if (num1 < num2) {
          maxNumber = num2;
        }
        if (maxNumber < num3) {
          maxNumber = num3;
        }
        return maxNumber;
      }
    </script>
  </head>
  <body>
    <script>
      let num1 = parseInt(prompt("비교할 숫자를 입력해주세요"));
      let num2 = parseInt(prompt("비교할 숫자를 입력해주세요"));
      let num3 = parseInt(prompt("비교할 숫자를 입력해주세요"));

      console.log(
        `입력한 숫자 ${num1}, ${num2}, ${num3} 중 큰 숫자는 ${maxNum(
          num1,
          num2,
          num3
        )}입니다.`
      );
    </script>
  </body>
</html>
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script>
      function gugudan(dan) {
        let html = "";
        html += "<table>";
        for (let i = 1; i <= 9; i++) {
          html += "<tr>";
          html += "<td>";
          html += `${dan} X ${i} = ${dan * i}`;
          html += "</td>";
          html += "</tr>";
        }
        html += "</table>";
        return html;
      }
    </script>
  </head>
  <body>
    <script>
      let result = "";
      let dan = 1;
      result += "<table>";
      for (let row = 1; row <= 3; row++) {
        result += "<tr>";
        for (let col = 1; col <= 3; col++) {
          result += `<td> ${gugudan(dan)} </td>`;
          dan++;
        }
        result += "</tr>";
      }
      result += "</table>";
      document.write(result);
    </script>
  </body>
</html>
<!-- 출력 확인해보기 -->
```

### 익명함수 
- 이름이 없는 함수로 변수, 특히 상수에 할당해서 사용한다

```js
const doFunc1 = function () {
  console.log("Hello Function");
}; // 익명함수

doFunc1();
// 이처럼 익명함수는 할당한 변수의 이름 뒤에 괄호를 붙여 사용한다
```

```js
const doFunc1 = function () {
  console.log("Hello Function");
};
let doFunc2 = doFunc1; // 이렇게 익명함수가 할당된 변수를 다른 변수에 할당시킬 수도 있다

doFunc2(); // 역시 변수뒤에 괄호를 붙여 사용할 수 있다
```

```js
const callBack = function () {
  console.log("함수 호출");
};
const callFunc = function (data) {
  data(); // 함수를 인수처럼 사용할 수 있다
};
callFunc(callBack); // callBack에 할당된 익명함수가 호출된다
// 이와 같이 다른 함수의 인수로 사용되는 함수를 콜백함수라고 하며 보통 시스템이 호출한다
```

```js
const rFunc = function () {
  return function () {
    console.log("Hello function");
  };
};
let result = rFunc();
result();
```

위의 코드는 아래와 같이 쓸 수도 있다

```js
const rFunc = function () {
  return function () {
    console.log("Hello function");
  };
};
rFunc()();
```

```js
const rFunc2 = function (type) {
  if (type == 1) {
    return function () {
      console.log("함수 1 형태 호출");
    };
  } else {
    return function () {
      console.log("함수 2 형태 호출");
    };
  }
};
rFunc2(1)(); // 결과 "함수 1 형태 호출"
```

---

## 프로그래밍의 종류

- 함수 중심 - 구조적 프로그래밍 : C

- 객체 중심 - 객체 지향 프로그래밍 : C++ / java

---

## 사용자 정의 함수

- 함수의 구성

  - 지역변수

  - 제어문
  - 내부함수

- 내장 함수 : 프로그램이 제공
- 선언 함수 : 일반적인 함수
- 익명 함수 : 변수나 상수처럼 사용 (요즘은 익명함수를 많이 사용하는 추세다)

  !! 자바스크립트 함수는 1급 시민(1급 함수)라고 한다

  - 1급 시민의 조건

    1. 변수에 할당할 수 있어야 한다

    2. 다른 함수의 인자로 사용할 수 있어야 한다

    3. 다른 함수의 반환값으로 반환할 수 있어야 한다

- 콜백함수 : 다른 함수의 인수로 사용하는 함수로 프로그래머가 직접 실행시키는 것이 아닌 시스템이 실행시키는 것이다

### 화살표 함수(lambda)

```js
const doFunc1 = function () {
  console.log(`doFunc1 호출`);
};
doFunc1();
```

위와 같은 익명함수를 아래와 같이 화살표 함수로 바꿀 수 있다

```js
const doFunc1 = () => {
  console.log(`doFunc1 호출`);
};
doFunc1();
```

```js
const doFunc1 = (one) => {
  console.log(`doFunc1 호출 : ${one}`);
};
doFunc1(5); // 인수를 받을 수도 있다
```

```js
const doFunc1 = (one, two) => {
  return one + two;
};
console.log(`결과 : ${doFunc1(10, 20)}`); // 반환값을 줄 수도 있다
```

위의 코드를 아래와 같이 바꿀 수도 있다

```js
const doFunc1 = (one, two) => one + two;
console.log(`결과 : ${doFunc1(10, 20)}`);
```

- 매개변수에 기본값 주기

```js
const doFunc1 = function (data1, data2 = 10) {
  console.log(`doFunc1 호출 : ${data1}`);
  console.log(`doFunc1 호출 : ${data2}`);
};
doFunc1(10); // data2의 값이 주어지지 않았지만 주어진 기본값 10을 이용해 결과가 잘 나온다
```

!! 자바스크립트 함수의 특이점

```js
const doFunc1 = function (data1, data2) {
  console.log(`doFunc1 호출 : ${data1}`);
  console.log(`doFunc1 호출 : ${data2}`);
};
doFunc1(); // 인수가 없기 때문에 에러가 나야하는데 함수가 실행되지 않을 뿐 에러가 나지는 않는다
```

---

## 스코프

- 선언한 변수가 영향을 미치는 범위

- 선언을 항상 먼저 해석하기 때문에 사용한 함수 사용 이후에 변수를 선언을 하더라도 에러가 생기지 않는다

```js
const doFunc1 = function () {
  console.log(`doFunc1 호출 : ${one}`);
  console.log(`doFunc1 호출 : ${two}`);
};
console.log(`one : ${one}`);
console.log(`twe : ${two}`);
doFunc1();
let one = 100;
var two = 200;
// 이렇게 함수에 쓰이는 변수를 나중에 선언하더라도 제대로 된 결과를 얻을 수 있지만 되도록이면 변수를 가장 위쪽에 선언하는 습관을 들이도록 하자 !!
```

- 변수의 영역

```js
const doFunc1 = function () {
  let one = 110; // 지역(local)변수
  var two = 210; // 지역변수
  console.log(`doFunc1 호출 : ${one}`);
  console.log(`doFunc1 호출 : ${two}`);
};
let one = 100; // 전역(static)변수
var two = 200; // 전역변수
console.log(`one : ${one}`); // 결과 100
console.log(`twe : ${two}`); // 결과 200
doFunc1(); // 결과 110, 210
```

```js
const outer = function () {
  //  함수 안에 선언해서 안에서만 쓰이도록 함수를 선언할 수도 있다
  const inner1 = function () {
    console.log(`inner1 호출`);
  };
  const inner2 = function () {
    console.log(`inner2 호출`);
  };
  console.log(`outer 호출`);
  inner1();
  inner2();
};
outer();
```

---

# 내장함수

## 자료형 변환 함수

### 숫자로 형변환시키는 함수

- Number
- parseInt

- parseFloat

```js
let data1 = "10";
let data2 = "20";

let sum1 = data1 + data2;
console.log(sum1); // 결과 1020
let sum2 = Number(data1) + Number(data2); // 숫자로 형변환 해서 30의 결과를 얻는다
```

```js
let data = "10일";
console.log(Number(data));
// 숫자가 아닌 문자가 포함되어 있어서 결과 NaN(Not a Number)
```

```js
let data = "10일";
console.log(parseInt(data)); // 결과 10(Number 함수와 달리 parseInt, parseFloat 함수는 숫자가 먼저 나올 경우 그 숫자를 결과로 반환한다)
```

```js
// isNaN() : 괄호 안의 값이 NaN이면 true 값을 반환하는 함수
// isXXX() : true / false 값을 반환하고 주로 제어문의 조건에 사용된다
console.log(isNaN("1")); // 결과 false
console.log(isNaN("1e")); // 결과 true
console.log(isNaN("e1")); // 결과 trune
```

### 문자열로 형변환 시키는 함수

- String

```js
let data1 = 10;
let data2 = 20;

let sum1 = data1 + data2;
console.log(sum1); // 결과 30
let sum2 = String(data1) + String(data2);
console.log(sum2); // 결과 1020
```

```js
let data1 = 10;
let data2 = 20;

let sum1 = "" + data1 + data2;
console.log(sum1); // 결과 1020
// String()함수를 쓰지 않고 빈 문자열만 앞에 더해주더라도 문자열로 형변환이 된다
```

### 논리형으로 형변환시키는 함수

- 숫자 0, 빈문자열, null, undefined가 아닐 시에는 true를 반환한다

- Boolean

```js
Boolean(5 * 4); // 결과 true
Boolean("Hi"); // 결과 true
Boolean(undefined); // 결과 false
```

---

### 기본 함수

- 경고창 함수

```js
alert("난 알림창");
```

- 확인창 함수

```js
if (confirm("난 확인창")) {
  console.log("확인선택"); // 확인을 선택할 시에 true
} else {
  console.log("취소선택"); // 취소를 선택할 시에 false
}
```

- 입력창 함수

```js
let value = prompt("난 입력창", "초기값"); // 초기값을 줄 수도 있다
console.log(value); // 값을 입력하지 않고 취소를 누르면 null 값이 나온다
```

```js
if (value) {
  console.log("확인", value); // , : console.log에 사용되는 문자열 연결 연산
} else {
  console.log("취소"); // 취소를 누르면 false
}
```

- eval 함수 : 문자열안의 내용을 실행문으로 바꿔준다

```js
let expr1 = "2 + 3";
console.log(eval(expr1)); // 콘솔창에 결과 5

let expr = "";
expr += "let num1 = 10;";
expr += "let num2 = 20;";
expr += "alert(num1 + num2);";
eval(expr); // 알림창에 결과 30
```

### 타이머 함수

```js
const work = function () {
  console.log("work 함수 실행");
};

setTimeout(work, 3000); // 3초후에 변수 work에 할당된 함수를 실행
```

```js
const work = function () {
  console.log("work 함수 실행");
};
console.log("시작");
setTimeout(work, 3000);
console.log("끝");
// 시작, 끝이 먼저 나오고 3초후에 work에 할당된 함수가 실행된다
// 이처럼 각각 따로 처리하는 것을 쓰레드라고 한다
```

```js
setTimeout(function () {
  console.log("함수 실행");
}, 3000); // 콜백함수 적용
```

```js
setInterval(function () {
  console.log("work 함수 실행");
}, 3000); // 브라우저가 꺼지거나 특별한 조건이 생기기 전까지 3초마다 콜백함수가 계속 실행된다
```

```js
let counter = 0;

let timer = setInterval(() => {
  console.log("안녕하세요");
  counter++;
  if (counter === 5) {
    clearInterval(timer);
  }
}, 2000);
```

---

## 배열(Array)

- 1개의 값만을 저장할 수 있는 변수, 상수와 달리 여러개의 값을 저장한다

```js
let arr1 = []; // 값이 없는 빈 배열
let arr2 = [10, 20, 30, 40]; // 네개의 숫자가 있는 배열
let arr3 = ["10", "20", "30", "40"]; // 네개의 문자열이 있는 배열
let arr4 = [10, "20"]; // 다른 종류의 자료가 들어 있는 배열(보통은 같은 자료형을 넣는다)

console.log(typeof arr1); // 결과 object
console.log(arr2[0]); // 결과 10(배열안에 있는 값들의 위치를 나타내는 인덱스는 0부터 시작한다)

arr2[0] = 100; // 이처럼 배열 안의 값을 다른 값으로 바꿀 수 있다

console.log(arr3.length); // 배열이름.length 로 배열안의 자료 개수를 알 수 있다

for (let i = 0; i < arr3.length; i++) {
  console.log(arr3[i]);
} // 보통 for문을 이용해서 배열의 자료를 전부 출력한다
```

```js
let arr1 = [10, 20, 30, 40];
for (let i in arr1) {
  console.log(arr1[i], i);
} // 이렇게 배열 자료를 전부 출력할 수도 있다
```

```js
let arr1 = [10, 20, 30, 40];
for (let value of arr1) {
  console.log(value);
} // 바로 위의 for ... in 문과 비교해보기
```

```js
const students = ["Park", "Kim", "Lee", "Kang"];

for (student of students) {
  console.log(`${student}`);
}
```

```js
let arr1 = [10, 20, 30, 40];
let sum = 0;
for (let i = 0; i < arr1.length; i++) {
  sum += arr1[i];
}
console.log(sum);
// 배열안 값들의 합 구하기도 for문을 이용할 수 있다
```

```js
let arr1 = Array(10, 20, 30);
let arr2 = new Array(10, 20, 30);
// 이같은 방식으로 배열선언을 할 수도 있다
```

- 문자열도 배열처럼 취급할 수 있다

```js
let str1 = ["a", "b", "c", "d"];
let str2 = "abcd";
console.log(str1.length); // 결과 4
console.log(str2.length); // 결과 4
```

```js
let str1 = ["a", "b", "c", "d"];
let str2 = "abcd";

console.log(str1[0]); // 결과 a
console.log(str2[0]); // 결과 a
```

```js
let str2 = "abcd";
for (let value of str2) {
  console.log(value);
} // str2에 할당된 문자열을 이루고 있는 문자들을 차례로 출력
```

- arguments : 인수에 대한 배열을 가리키는 예약어로 함수에 필요한 인수의 개수가 여러개 일 때 사용한다

```js
const doFunc2 = function () {
  console.log(arguments.length);
  for (let i = 0; i < arguments.length; i++) {
    console.log(arguments[i]);
  }
};
doFunc2(10);
doFunc2(10, 20);
doFunc2(10, 20, 30);
// 콘솔창에 직접 실행해보기
```

```js
const doFunc1 = function (...numbers) {
  // ...배열이름을 통해 arguments 대신 직접 정한 배열이름을 쓸 수도 있다
  let sum = 0;
  for (let number of numbers) {
    sum += number;
  }
  console.log(sum);
};
doFunc1(1, 19, 29, 39); // 결과 88
```

```js
function viewMinNumeber(...numbers) {
  let minNum = numbers[0];
  for (let i = 1; i < numbers.length; i++) {
    if (minNum > numbers[i]) {
      minNum = numbers[i];
    }
  }
  return minNum;
}
let arr = [10, 32, 89, 64, 9, 97, 7];
console.log(`배열 ${arr}의 값 중 최소값은 ${viewMinNumeber(...arr)}`);
// 이처럼 미리 만들어 둔 배열을 괄호 안에 "...배열이름" 형태로 넣어서 사용할 수 있다
```

- 배열은 참조자료형이기 때문에 배열 안에 값이 들어있는 것이 아닌 값이 있는 저장소의 주소값을 가지고 있다

```js
let arr1 = [1, 2, 3];
let arr2 = arr1; // arr1이 참조하고 있는 저장소의 주소를 arr2에 할당시킨다
// 따라서, arr1과 arr2는 같은 저장소를 가리키는 주소를 가지고 있다
console.log(arr1[0], arr1[1], arr1[2]);
console.log(arr2[0], arr2[1], arr2[2]);
arr1[0] = 100; // arr1[0] 이 가리키고 있는 저장소의 값을 100으로 바꾼다
arr1[1] = 200; // arr1[1] 이 가리키고 있는 저장소의 값을 100으로 바꾼다
arr1[2] = 300; // arr1[2] 이 가리키고 있는 저장소의 값을 100으로 바꾼다
console.log(arr1[0], arr1[1], arr1[2]);
console.log(arr2[0], arr2[1], arr2[2]); // arr2도 arr1이 가리키고 있는 저장소를 참조하기 때문에 값이 똑같이 값이 바뀐 형태로 출력된다
```

```js
let num1 = 10;
let num2 = num1; // 깊은 복사(값 복사)
let arr1 = [1, 2, 3];
let arr2 = arr1; // 얕은 복사(주소, 참조값 복사)
```

### 다차원 배열(2차원 이상의 배열)

- 2차원 배열

```js
let arr1 = [
  [10, 20, 30],
  [40, 50, 60],
  [70, 80, 90],
]; // 2차원 배열(행렬)
/*
    let arr1 = Array(
    Array(10, 20, 30),
    Array(40, 50, 60),
    Array(70, 80, 90)
    ) 
    */
console.log(arr1[0]); // 1행 출력
console.log(arr1[0][1]); // 1행 2열의 값 출력
console.log(arr1.length); // arr1이 참조하는 배열의 개수 즉, arr1의 행의 개수인 3이 출력
console.log(arr1[0].length); // arr1[0]이 참조하는 배열의 개수인 3이 출력
```

```js
let arr1 = [
  [10, 20, 30],
  [40, 50, 60],
  [70, 80, 90],
];
for (let row = 0; row < arr1.length; row++) {
  for (let col = 0; col < arr1[row].length; col++) {
    console.log(arr1[row][col]);
  }
} // 두개의 for문을 사용한다
/*
    for(let i in arr1){
      for(let j in arr1[i]){
        console.log(arr1[i][j]);
      }
    }
    */
```

```js
let arr1 = [[10], [40, 50], [70, 80, 90]];
// 이렇게 선언할 수도 있다.
```

```js
let arr1 = Array(Array(10, 20, 30), Array(40, 50, 60), Array(70, 80, 90));
```

- 3차원 배열

```js
let arr1 = [
  [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ],
  [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90],
  ],
];
for (let i in arr1) {
  for (let j in arr1[i]) {
    for (let k in arr1[i][j]) {
      console.log(arr1[i][j][k]);
    }
  }
}
```

---

## 함수와 html 문서와의 연결

- html문서에서 javascript의 함수를 사용할 수 있다

- 함수 호출을 위해서 이벤트 속성을 이용하는데, 이벤트 속성은 "on + 동작"의 이름을 갖고 있다

  <small> ex) onclick = "동작이 일어날 때 실행시킬 함수이름()"<br>
  &nbsp;&nbsp;input, button, a 태그에 주로 쓰이며, 특히 버튼 관련된 태그에 자주 쓰인다
  </small>

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Document</title>
    <script>
      const doFunc = () => {
        console.log("doFunc 호출");
      };
    </script>
  </head>
  <body>
    <script>
      // 호출
      doFunc();
    </script>
    <input type="button" value="함수 호출" onclick="doFunc()" />
    <button onclick="doFunc()">함수호출</button>
    <a href="javascript:doFunc()">함수호출</a>
  </body>
</html>
```

---

# 객체

- 여러 자료형을 묶어 사물(새로운 자료형)을 정의

- 속성과 기능으로 이루어져 있음

  - 속성 : 변수나 상수

  - 기능 : 함수

- 자료형 개념은 클래스(class)라고 하고, 클래스에 데이터가 결합 되어 실체가 있게 된 것을 객체(object)라고 한다

  !! 클래스에 데이터가 결합되어 객체를 만드는 것을 인스턴스화라고 한다

  <small>ex) &nbsp;&nbsp;자동차(클래스) &nbsp;&nbsp;------ &nbsp;&nbsp;자동차(클래스)&nbsp;&nbsp; + &nbsp;&nbsp;그랜저 변수 &nbsp;&nbsp;&rarr;&nbsp;&nbsp; 그랜저(객체)
  </small>

## 사용자 정의 클래스

- 선언하는 방법

```js
class ClassName {
  // 속성 : 변수(멤버변수)
  // 기능 : 함수(메서드)
}
let objectName = new ClassName(); // 클래스를 객체변수로 할당
// 이때, 이름은 속성과 기능을 알 수 있도록 정한다
```

```js
class Student {
  // 클래스 정의
}
let stu1 = new Student(); // stu1 객체변수(인스턴스) 선언, 타입은 객체
```

- 생성자 : 클래스의 멤버변수를 초기화

```js
class Student {
  constructor() {
    // 생성자는 constructor라는 이름이 정해진 특수 함수를 사용하고 멤버변수를 선언하고 초기화시키는 역할을 한다
    this.name = "홍길동";
    this.kor = 99;
    this.mat = 100;
  }
}
```

```js
class Student {
  constructor(name, kor, mat) {
    // 이처럼 constructor 함수에 값을 줘서 멤버변수 초기화를 시킬 수 있다
    this.name = name;
    this.kor = kor;
    this.mat = mat;
  }
  // 단, 두개 이상의 constructor 함수를 가질 수는 없다
}
let stu1 = new Student("박문수", 80, 98);
console.log(stu1.name); // 결과 박문수
```

- 멤버변수 사용 : "클래스이름.멤버변수이름"의 형태로 사용할 수 있다(이때, "."은 메모리 참조연산자)

```js
class Student {
  constructor() {
    this.name = "홍길동";
    this.kor = 99;
    this.mat = 100;
  }
}
let stu = new Student();
console.log(stu.name); // 홍길동
console.log(stu.kor); // 99
console.log(stu.mat); // 100
```

- 메서드 사용 : "클래스이름.메서드이름"의 형태로 사용할 수 있다

```js
class Student {
  constructor() {
    this.name = "홍길동";
    this.kor = 99;
    this.mat = 100;
  }
  getSum() {
    // 함수지만 선언할 때 앞에 function은 붙이지 않는다
    console.log("getSum 호출", this.name);
    console.log("getSum 호출", this.kor);
    console.log("getSum 호출", this.mat);
  }
}
let stu = new Student();
stu.getSum();
```

- 클래스도 참조자료형이기 때문에 변수에는 클래스의 멤버변수, 메서드가 있는 저장소를 가리키는 주소를 저장한다

```js
class Student {
  constructor() {
    this.name = "홍길동";
    this.kor = 99;
    this.mat = 100;
  }
}
let stu1 = new Student();
let stu2 = stu1; // 값이 아닌 주소값을 복사한다(얕은 복사)
```

```js
class Student {
  constructor() {
    this.name = "홍길동";
    this.kor = 99;
    this.mat = 100;
  }
}
let stu1 = new Student();
let stu2 = new Student();
stu1.name = "박문수";
console.log(stu1.name); // 박문수
console.log(stu2.name); // 홍길동
// 같은 생성자를 통해 만들어졌지만 각각 다른 저장소를 가리키고 있는 것이다
```

- 클래스가 아닌 생성자 함수로 객체 만들기

```js
const makeStudent = function () {
  this.name = "박문수";
  this.kor = 99;
  this.mat = 100;
};
let stu1 = new makeStudent();
console.log(typeof stu1);
console.log(stu1.name);
console.log(stu1.kor);
console.log(stu1.mat);
```

- JSON(Javascript Objetct Notation) : javascript에서의 객체 표기법

```js
objectName = {
  key1: value1,
  key2: value2,
  key3: value3,
  key4: function () {
    // 메서드 내용
  },
};
// 클래스나 생성자 함수 없이 이런식으로 직접 객체를 생성할 수도 있다( 키와 값 사이에 있는 ":"와 각각의 프로퍼티 사이에 있는 ","에 유의하기)
```

## 내장객체

- 기본객체 : 기본 자료형

- 문서객체 : DOM(Document Object Model)
- 웹브라우저객체 : BOM(Browser Object Model)

## 외부객체 객체

- 새로운 자료형

- 내부 구성

  - 멤버변수

  - 메서드

- 선언 방법

  - class 예약어 사용

  ```js
    class ClassName{
      memberVariable1 : value1,
      memberVariable2 : value2,
      memberVariable3 : value3,
      memberMethod : function (){
        // 실행문
      }
    } // 클래스 선언
    let objectName = new ClassName(); // 객체 선언
  ```

  !! class 내에서 constructor 함수 이용해서 멤버변수 값을 초기화할 수 있다

  ```js
  class ClassName {
    constructor(value1, value2, value3) {
      (this.memberVariable1 = value1),
        (this.memberVariable2 = value2),
        (this.memberVariable3 = value3);
      // 멤버변수를 constructor 함수를 이용해 초기화
    }
    memberMethod1() {
      // 실행문
    } // 메서드 사이에는 쉼표가 없다
    memberMethod2() {
      // 실행문
    }
  } // 클래스 선언
  let objectName = new ClassName(value1, value2, value3); // 객체 선언할 때 값을 줘서 멤버변수 초기화도 가능하다
  ```

  ```js
    const ClassName = class {
      constructor(value1, value2, value3){
        this.memberVariable1 = value1,
        this.memberVariable2 = value2,
        this.memberVariable3 = value3
        // 멤버변수를 constructor 함수를 이용해 초기화
      }
      this.memberMethod1 (){
        // 실행문
      } // 메서드 사이에는 쉼표가 없다
      this.memberMethod2 (){
        // 실행문
      }
    } // 클래스 선언
  ```

  - 생성자 함수 사용

  ```js
    const ClassName = function (){
      memberVariable1 = value1,
      memberVariable2 = value2,
      memberVariable3  value3,
      memberMethod = function (){
        // 실행문
      }
    }
    let objectName = new ClassName(); // 객체 선언
  ```

  - JSON(JavaScript Object Notation)

  ```js
  const ClassName = {
    memberVariable1: value1,
    memberVariable2: value2,
    memberVariable3: value3,
    memberMethod: function () {
      // 실행문
    },
  };
  ```

- 프로퍼티 사용
  - 객체변수.멤버변수
  ```js
  console.log(objectName.memberVariable1);
  ```
  - 객체변수.메서드
  ```js
  objectName.mamberMethod();
  ```

---

## 내장 객체

<small>!! https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects 참조 </small>

- 구성

  - 기본객체(확장자료형) : 멤버변수, 메서드로 구성된 자료형(특히 메서드에 집중!!)

  - BOM
  - DOM

### Object : 모든 객체들은 기본적으로 Object 객체이다

```js
let obj = new Object();

console.log(obj); // Object 객체 세부 정의 내용을 출력한다
console.log(obj.toString()); // toString 메서드는 내부(멤버변수) 내용을 문자열로 출력한다

let student = {
  name: "홍길동",
  grade: "1학년",
};
console.log(student.toString());
/* toString 메서드 정의가 안돼 있지만 student가 기본적으로 
    Object의 객체이고 toString 메서드는 Object 객체의 메서드라서 사용할 수는 있다*/
```

```js
let student = {
  name: "홍길동",
  grade: "1학년", // 쉼표 주의하기!!

  toString: function () {
    return this.name + ", " + this.grade;
  },
};
console.log(student.toString()); // 결과 홍길동, 1학년
// toString을 재정의해서 사용할 수 있다
```

### String : 문자열을 String 객체로 사용할 수도 있다

```js
let str1 = "Hello String";
let str2 = new String("Hello String");
console.log(str1); // 결과 Hello String

console.log(str2); // 결과 String {"Hello String"}
console.log(str2.toString()); // 결과 Hello String
```

#### 문자열에 사용할 수 있는 메서드

- 문자열 길이를 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.length); // 22
// str1 대신 문자열을 직접 집어넣을 수도 있다 ex) "Hello String".length
```

- 인덱스를 이용해 문자열에 포함된 문자 찾아 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.charAt(0)); // H
console.log(str1.substr(6)); // 7번째 문자부터 끝까지 출력
console.log(str1.substr(6, 6)); // 7번째 문자부터 6개의 문자 출력
console.log(str1.substring(6, 12)); // 7번째 문자부터 12번째 문자까지 출력
console.log(str1.substring(6, str1.length)); // 7번째 문자부터 마지막 문자까지 출력
console.log(str1.slice(6, 12)); // 7번째 문자부터 12번째 문자까지 출력
```

- 문자열에 속한 문자 인덱스 찾아 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.indexOf("l")); // 괄호 안 문자의 최초 인덱스를 찾아서 출력
console.log(str1.indexOf("s")); // 문자열에 찾는 문자가 없을 경우 -1 출력
console.log(str1.indexOf("S")); // 당연히 대소문자 구분한다
console.log(str1.indexOf("S", 7)); // 인덱스 7(여덟번 째 문자)인 문자부터 찾기 시작
console.log(str1.lastIndexOf("S")); // 뒤에서 부터 찾아서 최초의 인덱스 출력(뒤에서 부터 찾는다고 인덱스 순서가 역순이 되는 것은 아니다)
```

```js
let str1 = "Hello String 안녕 String";
console.log(str1.search("String")); // 문자열에서 "String"가 나오기 시작하는 최초의 인덱스 출력
```

- 문자열에 어떤 문자열이 있는지 확인하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.includes("Hello")); // 괄호 안에 문자열을 포함하는지 확인한다(!! 대소문자 구분하는 것에 유의하기)
// 결과 true
console.log(str1.startsWith("Hel")); // 괄호 안에 문자열로 시작하는지 확인한다(!! 대소문자 구분하는 것에 유의하기)
// 결과 true
console.log(str1.startsWith("Hel", 2)); // 이처럼 검색의 시작 위치를 지정해주는 것도 가능하다
// 결과 false
console.log(str1.endsWith("String")); // 괄호 안에 문자열로 끝나는지 확인한다(!! 대소문자 구분하는 것에 유의하기)
// 결과 true
console.log(str1.endsWith("lo", 5)); // 이처럼 문자의 길이를 지정하고 전체 문자열 중 그 길이에 해당하는 문자열 안에서만 확인하는 것도 가능하다
// 결과 true
```

- 문자열의 알파벳을 대소문자로 만들어 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.toUpperCase()); // 알파벳을 모두 대문자로 만든다
console.log(str1.toLowerCase()); // 알파벳을 모두 소문자로 만든다
```

- 문자열 치환하여 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1.replace("Hello", "안녕")); // str1 문자열의 "Hello"를 모두 "안녕"으로 치환
```

- 문자열 결합하여 반환하는 메서드

```js
let str1 = "Hello String 안녕 String";
console.log(str1 + "Hello 안녕" + "안녕하세요"); // "+" 연산자로 문자열 결합 가능하다
console.log(str1.concat("Hello 안녕", "안녕하세요")); // str1에 "Hello 안녕", "안녕하세요" 차례로 결합
```

- 문자열을 구분자 중심으로 분리하여 반환하는 메서드

```js
let str1 = "사과, 딸기, 수박, 참외";
let arr1 = str1.split(","); // "," 을 구분자로 해서 str1에 할당된 문자열을 분리(배열의 형태로 분리된다)
console.log(arr1); // ["사과", "딸기", "수박", "참외"]
```

- 단어의 첫글자만 대문자로 만드는 함수 만들어보기

```js
function capitalize(str) {
  let result = "";
  if (str.charAt(0) === " ") {
    result += " ";
  } else {
    result += str.charAt(0).toUpperCase();
  }
  for (let i = 1; i < str.length; i++) {
    if (str.charAt(i - 1) === " ") {
      result += str.charAt(i).toUpperCase();
    } else {
      result += str.charAt(i);
    }
  }
  return result;
}
console.log(capitalize("hello park dae ho"));
```

```js
function capitalize(str) {
  let result = "";
  let arrResult = str.split(" ");
  for (let i = 0; i < arrResult.length; i++) {
    for (let j = 0; j < arrResult[i].length; j++) {
      if (j === 0) {
        result += arrResult[i].charAt(j).toUpperCase();
      } else {
        result += arrResult[i].charAt(j);
      }
    }
    i !== arrResult.length - 1 ? (result += " ") : (result += "");
  }
  return result;
}
console.log(capitalize("hello park dae ho"));
```

```js
const capitalize = function (data) {
  let words = data.split(" ");
  let result = "";
  for (let word of words) {
    result += word.substring(0, 1).toUpperCase() + word.substr(1) + " ";
  }
  return result.substring(0, result.length - 1); // 마지막에 있는 공백 없애기
};
console.log(capitalize("hello world"));
```

### Number

- 숫자를 Number 객체로 사용할 수도 있다

#### 숫자에 사용할 수 있는 메서드

- 변수에 저장할 수 있는 최대, 최소 값 출력

```js
console.log(Number.MAX_VALUE); // 저장할 수 있는 최대 값 출력
console.log(Number.MIN_VALUE); // 저장할 수 있는 최소 값 출력
```

- 소수에 사용하는 메서드

```js
let num = 273.1534;
console.log(num.toFixed(1)); // 소수 두번째 자리에서 반올림해서 소수 첫번째 자리까지 출력
```

### Date

- 날짜 관련 객체

```js
let today = new Date();
console.log(today); // 표준시를 중심으로 영문 출력
console.log(today.toString()); // 표준시를 중심으로 영문 출력
console.log(today.toLocaleString()); // 표준시를 중심으로 한글 출력
```

```js
let today = new Date();
let strToday = today.toLocaleString();
console.log(strToday.substring(0, 11)); // 년, 월, 일만 출력
console.log(today.getFullYear()); // 연도 출력
console.log(today.getMonth() + 1); // 월은 0부터 시작하기 때문에 1을 더해줘야 한다
console.log(today.getDate()); // 일 출력
console.log(today.getDay()); // 요일을 숫자로 출력 (Sunday[0] ~ Saturday[6]);
```

```js
let today = new Date();
console.log(today.getHours()); // 시간 출력
console.log(today.getMinutes()); // 분 출력
console.log(today.getSeconds()); // 초 출력
console.log(today.getTime()); // 1970 년 1 월 1 일 00:00:00 UTC와 주어진 날짜 사이의 경과 시간 (밀리 초)을 출력
```

```js
let date1 = new Date(2023, 3 - 1, 3);
let date2 = new Date(2023, 3 - 1, 1);
let interval1 = date1 - date2;
let interval2 = date1.getTime() - date2.getTime();
console.log(interval1); // 172800000
console.log(interval2); // 172800000
let day = interval1 / (1000 * 60 * 60 * 24);
console.log(day); // 2
console.log(date1.getDate() - date2.getDate()); // 2
```

```js
let date1 = new Date(2023, 3 - 1, 8); // 특정 년, 월, 일로 설정할 수 있다
console.log(date1.toLocaleString()); // 시간을 설정하지 않을 경우 기본 값은 오전 12:00:00:00
let date2 = new Date(2023, 3 - 1, 8, 10, 10, 24); // 시간까지 설정한 경우
console.log(date2.toLocaleString());
```

```js
let date3 = new Date(2023, 3 - 1, 1 - 1); // 이처럼 저번 달의 마지막 날을 구할 수도 있다
console.log(date3.toLocaleString());
```

```js
let date = new Date();
date.setDate(date.getDate() + 7); // 7일 후의 일자로 설정한다
```

### Math

- 수학과 관련된 객체

```js
console.log(Math.ceil(5.6));
console.log(Math.ceil(5.5));
console.log(Math.ceil(5.4));
// 올림
console.log(Math.floor(5.6));
console.log(Math.floor(5.5));
console.log(Math.floor(5.4));
// 내림
console.log(Math.round(5.6));
console.log(Math.round(5.5));
console.log(Math.round(5.4));
// 반올림
```

```js
console.log(Math.max(52, 273, 57, 32)); // 괄호 안에 나열된 값들 중 최대값 구하는 메서드
console.log(Math.min(52, 273, 57, 32)); // 괄호 안에 나열된 값들 중 최소값 구하는 메서드
```

```js
// 난수(임의의 값 추출) : 0 <= x < 1 임의의 실수
console.log(Math.random());
console.log(Math.random());
console.log(Math.random());
// 각각 다른 값이 나온다
// 0 ~ 9까지 중 임의의 정수
console.log(Math.floor(Math.random() * 10));
console.log(parseInt(Math.random() * 10));
```

```js
// 로또 만들기
let lotto = [0, 0, 0, 0, 0, 0];
for (let i = 0; i < lotto.length; i++) {
  lotto[i] = parseInt(Math.random() * 45 + 1);
}
console.log(lotto); // 33,34,28,6,9,3
console.log(lotto.toString()); // 31,39,34,18,24,25
console.log(...lotto); // 45 25 42 10 30 43
// 같은 수가 나오는 경우 해결해보기
```

### Array

- 배열 관련 객체

```js
let arr1 = [];
let arr2 = new Array();
// 빈 배열의 두가지 생성방법
```

```js
let arr3 = new Array(1, 2, 3, 4);
console.log(arr3); // 1,2,3,4 출력
let arr4 = new Array(4);
console.log(arr4); // 길이가 4인 비어있는 배열 출력
```

```js
let arr1 = new Array(1, 2, 3, 4);
let arr2 = new Array(5, 6, 7, 8);
console.log(arr1.concat(arr2)); // 두 개의 배열을 결합시킨 배열을 반환한다
```

```js
let arr1 = new Array(1, 2, 3, 4);
console.log(arr1.join()); // 배열을 문자열로 만든다
console.log(arr1.join(" "));
// 배열을 문자열로 만들 때, 괄호 안의 문자열로 구분한다 (기본값은 ',')
```

```js
let arr1 = new Array(1, 2, 3, 4);
console.log(arr1.pop()); // 배열의 마지막 인덱스의 값을 반환한다
console.log(arr1); // [1, 2, 3]
console.log(arr1.push(4)); // 배열에 괄호안에 있는 값을 추가시킨다
console.log(arr1); // [1, 2, 3, 4]
```

```js
let arr1 = new Array(1, 2, 3, 4);
arr1.reverse(); // 배열을 역순으로 만든다
console.log(arr1); // [4, 3, 2, 1]
```

```js
let arr1 = new Array(1, 2, 3, 4);
let subarr = arr1.slice(1, 3); // 1 인덱스 부터 (3 - 1)인덱스까지의 값을 반환한다
console.log(subarr); // [2, 3]
```

```js
let arr1 = new Array(1, 2, 3, 4);
for (let i = 0; i < arr1.length; i++) {
  console.log(arr1[i]);
} // 배열의 모든 데이터 출력
arr1.forEach(function () {
  console.log("함수 호출");
});
arr1.forEach(function (e, i) {
  console.log("함수 호출 : ", e, i);
}); // 배열의 값과 인덱스 출력
```

```js
let sum = 0;
arr1.forEach(function (e) {
  sum += e;
});
console.log(sum); // 배열 안의 값들의 총합 출력
```

---

!! 지금까지 배운 것을 종합해서 주민등록번호 형식 검사 프로그램 만들어보기

```js
let check = true;
while (check) {
  let data = prompt("주민등록번호를 입력하세요(123456-1234567)");
  if (data.includes("-")) {
    let dataArr = data.split("-");
    if (data.length == 14 && dataArr[0].length == 6 && dataArr[1].length == 7) {
      let sum = 0;
      let mulNum = 2;
      for (let i = 0; i < dataArr[0].length; i++) {
        sum += dataArr[0].charAt(i) * mulNum++;
      }
      for (let j = 0; j < dataArr[1].length - 1; j++) {
        sum += dataArr[1].charAt(j) * mulNum++;
        if (mulNum === 10) {
          mulNum = 2;
        }
      }
      if (
        Number(dataArr[1].charAt(dataArr[1].length - 1)) ===
        (11 - (sum % 11)) % 10
      ) {
        alert("올바른 주민등록번호 형식입니다");
        check = false;
      } else {
        alert("주민등록번호 형식에 맞지 않습니다");
        check = false;
      }
    } else {
      alert("주민등록번호 형식에 맞춰 다시 입력해주세요(123456-1234567)");
    }
  } else {
    alert('"-"를 포함해 주민등록번호 형식에 맞춰 입력해주세요(123456-1234567)');
    continue;
  }
}
```

```js
const data = "941117-1031928";
let strData = data.replace("-", "");
let sum = Number(strData.substr(0, 1)) * 2;
sum += Number(strData.substr(1, 1)) * 3;
sum += Number(strData.substr(2, 1)) * 4;
sum += Number(strData.substr(3, 1)) * 5;
sum += Number(strData.substr(4, 1)) * 6;
sum += Number(strData.substr(5, 1)) * 7;
sum += Number(strData.substr(6, 1)) * 8;
sum += Number(strData.substr(7, 1)) * 9;
sum += Number(strData.substr(8, 1)) * 2;
sum += Number(strData.substr(9, 1)) * 3;
sum += Number(strData.substr(10, 1)) * 4;
sum += Number(strData.substr(11, 1)) * 5;
let result = (11 - (sum % 11)) % 10;
if (strData.substr(12, 1) == result) {
  alert("형식에 맞는 주민번호");
} else {
  alert("형식에 맞지 않는 주민번호");
}
```

```js
let data = "941117-1031928";
let strData = data.replace("-", "");
let sum = 0;
const bits = new Array(2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5);
for (let i = 0; i < bits.length; i++) {
  sum += Number(strData.substr(i, 1) * bits[i]);
}
let check = (11 - (sum % 11)) % 10;
if (strData.substr(12, 1) == check) {
  console.log("형식에 맞는 주민번호");
} else {
  console.log("형식에 맞지 않는 주민번호");
}
```

위의 코드를 함수로 만들면 아래와 같이 만들 수 있다

```js
const checkFormat = function (data) {
  let strData = data.replace("-", "");
  let sum = 0;
  const bits = new Array(2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5);
  for (let i = 0; i < bits.length; i++) {
    sum += Number(strData.substr(i, 1) * bits[i]);
  }
  let check = (11 - (sum % 11)) % 10;
  if (strData.substr(12, 1) == check) {
    console.log("형식에 맞는 주민번호");
  } else {
    console.log("형식에 맞지 않는 주민번호");
  }
};
```

클래스를 이용한 객체로 만들어보기

```js
class Util {
  constructor(data) {
    this.data = data;
  }
  isJuminCheck() {
    let data = this.data;
    let strData = data.replace("-", "");
    let sum = 0;
    const bits = new Array(2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5);
    for (let i = 0; i < bits.length; i++) {
      sum += Number(strData.substr(i, 1) * bits[i]);
    }
    let check = (11 - (sum % 11)) % 10;
    if (strData.substr(12, 1) == check) {
      return true;
    } else {
      return false;
    }
  }
} // 객체를 만들어서 직접 확인해보자
```

```js
const data = "941117-1031928";
let strData = data.replace("-", "");
let sum = Number(strData.substr(0, 1)) * 2;
for (let i = 1; i <= 11; i++) {
  if (2 * i + 2 <= 16) {
    sum += Number(strData.substr(i, 1)) * (i + 2);
  } else {
    sum += Number(strData.substr(i, 1)) * (i - 6);
  }
}
console.log(sum);
let result = (11 - (sum % 11)) % 10;
if (strData.substr(12, 1) == result) {
  alert("형식에 맞는 주민번호");
} else {
  alert("형식에 맞지 않는 주민번호");
}
```

---

## 외부 객체

- 외부에서 만들어 놓은 객체를 유료로 사용할 수 있다

  <small>ex) https://www.highcharts.com/ 차트 관련 외부 객체</small>

## 배열

- 집합적인 저장소
- 배열의 종류

  - 순서(인덱스)가 있는 저장소 : Array, List

  - 중복을 배제하는 알고리즘을 포함하는 저장소 : Set

  ```js
  let set = new Set();
  console.log(set); // Set(0) {size: 0}

  let set1 = new Set([1, 2, 3, 4, 1, 2, 3, 4]);
  console.log(set1); // Set(4) {1, 2, 3, 4}(중복이 되지 않는다)
  console.log(set1.size); // 4
  console.log(set1[0]); // 에러(배열을 넣어 만들었지만 Set은 배열과 다르다)
  for (let data of set1) {
    console.log(data);
  } // 데이터를 차례로 출력
  ```

  ```js
  let set = new Set();
  set.add(1);
  set.add(3);
  set.add(4);
  set.add(2);
  console.log(set); // Set(4) {1, 3, 4, 2}
  set.add(3);
  set.add(4);
  console.log(set); // Set(4) {1, 3, 4, 2}(중복된 값은 추가되지 않는다)
  ```

  !! Set을 로또번호 뽑기에 이용해보기

  - 키(문자열)와 값의 구조로 저장하는 저장소 : Map

  ```js
  const map = new Map();
  console.log(map); // Map(0) {size: 0}

  const map1 = new Map([
    ["key1", "value1"],
    ["key2", "value2"],
    ["key3", "value3"],
  ]); // 2차배열과 비슷하다
  /*
    const map2 = [
      {key : 1, value : 10},
      {key : 2, value : 20},
      {key : 3, value : 30}
    ] 
    */
  console.log(map1); // Map(3) {'key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3'}
  console.log(map1[0]); // undefined
  for (let data of map1) {
    console.log(data);
  } // ['key1', 'value1'] 이런식으로 출력
  for (let [key, value] of map1) {
    console.log(key, value);
  } // key1 value1 이런식으로 출력
  ```

  ```js
  const map = new Map();
  map.set("key1", "value1"); // map에 ["key1", "value1"] 추가
  map.set("key2", "value2"); // map에 ["key2", "value2"] 추가
  map.set("key3", "value3"); // map에 ["key3", "value3"] 추가
  // map.set("key1", "value1").set("key2","value2").set("key3","value3"); 이렇게 쓸 수도 있다(메서드 체이닝)
  ```

  ***

## 내장객체

- 모듈, API(application programming interface), 라이브러리

- 재활용성 극대화
- window : DOM, BOM의 최상위 객체로 브라우저와 연관되어 있는 객체

```js
alert("알림창"); // window.alert("알림창")에서 "window." 생략하고 쓰인다
```

```js
console.log(window.screenTop); // 웹 브라우저의 top 위치값이 나온다
console.log(window.screenLeft); // 웹 브라우저의 left 위치값이 나온다
```

```js
open("https://www.naver.com"); // 새로운 탭에 url을 열어주는 메서드
// window.open("https://www.naver.com")
open("https://www.naver.com", "windowopen", "width = 640, height = 960"); // 새 창에 url이 열린다
// 여기서 "windowopen" 은 창의 이름이고 "width = 640, height = 960"은 옵션이다(top, left 옵션으로 창이 열리는 위치 설정도 할 수 있다)
```

```js
const openWin = function () {
  child = open(
    "https://www.naver.com",
    "windowopen",
    "width = 640, height = 960"
  );
};
const closeWin = function () {
  child.close(); // 값을 얻어와 그 창을 닫을 수있다.
};
```

### screen

- 브라우저 창 화면이 아닌 pc나 스마트폰의 화면에 대해 다루는 객체

```js
console.log(screen.width, screen.height); // 1920 1080
// 전체 스크린의 크기
console.log(screen.availWidth, screen.availHeight); // 1920 1040
// 사용 가능한 스크린의 크기(윈도우 작업표시줄을 제외한 화면 크기)
```

!! 위에서 배운 것을 활용해서 팝업창 화명 중앙에서 열리게 하기

```js
const mOpen = function (url) {
  let width = 600;
  let height = 700;
  let left = (screen.width - width) / 2;
  let top = (screen.height - height) / 2;
  let option = `width=${width} height=${height} left=${left} top=${top}`;
  open(url, "mOpen", option);
};
```

### location

```js
console.log(location.href); // 지금 열려있는 창의 url 출력
console.log(location.host); // 지금 열려있는 창의 호스트이름과 포트 번호 출력
console.log(location.hostname); // 지금 열려있는 창의 호스트이름 출력
console.log(location.protocol); // 지금 열려있는 창의 프로토콜 출력
```

```js
location.href = "https://www.naver.com"; // naver가 열린다
```

위의 코드를 이용해 naver로 이동하는 함수 만들기

```js
const goUrl = function () {
  location.href = "https://www.naver.com";
};
```

5초 후 naver로 이동하는 함수 만들기

```html
<body>
  <script>
    const goUrl = function () {
      location.href = "https://www.naver.com";
    };
  </script>
  <button onclick="setTimeout(goUrl,5000)">5초 후 네이버로 이동</button>
</body>
```

### navigator

- 브라우저 창의 주소 표시줄과 관련있는 객체

```js
console.log(navigator.appCodeName); // Mozilla
console.log(navigator.appName); // Netscape
console.log(navigator.platform); // Win32
console.log(navigator.userAgent); // Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36
```

### history

- 브라우저에서의 기록과 관련된 객체

```html
<body>
  <script>
    const backUrl = function () {
      history.back();
      // history.go(-1) 이렇게 쓸 수도 있다
    };
  </script>
  <button onclick="backUrl()">뒤로가기</button>
</body>
// 뒤로가기 버튼 만들기
```

---

# DOM(Document Object Model)

- DOM 트리

<img src="https://postfiles.pstatic.net/MjAxODA4MTJfMjAx/MDAxNTM0MDU4NTU5MzY3.kXFm4uyU0cvNRkksGATskTwGkPAlIUcrfL4EVQc3rpQg.7g3iioytTUcOEsoA3QYWRObgk5Vm5UCDpa7DgPRF3p8g.PNG.jwyoon25/image.png?type=w773">
<br>
<br>

- document 객체로 html 문서 조작 가능

```js
document.write("Hello script"); // "Hello script"를 html 문서로 출력
document.bgColor = "darkgrey"; // 배경색을 바꾼다
console.log(document.title); // title 태그 안의 값을 출력
```

```js
const changeTitle = function (title) {
  document.title = title;
}; // html title 태그 값 변경 함수
```

```js
const changeBg = function () {
  let color = prompt("배경색 입력");
  document.bgColor = color;
}; // 배경색을 입력받아 배경색을 변경시키는 함수
```

## input 태그에서 입력받은 내용 Javascript에서 사용하기

```js
console.log(typeof document.forms); // object
// forms는 html에 쓰인 form 태그의 배열이다
console.log(document.forms[0]); // html에서 쓰인 첫번째 form 태그 출력
console.log(document.naver); // html에서 쓰인 naver 이름을 가진 태그 출력
console.log(document.forms.length); // form 태그의 개수
console.log(document.forms[0].action); // 첫번째 form 태그의 action 속성 값 출력
console.log(document.naver.action); // html 문서에서 naver 이름을 가진 태그의 action 속성 값 출력
```

```html
<body>
  <script>
    window.onload = function () {
      console.log(typeof document.forms);
      console.log(document.forms[0]);
      console.log(document.naver);
      console.log(document.forms.length);
      console.log(document.forms[0].action);
    }; // html 문서를 다 읽고 나서 script 태그를 해석하기 때문에 에러가 나지 않는다
  </script>
  <form action="https://www.naver.com" name="naver"></form>
  <form action="https://www.daum.net" name="daum"></form>
</body>
```

아래와 같이 버튼을 이용하는 방법도 있다

```html
<body>
  <script>
    const checkForm = function () {
      console.log(typeof document.forms);
      console.log(document.forms[0]);
      console.log(document.naver);
      console.log(document.forms.length);
      console.log(document.forms[0].action);
    };
  </script>
  <form action="https://www.naver.com" name="naver"></form>
  <form action="https://www.daum.net" name="daum"></form>
  <button onclick="checkForm()">폼 형식 확인</button>
</body>
```

!! 외부에 있는 javascript 파일을 불러오는 경우 defer 속성을 적어서 script 태그를 마지막에 해석하게 할 수도 있다

```js
<script defer src="스크립트 파일 경로"></script>
```

```html
<body>
  <script>
    function capitalize() {
      let str = document.frm.data1.value;
      let result = "";
      if (str.charAt(0) === " ") {
        result += " ";
      } else {
        result += str.charAt(0).toUpperCase();
      }
      for (let i = 1; i < str.length; i++) {
        if (str.charAt(i - 1) === " ") {
          result += str.charAt(i).toUpperCase();
        } else {
          result += str.charAt(i);
        }
      }
      document.frm.data2.value = result;
    }
  </script>
  <form name="frm">
    data1 : <input type="text" name="data1" />
    <input
      type="button"
      value="첫 글자 대문자로 만들기"
      onclick="capitalize()"
    />
    <input type="text" name="data2" />
  </form>
</body>
```

```html
<body>
  <script>
    const checkfrm = function () {
      console.log(document.frm.cb1.checked); // 체크박스에 체크되었는지 확인
      console.log(document.frm.cb1.value);
      console.log(document.frm.cb2.checked);
      console.log(document.frm.cb2.value);
      console.log(document.frm.cb3.checked);
      console.log(document.frm.cb3.value);
      console.log(document.frm.cb4.checked);
      console.log(document.frm.cb4.value);
    };
  </script>
  <form name="frm">
    <input type="checkbox" name="cb1" value="사과" />사과<br />
    <input type="checkbox" name="cb2" checked value="딸기" />딸기<br />
    <input type="checkbox" name="cb3" value="수박" />수박<br />
    <input type="checkbox" name="cb4" value="참외" />참외<br /><br />

    <input type="button" value="form 내용읽기" onclick="checkfrm()" />
  </form>
</body>
```

```html
<body>
  <script>
    const checkfrm = function () {
      for (let i = 0; i < document.frm.cb.length; i++) {
        if (document.frm.cb[i].checked == true) {
          console.log(document.frm.cb[i].value);
        }
      }
    };
  </script>
  <form action="" name="frm">
    <input type="checkbox" name="cb" value="사과" />사과<br />
    <input type="checkbox" name="cb" checked value="딸기" />딸기<br />
    <input type="checkbox" name="cb" value="수박" />수박<br />
    <input type="checkbox" name="cb" value="참외" />참외<br /><br />
    // name을 같게 하면 그 이름의 배열이 생성된다
    <input type="button" value="form 내용읽기" onclick="checkfrm()" />
  </form>
</body>
```

```html
<body>
  <script>
    const checkfrm = function () {
      for (let i = 0; i < document.frm.cb.length; i++) {
        if (document.frm.cb[i].checked == true) {
          console.log(document.frm.cb[i].value);
        }
      }
    };
    const selectChk = function () {
      document.frm.cb[2].checked = true;
    };
  </script>
  <form action="" name="frm">
    <input type="checkbox" name="cb" value="사과" />사과<br />
    <input type="checkbox" name="cb" checked value="딸기" />딸기<br />
    <input type="checkbox" name="cb" value="수박" />수박<br />
    <input type="checkbox" name="cb" value="참외" />참외<br /><br />
    <input type="button" value="form 내용읽기" onclick="checkfrm()" />
    <input type="button" value="수박에 체크하기" onclick="selectChk()" />
  </form>
</body>
```

```html
<body>
  <script>
    const selectAll = function () {
      for (let i = 0; i < document.frm.cb.length; i++) {
        document.frm.cb[i].checked = true;
      }
    };
    const deleteAllchk = function () {
      for (let i = 0; i < document.frm.cb.length; i++) {
        document.frm.cb[i].checked = false;
      }
    };
  </script>
  <form action="" name="frm">
    <input type="button" value="전체선택" onclick="selectAll()" />
    <input
      type="button"
      value="전체해제"
      onclick="deleteAllchk()"
    /><br /><br />

    <input type="checkbox" name="cb" value="사과" />사과<br />
    <input type="checkbox" name="cb" checked value="딸기" />딸기<br />
    <input type="checkbox" name="cb" value="수박" />수박<br />
    <input type="checkbox" name="cb" value="참외" />참외<br /><br />
  </form>
</body>
```

```html
<body>
  <script>
    const checkfrm = function () {
      for (let i = 0; i < document.frm.cb.length; i++) {
        if (document.frm.cb[i].checked) {
          console.log(document.frm.cb[i].value);
        }
      }
    };
  </script>
  <form action="" name="frm">
    <input type="radio" name="cb" value="사과" />사과<br />
    <input type="radio" name="cb" checked value="딸기" />딸기<br />
    <input type="radio" name="cb" value="수박" />수박<br />
    <input type="radio" name="cb" value="참외" />참외<br /><br />
    <input type="button" value="form 내용읽기" onclick="checkfrm()" />
  </form>
</body>
```

```html
<body>
  <script>
    const checkfrm = function () {
      for (let i = 0; i < document.frm.sel.options.length; i++) {
        if (document.frm.sel.options[i].selected) {
          console.log(document.frm.sel.options[i].value);
        }
      }
    };
    /*
      const checkfrm = function(){
        let selectedOption = document.frm.sel.selectedIndex;
        console.log(document.frm.sel.options[selectedOption].value);
      }
      */
    const selectfrm = function () {
      document.frm.sel.selectedIndex = 1;
    };
  </script>
  <form action="" name="frm">
    <select name="sel" id="">
      <option value="사과1">사과</option>
      <option value="수박1">수박</option>
      <option value="딸기1" selected>딸기</option>
      <option value="참외1">참외</option>
    </select>
    <input type="button" value="내용확인" onclick="checkfrm()" />
    <input type="button" value="수박선택" onclick="selectfrm()" />
  </form>
</body>
```

!! 검색사이트 선택해서 검색어 검색하는 웹 프로그램 만들기

```html
<body>
  <script>
    const webSearch = function () {
      let str = document.frm.query.value;
      let siteStr = "";
      // let option = "width=600 height=700 left=400 top= 400";
      if (document.frm.sitename.selectedIndex == 0) {
        siteStr = `https://search.naver.com/search.naver?query=${str}`;
        location.href = siteStr; // 지금의 창에서 바로 검색
        // open(siteStr,"naverSearch",option); 새 창으로 검색
      } else {
        siteStr = `https://search.daum.net/search?q=${str}`;
        location.href = siteStr; // 지금의 창에서 바로 검색
        // open(siteStr,"daumSearch",option); 새 창으로 검색
      }
    };
  </script>
  <form action="" name="frm">
    검색어 : <input type="text" name="query" placeholder="검색어 입력" />
    <br /><br />
    검색사이트 :
    <select name="sitename" id="">
      <option value="naver">네이버</option>
      <option value="daum">다음</option>
    </select>
    <br /><br />
    <input type="button" value="검색하기" onclick="webSearch()" />
  </form>
</body>
```

```html
<body>
  <script>
    const webSearch = function () {
      let query = document.frm.query.value;
      if (query.length < 1) {
        alert("1자 이상의 검색어를 입력하셔야 합니다.");
      } else {
        let sitename =
          document.frm.sitename.options[document.frm.sitename.selectedIndex]
            .value;
        console.log(sitename);
        let url = "";
        switch (sitename) {
          case "naver":
            url = "https://search.naver.com/search.naver?query=" + query;
            break;
          case "daum":
            url = "https://search.daum.net/search?q=" + query;
            break;
          case "google":
            url = "https://www.google.com/search?q=" + query;
            break;
        }
        location.href = url;
      }
    };
  </script>
  <form action="" name="frm">
    검색어 : <input type="text" name="query" placeholder="검색어 입력" />
    <br /><br />
    검색사이트 :
    <select name="sitename" id="">
      <option value="naver">네이버</option>
      <option value="daum">다음</option>
      <option value="google">구글</option>
    </select>
    <br /><br />
    <input type="button" value="검색하기" onclick="webSearch()" />
  </form>
</body>
```

계산기 만들기 실습

```html
<body>
  <script>
    const cal = function () {
      let val1 = Number(document.frm.val1.value);
      let val2 = Number(document.frm.val2.value);
      let oper =
        document.frm.operator.options[document.frm.operator.selectedIndex]
          .value;
      let result = 0;
      if (isNaN(val1) || val1 == 0 || isNaN(val2) || val2 == 0) {
        // NaN 확인은 무조건 isNaN 함수로 확인한다
        alert("제대로된 값을 입력해주세요");
      } else {
        switch (oper) {
          case "+":
            result = val1 + val2;
            break;
          case "-":
            result = val1 - val2;
            break;
          case "*":
            result = val1 * val2;
            break;
        }
        document.frm.result.value = result;
      }
    };
  </script>
  <form action="" name="frm">
    <input type="text" name="val1" />
    <select name="operator" id="">
      <option value="+">+</option>
      <option value="-">-</option>
      <option value="*">X</option>
    </select>
    <input type="text" name="val2" />
    =
    <input type="button" value="계산" onclick="cal()" />
    <input type="text" name="result" placeholder="결과" readonly />
    <input type="reset" value="초기화" />
  </form>
</body>
```

---

## html 문서의 요소 가져오기

- 특정 id, class, tag를 javascript로 다루기 위해서 가져온다

### getEelementById

```js
let h1 = document.getElementById("h1");
// id 이름이 "h1"인 요소를 가져와 변수 h1에 할당한다(id는 중복이 될수 없기 때문에 한가지만 골라서 가져온다고 생각하자)
```

### getElemetsByTagNme

```js
let h2s = document.getElementsByTagName("h2");
// h2 태그를 모두 가져와 변수 h2s에 할당한다(이때 h2s는 배열처럼 쓰인다)
```

!! 요소 여러개를 변수에 할당할 때는 배열로 할당한다

### querySelector

```js
let h1 = document.querySelector("#h1"); 
// 지정한 선택자를 사용한 요소 중 첫번째 요소만 할당한다 
// 주로 id 요소를 할당할 때 쓰인다
```

### querySelectorAll

```js
let c1s = document.querySelectorAll(".c1"); 
let h2s = document.querySelectorAll("h2"); 
// 한꺼번에 여러개 요소에 접근할 때 사용하며 노드리스트(배열)의 형태로 할당된다
// 한번만 사용할 수 있는 id를 제외한 요소를 할당할 때 쓰인다
```

### 웹 요소의 내용 가져오기

```js
let h1 = document.querySelector("#h1");
let text = h1.innerText; // 태그 안의 내용을 할당한다(브라우저에 보이는 내용만 가져오기 때문에 display 속성 값이 none이라서 웹브라우저에 보이지 않는 내용 역시 가져오지 않는다)
let text = h1.textContent; // 태그 안의 내용을 할당한다(브라우저에 보이는 내용이 아닌 태그를 제외한 소스 내용을 그대로 모두 가져온다)
let html = h1.innerHTML; // 태그안에 속해 있는 태그와 내용을 소스 내용 그대로 모두 가져와 할당한다
```

### 웹 요소 내용 수정 및 삭제

```js
const h1 = document.querySelector("#h1");
hi.innerHTML = "<i>Change Html</i>"; // 내용 수정
hi.innerHTML = ""; // 내용 삭제
```


테이블 추가, 삭제 버튼 만들기 실습

```html
<body>
  <script>
    const createTable = function () {
      let html = `<table border="1"><tr><td>1열</td><td>2열</td><td>3열</td></tr></table>`;
      const div = document.querySelector("#result");
      div.innerHTML = html;
    };
    const deleteTable = function () {
      const div = document.querySelector("#result");
      div.innerHTML = "";
    };
  </script>
  <input type="button" value="table 추가" onclick="createTable()" />
  <input type="button" value="table 삭제" onclick="deleteTable()" />
  <br />
  <hr />
  <br />
  <div id="result"></div>
</body>
```


구구단 출력버튼 만들고 구구단 표 출력하기

```html
<body>
  <script>
    const printGugudan = function () {
      let firstNumber = Number(document.gugudan.first.value);
      let lastNumber = Number(document.gugudan.last.value);
      let html = "";
      if (firstNumber >= lastNumber) {
        alert("끝단수는 시작단수보다 커야합니다");
      } else {
        html += "<table border='1'>";
        for (let i = firstNumber; i <= lastNumber; i++) {
          html += "<tr>";
          for (let j = 1; j <= 9; j++) {
            html += `<td>${i} X ${j} = ${i * j}</td>`;
          }
          html += "</tr>";
        }
        html += "</table>";
      }
      document.querySelector("#gugudanTable").innerHTML = html;
    };
  </script>
  <form name="gugudan">
    시작 단수 <input type="text" name="first" /> ~ 끝 단수
    <input type="text" name="last" />
    <input type="button" value="구구단 출력" onclick="printGugudan()" />
  </form>
  <br />
  <hr />
  <br />
  <div id="gugudanTable"></div>
</body>
```

---

## 이벤트

- 웹브라우저 내에서 일어나는 어떤 동작

  <small>ex) 링크 클릭, 웹 페이지 불러오기</small>

- GUI 환경은 거의 이벤트 중심이다

- 이벤트 처리하기
  - <태그 on이벤트명="함수">
  ```html
  <button onclick="alert('클릭')">클릭</button>
  ```
  - 요소.on이벤트명 = 함수
  ```js
  document.getElementById("btn1").onclick = function () {
    alert("클릭"); // id가 "btn1"인 요소를 클릭했을 때 알림창
  }; // 이 방법을 많이 사용한다
  ```

### window 이벤트

- 문서의 로딩이 완전히 끝났을 때를 나타내는 이벤트

```js
window.onload = function () {
  console.log("load event");
};
```

- 문서 화면크기가 바뀌었을 때를 나타내는 이벤트

```js
window.onresize = function () {
  console.log("resize event");
};
```

---

### 마우스 이벤트

```js
window.onload = function () {
  // 문서가 모두 로딩이 됐을 때
  document.getElementById("div").onclick = function () {
    // 마우스로 클릭했을 때
    console.log("click");
  };
  document.getElementById("div").onmouseover = function () {
    // 커서를 요소에 위치시켰을 때
    console.log("mouseover");
  };
  document.getElementById("div").onmouseout = function () {
    // 커서를 요소 밖으로 위치시켰을 때
    console.log("mouseout");
  };
};
```

아래와 같이 addEventListener 함수를 통해 이벤트 처리 가능하다

```js
window.onload = function () {
  const div = document.getElementById("div");
  div.addEventListener("click", function () {
    console.log("click");
  });
}; // id가 div인 영역을 클릭했을 때 click 콘솔 출력
```

```js
document.getElementById("div").onclick = function (e) {
  // 마우스로 id가 "div"인 영역 클릭했을 때
  console.log(e.x);
  console.log(e.y);
  // 클릭한 위치의 좌표값이 나온다
  console.log("altkey : ", e.altKey); // alt키를 누르고 클릭하면 true
  console.log("shiftkey : ", e.shiftKey); // shift키를 누르고 클릭하면 true
  console.log("ctrlkey : ", e.ctrlKey); // ctrl키를 누르고 클릭하면 true
};
```

```html
<body>
  <script>
    window.onload = function () {
      let buttons = document.getElementsByClassName("btn");
      for (let i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function () {
          console.log("button 클릭 : ", this); // 클릭한 버튼의 태그를 포함한 내용 모두 출력
          console.log("button 클릭 : ", this.value); // 클릭한 버튼의 value 속성값 출력
          console.log("button 클릭 : ", this.id); // 클릭한 버튼의 id 속성값 출력
          // this는 자기참조라고 한다
        };
      }
    };
  </script>
  <input type="button" id="btn1" class="btn" value="버튼1" />
  <input type="button" id="btn2" class="btn" value="버튼2" />
  <input type="button" id="btn3" class="btn" value="버튼3" />
  <input type="button" id="btn4" class="btn" value="버튼4" />
  <input type="button" id="btn5" class="btn" value="버튼5" />
</body>
```

```html
<body>
  <script>
    window.onload = function () {
      let buttons = document.getElementsByClassName("btn");
      for (let i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function () {
          document.frm.result.value = `${buttons[i].value}가 눌렸습니다`;
        };
      }
    };
  </script>
  <input type="button" id="btn1" class="btn" value="버튼1" />
  <input type="button" id="btn2" class="btn" value="버튼2" />
  <input type="button" id="btn3" class="btn" value="버튼3" />
  <input type="button" id="btn4" class="btn" value="버튼4" />
  <input type="button" id="btn5" class="btn" value="버튼5" />
  <br />
  <hr />
  <br />
  <form name="frm">
    // form 태그가 있어야 name 속성을 이용해 값을 받을 수 있다
    <input type="text" name="result" readonly />
  </form>
</body>
```

위의 코드는 아래와 같이 쓸 수도 있다

```html
<body>
  <script>
    window.onload = function () {
      let buttons = document.getElementsByClassName("btn");
      for (let i = 0; i < buttons.length; i++) {
        buttons[i].onclick = function () {
          document.getElementById(
            "result"
          ).value = `${buttons[i].value}가 눌렸습니다`;
        };
      }
    };
  </script>
  <input type="button" id="btn1" class="btn" value="버튼1" />
  <input type="button" id="btn2" class="btn" value="버튼2" />
  <input type="button" id="btn3" class="btn" value="버튼3" />
  <input type="button" id="btn4" class="btn" value="버튼4" />
  <input type="button" id="btn5" class="btn" value="버튼5" />
  <br />
  <hr />
  <br />
  <input type="text" id="result" readonly />
</body>
```

```html
<body>
  <script>
    window.onload = function () {
      let btn1 = document.getElementById("btn1");
      let btn2 = document.getElementById("btn2");
      let count1 = document.getElementById("count1");
      let count2 = document.getElementById("count2");
      btn1.onclick = function () {
        count1.innerHTML = Number(count1.innerHTML) + 1;
        console.log(count1.innerHTML);
      };
      btn2.onclick = function () {
        count2.innerHTML = Number(count2.innerHTML) + 1;
        console.log(count2.innerHTML);
      };
    };
  </script>
  <button id="btn1">클릭</button>
  <button id="btn2">클릭</button>
  <br />
  <hr />
  <br />
  <h1>button1 - <span id="count1">0</span></h1>
  <h1>button2 - <span id="count2">0</span></h1>
</body>
```

```html
<body>
  <script>
    const checkfrm1 = function () {
      if (document.frm.id.value == "") {
        alert("아이디를 입력해주세요");
        return false;
      }
    };
    window.addEventListener("contextmenu", function (e) {
      // contextmenu는 마우스 오른쪽 버튼 클릭 이벤트
      e.preventDefault(); // preventDefault 함수로 기본기능을 없앨 수 있다
      alert("오른쪽 버튼을 사용할 수 없습니다");
    });
  </script>
  <form
    action="test.html"
    name="frm"
    method="get"
    onsubmit="return checkfrm1()"
  >
    <!-- 아이디를 입력하지 않았을 때, onsubmit 속성값이 false 가 되어 submit의 전송기능이 없어진다 -->
    아이디 : <input type="text" name="id" id="id" />
    <input type="submit" value="전송" />
    <!-- submit은 전송이 기본이벤트 -->
    <input type="button" value="전송" />
    <!-- button은 기본이벤트가 없다 -->
  </form>
</body>
```

---

### 키보드 이벤트

```js
window.onload = function () {
  document.getElementById("data").onkeypress = function () {
    console.log("keypress");
  }; // id가 "data"인 요소에 키가 눌릴 때마다 keypress를 콘솔에 출력한다
};
```

```js
window.onload = function () {
  document.getElementById("data").onkeypress = function (e) {
    // id가 "data"인 영역에 키보드 입력을 했을 때
    console.log("code ", event.code);
    console.log("key ", event.key);
  }; // 누르는 키의 코드와 키 이름 출력
};
```

---

### 이벤트 버블

- 자식요소의 이벤트가 자식을 포함하고 있는 부모요소에게도 영향을 준다

```js
  <body>
    <script>
      window.onload = function(){
        document.getElementById("div1").onclick = function(){
          console.log("div1 클릭");
        }
        document.getElementById("div2").onclick = function(){
          console.log("div2 클릭");
        }
        document.getElementById("h1").onclick = function(){
          console.log("h1 클릭");
        }
        document.getElementById("p1").onclick = function(){
          console.log("p1 클릭");
        }
      }
    </script>
    <div id="div1">
      <div id="div2">
        <h1 id="h1">
          <p id="p1">클릭영역</p>
        </h1>
      </div>
    </div>
  </body>
  // p1태그의 "클릭영역"을 클릭하면 p1, h1, div2, div1 모두 콘솔에 출력된다
```

```html
<body>
  <script>
    window.onload = function () {
      document.getElementById("div1").onclick = function () {
        console.log("div1 클릭");
      };
      document.getElementById("div2").onclick = function () {
        console.log("div2 클릭");
      };
      document.getElementById("h1").onclick = function () {
        console.log("h1 클릭");
      };
      document.getElementById("p1").onclick = function (e) {
        console.log("p1 클릭");
        if (e.stopPropagation) {
          e.stopPropagation(); // stopPropagation 함수로 이벤트 버블링을 막을 수 있다
        }
      };
    };
  </script>
  <div id="div1">
    <div id="div2">
      <h1 id="h1">
        <p id="p1">클릭영역</p>
      </h1>
    </div>
  </div>
</body>
```
### Javascript 이벤트로 스타일 수정하기

- 요소.style.속성명 = "속성값"

```html
<body>
  <script>
    window.onload = function () {
      let h1 = document.getElementById("h1");
      document.getElementById("btn1").onclick = function () {
        h1.style.border = "1px solid red";
        h1.style.color = "orange";
        h1.style.textAlign = "center";
      };
      document.getElementById("btn2").onclick = function () {
        h1.style.border = "";
        h1.style.color = "";
        h1.style.textAlign = "";
      }; // "" 값을 할당하면 해당 속성이 삭제된다
    };
  </script>
  <input type="button" id="btn1" value="style 추가" />
  <input type="button" id="btn2" value="style 삭제" />
  <br />
  <hr />
  <br />
  <h1 id="h1">Hello Style</h1>
</body>
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <style>
      .t1 {
        border: 1px solid rebeccapurple;
      }
      .t2 {
        color: orange;
      }
    </style>
  </head>
  <script>
    window.onload = function () {
      document.getElementById("btn1").onclick = function () {
        const h1s = document.querySelectorAll("h1");
        console.log(h1s.classList);
      }; //
      document.getElementById("btn2").onclick = function () {
        const h2 = document.querySelector("#h2");
        h2.classList.add("t2"); // t2 클래스를 요소에 추가한다
      };
      document.getElementById("btn3").onclick = function () {
        const h2 = document.querySelector("#h2");
        h2.classList.remove("t2"); // 요소에 있는 t2 클래스를 삭제시킨다
      };
    };
  </script>
  <body>
    <input type="button" id="btn1" value="class 목록" />
    <input type="button" id="btn2" value="class 추가" />
    <input type="button" id="btn3" value="class 제거" />
    <br />
    <hr />
    <br />
    <h1 id="h1" class="t1 t2">Hello Style</h1>
    <!-- 클래스는 위와 같이 두개 중복시켜 적용시킬 수 있다 -->
    <h1 id="h2" class="t1">Hello Style</h1>
    <h1 id="h3" class="t2">Hello Style</h1>
  </body>
</html>
```


---------------
