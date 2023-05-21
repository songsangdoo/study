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

  <small>!! REPL(Read Eval Print Loop) : 한 줄씩 행단위로 실행을 해보는 것으로, 공부를 하거나 에러를 확인할 때 많이 사용한다</small>

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
    let one = 1, two = 2, three;
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

- 템플릿 리터럴 : `(백팃)을 사용하며 안의 문자, 형식을 그대로 보여준다

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
console.log(10 + "10"); 
// 문자와 숫자를 더하는 경우, 숫자가 문자열로 형변환 되어 합쳐진 문자열이 결과로 나온다
```

```js
console.log(10 - "10"); 
// 문자와 숫자를 빼는 경우, 문자열이 숫자로 형변환 되어 뺄셈을 한 숫자가 결과로 나온다
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
console.log(value); // 값을 입력하지 않고 취소를 누르면 null 을 출력한다
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

- 대괄호를 이용한다
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
  // "...배열이름"을 통해 arguments 대신 직접 정한 배열이름을 쓸 수도 있다
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

### javascript에서의 객체 표기법

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


# Http 통신

## 자료

- 종류
  - csv : 엔터키, ','를 구분자로 가지는 데이터 파일

    jsp로 csv파일 출력하기
  ```jsp
  <%@ page language="java" contentType="text/plain; charset=UTF-8"
      pageEncoding="UTF-8" trimDirectiveWhitespaces="false" %>
  <!-- contentType 속성의 'text/plain;charset=UTF-8'은 평문으로 출력한다는 뜻이다 -->
  HTML5 + CSS 입문, 삼국미디어, 유비, 3000원
  Javascript + JQuery 입문, 삼국미디어 , 관우, 32000원
  Node.js 프로그래밍, 삼국미디어, 장비, 22000원
  HTML% 프로그래밍, 삼국미디어, 조조, 50000원
  ```

  - xml : 태그를 직접 만들어 트리모양으로 데이터를 전달한다 
  
    <small> !! https://www.tcpschool.com/xml/xml_basic_syntax 참조</small>

    <small> !! html과 다르게 문법에 엄격하다</small>


  - json

### XML
<small> !! https://www.tcpschool.com/xml/xml_basic_syntax 참조</small>

```xml
  <?xml version="1.0" encoding="utf-8" ?>
  <books>
    <book>
      <name>Html + Css3 입문</name>
      <publisher>삼국미디어</publisher>
      <author>유비</author>
      <price>3000원</price>
    </book>
    <book>
      <name>Javascript 입문</name>
      <publisher>삼국미디어</publisher>
      <author>관우</author>
      <price>32000원</price>
    </book>
  </books>
  ```
  #### jsp 파일로 xml 출력하기
  ```jsp
  <%@ page language="java" contentType="text/xml; charset=UTF-8"
      pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
  <books>
    <book>
      <name>Html + Css3 입문</name>
      <publisher>삼국미디어</publisher>
      <author>유비</author>
      <price>3000원</price>
    </book>
    <book>
      <name>Javascript 입문</name>
      <publisher>삼국미디어</publisher>
      <author>관우</author>
      <price>32000원</price>
    </book>
    <book>
      <name>Node.js 프로그래밍</name>
      <publisher>삼국미디어</publisher>
      <author>장비</author>
      <price>15000원</price>
    </book>
    <book>
      <name>html 프로그래밍</name>
      <publisher>삼국미디어</publisher>
      <author>조조</author>
      <price>50000원</price>
    </book>
  </books>

  ```
  #### 데이터베이스의 데이터를 xml 형식으로 출력하기
  ```jsp
  <%@ page language="java" contentType="text/xml; charset=UTF-8"
      pageEncoding="UTF-8"%>
  <%@page import="java.sql.SQLException"%>
  <%@page import="java.sql.DriverManager"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.Connection"%>
  <%
    String url = "jdbc:mariadb://localhost:3306/project";
    String user = "root";
    String password = "123456";
  
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
  
    StringBuilder sbXml = new StringBuilder();
  
    try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);
  
      String sql = "select * from books";
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
  
      sbXml.append("<books>");
      while(rs.next()){
        sbXml.append("<book>");
        sbXml.append("<name>" + rs.getString("name") + "</name>");
        sbXml.append("<publisher>" + rs.getString("publisher") + "</publisher>");
        sbXml.append("<author>" + rs.getString("author") + "</author>");
        sbXml.append("<price>" + rs.getString("price") + "</price>");
        sbXml.append("</book>");
      }
      sbXml.append("</books>");
    }catch(SQLException e){
      System.out.println("에러 : " + e.getMessage());
    }finally{
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(conn != null) conn.close();
    }
  
    out.println(sbXml);
  %>

  ```
### JSON
- javascript의 객체와 비슷하지만, 키값에 반드시 큰 따옴표를 사용해야하는 것과 값으로 함수를 사용하지 못하는 차이점이 있다 

- 문자열의 형태기 때문에 JSON 문자열이라고 하기도 한다

  <small> !! 키값에 작은 따옴표를 사용하면 JSON이 아니다 </small>

  <small> !! 키값에 공백, '-', '_'를 사용할 수 있다 </small>

  <small> !! 값으로 기본 자료형(숫자, 문자열, 논리형), null, 배열, 객체, 다른 JSON을 사용할 수 있다 </small>

  <small> !! 값으로 문자열을 사용할 때, 반드시 큰 따옴표를 사용해야 한다 </small>

- javascript 객체를 JSON으로 변환시키기
```js
let student = {name : "도레미", major : "컴퓨터 공학"};
let json = JSON.stringify(student);
// student 객체를 JSON으로 변환시켜 json에 할당한다
```

- JSON을 javascript 객체로 변환시키기
```js
let json = {"name" : "백두산", "age" : 30};
let person = JSON.parse(json);
// json JSON을 javascript 객체로 변환시켜 person에 할당한다 
```
#### 문자열 출력으로 JSON 출력하기
```jsp
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  StringBuilder sbJson = new StringBuilder();
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb_book");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from books";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    int totalRecord = 0;
    rs.last();
    totalRecord = rs.getRow();
    rs.beforeFirst();
    
    sbJson.append("[");
    for(int i = 0; i < totalRecord && rs.next(); i++){
      sbJson.append("{");
      sbJson.append("\"name\" : \"" + rs.getString("name") + "\",");
      sbJson.append("\"publisher\" : \"" + rs.getString("publisher") + "\",");
      sbJson.append("\"author\" : \"" + rs.getString("author") + "\",");
      sbJson.append("\"price\" : \"" + rs.getString("price") + "\"");
      sbJson.append("}");
      if(i != totalRecord - 1){
        sbJson.append(",");
      }
    }
    sbJson.append("]");

    /*
    sbJson.append("[");
    while(rs.next()){
      sbJson.append("{");
      sbJson.append("\"name\" : \"" + rs.getString("name") + "\",");
      sbJson.append("\"publisher\" : \"" + rs.getString("publisher") + "\",");
      sbJson.append("\"author\" : \"" + rs.getString("author") + "\",");
      sbJson.append("\"price\" : \"" + rs.getString("price") + "\"");
      sbJson.append("}");
      sbJson.append(",");
    }
    sbJson.append("]");

    sbJson.deleteCharAt(sbJson.lastIndexOf(","));
    */

  } catch(NamingException e){
    System.out.println("에러 :" + e.getMessage());
  } catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  } finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println(sbJson);
%>

```
#### JSON 라이브러리를 사용해 JSON 출력하기

<small> !! java.md 참고</small>

```jsp
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
  JSONArray arr = new JSONArray();
  for(int i = 1 ; i <= 3; i++){
    JSONObject obj = new JSONObject();
    obj.put("name", "책이름" + i);
    obj.put("publisher", "출판사" + i);
    obj.put("author", "저자" + i);
    obj.put("price", "가격" + i);
    
    arr.add(obj);
  }
  out.println(arr);
%>
```
```jsp
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  JSONArray arr = new JSONArray();
  
  try{
    Context initCtx = (Context)new InitialContext();
    Context envCtx = (Context)initCtx.lookup("java:comp/env");
    DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadb_book");
    
    conn = dataSource.getConnection();
    
    String sql = "select * from books";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    int totalRecord = 0;
    rs.last();
    totalRecord = rs.getRow();
    rs.beforeFirst();
    
    for(int i = 0; i < totalRecord && rs.next(); i++){
      JSONObject obj = new JSONObject();
      obj.put("name", rs.getString("name"));
      obj.put("publisher", rs.getString("publisher"));
      obj.put("author", rs.getString("author"));
      obj.put("price", rs.getString("price"));
      
      arr.add(obj);
    }
    
  } catch(NamingException e){
    System.out.println("에러 :" + e.getMessage());
  } catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  } finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println(arr);
%>
```
## AJAX (Asynchronous Javascript And XML)

- 전통적인 http통신 : MPA 기법으로 여러개의 html로 구성된다

  <img src="https://poiemaweb.com/img/traditional-webpage-lifecycle.png" width=500>

- AJAX : SPA 기법으로 한개의 html로 구성된다 (요청마다 문서 전체를 불러오는 것이 아닌 일부의 데이터만 가져와서 현재 페이지를 다시 구성한다)

  <img src="https://poiemaweb.com/img/ajax-webpage-lifecycle.png" width=500>

  <small>!! MPA (Multi Page Application) : 브라우저에서 요청하면 서버에서 요청에 해당되는 html 문서를 보내주는 웹앱 기법</small>

  <small>!! SPA (Single Page Application) : 전통적인 방식과 달리 서버에서 하는 대부분의 작업을 브라우저에서 처리하는 웹앱 기법</small>

- AJAX를 이용해 데이터 요청하기
  
  <small> !! AJAX를 이용해 데이터를 요청한 것은 브라우저에 출력되지 않기 때문에 개발자 도구에 들어가 봐야한다</small>

```jsp
<!-- csv1.jsp -->
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="false" %>
<%
  System.out.println("csv1.jsp 출력");
%>
HTML5 + CSS 입문, 삼국미디어, 유비, 3000원
Javascript + JQuery 입문, 삼국미디어 , 관우, 32000원
Node.js 프로그래밍, 삼국미디어, 장비, 22000원
HTML% 프로그래밍, 삼국미디어, 조조, 50000원

<!-- ajax.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn1").onclick = function() {
      const request = new XMLHttpRequest();
      request.open('get', 'csv1.jsp', false);
      // false는 동기식 데이터 처리, true는 비동기처리를 의미한다 
      request.send();
      
      console.log(request.responseText);
      // 동기식 데이터 처리이기 때문에 콘솔에서 데이터 확인이 가능하다
    };
  };
</script>
</head>
<body>
<button id="btn1">요청하기</button>
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
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn1").onclick = function() {
      const request = new XMLHttpRequest();
      request.open('get', 'csv1.jsp', true);
      request.send();
      
      console.log(request.responseText);
      // 비동기식 데이터 처리는 스레드를 이용하기 때문에 처음 눌렀을 때는 콘솔에서 데이터 내용을 확인할 수 없다
    };
    
    document.getElementById("btn2").onclick = function() {
      const request = new XMLHttpRequest();
      
      console.log('1');
      request.onreadystatechange = function() {
        if(request.readyState == 4){ // 요청한 데이터를 받은 상태
          if(request.status == 200){ // 서버에서 데이터를 받는 것을 성공했을 때
            console.log('2');
            console.log(request.responseText);
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'csv1.jsp', true);
      request.send();
      console.log('3');
      // 콘솔에 출력되는 순서는 1 -> 3 -> 2
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn1">요청하기1</button>
<button id="btn2">요청하기2</button>
</body>
</html>
```
<hr>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn").onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            document.getElementById("ta").value = request.responseText;						
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'csv1.jsp', true);
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<textarea id="ta" rows="4" cols="100"></textarea>
</body>
</html>

```
### csv 데이터 가져오기 
- csv 파일은 엔터키, 쉼표를 기준으로 구분한다

- responseText를 이용해 데이터를 가져온다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn").onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            const data = request.responseText.trim();
            const rowdatas = data.split('\n');
            
            let result = '<table bordeor="1">';
            for(let i = 0; i < rowdatas.length; i++){
              let coldatas = rowdatas[i].split(',');
              result += '<tr>';
              result += '<td>' + coldatas[0] + '</td>';
              result += '<td>' + coldatas[1] + '</td>';
              result += '<td>' + coldatas[2] + '</td>';
              result += '<td>' + coldatas[3] + '</td>';
              result += '</tr>';
            }
            result += '</table>';
            
            document.getElementById('result').innerHTML = result;
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'csv1.jsp', true);
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>

```
### xml 데이터 가져오기
- responseXML을 이용해 데이터를 가져온다
```jsp
<!-- xml2.jsp -->
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
  String url = "jdbc:mariadb://localhost:3306/project";
  String user = "root";
  String password = "123456";
  
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  StringBuilder sbXml = new StringBuilder();
  
  try{
    Class.forName("org.mariadb.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
    
    String sql = "select * from books";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    sbXml.append("<books>");
    while(rs.next()){
      sbXml.append("<book>");
      sbXml.append("<name>" + rs.getString("name") + "</name>");
      sbXml.append("<publisher>" + rs.getString("publisher") + "</publisher>");
      sbXml.append("<author>" + rs.getString("author") + "</author>");
      sbXml.append("<price>" + rs.getString("price") + "</price>");
      sbXml.append("</book>");
    }
    sbXml.append("</books>");
  }catch(SQLException e){
    System.out.println("에러 : " + e.getMessage());
  }finally{
    if(rs != null) rs.close();
    if(pstmt != null) pstmt.close();
    if(conn != null) conn.close();
  }
  
  out.println(sbXml);
%>

<!-- ajax02.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn").onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            const xmlData = request.responseXML;
            
            const names = xmlData.getElementsByTagName('name');
            const publishers = xmlData.getElementsByTagName('publisher');
            const authors = xmlData.getElementsByTagName('author');
            const prices = xmlData.getElementsByTagName('price');
            
            let result = '<table border="1">'; 
            for(let i = 0; i < names.length; i++){
              result += '<tr>';
              result += '<td>' + names[i].innerHTML + '</td>';
              result += '<td>' + publishers[i].innerHTML + '</td>';
              result += '<td>' + authors[i].innerHTML + '</td>';
              result += '<td>' + prices[i].innerHTML + '</td>';
              result += '</tr>';
            }
            result += '</table>';
            
            document.getElementById('result').innerHTML = result;
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'xml2.jsp', true);
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>

```
<hr>

kobis에서 제공하는 데이터로 주간 영화 순위 출력하기

<small>!! https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do</small>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn").onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            const xmlData = request.responseXML;
            
            const rankes = xmlData.getElementsByTagName('rank');
            const movieNms = xmlData.getElementsByTagName('movieNm');
            const openDts = xmlData.getElementsByTagName('openDt');
            
            let result = '<table border="1">';
            result += '<tr>';
            result += '<th>순위</th>';
            result += '<th>영화이름</th>';
            result += '<th>개봉일자</th>';
            result += '</tr>';
            for(let i = 0; i < rankes.length; i++){
              result += '<tr>';
              result += '<td>' + rankes[i].innerHTML + '</td>'
              result += '<td>' + movieNms[i].innerHTML + '</td>'
              result += '<td>' + openDts[i].innerHTML + '</td>'
              result += '</tr>';
            }
            result += '</table>';
            
            document.getElementById('result').innerHTML = result;
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101', true);
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
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
<script type="text/javascript">
  window.onload = function() {
    document.getElementById("btn").onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            const xmlData = request.responseXML;
            
            const weeklyBoxOffices = xmlData.getElementsByTagName('weeklyBoxOffice');
            for(let i = 0; i < weeklyBoxOffices.length; i++){
              for(let j = 0; j < weeklyBoxOffices[i].childNodes.length; j++){
                console.log(weeklyBoxOffices[i].childNodes[j].nodeName + " : " + weeklyBoxOffices[i].childNodes[j].innerHTML);	
              }
            }
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101', true);
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>

```
<hr>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const request = new XMLHttpRequest();
      
      request.open('get', 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101' , false)
      request.send();
      
      const datas = request.responseText.trim();
      const jsonData = JSON.parse(datas).boxOfficeResult.weeklyBoxOfficeList;
      console.log(jsonData);
      let result = '<table border="1">';
      for(let i = 0; i < jsonData.length; i++){
        result += '<tr>';
        result += '<td>' + jsonData[i].rank + '</td>';
        result += '<td>' + jsonData[i].movieNm + '</td>';
        result += '<td>' + jsonData[i].openDt + '</td>';
        result += '</tr>';
      }
      result += '</table>';
      
      document.getElementById('result').innerHTML = result;
    };
  };
</script>
</head>
<body>
<button id='btn'>요청하기</button>
<div id='result'></div>
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
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){ 
          if(request.status == 200){ 
            const datas = request.responseText.trim();
            const jsonData = JSON.parse(datas).boxOfficeResult.weeklyBoxOfficeList;
            let result = '<table border="1">';
            for(let i = 0; i < jsonData.length; i++){
              result += '<tr>';
              result += '<td>' + jsonData[i].rank + '</td>';
              result += '<td>' + jsonData[i].movieNm + '</td>';
              result += '<td>' + jsonData[i].openDt + '</td>';
              result += '</tr>';
            }
            result += '</table>';
            
            document.getElementById('result').innerHTML = result;
          }else{
            alert('페이지 오류');
          }
        }
      };
      request.open('get', 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101' , false)
      request.send();
      
      console.log(request.responseText);
    };
  };
</script>
</head>
<body>
<button id='btn'>요청하기</button>
<div id='result'></div>
</body>
</html>
```
우편번호 검색기
```java
// ZipcodeTO.java
package model1;

public class ZipcodeTO {
  private String zipcode;
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;
  
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getSido() {
    return sido;
  }
  public void setSido(String sido) {
    this.sido = sido;
  }
  public String getGugun() {
    return gugun;
  }
  public void setGugun(String gugun) {
    this.gugun = gugun;
  }
  public String getDong() {
    return dong;
  }
  public void setDong(String dong) {
    this.dong = dong;
  }
  public String getRi() {
    return ri;
  }
  public void setRi(String ri) {
    this.ri = ri;
  }
  public String getBunji() {
    return bunji;
  }
  public void setBunji(String bunji) {
    this.bunji = bunji;
  }
  
}

// ZipcodeDAO.java
package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ZipcodeDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public ZipcodeDAO() {
    try {
      Context initCtx = (Context)new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadbProject");
      
      conn = dataSource.getConnection();
    } catch (NamingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<ZipcodeTO> zipcodeList(String strDong){
    List<ZipcodeTO> lists = new ArrayList<>();
    
    String sql = "select * from zipcode where dong like ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, strDong + "%");
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        ZipcodeTO data = new ZipcodeTO();
        
        data.setZipcode(rs.getString("zipcode"));
        data.setSido(rs.getString("Sido"));
        data.setGugun(rs.getString("gugun"));
        data.setDong(rs.getString("dong"));
        data.setRi(rs.getString("ri"));
        data.setBunji(rs.getString("bunji"));
        
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
}
```

```jsp
<!-- data_xml.jsp -->
<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
  request.setCharacterEncoding("utf-8");


  String strDong = request.getParameter("strDong");
  
  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> lists = dao.zipcodeList(strDong);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<addresses>");
  for(ZipcodeTO data : lists){
    sbXml.append("<address>");
    sbXml.append("<zipcode>" + data.getZipcode() + "</zipcode>");
    sbXml.append("<sido>" + data.getSido() + "</sido>");
    sbXml.append("<gugun>" + data.getGugun() + "</gugun>");
    sbXml.append("<dong>" + data.getDong() + "</dong>");
    sbXml.append("<ri>" + data.getRi() + "</ri>");
    sbXml.append("<bunji>" + data.getBunji() + "</bunji>");
    sbXml.append("</address>");
  }
  sbXml.append("</addresses>");
%>
<%= sbXml %>

<!-- zipcode.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const strDong = document.getElementById('dong').value.trim();
      
      if(strDong.length < 2){
        alert('2자 이상 입력하세요');
      }else{
        const request = new XMLHttpRequest();
        
        request.onreadystatechange = function() {
          if(request.readyState == 4){
            if(request.status == 200){
              
              const result = showDatas(request.responseXML);

              document.getElementById('result').innerHTML = result;
            }
          }
        };
        
        let url = './data/data_xml.jsp?strDong=' + strDong;
        request.open('get', url, true);
        request.send();
          
      }
    };
    
    const showDatas = function(xmlData) {
      
      const zipcodes = xmlData.getElementsByTagName("zipcode");
      const sidos = xmlData.getElementsByTagName("sido");
      const guguns = xmlData.getElementsByTagName("gugun");
      const dongs = xmlData.getElementsByTagName("dong");
      const ris = xmlData.getElementsByTagName("ri");
      const bunjis = xmlData.getElementsByTagName("bunji");
      
      let result = "<table border='1'>";
      for(let i = 0; i < zipcodes.length; i++){
        result += "<tr>";
        result += "<td>" + zipcodes[i].innerHTML + "</td>"
        result += "<td>" + sidos[i].innerHTML + "</td>"
        result += "<td>" + guguns[i].innerHTML + "</td>"
        result += "<td>" + dongs[i].innerHTML + "</td>"
        result += "<td>" + ris[i].innerHTML + "</td>"
        result += "<td>" + bunjis[i].innerHTML + "</td>"
        result += "</tr>";
      }
      result += "</table>";
      
      return result;
    }
  };
</script>
</head>
<body>
<input type="text" id="dong"> <button id="btn">동이름 검색</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
```
```jsp
<!-- data_json.jsp -->
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeTO"%>
<%@page import="model1.ZipcodeDAO"%>
<%
  request.setCharacterEncoding("utf-8");

  String strDong = request.getParameter("strDong");
  
  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> lists = dao.zipcodeList(strDong);
  
  JSONArray arr = new JSONArray();
  
  for(ZipcodeTO data : lists){
    JSONObject obj = new JSONObject();
    obj.put("zipcode", data.getZipcode());
    obj.put("sido", data.getSido());
    obj.put("gugun", data.getGugun());
    obj.put("dong", data.getDong());
    obj.put("ri", data.getRi());
    obj.put("bunji", data.getBunji());
    
    arr.add(obj);
  }
%>
<%= arr %>

<!-- zipcode2.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const strDong = document.getElementById('dong').value.trim();
      
      if(strDong.length < 2){
        alert('2자 이상 입력하세요');
      }else{
        const request = new XMLHttpRequest();
        
        request.onreadystatechange = function() {
          if(request.readyState == 4){
            if(request.status == 200){
              
              const result = showDatas(request.responseText.trim());

              document.getElementById('result').innerHTML = result;
            }
          }else{
            alert('데이터 로딩 실패');
          }
        };
        
        let url = './data/data_json.jsp?strDong=' + strDong;
        request.open('get', url, true);
        request.send();
          
      }
    };
    
    const showDatas = function(jsonData) {
      const datas = JSON.parse(jsonData);
      
      let result = "<table border='1'>";
      for(let i = 0; i < datas.length; i++){
        result += "<tr>";
        result += "<td>" + datas[i].zipcode + "</td>"
        result += "<td>" + datas[i].sido + "</td>"
        result += "<td>" + datas[i].gugun+ "</td>"
        result += "<td>" + datas[i].dong+ "</td>"
        result += "<td>" + datas[i].ri+ "</td>"
        result += "<td>" + datas[i].bunji+ "</td>"
        result += "</tr>";
      }
      result += "</table>";
      
      return result;
    }
  };
</script>
</head>
<body>
<input type="text" id="dong"> <button id="btn">동이름 검색</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
```

### 크로스 도메인(CORS)

<small> !! https://eunplay.tistory.com/205 참조</small>

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){
          if(request.status == 200){
            alert('정상');
          }else {
            alert('페이지 처리 에러');
          }
        }
      };
      
       request.open('get', './data/xml.jsp', true);
      // request.open('get', 'http://localhost:8080/Ajax02/data/xml.jsp', true);
      
      // request.open('get', 'http://192.168.0.7:8080/Ajax02/data/xml.jsp', true);
      // http://localhost:8080/Ajax02/ajax01.jsp url에서 위의 코드를 이용해 xml.jsp 파일을 불러오면 페이지 처리 에러 알림이 나온다
      // 대신 http://192.168.0.7:8080/Ajax02/ajax01.jsp url로 xml.jsp 파일을 불러오면 정상 알림이 나온다
      // 크로스도메인(CORS)
      
      // request.open('get', 'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101', true);
      // 정상 알림이 나온다
      // http://kobis.or.kr은 외부 아이피에서의 데이터 접근을 허용했기 때문에 크로스도메인으로 인한 에러가 생기지 않는다
      
      // request.open('get', 'http://rss.etnews.com./02.xml', true);
      // 페이지 처리 에러 알림이 나온다
      // 대부분 나머지 웹사이트는 디폴트로 데이터 접근을 허용하지 않는다
      
      request.send();
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
```

#### 크로스 도메인 해결 방법
- jstl의 import 구문을 사용한다

  <small> !! 내 아이피로 경유지를 만든다고 생각하자</small>
```jsp
<!-- /proxy/xml.jsp -->
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import var="xmldata" url="http://192.168.0.7:8080/Ajax02/data/xml.jsp"></c:import>
${ xmldata }
<!-- 외부에 있는 xml 데이터를 불러다가 출력한다 -->

<!-- ajax02.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){
          if(request.status == 200){
            alert('정상');
          }else {
            alert('페이지 처리 에러');
          }
        }
      };
      
      request.open('get', './proxy/xml.jsp', true);
      request.send();
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
```
```jsp
<!-- /proxy/json.jsp -->
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import var="jsondata" url="http://192.168.0.7:8080/Ajax02/data/json.jsp"></c:import>
${ jsondata }
<!-- 원격에 있는 json 데이터를 불러다가 출력한다 -->

<!-- ajax03.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  window.onload = function() {
    document.getElementById('btn').onclick = function() {
      const request = new XMLHttpRequest();
      
      request.onreadystatechange = function() {
        if(request.readyState == 4){
          if(request.status == 200){
            alert('정상');
          }else {
            alert('페이지 처리 에러');
          }
        }
      };
      
      request.open('get', './proxy/json.jsp', true);
      request.send();
    };
  };
</script>
</head>
<body>
<button id="btn">요청하기</button>
<br><hr><br>
<div id="result"></div>
</body>
</html>
```

## jQuery

<small> !! https://jquery.com/ 참조</small>

<small> !! https://www.w3schools.com/jquery/ 참조</small>

- HTML(DOM)에 대한 접근을 편하게 하기 위해서 만든 javascript로 만든 javascript 라이브러리

-  'https://jquery.com/' 에서 jquery 라이브러리를 다운받을 때, 압축 버전과 압축 해제 버전이 있는데, 서비스를 제공할 때는 압축 버전을 사용하고 개발할 때는 직관적으로 알아보기 쉬운 압축 해제 버전을 사용한다

### jQuery 기본
- $가 있으면 jQuery로 해석한다

- jQuery를 여러개 사용해도 상관없지만, 보통 한개만 사용해서 복잡하지 않게 한다

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript">
  $(document).ready(function(){ // jQuery 시작
    console.log('Hello jQuery1');
  });
  $(document).ready(function(){
    console.log('Hello jQuery2');
  });
</script>
</head>
<body>
Hello jQuery !!
<script type="text/javascript">
  $(document).ready(function(){
    console.log('Hello jQuery3');
  });	
</script>
</body>
</html>
```
- 특정 기업에서 제공하는 CDN 라이브러리를 통해 라이브러리를 따로 다운받지 않더라도 jQuery를 사용할 수 있다

  <small>!! CDN (Content Delivery Network) :
웹사이트의 접속자가 콘텐츠를 다운로드할 때 자동으로 가장 가까운 서버에서 다운로드할 수 있도록 하는 기술 </small>
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="./js/jquery-3.7.0.js"></script> -->
<!-- 개발 버전 -->
<!-- <script type="text/javascript" src="./js/jquery-3.7.0.min.js"></script> -->
<!-- 서비스 버전 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- 구글에서 제공하는 CDN 라이브러리 -->
<script type="text/javascript">
  $(document).ready(function(){
    console.log('Hello jQuery1');
  });
</script>
</head>
<body>
Hello jQuery !!
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    console.log('Hello jQuery1');
  });
  
  jQuery(document).ready(function(){
    console.log('Hello jQuery2');
  });
  
  $(function(){
    console.log('Hello jQuery3');
  });
  
  $(() => {
    console.log('Hello jQuery4');
  });
  // 모두 같은 표현이다
</script>
</head>
<body>
Hello jQuery !!
</body>
</html>
```
### jQuery API

- css에서 사용하는 selector를 이용해서 html문서에 접근한다

- API는 https://api.jquery.com/ 를 참조하는 게 가장 정확하다

#### css()
- html 문서의 특정 요소에 css 효과를 준다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    // $('*').css('color', 'red');
    // 전체 선택자를 이용해 모든 태그에 css 효과를 준다
    // 개발자 도구에서 효과를 받은 태그 확인해보기
    $('*').css({
      color : 'blue'
    });
  });
  
</script>
</head>
<body>
<h2>Header1</h2>
<h3>Header2</h3>
<h2>Header3</h2>
<h3>Header4</h3>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('h2').css('color', 'red');
    $('h3').css('color', 'blue');
    
    // $('h' + '3').css('color', 'blue');
    // 선택자를 문자열로 쓰기 때문에 이렇게 써도 상관없다

    // const selector = 'hr';
    // const val = 'blue';
    // $(selector).css('color', val);
    // 이렇게 따로 변수를 지정하고 사용할 수도 있다
    
    // $('h2, h3').css('color', 'green');
    // ','를 이용해 여러개의 태그에 한번에 css 효과를 줄 수 있다
  });
</script>
</head>
<body>
<h2>Header1</h2>
<h3>Header2</h3>
<h2>Header3</h2>
<h3>Header4</h3>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('#i1, #i3').css('color', 'red');
    $('#i2, #i4').css('color', 'blue');
  });
</script>
</head>
<body>
<h2 id="i1">Header1</h2>
<h3 id="i2">Header2</h3>
<h2 id="i3">Header3</h2>
<h3 id="i4">Header4</h3>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('.c1').css('color', 'red');
    
    $('h2.c2').css('color', 'blue');
    // h2 태그 중 c2 클래스인 것에 css 효과를 준다
    $('.c1.c2').css('color', 'green');
    // c1, c2 클래스가 같이 지정된 태그에 css 효과를 준다
  });
</script>
</head>
<body>
<h2 class="c1">Header1</h2>
<h3 class="c1 c2">Header2</h3>
<h2 class="c2">Header3</h2>
<h3 class="c2">Header4</h3>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('div > *').css('color', 'red');
    // 자손인 ul 태그에만 css 효과가 적용되는 것을 확인
    
    // $('div *').css('color', 'red');
    // 후손인 ul, li 태그 모두 css 효과가 적용되는 것을 확인
  });
</script>
</head>
<body>
<div>
  <ul>
    <li>사과</li>
    <li>수박</li>
    <li>참외</li>
  </ul>
  <ul>
    <li>사과</li>
    <li>수박</li>
    <li>참외</li>
  </ul>
</div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('input[type="text"]').css('background-color', 'yellow');
    $('input[data="text2"]').css('background-color', 'blue');
    // 특정 속성을 가진 태그에 css 효과를 줄 수 있다
    
    // $('input[data^="te"]').css('background-color', 'red');
    // data 속성의 값이 "te"로 시작하는 태그에 css효과를 준다
  });
</script>
</head>
<body>
<input type="text" data="text1"><br><br>
<input type="password" data="text2"><br><br>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('table').css('width', '800');
    
    document.getElementById('btn1').onclick = function() {
       $('tr:odd').css('background-color', 'blue');
      // $('tr:nth-child(2n + 1)').css('background-color', 'blue');
      // 홀수 행에 css 효과를 준다
       $('tr:even').css('background-color', 'yellow');
      // $('tr:nth-child(2n)').css('background-color', 'blue');
      // 0을 포함한 짝수 행에 css 효과를 준다
      // 행의 인덱스는 0부터 시작한다
      
      // $('tr:first').css('background-color', 'red');
      // $('tr:eq(0)').css('background-color', 'red');
      // tr 태그중 첫번째 태그에만 css 효과를 준다
      
    };
    
    document.getElementById('btn2').onclick = function() {
      $('tr:odd').css('background-color', 'white');
      $('tr:even').css('background-color', 'white');
    };
  });
</script>
</head>
<body>

<button id="btn1">색상변경</button>
<button id="btn2">원상복귀</button>

<table>
  <tr>
    <th>이름</th>
    <th>혈액형</th>
    <th>지역</th>
  </tr>
  <tr>
    <th>tester</th>
    <th>a</th>
    <th>서울</th>
  </tr>
  <tr>
    <th>tester2</th>
    <th>b</th>
    <th>경기</th>
  </tr>
  <tr>
    <th>tester3</th>
    <th>o</th>
    <th>부산</th>
  </tr>
  <tr>
    <th>tester4</th>
    <th>ab</th>
    <th>제주</th>
  </tr>
  <tr>
    <th>tester5</th>
    <th>a</th>
    <th>강원</th>
  </tr>
</table>
</body>
</html>
```
##### eq(), first(), last()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('table').css('width', '800');
    $('tr').eq(0).css('color', 'blue');
    // eq로 특정 태그 중 특정 인덱스를 지정해 css 효과를 줄 수 있다 
    // $('tr').eq(-1).css('color', 'blue';)
    // 마지막 인덱스에 css 효과를 준다
    
    // $('tr').first().css('color','blue');
    // tr 태그 중 첫번째 태그에만 css 효과를 준다
    // $('tr').last().css('color','red');
    // tr 태그 중 마지막 태그에만 css 효과를 준다
  });
</script>
</head>
<body>

<table>
  <tr>
    <th>이름</th>
    <th>혈액형</th>
    <th>지역</th>
  </tr>
  <tr>
    <th>tester</th>
    <th>a</th>
    <th>서울</th>
  </tr>
  <tr>
    <th>tester2</th>
    <th>b</th>
    <th>경기</th>
  </tr>
  <tr>
    <th>tester3</th>
    <th>o</th>
    <th>부산</th>
  </tr>
  <tr>
    <th>tester4</th>
    <th>ab</th>
    <th>제주</th>
  </tr>
  <tr>
    <th>tester5</th>
    <th>a</th>
    <th>강원</th>
  </tr>
</table>
</body>
</html>
```
##### parent(), children(), prev(), next(), sibling()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('#l1').css('color', 'red');
    // $('#l1').parent().css('color', 'blue');
    
    // $('#d1').children().css('color', 'green');
    // $('#d1').children('ol').css('color', 'blue');
    
    // $('#d1').prev().css('color', 'yellow');
    // $('#d1').next().css('color', 'yellow');
    
  });
</script>
</head>
<body>
<div>
  <div>내용1</div>
  <div>내용2</div>
  <div id="d1">
    <ul>
      <li id="l1">사과</li>
      <li>참외</li>
      <li>딸기</li>
    </ul>
    <ol>
      <li id="l2">사과</li>
      <li>참외</li>
      <li>딸기</li>
    </ol>
  </div>
  <div>내용4</div>
</div>
</body>
</html>
```
#### val()
- html 문서의 특정 요소의 value 속성의 값을 가져오거나 값을 설정한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('input[data="text1"]').val('Hello jQuery');
    // 특정 속성의 값을 가진 input 태그의 value 속성 값을 설정한다
  });
</script>
</head>
<body>
<input type="text" data="text1"><br><br>
<input type="password" data="text2"><br><br>
</body>
</html>
```

#### 배열 관련 메서드
##### each()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    const arr = [
      {name : 'daum', link : 'https://www.daum.net'},
      {name : 'naver', link : 'https://www.naver.com'},
      {name : 'google', link : 'https://www.google.com'}
    ];
    
    for(let i = 0; i < arr.length; i++){
      console.log(arr[i].name);
      console.log(arr[i].link);
    }
    
    for(let i = 0; i < arr.length; i++){
      for(key in arr[i]){
        console.log(key, ':', arr[i][key]);
      }
    }
      
    arr.forEach(function (item) {
      console.log(item.name, ':', item.link)
    });
    
    $.each(arr, function(index, item) {
      console.log(index, '.', item.name, ':', item.link);
    })
  });
</script>
</head>
<body>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    const arr = [
      {name : 'daum', link : 'https://www.daum.net'},
      {name : 'naver', link : 'https://www.naver.com'},
      {name : 'google', link : 'https://www.google.com'}
    ];
    
    let output = '';
    $.each(arr, function(index, item){
      output += '<a href="' + item.link + '">';
      output += '<div>' + item.name + '</div>';
      output += '</a>';
    });
    
    document.body.innerHTML = output;
  });
</script>
</head>
<body>

</body>
</html>
```
- 객체에 정의된 키값과 그 값을 이용하기 위해 사용할 수도 있다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    const obj = {name : 'daum', link : 'https://www.daum.net'};
    
    let output = '';
    $.each(obj, function(key, value){
      console.log(key, ':', value);
    });
  });
</script>
</head>
<body>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('h1').each(function(index, item){
      console.log(index, ':', item);
      
      console.log(item.innerHTML);
      // console.log(this.innerHTML);
      // 위의 코드와 같이 데이터만 출력한다
      
      // this.innerHTML = 'New Text : ' + index;
      // 태그 안의 데이터 내용을 바꿀 수도 있다
      // 데이터 내용 바꾸는 것은 map()을 이용할 수도 있다
    });
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h1>Header2</h1>
<h1>Header3</h1>
<h1>Header4</h1>
<h1>Header5</h1>
</body>
</html>
```
##### filter()
- 선택된 요소들 중 어떤 조건을 만족하는 요소를 선택한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    // $('h1:even').css('color', 'red');
    $('h1').filter(':even').css('color', 'red');
    // 위의 코드를 이렇게 쓰는 것도 가능하다
    
    $('h1').filter(':odd').css({
      color : 'blue',
      backgroundColor : 'yellow'
    });
    // css()에 '{}'를 사용해서 여러개의 css 효과를 줄 수 있다

    // $('h1:nth-child(2n+1)').css('color', 'yellow');
    $('h1').filter(':nth-child(2n+1)').css('color', 'yellow');
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h1>Header2</h1>
<h1>Header3</h1>
<h1>Header4</h1>
<h1>Header5</h1>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    const h1 = $('h1'); 
    console.log(h1);
    // 해당되는 태그가 배열의 형태로 출력된다
    // html collection
    
    h1.filter(':even').css('color', 'green');
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h1>Header2</h1>
<h1>Header3</h1>
<h1>Header4</h1>
<h1>Header5</h1>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('h1').filter(function(index) {
      return index % 2 == 0;
      // filter의 내용을 직접 만들 수 있다
    }).css('color', 'blue'); // true를 반환하는 짝수인 인덱스에만 css 효과를 준다
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h1>Header2</h1>
<h1>Header3</h1>
<h1>Header4</h1>
<h1>Header5</h1>
</body>
</html>
```
###### end()
- 선택된 요소에 filter로 조건을 준 것을 취소시킨다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('h1').css('background-color', 'orange');
    $('h1').filter(':even').css('color', 'red');
    $('h1').filter(':odd').css('color', 'white');

    $('h1').css('background-color', 'orange')
      .filter(':even').css('color', 'red')
      .end()
      .filter(':odd').css('color', 'white')
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h1>Header2</h1>
<h1>Header3</h1>
<h1>Header4</h1>
<h1>Header5</h1>
</body>
</html>
```
###### add()
- 선택된 요소 이외의 새로운 요소를 선택해 각각 작업을 할 수 있게 한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    // $('h1').css('background-color', 'orange');
    // $('h1, h2').css('color', 'red');
    $('h1').css('background-color', 'orange').add('h2').css('color', 'red');
  });
</script>
</head>
<body>
<h1>Header1</h1>
<h2>Header2</h2>
<h1>Header3</h1>
<h2>Header4</h2>
<h1>Header5</h1>
</body>
</html>
```
##### find()
- filter()와 달리 선택한 요소가 아닌 그 하위 요소 중 조건을 만족하는 요소를 선택할 때 사용한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    console.log($(document).find('h2'));
    
    $(document).find('h2').each(function(index, item) {
      console.log(index, ':', item.innerHTML)
      // console.log(index, ':', this.innerHTML)
    });
    
    $(document).find('.c').each(function() {
      console.log(index, ':', this.innerHTML);
    });
  });
</script>
</head>
<body>
<h2 class="c">Header1</h2>
<h2>Header2</h2>
<h2 class="c">Header3</h2>
<h2>Header4</h2>
<h2 class="c">Header5</h2>
</body>
</html>
```
##### parseXML()
- 문자열을 xml 데이터로 구문 분석해서 반환한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  const xml = `<friends>
    <friend>
      <name>tester1</name>
      <language>javascript</language>
    </friend>
    <friend>
      <name>tester2</name>
      <language>java</language>
    </friend>
    <friend>
      <name>tester3</name>
      <language>html</language>
    </friend>
    </friends>`

  $(document).ready(function(){
    console.log(typeof xml);
    
    const xmlDoc = $.parseXML(xml);
    console.log(typeof xmlDoc);
    
    $(xmlDoc).find('friend').each(function(index, item) {
      console.log(index);
      console.log(item.innerHTML);
      console.log($(item).find('name')[0].innerHTML);
      console.log($(item).find('language')[0].innerHTML);
    });
  });
</script>
</head>
<body>
</body>
</html>
```
##### is()
- 특정 요소가 존재하는지 확인해서 true, false를 반환한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('h2').each(function() {
      if($(this).is('.c')){ 
        $(this).css('color', 'orange');
      }
    });
  });
</script>
</head>
<body>
<h2 class="c">Header1</h2>
<h2>Header2</h2>
<h2 class="c">Header3</h2>
<h2>Header4</h2>
<h2 class="c">Header5</h2>
</body>
</html>
```
##### extend()
- 동적으로 선택한 객체에 프로퍼티를 추가시킨다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    let obj = {name : '홍길동'};
    console.log(obj);
    
    obj.region1 = '서울시 종로구';
    obj.part1 = '리더';
    // 기존 javascript 방식을 이용해 동적으로 프로퍼티 추가
    console.log(obj);
    
    $.extend(obj, {region2 : '서울시 강남구', part2 : '베이스'},
        {region3 : '서울시 서초구', part3 : '세컨드'});
    // 객체에 대한 확장이 가능하다
  });
</script>
</head>
<body>

</body>
</html>
```
##### $.noConflict()
- '\$' 사용으로 충돌이 생길 수 있는 상황을 막기 위해 jQuery를 이용하기 위한 '$'를 사용하면 에러가 생기게 한다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $.noConflict();

  const J = jQuery;
  
  // $(document).ready(function(){
  // 에러가 생긴다

  J(document).ready(function(){
  // jQuery(document).ready(function(){
    let obj = {name : '홍길동'};
    
    J.extend(obj, {region2 : '서울시 강남구', part2 : '베이스'},
        {region3 : '서울시 서초구', part3 : '세컨드'}
    );
  });
</script>
</head>
<body>
</body>
</html>
```
##### html(), text()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('btn1').onclick = function() {
      const html = document.getElementById('result');
      console.log(html.innerHTML);
      console.log(html.textContent);
      // 기존의 javascript 방식		
      
      console.log($('#result').html());
      console.log($('#result').text());
      // jQuery 방식
    };
    
    document.getElementById('btn2').onclick = function() {
      // const html = document.getElementById('result');
      // html.innerHTML = '<i>새로운 결과</i>';
      // html.textContent = '<i>새로운 결과</i>';
      
      // $('#result').html('<i>새로운 결과</i>');
      $('#result').text('<i>새로운 결과</i>');
    };
  });
</script>
</head>
<body>

<button id="btn1">내용 확인</button>
<button id="btn2">내용 수정</button>
<br><hr><br>
<div id="result"><b>출력내용</b></div>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('btn1').onclick = function() {
      $('div').html(function(index) {
        return '<i>새로운 결과' + index + '</i>';
      });
    };
  });
</script>
</head>
<body>

<button id="btn1">내용 확인</button>
<br><hr><br>
<div><b>출력내용1</b></div>
<div><b>출력내용2</b></div>
<div><b>출력내용3</b></div>
</body>
</html>
```
jQuery로 구구단 출력하기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    document.getElementById('btn').onclick = function() {
      const startDan = $('#startDan').val();
      const endDan = $('#endDan').val();
      
      let result = '<table border="1">';
      for(let i = startDan; i <= endDan; i++){
        result += '<tr>';
        result += '<td>' + i + '단</td>';
        for(let j = 1; j <= 9; j++){
          result += '<td>' + i + ' X ' + j + ' = ' + (i * j) + '</td>'; 
        }
        result += '</tr>';
      }
      result += '</table>';
      
      $('#result').html(result);
    };
  });
</script>
</head>
<body>
시작단 <input type="text" id="startDan">
~
끝단 <input type="text" id="endDan">
<button id="btn">구구단 출력</button>

<br><hr><br>
<div id="result"></div>
</body>
</html>
```
##### empty(), remove()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('btn1').onclick = function() {
      $('#d').html('');
    };
    
    document.getElementById('btn2').onclick = function() {
      $('#d').empty();
      // empty()는 태그 안의 내용만 삭제시킨다
    };
    
    document.getElementById('btn3').onclick = function() {
      $('#d').remove();
      // remove()는 태그 자체를 삭제시킨다
    };
    
    document.getElementById('btn4').onclick = function() {
      $('p').first().remove();
      // p 태그 중 첫번째 태그만 삭제
    };
  });
</script>
</head>
<body>
<button id="btn1">내용 삭제</button>
<button id="btn2">내용 삭제</button>
<button id="btn3">내용 삭제</button>
<button id="btn4">내용 삭제</button>
<br><hr><br>
<div id="d">
  <p>내용 1</p>
  <p>내용 2</p>
</div>
</body>
</html>
```
##### appendTo(), prependTo(), insertAfter(), insertBefore()

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    document.getElementById('btn1').onclick = function() {
      $('<i>Hello jQuery</i>').appendTo('#result');
      // $('<i></i>').html('Hello jQuery').appendTo('#result');
      // jQuery에 선택자가 아닌 html 내용을 사용한다면 그 html의 내용 자체를 생성한다
      // $('<i>Hello jQuery</i>').prependTo('#result');
      // $('<i>Hello jQuery</i>').insertAfter('#result');
      // $('<i>Hello jQuery</i>').insertBefore('#result');
    };
  });
</script>
</head>
<body>

<button id="btn1">내용 추가</button>
<br><hr><br>
<div id="result"><b>출력내용1</b></div>
</body>
</html>
```
##### attr(), removeAttr()
- 선택된 요소의 특정 속성 값의 사용, 수정, 삭제에 이용된다
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    document.getElementById('btn1').onclick = function() {
      // console.log($('img').attr('src'));
      // 에러가 나지 않고 제일 처음 태그의 속성만 출력된다
      
      $('img').each(function(index, item) {
        console.log($(item).attr('data'));
      });
      $('img').attr('src', function(index, item) {
        console.log(item);
      });
      // 선택된 태그 전부의 속성 값을 모두 출력한다
    };
    
    document.getElementById('btn2').onclick = function() {
      // $('img').attr('width', 100);
      // 모든 img 태그의 width 속성 값을 바꾼다
      
      // $('img').attr('width', function(index) {
      //   return (index + 1) * 100;
      // });
      // img 태그마다 다른 속성 값을 줄 수도 있다
      
      $('img').attr({
        width : function(index) {
          return (index + 1) * 100;
        },
        height : 200
      })
    };
    
    document.getElementById('btn3').onclick = function() {
      $('img').removeAttr('height');
      // 특정 속성의 값으로 준 것을 없앤다
    };
  });
</script>
</head>
<body>
<button id="btn1">속성 내용</button>
<button id="btn2">속성 수정</button>
<button id="btn3">속성 제거</button>
<br><hr><br>
<img src="./images1/Chrysanthemum.jpg" width="150" data="1">
<!-- html에서는 개발자 임의로 속성을 만들고 값을 줄 수 있다 -->
<img src="./images1/Desert.jpg" width="150" data="2">
<img src="./images1/Hydrangeas.jpg" width="150" data="3"> 
<img src="./images1/Jellyfish.jpg" width="150" data="4">
</body>
</html>
```
#### html 문서 안의 데이터 사용하기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    document.getElementById('btn1').onclick = function() {
      // console.log(document.frm.data.value);
      // 기존의 javascript 방식
      
      console.log($('#data').val());
    };
    
    document.getElementById('btn2').onclick = function() {
      $('#data').val('새로운 데이터');
    };
    
    document.getElementById('btn3').onclick = function() {
      $('input:checkbox:checked').each(function() {
        console.log($(this).val());
      });
    };
    
    document.getElementById('btn4').onclick = function() {
      console.log($('#sel option:selected').val());
    };
  });
</script>
</head>
<body>
<button id="btn1">내용</button>
<button id="btn2">내용 넣기</button>
<button id="btn3">체크된 값 확인하기</button>
<button id="btn4">선택된 값 확인하기</button>
<br><hr><br>
<form action="" name="frm">
데이터 <input type="text" name="data" id="data">

<input type="checkbox" id="ch1" name="ch" value="사과">사과<br>
<input type="checkbox" id="ch1" name="ch" value="수박">수박<br>
<input type="checkbox" id="ch1" name="ch" value="딸기">딸기<br>
<input type="checkbox" id="ch1" name="ch" value="참외">참외<br>

<select id="sel">
  <option value="사과">사과</option> 
  <option value="수박">수박</option> 
  <option value="참외">참외</option> 
  <option value="딸기">딸기</option> 
</select>
</form>
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
<style type="text/css">
  .c1{ color : red;}
  .c2{ color : green;}
  .c3{ color : blue;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    document.getElementById('btn1').onclick = function() {
      // console.log($('h2').css('color'));
      // 첫번째 태그의 속성만 출력된다
      
      $('h2').css('color', function(index, item) {
        console.log(item);
      });
    };
    
    document.getElementById('btn2').onclick = function() {
      // $('h2').css('color', 'orange');	
      const colors = ['purple', 'black', 'cyan'];
      $('h2').css('color', function(index, item) {
        return colors[index];
      });
    };
  });
</script>
</head>
<body>
<button id="btn1">내용</button>
<button id="btn2">변경</button>
<br><hr><br>
<h2 class="c1">header 1</h2>
<h2 class="c2">header 2</h2>
<h2 class="c3">header 3</h2>
</form>
</body>
</html>
```
##### addClass(), removeClass(), toggleClass()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    document.getElementById('btn1').onclick = function() {
      $('h2').addClass('c');
    };
    
    document.getElementById('btn2').onclick = function() {
      $('h2').removeClass('c');
    };
    
    document.getElementById('btn3').onclick = function() {
      $('h2').toggleClass('c');
    };
  });
</script>
</head>
<body>
<button id="btn1">클래스 추가</button>
<button id="btn2">클래스 삭제</button>
<button id="btn3">클래스 추가/삭제</button>
<br><hr><br>
<h2>header 1</h2>
<h2>header 2</h2>
<h2>header 3</h2>
</form>
</body>
</html>
```
### jQuery 이벤트
```jsp
$(선택자).이벤트메서드(function(){
  처리
});

$(선택자).on('이벤트이름', function(){
  처리
});
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn1').click(function() {
      alert('btn1 click');
    });
    
    $('#btn1').mouseover(function() {
      alert('btn1 over');
    });
    
    $('#btn2').click(function() {
      alert('btn2 click');
    });
    
    $('#btn3').click(function() {
      alert('btn3 click');
    });
  });
</script>
</head>
<body>
<input type="button" id="btn1" value="버튼1"><br><br>
<button id="btn2">버튼2</button><br><br>
<div id="btn3" style="width:100px;height:20px;border:1px solid black">버튼3</div>
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
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn1').on('click', function() {
      alert('btn1 click');
    });
    
    $('#btn2').on('click', function() {
      alert('btn2 click');
    });
    
    $('#btn3').on('click', function() {
      alert('btn3 click');
    });
  });
</script>
</head>
<body>
<input type="button" id="btn1" value="버튼1"><br><br>
<button id="btn2">버튼2</button><br><br>
<div id="btn3" style="width:100px;height:20px;border:1px solid black">버튼3</div>
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
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn1').on('click mouseover mouseleave', function() {
      // 공백을 이용해 여러개 이벤트에 대한 내용을 지정할 수 있다
      console.log('btn1 mouse event');
    });
    
    $('#btn2').on({
      'click' : function() {
        console.log('click');	
      },
      'mouseover' : function() {
        console.log('mouseover');	
      },
      'mouseleave' : function() {
        console.log('mouseleave');	
      }
    });
    
  });
</script>
</head>
<body>
<input type="button" id="btn1" value="버튼1"><br><br>
<button id="btn2">버튼2</button><br><br>
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
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('button').on('click', function() {
      alert('button click : ' + $(this).attr('id'));
    });
  });
</script>
</head>
<body>
<button id="btn1">버튼1</button><br><br>
<button id="btn2">버튼2</button><br><br>
<button id="btn3">버튼3</button><br><br>
</body>
</html>
```

#### ajax()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn').on('click', function() {
      $.ajax({
        // url : './data/csv1.jsp',
        // url : './data/xml1.jsp',
        url : './data/json1.jsp',
        type : 'get',
        dataType : 'json',
        // dataType은 따로 지정하지 않아도 자동으로 정해지지만, 되도록이면 확실하게 정해주도록 하자
        success : function(csvData) {
          console.log('성공 : ', typeof csvData);
          console.log(csvData);
        },
        error : function(err) {
          console.log('실패', err.status);
          console.log('실패', err.responseText);
        }
      })
    });
  });
</script>
</head>
<body>
<button id="btn">버튼1</button><br><br>

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
<style type="text/css">
  .c{ color : red;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn').on('click', function() {
      $.ajax({
        url : './data/xml1.jsp',
        type : 'get',
        dataType : 'xml',
        success : function(xmlData) {
          let html = '<table border="1">';
          $(xmlData).find('book').each(function() {
            html += '<tr>';
            html += '<td>' + $(this).find('name').text() + '</td>';
            html += '<td>' + $(this).find('publisher').text() + '</td>';
            html += '<td>' + $(this).find('author').text() + '</td>';
            html += '<td>' + $(this).find('price').text() + '</td>';
            html += '</tr>';
          }) 
          html += '</table>';
          $('#result').html(html);
        },
        error : function(err) {
          console.log('실패', err.status);
          console.log('실패', err.responseText);
        }
      });
    });
  });
</script>
</head>
<body>
<button id="btn">버튼1</button><br><br>
<hr><br>
<div id='result'></div>

</body>
</html>
```

jQuery로 우편번호 검색기 만들기
```xml
<!-- context.xml -->
<?xml version="1.0" encoding="utf-8" ?>
<Context>
  <Resource
    name="jdbc/mariadbProject"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="org.mariadb.jdbc.Driver"
    url="jdbc:mariadb://localhost:3306/project"
    username="root"
    password="123456"
  />
</Context>
```
```java
// ZipcodeTO.java
package model1;

public class ZipcodeTO {
  private String zipcode;
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;
  
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getSido() {
    return sido;
  }
  public void setSido(String sido) {
    this.sido = sido;
  }
  public String getGugun() {
    return gugun;
  }
  public void setGugun(String gugun) {
    this.gugun = gugun;
  }
  public String getDong() {
    return dong;
  }
  public void setDong(String dong) {
    this.dong = dong;
  }
  public String getRi() {
    return ri;
  }
  public void setRi(String ri) {
    this.ri = ri;
  }
  public String getBunji() {
    return bunji;
  }
  public void setBunji(String bunji) {
    this.bunji = bunji;
  }
}

// ZipcodeDAO.java
package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ZipcodeDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public ZipcodeDAO() {
    try {
      Context initCtx = (Context)new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadbProject");
      
      conn = dataSource.getConnection();
    } catch (NamingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<ZipcodeTO> searchZipcode(String dong){
    List<ZipcodeTO> datas = new ArrayList<>();
    
    String sql = "select * from zipcode where dong like ?";
    
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dong + "%");
      
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
      if(rs != null) try{rs.close();} catch(SQLException e) {}
      if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
      if(conn != null) try{conn.close();} catch(SQLException e) {}
    }
    
    return datas;
  }
}
```
```jsp
<!-- zipcodeXml.jsps -->
<%@page import="model1.ZipcodeTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");

  String strDong = request.getParameter("dong");

  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> datas = dao.searchZipcode(strDong);
  
  StringBuilder sbXML = new StringBuilder();
  sbXML.append("<addresses>");
  for(int i = 0; i < datas.size(); i++){
    sbXML.append("<address>");
    sbXML.append("<zipcode>" + datas.get(i).getZipcode() + "</zipcode>");
    sbXML.append("<sido>" + datas.get(i).getSido() + "</sido>");
    sbXML.append("<gugun>" + datas.get(i).getGugun() + "</gugun>");
    sbXML.append("<dong>" + datas.get(i).getDong() + "</dong>");
    sbXML.append("<ri>" + datas.get(i).getRi() + "</ri>");
    sbXML.append("<bunji>" + datas.get(i).getBunji() + "</bunji>");
    sbXML.append("</address>");
  }
  sbXML.append("</addresses>");
%>
<%= sbXML %>

<!-- zipcode.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn').on('click', function() {
      $.ajax({
        url : './data/zipcodeXml.jsp?dong=' + $('#strDong').val(),
        type : 'get',
        dataType : 'xml',
        success : function(xmlData) {
          let html = '<table border="1">';
          $(xmlData).find('address').each(function() {
            html += '<tr>';
            html += '<td>' + $(this).find('zipcode').text() + '</td>';
            html += '<td>' + $(this).find('sido').text() + '</td>';
            html += '<td>' + $(this).find('gugun').text() + '</td>';
            html += '<td>' + $(this).find('dong').text() + '</td>';
            html += '<td>' + $(this).find('ri').text() + '</td>';
            html += '<td>' + $(this).find('bunji').text() + '</td>';
            html += '</tr>';
          });
          html += '</table>';
          $('#result').html(html);
        },
        error : function(err) {
          console.log('실패', err.status);
          console.log('실패', err.responseText);
      });
    });
  });
</script>
</head>
<body>
동이름 : <input type="text" id="strDong" name="strDong"><input type="button" id="btn" value="주소 검색">
<div id="result"></div>
</body>
</html>
```
### jQuery UI
<small>!! https://jqueryui.com/ widget 참고</small>

- jQuery Core에 속하고 DOM에 css 요소를 준다

- 라이브러리 다운로드

  https://jqueryui.com/ &rarr; download &rarr; stable, theme 다운로드

  <small> !! stable 은 js 파일로 jQuery UI 라이브러리에 해당된다</small>

  <small> !! theme 은 css 파일들의 집합으로 jQuery UI css 효과를 준다</small>

  <small> !! stable, theme 가 모두 있어야 문서의 요소에 jQuery UI를 줄 수 있다</small>

#### jQuery UI 디자인 주기

##### button()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<style type="text/css">
  /* 사용자 스타일 */
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    console.log('Hello jQuery UI !!');
    
    $('#btn1').button(); 
    $('input[type="button"]').button();
    $('a').button();
    $('#btn2').button();
    // 버튼과 관련이 없는 태그더라도 button 디자인을 줄 수 있다
  });
</script>
</head>
<body>
<input type="button" value="버튼 1"><br><br>
<input type="submit" value="버튼 2"><br><br>
<button>버튼 3</button><br><br>

<button id="btn1">버튼 4</button><br><br>

<a href="https://www.daum.net">다음 바로가기</a><br><br>

<div id="btn2">버튼 5</div>
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
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn1').button().on('click', function() {
      alert('btn1 클릭');
    });
    
    $('#btn2').button().on('click', function() {
      alert('btn2 클릭');
    });
  });
</script>
</head>
<body>
<button id="btn1">버튼 1</button><br><br>
<div id="btn2">버튼 2</div>
</body>
</html>
```
###### icon 주기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#btn1').button({
      icon : 'ui-icon-gear',
      iconPosition : 'end'
      // top, bottom, end, 없음
    });
    
    $('#btn2').button({
      icon : 'ui-icon-flag',
      showLabel : false
      // 버튼 안의 내용을 보여주지 않는다
    }).on('click', function() {
      alert('btn2 클릭');
    });
    // javascript는 메서드 체이닝을 주로 사용한다
  });
</script>
</head>
<body>
<button id="btn1">버튼 1</button><br><br>
<div id="btn2">버튼 2</div>
</body>
</html>
```
##### checkboxradio()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('input[type="checkbox"]').checkboxradio();
  });
</script>
</head>
<body>
<fieldset>
  <legend>Hotel Ratings</legend>
  <label for="cb1">2 Star</label><input type="checkbox" id="cb1">
  <label for="cb2">3 Star</label><input type="checkbox" id="cb2">
  <label for="cb3">4 Star</label><input type="checkbox" id="cb3">
  <label for="cb4">5 Star</label><input type="checkbox" id="cb4">
</fieldset>
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
<link rel="stylesheet" href="./css/base/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('input[type="radio"]').checkboxradio({
      icon : false
      // toggle button 형태로 만든다
    }).on('change', function() { // 선택의 변화가 생겼을 때의 이벤트
      console.log('radio change')
    });
  });
</script>
</head>
<body>
<fieldset>
  <legend>Hotel Ratings</legend>
  <label for="cb1">2 Star</label><input type="radio" id="cb1" name="radio">
  <!-- name 속성의 값을 줘야 다중선택이 되지 않는다 -->
  <label for="cb2">3 Star</label><input type="radio" id="cb2" name="radio">
  <label for="cb3">4 Star</label><input type="radio" id="cb3" name="radio">
  <label for="cb4">5 Star</label><input type="radio" id="cb4" name="radio">
</fieldset>
</body>
</html>
```
##### progressbar()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#progressbar').progressbar({
      value : 10
      // 단위는 %
      // 초깃값은 반드시 이렇게 설정해줘야 한다
    });
    
    $('#btn1').button().on('click', function() {
      const value = $('#progressbar').progressbar('value');
      console.log(value);
      
      $('#progressbar').progressbar('value', 50);
      // 초깃값을 집어넣은 상태여야 이와 같은 방식으로 값 변경을 시킬 수 있다
    });
    
    $('#btn2').button().on('click', function() {
      
      $('#progressbar').progressbar('value', $('#progressbar').progressbar('value') + 10);
    });
    $('#btn3').button().on('click', function() {
      
      $('#progressbar').progressbar('value', $('#progressbar').progressbar('value') - 10);
    });
  });
</script>
</head>
<body>

<div id="progressbar"></div>
<br><hr><br>
<button id="btn1">값(50)</button>
<button id="btn2">증가</button>
<button id="btn3">감소</button>

</body>
</html>
```

##### slider()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#slider').slider({
      // orientaion : 'vertical'
      // 수직모양 슬라이더
      value : 50,
      min : 0,
      max : 200,
      step : 20,
      slide : function(event, ui) {
        console.log('slide : ' , $(this).slider('value'));
        console.log('slide : ' , ui.value);
      }
    });
    
    $('#btn').button().on('click', function() {
      const value = $('#slider').slider('value');
      console.log(value);
    });
  });
</script>
</head>
<body>

<div id="slider"></div>
<br><hr><br>
<button id="btn">값 확인</button>

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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#slider').slider({
      range : true,
      min : 0,
      max : 500,
      values : [75, 300],
      slide : function(event, ui) {
        // console.log(ui.values[0], '/', ui.values[1]);
        console.log($(this).slider('values', 0), '/', $(this).slider('values', 1));
      }
    });
    
    $('#btn').button().on('click', function() {
      const value = $('#slider').slider('value');
      console.log(value);
    });
  });
</script>
</head>
<body>

<div id="slider"></div>
<br><hr><br>
<button id="btn">값 확인</button>

</body>
</html>
```
slider color-picker
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  $(document).ready(function() {
    let red = 0;
    let green = 0;
    let blue = 0;
    
    $('#red, #green, #blue').slider({
      mit : 0,
      max : 255,
      step : 1
    });
    
    $('#red').slider({
      slide : function() {
        red = $(this).slider('value');
        $('#color').css('background-color', 'rgb(' + red + ', ' + green + ', ' + blue + ')')
      }
    })
    
    $('#green').slider({
      slide : function() {
        green = $(this).slider('value');
        $('#color').css('background-color', 'rgb(' + red + ', ' + green + ', ' + blue + ')')
      }
    })
    
    $('#blue').slider({
      slide : function() {
        blue = $(this).slider('value');
        $('#color').css('background-color', 'rgb(' + red + ', ' + green + ', ' + blue + ')')
      }
    })
    
  });
</script>
</head>
<body>
Red<br><br>
<div id="red"></div><br><br>
Green<br><br>
<div id="green"></div><br><br>
Blue<br><br>
<div id="blue"></div><br><br>

<br><hr><br>

<div id="color" style="width:500px;height:300px"></div>
</body>
</html>
```
##### spinner()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#spinner').spinner({
      min : 5,
      max : 250,
      step : 25,
      spin : function() {
        console.log($(this).spinner('value'));
      }
    });
    
    $('#btn').button().on('click', function() {
      console.log($('#spinner').spinner('value'));
    });
  });
</script>
</head>
<body>

<div>
  <label for="spinner">데이터</label>
  <input type="text" id="spinner" value="50" readonly>
</div>
<br><hr><br>
<button id="btn">값 확인</button>
</body>
</html>
```

##### selectmenu()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#files').selectmenu({
      width : 500,
      change : function() {
        let value = $(this).val();
        console.log($('option[value=' + value +']');
        // 값 나오게 하기
      }
    });
  });
</script>
</head>
<body>
<select id="files">
  <option disabled="disabled" selected>선택하세요</option>
  <optgroup label="classA">
    <option value="jquery">jQuery.js</option>
    <option value="jqueryui">jQueryui.js</option>
  </optgroup>
  <optgroup label="classB">
    <option value="jquery">jQuery.js</option>
    <option value="jqueryui">jQueryui.js</option>
  </optgroup>
  <optgroup label="classC">
    <option value="jquery">jQuery.js</option>
    <option value="jqueryui">jQueryui.js</option>
  </optgroup>
</select>
</body>
</html>
```
jQuery UI 우편번호 검색기
```java
// ZipcodeTO.java
package model1;

public class ZipcodeTO {
  private String zipcode;
  private String sido;
  private String gugun;
  private String dong;
  private String ri;
  private String bunji;
  
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getSido() {
    return sido;
  }
  public void setSido(String sido) {
    this.sido = sido;
  }
  public String getGugun() {
    return gugun;
  }
  public void setGugun(String gugun) {
    this.gugun = gugun;
  }
  public String getDong() {
    return dong;
  }
  public void setDong(String dong) {
    this.dong = dong;
  }
  public String getRi() {
    return ri;
  }
  public void setRi(String ri) {
    this.ri = ri;
  }
  public String getBunji() {
    return bunji;
  }
  public void setBunji(String bunji) {
    this.bunji = bunji;
  }
  
}

// ZipcodeDAO.java
package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ZipcodeDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public ZipcodeDAO() {
    try {
      Context initCtx = (Context)new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadbProject");
      
      conn = dataSource.getConnection();
    } catch (NamingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<ZipcodeTO> sidos(){
    List<ZipcodeTO> datas = new ArrayList<>();
    
    String sql = "select distinct sido from zipcode";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        ZipcodeTO data = new ZipcodeTO();
        data.setSido(rs.getString("sido"));
        
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
  
  public List<ZipcodeTO> guguns(ZipcodeTO input){
    List<ZipcodeTO> datas = new ArrayList<>();
    
    String sql = "select distinct gugun from zipcode where sido = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSido());
      rs = pstmt.executeQuery();
      while(rs.next()) {
        ZipcodeTO data = new ZipcodeTO();
        data.setGugun(rs.getString("gugun"));
        
        datas.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt!= null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return datas;
  }
  
  public List<ZipcodeTO> dongs(ZipcodeTO input){
    List<ZipcodeTO> datas = new ArrayList<>();
    
    String sql = "select distinct dong from zipcode where sido = ? and gugun = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSido());
      pstmt.setString(2, input.getGugun());
      rs = pstmt.executeQuery();
      while(rs.next()) {
        ZipcodeTO data = new ZipcodeTO();
        data.setDong(rs.getString("dong"));
        
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
  
  public List<ZipcodeTO> addresses(ZipcodeTO input){
    List<ZipcodeTO> datas = new ArrayList<>();
    
    String sql = "select * from zipcode where sido = ? and gugun = ? and dong = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSido());
      pstmt.setString(2, input.getGugun());
      pstmt.setString(3, input.getDong());
      
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
```jsp
<!-- sido.jsp -->
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeDAO"%>
<%@page import="model1.ZipcodeTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> sidos = dao.sidos();
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<address>");
  for(int i = 0; i < sidos.size(); i++){
    sbXml.append("<sido>" + sidos.get(i).getSido() + "</sido>");
  }
  sbXml.append("</address>");
%>
<%= sbXml %>

<!-- gugun.jsp -->
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeDAO"%>
<%@page import="model1.ZipcodeTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  ZipcodeTO input = new ZipcodeTO();
  input.setSido(request.getParameter("sido"));
  
  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> guguns = dao.guguns(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<address>");
  for(int i = 0; i < guguns.size(); i++){
    sbXml.append("<gugun>" + guguns.get(i).getGugun() + "</gugun>");
  }
  sbXml.append("</address>");
%>
<%= sbXml %>

<!-- dong.jsp -->
<%@page import="java.util.List"%>
<%@page import="model1.ZipcodeDAO"%>
<%@page import="model1.ZipcodeTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  ZipcodeTO input = new ZipcodeTO();
  input.setSido(request.getParameter("sido"));
  input.setGugun(request.getParameter("gugun"));
  
  ZipcodeDAO dao = new ZipcodeDAO();
  List<ZipcodeTO> dongs = dao.dongs(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<address>");
  for(int i = 0; i < dongs.size(); i++){
    sbXml.append("<dong>" + dongs.get(i).getDong() + "</dong>");
  }
  sbXml.append("</address>");
%>
<%= sbXml %>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#sido, #gugun, #dong').selectmenu({
      width : 150
    });
    
    $.ajax({
      url : './data/sido.jsp',
      type : 'get',
      dataType : 'xml',
      success : function(xmlData) {
        let opts = '';
        $(xmlData).find('sido').each(function() {
          opts += '<option value=' + $(this).text() + '>' + $(this).text() + '</option>';
        });
        $(opts).appendTo('#sido');
      },
      error : function(e) {
        console.log('에러 : ' + e.status)
      }
    });
    
    $('#sido').selectmenu({
      change : function() {
        $.ajax({
          // url : './data/gugun.jsp?sido=' + $('#sido').val(),
          url : './data/gugun.jsp', 
          type : 'get',
          data : {
            sido : $('#sido').val()
          },
          dataType : 'xml',
          success : function(xmlData) {
            $('#gugun').empty();
            
            let opts = '';
            $(xmlData).find('gugun').each(function() {
              opts += '<option value=' + $(this).text() + '>' + $(this).text() + '</option>';
            });
            $(opts).appendTo('#gugun');
            
            $('#gugun').selectmenu('refresh');
          },
          error : function(e) {
            console.log('에러 : ' + e.status)
          }
        });
      }
    });
    
    $('#gugun').selectmenu({
      change : function() {
        $.ajax({
          // url : './data/dong.jsp?sido=' + $('#sido').val() + '&gugun=' + $('#gugun').val(),
          url : './data/dong.jsp',
          type : 'get',
          data : {
            sido : $('#sido').val(),
            gugun : $('#gugun').val()
          },
          dataType : 'xml',
          success : function(xmlData) {
            $('#dong').empty();
            
            let opts = '';
            $(xmlData).find('dong').each(function() {
              opts += '<option value=' + $(this).text() + '>' + $(this).text() + '</option>';
            });
            $(opts).appendTo('#dong');
            
            $('#dong').selectmenu('refresh');
          },
          error : function(e) {
            console.log('에러 : ' + e.status)
          }
        });
      }
    });
    
    $('#btn').button().on('click', function() {
      $.ajax({
        // url : './data/address.jsp?sido=' + $('#sido').val() + '&gugun=' + $('#gugun').val() + '&dong=' + $('#dong').val(),
        url : './data/address.jsp',
        type : 'get',
        data : {
          sido : $('#sido').val(),
          gugun : $('#gugun').val(),
          dong : $('#dong').val()
        },
        dataType : 'xml',
        success : function(xmlData) {
          $('table').empty();
          
          let trs = '';
          $(xmlData).find('address').each(function() {
            trs += '<tr>';
            trs += '<td>' + $(this).find('zipcode').text() + '</td>';
            trs += '<td>' + $(this).find('sido').text() + '</td>';
            trs += '<td>' + $(this).find('gugun').text() + '</td>';
            trs += '<td>' + $(this).find('dong').text() + '</td>';
            trs += '<td>' + $(this).find('ri').text() + '</td>';
            trs += '<td>' + $(this).find('bunji').text() + '</td>';
            trs += '</tr>';
          });
          
          $(trs).appendTo('table');
        },
        error : function(e) {
          console.log('에러 : ' + e.status)
        }
      });
    })

  });
</script>
</head>
<body>
<fieldset>
  <legend>우편번호 검색</legend>
  <label for="sido">시도</label>
  <select id="sido">
    <option disabled selected>시도 선택</option>
  </select>
  <label for="gugun">구군</label>
  <select id="gugun">
    <option disabled selected>구군 선택</option>
  </select>
  <label for="dong">동</label>
  <select id="dong">
    <option disabled selected>동 선택</option>
  </select>
  
  <button id="btn">주소 검색</button>
</fieldset>
<br><hr><br>
<div>
  <table border="1" width="800">
    <tr>
      <th>우편번호</th>
      <th>시도</th>
      <th>구군</th>
      <th>동</th>
      <th>리</th>
      <th>번지</th>
    </tr>
  </table>
</div>
</body>
</html>
```
##### autocomplete()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    const availableTags = [
          "ActionScript",
          "AppleScript",
          "Asp",
          "BASIC",
          "C",
          "C++",
          "Clojure",
          "COBOL",
          "ColdFusion",
          "Erlang",
          "Fortran",
          "Groovy",
          "Haskell",
          "Java",
          "JavaScript",
          "Lisp",
          "Perl",
          "PHP",
          "Python",
          "Ruby",
          "Scala",
          "Scheme"
        ];
    $('#tags').autocomplete({
      source : availableTags
    });
  });
</script>
</head>
<body>

<div>
  <label for="tags">program language</label>
  <input type="text" id="tags">
</div>

</body>
</html>
```
```jsp
<!-- json.jsp -->
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
{
  "data" : [ 
        "ActionScript",
          "AppleScript",
          "Asp",
          "BASIC",
          "C",
          "C++",
          "Clojure",
          "COBOL",
          "ColdFusion",
          "Erlang",
          "Fortran",
          "Groovy",
          "Haskell",
          "Java",
          "JavaScript",
          "Lisp",
          "Perl",
          "PHP",
          "Python",
          "Ruby",
          "Scala",
          "Scheme"
        ]
}

<!-- autocomplete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $.ajax({
      url : './data/json.jsp',
      type : 'get',
      dataType : 'json',
      success : function(json) {
        $('#tags').autocomplete({
          source : json.data
        });
      },
      error : function(e) {
        alert('에러 : ' + e.status);
      }
    });
    
  });
</script>
</head>
<body>

<div>
  <label for="tags">program language</label>
  <input type="text" id="tags">
</div>

</body>
</html>
```
##### accordion()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#accordion').accordion();
  });
</script>
</head>
<body>

<div id="accordion">
  <h3>Section 1</h3>
  <div>
    <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sitamet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo utodio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit ametpurus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitorvelit, faucibus interdum tellus libero ac justo. Vivamus non quam. Insuscipit faucibus urna.</p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quislacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada fames ac turpis egestas. Vestibulum ante ipsum primis infaucibus orci luctus et ultrices posuere cubilia Curae; Aenean laciniamauris vel est.</p>
    <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.Class aptent taciti sociosqu ad litora torquent per conubia nostra, perinceptos himenaeos.</p>
  </div>
</div>

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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#accordion').accordion();
    
    $('#btn1').button().on('click', function() {
      let html = '';
      html += '<h3>Section 5</h3>';
      html += '<div>';
      html += '<p>가나다라마바사아자차카타파</p>';
      html += '</div>'
      
      $('#accordion').append(html);
      $('#accordion').accordion('refresh');
      // refresh 옵션을 주지 않으면 ui 적용은 되지 않고, 내용만 추가된다
    });
  });
</script>
</head>
<body>
<button id="btn1">데이터 추가</button>

<br><hr><br>

<div id="accordion">
  <h3>Section 1</h3>
  <div>
    <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sitamet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo utodio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit ametpurus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitorvelit, faucibus interdum tellus libero ac justo. Vivamus non quam. Insuscipit faucibus urna.</p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quislacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada fames ac turpis egestas. Vestibulum ante ipsum primis infaucibus orci luctus et ultrices posuere cubilia Curae; Aenean laciniamauris vel est.</p>
    <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.Class aptent taciti sociosqu ad litora torquent per conubia nostra, perinceptos himenaeos.</p>
  </div>
</div>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#accordion').accordion();
    
    $('#btn1').button().on('click', function() {
      let html = '';
      html += '<h3>Section 5</h3>';
      html += '<div>';
      html += '<p>가나다라마바사아자차카타파</p>';
      html += '</div>'
      
      $('#accordion').append(html);
      $('#accordion').accordion('refresh');
    });
    
    $('#btn2').button().on('click', function() {
      // console.log($('#accordion').accordion('option', 'active'));
      // active 상태인 옵션의 인덱스 값을 출력한다
      
      $('#accordion').accordion('option', 'active', 2);
      // 2번 인덱스의 옵션을 active 상태로 만든다
    });
  });
</script>
</head>
<body>
<button id="btn1">데이터 추가</button>
<button id="btn2">데이터 선택</button>

<br><hr><br>

<div id="accordion">
  <h3>Section 1</h3>
  <div>
    <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sitamet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo utodio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit ametpurus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitorvelit, faucibus interdum tellus libero ac justo. Vivamus non quam. Insuscipit faucibus urna.</p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quislacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada fames ac turpis egestas. Vestibulum ante ipsum primis infaucibus orci luctus et ultrices posuere cubilia Curae; Aenean laciniamauris vel est.</p>
    <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.Class aptent taciti sociosqu ad litora torquent per conubia nostra, perinceptos himenaeos.</p>
  </div>
</div>
</body>
</html>
```
accordion 구구단 출력
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#result').accordion();
    // 되도록이면 accordion() 생성을 먼저 해주자
    $('#start').spinner({
      min : 1,
      max : 8,
      spin : function() {
      }
    });
    $('#end').spinner({
      min : 2,
      max : 9,
      spin : function() {
      }
    });
    $('#btn').button().on('click', function() {
      $('#result').accordion().empty();
      let startDan = $('#start').spinner('value');
      let endDan = $('#end').spinner('value');
      
      let html = '';
      for(let i = startDan; i <= endDan; i++){
        html += '<h3>' + i + '단</h3>';
        html += '<div>';
        html += '<ul>';
        for(let j = 1; j <= 9; j++){
          html += '<li>';
          html += i + ' X ' + j + ' = ' + (i * j);
          if(j == 9){
            html += '</li>';
          }
        }			
        html += '</ul>';
        html += '</div>';
      }
      $('#result').accordion().append(html);
      $('#result').accordion('refresh');
    });
  });
</script>
</head>
<body>

<fieldset>
  <legend>구구단 출력</legend>
  <label for="start">시작단</label>
  <input type="text" id="start" value="1" readonly>
  ~
  <label for="end">끝단</label>
  <input type="text" id="end" value="2" readonly>
  <button id="btn">구구단 출력</button>
</fieldset>
<br><hr><br>
<div id="result"></div>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  
  #accordion-resizer {
    padding: 10px;
    width: 350px;
    height: 200px;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#accordion').accordion({
      heightStyle : 'fill'
    });
    
    $('#accordion-resizer').resizable({
      minHeight: 140,
        minWidth: 200,
        resize: function() {
          $( "#accordion" ).accordion( "refresh" );
        }
    });
    
    $('#btn1').button().on('click', function() {
      let html = '';
      html += '<h3>Section 5</h3>';
      html += '<div id="accordion-resizer">';
      html += '<p>가나다라마바사아자차카타파</p>';
      html += '</div>'
      
      $('#accordion').append(html);
      $('#accordion').accordion('refresh');
    });
    
    $('#btn2').button().on('click', function() {
      
      $('#accordion').accordion('option', 'active', 2);
    });
  });
</script>
</head>
<body>
<button id="btn1">데이터 추가</button>
<button id="btn2">데이터 선택</button>

<br><hr><br>
<div id="accordion-resizer">
<div id="accordion">
  <h3>Section 1</h3>
  <div>
    <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sitamet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo utodio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
  </div>
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit ametpurus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitorvelit, faucibus interdum tellus libero ac justo. Vivamus non quam. Insuscipit faucibus urna.</p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac liberoac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quislacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
  <h3>Section 4</h3>
  <div>
    <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netuset malesuada fames ac turpis egestas. Vestibulum ante ipsum primis infaucibus orci luctus et ultrices posuere cubilia Curae; Aenean laciniamauris vel est.</p>
    <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus.Class aptent taciti sociosqu ad litora torquent per conubia nostra, perinceptos himenaeos.</p>
  </div>
</div>
</div>
</body>
</html>
```
##### datepicker()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#datepicker1').datepicker();
  });
</script>
</head>
<body>
<div>
  Date : <input type="date">
  // input 태그 자체에도 달력을 보여주는 기능이 있다
</div>

<div>
  Date : <input type="text" id="datepicker1" readonly>
</div>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#datepicker1').datepicker();
    
    $('#datepicker2').datepicker();
  });
</script>
</head>
<body>

<div>
  Date : <input type="text" id="datepicker1" readonly>
</div>

<div>
  Date : <div id="datepicker2"></div>
  // 달력이 바로 보인다
</div>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#datepicker').datepicker();
    
    $('#anim').on('change', function() {
      $('#datepicker').datepicker('option', 'showAnim', $(this).val())
    });
  });
</script>
</head>
<body>

<p>Date: <input type="text" id="datepicker" size="30"></p>
 
<p>Animations:<br>
  <select id="anim">
    <option value="show">Show (default)</option>
    <option value="slideDown">Slide down</option>
    <option value="fadeIn">Fade in</option>
    <option value="blind">Blind (UI Effect)</option>
    <option value="bounce">Bounce (UI Effect)</option>
    <option value="clip">Clip (UI Effect)</option>
    <option value="drop">Drop (UI Effect)</option>
    <option value="fold">Fold (UI Effect)</option>
    <option value="slide">Slide (UI Effect)</option>
    <option value>None</option>
  </select>
</p>
 
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/datepicker-ko.js"></script>
<!-- 달력을 한국어로 사용하기 위한 js 라이브러리를 사용한다 -->
<!-- 경로 : /ui/i18n/datepicker-ko.js  -->

<script type="text/javascript">
  $(document).ready(function() {
    $('#datepicker').datepicker({
      showOtherMonths : true,
      selectOtherMonths : true,
      showButtonPanel : true,
      changeMonth : true,
      changeYear : true,
      numberOfMonths : 3,
      dateFormat : 'yy-mm-dd'
    });
  });
</script>
</head>
<body>

<div>
  Date : <input type="text" id="datepicker" readonly>
</div>
 
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/datepicker-ko.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#datepicker').datepicker({
      onClose : function(data) {
      // 날짜를 선택하면 발생하는 이벤트
        console.log(data);
      }
    });
    
    $('#btn').button().on('click', function() {
      console.log($('#datepicker').val());
      // 선택된 날짜가 출력된다
      console.log($('#datepicker').datepicker('getDate'));
      // 자세한 날짜, 시간이 출력된다
    });
  });
</script>
</head>
<body>

<div>
  Date : <input type="text" id="datepicker" readonly>
</div>
<br><hr><br>
<button id="btn">읽기</button>
</body>
</html>
```
##### dialog()
- 새창 열기

  - widow.open : mpa 방식으로 새로운 페이지를 열어 새창을 보여준다

  - jQuery_dialog : spa 방식으로 현재 페이지의 요소를 이용해 새창을 보여준다

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    
    $('#btn1').button().on('click', function() {
      open('https://m.daum.net', 'winopen', 'width=640, height=960');
    });
    // window.open 방식
    
    // $('#dialog').dialog();
    // jquery dialog 방식

    $('#dialog').dialog({
      autoOpen : false,
      modal : true,
      
      width : 500,
      height : 300,
      resizable : false,
      
      buttons : {
      // dialog 내부의 버튼은 객체 형식으로 값을 준다
        '취소' : function() {
          alert('취소');
          $(this).dialog('close');
        },
        '확인' : function() {
          alert('확인');
          $(this).dialog('close');
        }
      },
    
      show : {
        effect : 'blind',
        duration : 1000
      },
      hide : {
        effect : 'explode',
        duration : 1000
      }
    })
    
    $('#btn2').button().on('click', function() {
      $('#dialog').dialog('open');
    });
  });
</script>
</head>
<body>
<button id="btn1">새창 열기</button>

<br><hr><br>

<div id="dialog" title="jQuery 다이얼로그">
  <h1>Hello 다이얼로그</h1>
</div>
<button id="btn2">다이얼로그 열기</button>
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
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 700px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#dialog-form').dialog({
      autoOpen : false,
      modal : true,
      width : 350,
      height : 400,
      resizable : false,
      buttons : {
        '취소' : function() {
          $(this).dialog('close');
        },
        '추가' : function() {
          let seq = parseInt($('#users tbody').find('tr').last().find('td').first().text());
          let html = '<tr>';
          html += '<td>' + (seq + 1) + '</td>';
          html += '<td>' + $('#name').val() + '</td>';
          html += '<td>' + $('#email').val() + '</td>';
          html += '<td>' + $('#password').val() + '</td>';
          html += '</tr>'
          
          $('#users tbody').append(html);
          $(this).dialog('close');
        }
      }
    });
    $('#btn1').button().on('click', function() {
      $('#dialog-form').dialog('open');
    });
  });
</script>
</head>
<body>
<button id="btn1">새창 열기</button>

<br><hr><br>

<div id="users-contain" class="ui-widget">
  <h1>Existing Users:</h1>
  <table id="users" class="ui-widget ui-widget-content">
    <thead>
      <tr class="ui-widget-header ">
        <th>Seq</th>
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>John Doe</td>
        <td>john.doe@example.com</td>
        <td>johndoe1</td>
      </tr>
    </tbody>
  </table>
</div>

<div id="dialog-form" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
 
  <form>
    <fieldset>
      <label for="name">Name</label>
      <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
      <label for="email">Email</label>
      <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
 
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    </fieldset>
  </form>
</div>
</body>
</html>
```
###### dialog() 회원관리 시스템

- 테이블 생성 구문
```sql
create table users (
seq int primary key auto_increment,
name varchar(20) not null,
password varchar(20) not null,
email varchar(100),
address varchar(150),
wdate datetime not null
);
```
- 데이터 삽입 구문
```sql
insert into users values (0, '홍길동', '1234', 'test@test.com', '서울시 강남구', now());
```

- protocol
  - 데이터 형식 : xml

  - 표

    기능|페이지|보내는 데이터|받는 데이터|데이터 형식|
    |:--:|:--:|:--:|:--:|:--:|
    |회원목록|user_list.jsp|X|seq<br>name<br>email<br>wip<br>wdate('%Y-%m-%d')<br>wgap(date_diff(wdate, now()))<br>address|\<users>\<user>\<seq>...\</seq>\<name>...\</name>...|
    |회원추가|user_write.jsp|name<br>password<br>email(mail1, mail2)<br>address|flag|\<flag>\</flag>|
    |회원삭제|user_delete.jsp|seq<br>password|flag|\<flag>\</flag>|
    |회원수정|user_modify.jsp|seq<br>password<br>email(mail1, mail2)<br>address|flag|\<flag>\</flag>|

- 흐름도

  - 회원 추가 : 화면 &rarr; 추가 &rarr; user_write.jsp &rarr; 정상 &rarr; user_list.jsp &rarr; 목록출력

  - 회원 삭제 : 화면 &rarr; 삭제 &rarr; user_delete.jsp &rarr; 정상 &rarr; user_list.jsp &rarr; 목록출력

  - 회원 수정 : 화면 &rarr; 수정 &rarr; user_modify.jsp &rarr; 정상 &rarr; user_list.jsp &rarr; 목록출력

- 구현하기
```java
// MemberTO.java
package model1;

public class MemberTO {
  private String seq;
  private String name;
  private String password;
  private String email;
  private String address;
  private String wdate;
  public String getSeq() {
    return seq;
  }
  public void setSeq(String seq) {
    this.seq = seq;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address) {
    this.address = address;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  
}

// MemberDAO.java
package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  public MemberDAO() {
    try {
      Context initCtx = (Context)new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadbProject");
      
      conn = dataSource.getConnection();
    } catch (NamingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<MemberTO> userList(){
    List<MemberTO> datas = new ArrayList<>();
    
    String sql = "select * from users";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        MemberTO data = new MemberTO();
        data.setSeq(rs.getString("seq"));
        data.setName(rs.getString("name"));
        data.setEmail(rs.getString("email"));
        data.setAddress(rs.getString("address"));
        data.setWdate(rs.getString("wdate"));
        
        datas.add(data);
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }finally {
      if(rs != null) try {rs.close();} catch(SQLException e) {}
      if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
      if(conn != null) try {conn.close();} catch(SQLException e) {}
    }
    
    return datas;
  }
  
  public int userWrite(MemberTO input) {
    int flag = 1;
    
    String sql = "insert into users value (0, ?, ?, ?, ?, now())";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getName());
      pstmt.setString(2, input.getPassword());
      pstmt.setString(3, input.getEmail());
      pstmt.setString(4, input.getAddress());
      
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
  
  public int userDelete(MemberTO input) {
    int flag = 2;
    
    String sql = "delete from users where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSeq());
      pstmt.setString(2, input.getPassword());
      System.out.println(input.getPassword());
      
      int result = pstmt.executeUpdate();
      
      if(result == 1) {
        flag = 0;
      }else {
        flag = 1;
      }
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    } finally {
      if(pstmt != null)try {pstmt.close();} catch(SQLException e) {}
      if(conn != null)try {conn.close();} catch(SQLException e) {}
    }
  
    return flag;
  }
  
  public int userModify(MemberTO input) {
    int flag = 2;
    
    String sql = "update users set name = ?, email = ?, address = ? where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getName());
      pstmt.setString(2, input.getEmail());
      pstmt.setString(3, input.getAddress());
      pstmt.setString(4, input.getSeq());
      pstmt.setString(5, input.getPassword());
      
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
}

```
```jsp
<!-- user_list.jsp -->
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model1.MemberDAO"%>
<%@page import="model1.MemberTO"%>
<% 
  request.setCharacterEncoding("utf-8");

  MemberDAO dao = new MemberDAO();
  List<MemberTO> datas = dao.userList();
  
  StringBuilder sbXml = new StringBuilder();
  
  sbXml.append("<users>");
  for(MemberTO data : datas){
    sbXml.append("<user>");
    sbXml.append("<seq>" + data.getSeq() + "</seq>");
    sbXml.append("<name>" + data.getName() + "</name>");
    sbXml.append("<email>" + data.getEmail() + "</email>");
    sbXml.append("<address>" + data.getAddress() + "</address>");
    sbXml.append("<wdate>" + data.getWdate() + "</wdate>");
    sbXml.append("</user>");
  }
  sbXml.append("</users>");
%>
<%= sbXml %>

<!-- user_write.jsp -->
<%@page import="model1.MemberTO"%>
<%@page import="model1.MemberDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");
  MemberTO input = new MemberTO();
  input.setSeq(request.getParameter("seq"));
  input.setName(request.getParameter("name"));
  input.setPassword(request.getParameter("password"));
  input.setEmail(request.getParameter("email"));
  input.setAddress(request.getParameter("address"));

  MemberDAO dao = new MemberDAO();
  int flag = dao.userWrite(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml%>

<!-- user_delete.jsp -->
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="model1.MemberDAO"%>
<%@page import="model1.MemberTO"%>
<%
  request.setCharacterEncoding("utf-8");
  MemberTO input = new MemberTO();
  input.setSeq(request.getParameter("seq"));
  input.setPassword(request.getParameter("password"));
  
  MemberDAO dao = new MemberDAO();
  int flag = dao.userDelete(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml %>

<!-- user_modify.jsp -->
<%@page import="model1.MemberDAO"%>
<%@page import="model1.MemberTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");

  MemberTO input = new MemberTO();
  input.setSeq(request.getParameter("seq"));
  input.setName(request.getParameter("name"));
  input.setPassword(request.getParameter("password"));
  input.setEmail(request.getParameter("email"));
  input.setAddress(request.getParameter("address"));
  
  MemberDAO dao = new MemberDAO();
  int flag = dao.userModify(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml %>
```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/cupertino/jquery-ui.css">
<style type="text/css">
  body { font-size: 80%; }
  
  label, input { display:block; }
  input.text { margin-bottom:12px; width:95%; padding: .4em; }
  fieldset { padding:0; border:0; margin-top:25px; }
  h1 { font-size: 1.2em; margin: .6em 0; }
  div#users-contain { width: 700px; margin: 20px 0; }
  div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
  div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
  .ui-dialog .ui-state-error { padding: .3em; }
  .validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
  $( document ).ready( function() {
    
    listServer();
    
    $( '#write-form' ).dialog({
      autoOpen: false,
      modal: true,
      width: 350,
      height: 400,
      resizable: false,
      buttons: {
        '취소': function() {
          $( this ).dialog( 'close' );
          $('#w_name').val('');
          $('#w_password').val('');
          $('#w_email').val('');
          $('#w_address').val('');
        },
        '추가': function() {
          writeServer();
        }
      }
    });
    
    $( '#btn1' ).button().on( 'click', function() {
      $( '#write-form' ).dialog( 'open' ); 
    });
    
    $('#delete-form').dialog({
      autoOpen : false,
      modal : true,
      width : 300,
      height : 350,
      resizable : false,
      buttons : {
        '취소' : function() {
          $(this).dialog('close');
          $('#d_password').val('');
        },
        '삭제' : function() {
          deleteServer();
        }
      }
    });
    
    $('#modify-form').dialog({
      autoOpen : false,
      modal : true,
      width : 400,
      height : 500,
      resizable : false,
      buttons : {
        '취소' : function() {
          $(this).dialog('close');
          $('#m_password').val('');
        },
        '수정' : function() {
          modifyServer();
        }
      }
    });
    
  });
  
  const listServer = function() {
    $.ajax({
      url : './data/user_list.jsp',
      type : 'get',
      dataType : 'xml',
      success : function(xml) {
        // $('#users tbody').empty()
        // append()를 이용해 리스트를 출력하는 경우 비워줘야 한다
        let html = '';
        $(xml).find('user').each(function() {
          // html += '<tr seq="' + $(this).find('seq').text() + '">';
          // 데이터를 쉽게 찾기 위해 특정 속성을 추가시키기도 한다
          html += '<tr>';
          html += '<td>' + $(this).find('seq').text() + '</td>';
          html += '<td>' + $(this).find('name').text() + '</td>';
          html += '<td>' + $(this).find('email').text() + '</td>';
          html += '<td>' + $(this).find('address').text() + '</td>';
          html += '<td>';
          html += '<button onclick="modifyBtn(' + $(this).find('seq').text() + ', \'' + $(this).find('name').text() + '\', \'' + $(this).find('email').text() + '\', \'' + $(this).find('address').text() + '\')">수정</button>'

          // html += '<button onclick="modifyBtn1(' + $(this).find('seq').text() + ')">수정</button>'

          html += '<button onclick="deleteBtn(' + $(this).find('seq').text() + ')">삭제</button>'
          html += '</td>';
          html += '</tr>';
        });
        
        // $('#users tbody').append(html);
        $('#users tbody').html(html);

        $('button').button();
      },
      error : function(err) {
        alert('에러 : ' + err.message)
      }
    });
  };
  
  const writeServer = function() {
    $.ajax({
      url : './data/user_write.jsp',
      type : 'get',
      data : {
        name : $('#w_name').val(),
        password : $('#w_password').val(),
        email : $('#w_email').val(),
        address : $('#w_address').val()
      },
      dataType : 'xml',
      success : function(xml) {
        if($('#w_name').val() == '' || $('#w_password').val() == '' || $('#w_email').val() == '' || $('#w_address').val() == ''){
          alert('입력하지 않은 영역이 있습니다');
          return;
        }
        
        const flag = $(xml).find('flag').text();
        if(flag == 0){
          alert('회원 등록 성공');
          listServer();
          
          $('#w_name').val('');
          $('#w_password').val('');
          $('#w_email').val('');
          $('#w_address').val('');
          
          $('#write-form').dialog('close');
        }else{
          alert('회원 등록 실패');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.message);							
      }
    });
  };
  
  const deleteBtn = function(seq) {
    $('#d_seq').val(seq);
    
    $('#delete-form').dialog('open');
  };
  
  const modifyBtn = function(seq, name, email, address) {
    $('#m_seq').val(seq);
    $('#m_name').val(name);
    $('#m_email').val(email);
    $('#m_address').val(address);
    
    $('#modify-form').dialog('open');
  };

  <!-- html 파싱을 통해 값을 얻어오는 방법
  const modifyBtn1 = function(seq) {
    $('#m_seq').val(seq);
    $('#m_name').val($('tbody > tr > td:contains('+ seq +')').parent().children().eq(1).text());
    $('#m_email').val($('tbody > tr > td:contains('+ seq +')').parent().children().eq(2).text());
    $('#m_address').val($('tbody > tr > td:contains('+ seq +')').parent().children().eq(3).text());
    
    $('#modify-form').dialog('open');
  }; 
  -->
  
  const deleteServer = function() {
    $.ajax({
      url : './data/user_delete.jsp',
      type : 'get',
      data : {
        seq : $('#d_seq').val(),
        password : $('#d_password').val()
      },
      dataType : 'xml',
      success : function(xml) {
        if($('#d_password').val() == ''){
          alert('비밀번호를 입력해주세요');
          return;
        }
        const flag = $(xml).find('flag').text();
        if(flag == 0){
          alert('회원 삭제 성공');
          listServer();
          $('#delete-form').dialog('close');
        }else if(flag == 1){
          alert('비밀번호 오류');
          $('#d_password').val('');
        }else{
          alert('회원 삭제 실패');
          $('#d_password').val('');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.status);
      }
    })
  };
  
  const modifyServer = function() {
    $.ajax({
      url : './data/user_modify.jsp',
      type : 'get',
      data : {
        seq : $('#m_seq').val(),
        name : $('#m_name').val(),
        password : $('#m_password').val(),
        email : $('#m_email').val(),
        address : $('#m_address').val()
      },
      success : function(xml) {
        if($('#m_password').val() == ''){
          alert('비밀번호를 입력해주세요');
          return;
        }
        const flag = $(xml).find('flag').text();
        if(flag == 0){
          alert('수정 성공');
          listServer();
          $('#m_password').val('');
          $('#modify-form').dialog('close');
        }else if(flag == 1){
          alert('비밀번호 오류');
          $('#m_password').val('');
        }else{
          alert('정보 수정 실패');
          $('#m_password').val('');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.status)
      }
    })
  };
  
  
</script>
</head>
<body>

<button id="btn1">사용자 추가</button>

<br /><hr /><br />

<div id="users-contain" class="ui-widget">
  <h1>Existing Users:</h1>
  <table id="users" class="ui-widget ui-widget-content">
  <thead>
    <tr class="ui-widget-header ">
      <th>Seq</th>
      <th>Name</th>
      <th>Email</th>
      <th>Address</th>
      <th>비고</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
  </table>
</div>

<div id="write-form" title="Insert new user">
  <p class="validateTips">All form fields are required.</p>
   <form>
    <fieldset>
      <label for="w_name">Name</label>
      <input type="text" id="w_name" value="" class="text ui-widget-content ui-corner-all" />
      <label for="w_password">Password</label>
      <input type="password" id="w_password" value="" class="text ui-widget-content ui-corner-all" />
      <label for="w_email">Email</label>
      <input type="text" id="w_email" value="" class="text ui-widget-content ui-corner-all" />
      <label for="w_address">Address</label>
      <input type="text" id="w_address" value="" class="text ui-widget-content ui-corner-all" />
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
    </fieldset>
  </form>
</div>

<div id="delete-form" title="Delete user">
   <form>
    <fieldset>
      <label for="d_seq">Seq</label>
      <input type="text" id="d_seq" class="text ui-widget-content ui-corner-all" readonly="readonly" />
      <label for="d_password">Password</label>
      <input type="password" id="d_password" class="text ui-widget-content ui-corner-all" />
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
    </fieldset>
  </form>
</div>

<div id="modify-form" title="Modify user">
   <form>
    <fieldset>
      <label for="m_seq">Seq</label>
      <input type="text" id="m_seq" class="text ui-widget-content ui-corner-all" readonly="readonly" />
      <label for="m_name">Name</label>
      <input type="text" id="m_name" class="text ui-widget-content ui-corner-all" readonly="readonly" />
      <label for="m_password">Password</label>
      <input type="password" id="m_password" class="text ui-widget-content ui-corner-all" />
      <label for="m_email">Email</label>
      <input type="text" id="m_email" class="text ui-widget-content ui-corner-all" />
      <label for="m_address">Address</label>
      <input type="text" id="m_address" class="text ui-widget-content ui-corner-all" />
      <input type="submit" tabindex="-1" style="position:absolute; top:-1000px" />
    </fieldset>
  </form>
</div>

</body>
</html>
```

##### menu()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  .ui-menu{
    width : 200px;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#menu').menu({
      select : function() {
        console.log($('select'));
      }
    });
  });
</script>
</head>
<body>

<ul id="menu">
  <li class="ui-state-disabled"><div>Toys (n/a)</div></li>
  <li><div>Books</div></li>
  <li><div>Clothing</div></li>
  <li><div>Electronics</div>
    <ul>
      <li class="ui-state-disabled"><div>Home Entertainment</div></li>
      <li><div>Car Hifi</div></li>
      <li><div>Utilities</div></li>
    </ul>
  </li>
  <li><div>Movies</div></li>
  <li><div>Music</div>
    <ul>
      <li><div>Rock</div>
        <ul>
          <li><div>Alternative</div></li>
          <li><div>Classic</div></li>
        </ul>
      </li>
      <li><div>Jazz</div>
        <ul>
          <li><div>Freejazz</div></li>
          <li><div>Big Band</div></li>
          <li><div>Modern</div></li>
        </ul>
      </li>
      <li><div>Pop</div></li>
    </ul>
  </li>
  <li class="ui-state-disabled"><div>Specials (n/a)</div></li>
</ul>

</body>
</html>
```
###### category 추가
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  .ui-menu{
    width : 200px;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#menu').menu({
      items : '> :not(.ui-widget-header)',
      select : function() {
        console.log('select');
      }
    });
  });
</script>
</head>
<body>

<ul id="menu">
  <li class="ui-widget-header"><div>category 1</div></li>
  <li class="ui-state-disabled"><div>Toys (n/a)</div></li>
  <li><div>Books</div></li>
  <li><div>Clothing</div></li>
  <li><div>Electronics</div>
    <ul>
      <li class="ui-state-disabled"><div>Home Entertainment</div></li>
      <li><div>Car Hifi</div></li>
      <li><div>Utilities</div></li>
    </ul>
  </li>
  <li class="ui-widget-header"><div>category 2</div></li>
  <li><div>Movies</div></li>
  <li><div>Music</div>
    <ul>
      <li><div>Rock</div>
        <ul>
          <li><div>Alternative</div></li>
          <li><div>Classic</div></li>
        </ul>
      </li>
      <li><div>Jazz</div>
        <ul>
          <li><div>Freejazz</div></li>
          <li><div>Big Band</div></li>
          <li><div>Modern</div></li>
        </ul>
      </li>
      <li><div>Pop</div></li>
    </ul>
  </li>
  <li class="ui-state-disabled"><div>Specials (n/a)</div></li>
</ul>

</body>
</html>
```
###### icon 주기
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  .ui-menu{
    width : 150px;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#menu').menu({
      items : '> :not(.ui-widget-header)',
      select : function() {
        console.log('select');
      }
    });
  });
</script>
</head>
<body>

<ul id="menu">
  <li>
    <div><span class="ui-icon ui-icon-disk"></span>Save</div>
  </li>
  <li>
    <div><span class="ui-icon ui-icon-zoomin"></span>Zoom In</div>
  </li>
  <li>
    <div><span class="ui-icon ui-icon-zoomout"></span>Zoom Out</div>
  </li>
  <li class="ui-state-disabled">
    <div><span class="ui-icon ui-icon-print"></span>Print...</div>
  </li>
  <li>
    <div>Playback</div>
    <ul>
      <li>
        <div><span class="ui-icon ui-icon-seek-start"></span>Prev</div>
      </li>
      <li>
        <div><span class="ui-icon ui-icon-stop"></span>Stop</div>
      </li>
      <li>
        <div><span class="ui-icon ui-icon-play"></span>Play</div>
      </li>
      <li>
        <div><span class="ui-icon ui-icon-seek-end"></span>Next</div>
      </li>
    </ul>
  </li>
  <li>
    <div>Learn more about this menu</div>
  </li>
</ul>

</body>
</html>
```
##### tabs()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  
  .ui-tabs{
    width : 50%;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#tabs').tabs();
    $('#btn').button().on('click', function() {
      let html = '<li><a href="#tabs-4">추가</a></li>';
      $('#tabs > ul').append(html);	
      
      html = '<div id="tabs-4"><p>추가내용1</p><p>추가내용2</p></div>';
      $('#tabs').append(html);
      
      $('#tabs').tabs('refresh');
    });
  });
</script>
</head>
<body>

<button id="btn">추가</button>
<br><hr><br>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Nunc tincidunt</a></li>
    <li><a href="#tabs-2">Proin dolor</a></li>
    <li><a href="#tabs-3">Aenean lacinia</a></li>
  </ul>
  <div id="tabs-1">
    <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
  </div>
  <div id="tabs-2">
    <p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
  </div>
  <div id="tabs-3">
    <p>Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a, lacus.</p>
    <p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit hendrerit.</p>
  </div>
</div>
 
</body>
</html>
```
##### tooltip()
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/cupertino/jquery-ui.css">
<style type="text/css">
  body{
    font-size : 80%;
  }
  
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
    $(document).tooltip();
  });
</script>
</head>
<body>

<p><a href="#" title="That&apos;s what this widget is">Tooltips</a> can be attached to any element. When you hover
the element with your mouse, the title attribute is displayed in a little box next to the element, just like a native tooltip.</p>
<p>But as it&apos;s not a native tooltip, it can be styled. Any themes built with
<a href="http://jqueryui.com/themeroller/" title="ThemeRoller: jQuery UI&apos;s theme builder application">ThemeRoller</a>
will also style tooltips accordingly.</p>
<p>Tooltips are also useful for form elements, to show some additional information in the context of each field.</p>
<p><label for="age">Your age:</label><input id="age" title="We ask for your age only for statistical purposes."></p>
<p>Hover the field to see the tooltip.</p>
 
</body>
</html>
```

#### jQuery 게시판

- 테이블 생성 구문

```sql
create table board (
  seq int primary key auto_increment,
  name varchar(20) not null,
  password varchar(20) not null,
  email varchar(50),
  subject varchar(30) not null,
  content varchar(2000),
  wip varchar(15) not null,
  wdate datetime not null
);
```

- 데이터 삽입 구문
```sql
insert into board values (0, '홍길동', '1234', 'test@test.com', '제목', '내용', '000.000.000.000', now());
```

- protocol

  - 데이터 형식 : xml

  - 표

    |기능|페이지|보내는 데이터|받는 데이터|데이터 형식|
    |:--:|:--:|:--:|:--:|:--:|
    |글 목록|board_list.jsp|X|seq<br>name<br>wip<br>wdate('%Y-%m-%d')<br>wgap<br>subject<br>content|\<posts>\<post>\<seq>...\</seq>\<name>...|
    |글 쓰기|board_write.jsp|name<br>password<br>email(mail1, mail2)<br>subject<br>content|flag| \<flag>...\</flag>|
    |글 삭제|board_delete.jsp|seq<br>password|flag| \<flag>...\</flag>|
    |글 수정|board_modify.jsp|seq<br>password<br>email(mail1, mail2)<br>subject<br>content|flag| \<flag>...\</flag>|

- 페이지 흐름도

  - 게시글 추가 
    
    <b>화면 &rarr; 글 쓰기 &rarr; board_write.jsp &rarr; 성공 &rarr; board_list.jsp &rarr; 게시글 리스트 출력</b>

  - 게시글 삭제 
  
    <b>특정 게시글 활성화 &rarr; 삭제 &rarr; 비밀번호 입력 &rarr; board_delete.jsp &rarr; 성공 &rarr; board_list.jsp &rarr; 게시글 리스트 출력</b>

  - 게시글 수정 
  
    <b>특정 게시글 활성화 &rarr; 수정 &rarr; 수정 내용 입력 &rarr; board_modify.jsp &rarr; 성공 &rarr; board_list.jsp &rarr; 게시글 리스트 출력</b>

- 구현하기
```xml
<!-- cotext.xml -->
<?xml version="1.0" encoding="utf-8" ?>
<Context>
  <Resource
    name="jdbc/mariadbProject"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="org.mariadb.jdbc.Driver"
    url="jdbc:mariadb://localhost:3306/project"
    username="root"
    password="123456"
  />
</Context>
```
```java
// BoardTO.java
package model1;

public class BoardTO {
  private String seq;
  private String name;
  private String password;
  private String email;
  private String subject;
  private String content;
  private String wip;
  private String wdate;
  private String wgap;
  
  public String getWgap() {
    return wgap;
  }
  public void setWgap(String wgap) {
    this.wgap = wgap;
  }
  public String getSeq() {
    return seq;
  }
  public void setSeq(String seq) {
    this.seq = seq;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getSubject() {
    return subject;
  }
  public void setSubject(String subject) {
    this.subject = subject;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getWip() {
    return wip;
  }
  public void setWip(String wip) {
    this.wip = wip;
  }
  public String getWdate() {
    return wdate;
  }
  public void setWdate(String wdate) {
    this.wdate = wdate;
  }
  
}

// BoardDAO.java
package model1;

import java.sql.Connection;
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
    try {
      Context initCtx = (Context)new InitialContext();
      Context envCtx = (Context)initCtx.lookup("java:comp/env");
      DataSource dataSource = (DataSource)envCtx.lookup("jdbc/mariadbProject");
      
      conn = dataSource.getConnection();
    } catch (NamingException e) {
      System.out.println("에러 : " + e.getMessage());
    } catch (SQLException e) {
      System.out.println("에러 : " + e.getMessage());
    }
  }
  
  public List<BoardTO> boardList(){
    List<BoardTO> datas = new ArrayList<>();
    
    String sql = "select email, seq, name, wip, datediff(now(), wdate) wgap, date_format(wdate, '%Y-%m-%d') wdate, subject, content from board";
    
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      
      while(rs.next()) {
        BoardTO data = new BoardTO();
        data.setEmail(rs.getString("email"));
        data.setSeq(rs.getString("seq"));
        data.setName(rs.getString("name"));
        data.setWip(rs.getString("wip"));
        data.setWgap(rs.getString("wgap"));
        data.setWdate(rs.getString("wdate"));
        data.setSubject(rs.getString("subject"));
        data.setContent(rs.getString("content"));
        
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
  
  public int boardWrite(BoardTO input) {
    int flag = 1;
    
    String sql = "insert into board values (0, ?, ?, ?, ?, ?, ?, now())";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getName());
      pstmt.setString(2, input.getPassword());
      pstmt.setString(3, input.getEmail());
      pstmt.setString(4, input.getSubject());
      pstmt.setString(5, input.getContent());
      pstmt.setString(6, input.getWip());

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
  
  public int boardDelete(BoardTO input) {
    int flag = 2;
    
    String sql = "delete from board where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSeq());
      pstmt.setString(2, input.getPassword());
      
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
  
  public int boardModify(BoardTO input) {
    int flag = 2;
    
    String sql = "update board set subject = ?, name = ?, email = ?, content = ? where seq = ? and password = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, input.getSubject());
      pstmt.setString(2, input.getName());
      pstmt.setString(3, input.getEmail());
      pstmt.setString(4, input.getContent());
      pstmt.setString(5, input.getSeq());
      pstmt.setString(6, input.getPassword());
      
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
}

```
```jsp
<!-- board_list.jsp -->
<%@page import="model1.BoardTO"%>
<%@page import="java.util.List"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardDAO dao = new BoardDAO();

  List<BoardTO> datas = dao.boardList();
  StringBuilder sbXml = new StringBuilder();
  
  sbXml.append("<posts>");
  for(BoardTO data : datas){
    sbXml.append("<post>");
    sbXml.append("<email>" + data.getEmail() + "</email>");
    sbXml.append("<seq>" + data.getSeq() + "</seq>");
    sbXml.append("<name>" + data.getName() + "</name>");
    sbXml.append("<wip>" + data.getWip() + "</wip>");
    sbXml.append("<wdate>" + data.getWdate() + "</wdate>");
    sbXml.append("<wgap>" + data.getWgap() + "</wgap>");
    sbXml.append("<subject>" + data.getSubject() + "</subject>");
    sbXml.append("<content>" + data.getContent() + "</content>");
    sbXml.append("</post>");
  }
  sbXml.append("</posts>");
%>
<%= sbXml %>

<!-- board_write.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");
  
  BoardTO	input = new BoardTO();
  input.setName(request.getParameter("name"));
  input.setPassword(request.getParameter("password"));
  String email = "";
  if(request.getParameter("mail1") != null && request.getParameter("mail2") != null && !request.getParameter("mail1").trim().equals("") && !request.getParameter("mail2").trim().equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  input.setEmail(email);
  input.setSubject(request.getParameter("subject"));
  input.setContent(request.getParameter("content"));
  input.setWip(request.getRemoteAddr());
  
  BoardDAO dao = new BoardDAO();
  int flag = dao.boardWrite(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml %>

<!-- board_delete.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");

  BoardTO input = new BoardTO();
  input.setSeq(request.getParameter("seq"));
  input.setPassword(request.getParameter("password"));
  
  BoardDAO dao = new BoardDAO();
  int flag = dao.boardDelete(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml %>

<!-- board_modify.jsp -->
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
  request.setCharacterEncoding("utf-8");
  BoardTO input = new BoardTO();
  input.setSeq(request.getParameter("seq"));
  input.setSubject(request.getParameter("subject"));
  input.setName(request.getParameter("name"));
  input.setPassword(request.getParameter("password"));
  input.setContent(request.getParameter("content"));
  String email = "";
  if(request.getParameter("mail1") != null && request.getParameter("mail2") != null && !request.getParameter("mail1").equals("") && !request.getParameter("mail2").equals("")){
    email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
  }
  input.setEmail(email);
  
  BoardDAO dao = new BoardDAO();
  int flag = dao.boardModify(input);
  
  StringBuilder sbXml = new StringBuilder();
  sbXml.append("<flag>");
  sbXml.append(flag);
  sbXml.append("</flag>");
%>
<%= sbXml %> 

```
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/blitzer/jquery-ui.css" />
<style type="text/css">
  body { font-size: 80%; }
  
  #accordion > div > div:last-child { text-align: right; }
  #accordion-resizer {
    margin: 0 60px;
    max-width: 1500px;
  }
  #btngroup {
    text-align: right;
  }
  #btngroup button {
  margin: 3px;
    padding: 3px;
    width: 100px;
  }
  label.header {
    font-size: 10pt;
    margin-right: 5px;
  }
  input.text {
    width: 80%;
    margin-bottom: 12px;
    padding: 0.4em;
  }
  input.mail1 {
    width: 45%;
    margin-bottom: 12px;
    padding: 0.4em;
  }
  input.mail2 {
    width: 30%;
    margin-bottom: 12px;
    padding: 0.4em;
  }
  fieldset {
    margin-left: 15px;
    margin-top: 15px;
    border: 0;
  }
</style>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript">
  $( document ).ready(() => {
    $( '#writeDialog' ).css( 'display', 'none' );
    $( '#modifyDialog' ).css( 'display', 'none' );
    $( '#deleteDialog' ).css( 'display', 'none' );
    
    const readServer = () => {
      $( '#accordion' ).accordion({
        collapsible: 'true',
        heightStyle: 'content'
      });
      $( 'button.action' ).button();
    };
    
    readServer();
    
    listServer();
    // 페이지 처음 실행시 목록 출력
    
    $( document ).on( 'click', 'button.action', function() {
      if( $( this ).attr( 'action' ) == 'write' ) {
        $( '#writeDialog' ).dialog ({
          width: 900,
          height: 500,
          modal: true,
          buttons: {
            '쓰기': function() {
              if($('#w_subject').val().trim() == ''){
                alert('제목을 입력하세요');
                return false;
              }
              if($('#w_writer').val().trim() == ''){
                alert('글쓴이를 입력하세요');
                return false;
              }
              if($('#w_password').val().trim() == ''){
                alert('비밀번호를 입력하세요');
                return false;
              }
              // 필수요소 입력 확인
              writeServer();
            },
            '취소': function() {
              $('#w_writer').val('');
              $('#w_password').val('');
              $('#w_mail1').val('');
              $('#w_mail2').val('');
              $('#w_subject').val('');
              $('#w_content').val('');
              // 입력한 모든 값 초기화
              
              $( this ).dialog( 'close' );
            }
          }
        });
      } else if( $( this ).attr( 'action' ) == 'modify' ) {
        $( '#modifyDialog' ).dialog({
          width: 900,
          height: 500,
          modal: true,
          buttons: {
            '수정': function() {
              if($('#m_password').val().trim() == ''){
                alert('비밀번호를 입력하세요');
                return false;
              }
              // 필수요소 입력 확인
              modifyServer();
            },
            '취소': function() {
              $('#m_password').val('');
              // 입력한 값 초기화
              $( this ).dialog( 'close' );
            }
          }
        });
      } else if( $( this ).attr( 'action' ) == 'delete' ) {
        $( '#deleteDialog' ).dialog({
          width: 900,
          height: 240,
          modal: true,
          buttons: {
            '삭제': function() {
              if($('#d_password').val().trim() == ''){
                alert('비밀번호를 입력하세요');
                return false;
              }
              // 필수요소 입력 확인
              deleteServer();
            },
            '취소': function() {
              $('#d_password').val('');
              // 입력한 값 초기화
              $( this ).dialog( 'close' );
            }
          }
        });
      } else {
      }
    });
  });
  
  const listServer = function() {
    $.ajax({
      url : './data/board_list.jsp',
      type : 'get',
      dataType : 'xml',
      success : function(xml) {
        let lists = '';
        $(xml).find('post').each(function() {
          lists += '<h3>' + $(this).find('seq').text() + ' : ' + $(this).find('name').text() + '(' + $(this).find('wip').text() + ')';
          if($(this).find('wgap').text() == 0){
            lists += '&nbsp;&nbsp;new !!';
          }
          lists += '</h3>';
          lists += '<div seq=' + $(this).find('seq').text() + '>';
          lists += '<input type="hidden" value="' +  $(this).find('email').text() + '">';
          lists += '<input type="hidden" value="' +  $(this).find('name').text() + '">';
          lists += '<div>' + $(this).find('wdate').text() + '</div>';
          lists += '<div>' + $(this).find('subject').text() + '</div>';
          lists += '<br />';
          lists += '<hr noshade="noshade" />';
          lists += '<div>' + $(this).find('content').text() + '</div>';
          lists += '<br />';
          lists += '<hr noshade="noshade" />';
          lists += '<br />';
          lists += '<div>';
          lists += '<button idx="1" action="modify" class="action" onclick="modifyBtn(' + $(this).find('seq').text() + ')">수정</button>&nbsp;&nbsp;';
          lists += '<button idx="1" action="delete" class="action" onclick="deleteBtn(\'' + $(this).find('subject').text() + '\',' + $(this).find('seq').text() + ')">삭제</button>';
          lists += '</div>';       
          lists += '</div>';
        });
        
        $('#accordion').html(lists);
        
        $('#accordion').accordion('refresh');
        
        $('button').button();
      },
      error : function(err) {
        alert('에러 : ' + err.status)
      }
    });
  };
  
  const deleteBtn = function(subject, seq) {
    $('#d_subject').val(subject);
    $('#d_seq').val(seq);
  }
  
  const modifyBtn = function(seq) {
    $('#m_seq').val(seq);
    $('#m_subject').val($('#accordion > div').filter('[seq=' + seq + ']').find('div').eq(1).text());
    $('#m_content').val($('#accordion > div').filter('[seq=' + seq + ']').find('div').eq(2).text());
    $('#m_writer').val($('#accordion > div').filter('[seq=' + seq + ']').find('input').eq(1).val());
    const email = $('#accordion > div').filter('[seq=' + seq + ']').find('input').eq(0).val().split('@');
    $('#m_mail1').val(email[0]);
    $('#m_mail2').val(email[1]);
  }
  
  const writeServer = function() {
    $.ajax({
      url : './data/board_write.jsp',
      type : 'get',
      dataType : 'xml',
      data : {
        name : $('#w_writer').val(),
        password : $('#w_password').val(),
        mail1 : $('#w_mail1').val(),
        mail2 : $('#w_mail2').val(),
        subject : $('#w_subject').val(),
        content : $('#w_content').val()
      },
      success : function(xml) {
        const flag = $(xml).find('flag').text();
        
        if(flag == 0){
          alert('글쓰기 성공');
          
          $('#w_writer').val('');
          $('#w_password').val('');
          $('#w_mail1').val('');
          $('#w_mail2').val('');
          $('#w_subject').val('');
          $('#w_content').val('');
          
          $('#writeDialog').dialog( 'close' );
          
          listServer();
          $('#accordion').accordion('refresh');
        } else{
          alert('글쓰기 실패');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.status);	
      }
    });
  };
  
  const deleteServer = function() {
    $.ajax({
      url : './data/board_delete.jsp',
      type : 'get',
      data : {
        seq : $('#d_seq').val(),
        password : $('#d_password').val()
      },
      dataType : 'xml',
      success : function(xml) {
        const flag =$(xml).find('flag').text()
        
        if(flag == 0){
          alert('글 삭제 성공');
          $('#d_password').val('');
          $('#deleteDialog').dialog('close');	
        
          listServer();
          $('#accordion').accordion('refresh');
        }else if(flag == 1){
          alert('비밀번호 오류');
          $('#d_password').val('');
        }else{
          alert('글 삭제 실패');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.status);
      }
    });
  };
  
  const modifyServer = function() {
    $.ajax({
      url : './data/board_modify.jsp',
      type : 'get',
      data : {
        seq : $('#m_seq').val(),
        name : $('#m_writer').val(),
        mail1 : $('#m_mail1').val(),
        mail2 : $('#m_mail2').val(),
        subject : $('#m_subject').val(),
        password : $('#m_password').val(),
        subject : $('#m_subject').val(),
        content : $('#m_content').val()
      },
      dataType : 'xml',
      success : function(xml) {
        const flag = $(xml).find('flag').text();
        
        if(flag == 0){
          alert('글 수정 성공');
          $('#m_password').val('');
          $('#modifyDialog').dialog('close');
          
          listServer();
          $('#acccordion').accordion('fresh');
          
        }else if(flag == 1){
          alert('비밀번호 오류');
          $('#m_password').val('');
        }else {
          alert('글 수정 실패');
          $('#m_password').val('');
        }
      },
      error : function(err) {
        alert('에러 : ' + err.status);
      }
    })
  };
</script>
</head>
<body>

<div id="accordion-resizer">
  <hr noshade="noshade" />
  <div id="accordion">
    <h3>1 : 글쓴이(0) new</h3>
    <div>
      <div>2016-02-01</div>
      <div>제목 1</div>
      <br />
      <hr noshade="noshade" />
      <div>내용 1</div>
      <br />
      <hr noshade="noshade" />
      <br />
      <div>
        <button idx="1" action="modify" class="action">수정</button>
        <button idx="1" action="delete" class="action">삭제</button>
      </div>       
    </div>
    <h3>2 : 글쓴이(0) new</h3>
    <div>
      <div>2016-02-01</div>
      <div>제목 2</div>
      <br />
      <hr noshade="noshade" />
      <div>내용 2</div>
      <br />
      <hr noshade="noshade" />
      <br />
      <div>
        <button idx="2" action="modify" class="action">수정</button>
        <button idx="2" action="delete" class="action">삭제</button>
      </div>       
    </div>
  </div>
  <hr noshade="noshade" />
  <div id="btngroup">
    <button action="write" class="action">글쓰기</button>
  </div>
</div>
<div id="writeDialog" title="글쓰기">   
  <fieldset>
    <div>
      <label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
      <input type="text" id="w_subject" class="text ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
      <input type="text" id="w_writer" class="text ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
      <input type="text" id="w_mail1" class="mail1 ui-widget-content ui-corner-all"/>
      @
      <input type="text" id="w_mail2" class="mail2 ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="password" class="header">비밀&nbsp;번호</label>
      <input type="password" id="w_password" class="text ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
      <br /><br />
      <textarea rows="15" cols="100" id="w_content" class="text ui-widget-content ui-corner-all"></textarea>
    </div>
  </fieldset>
</div>
<div id="modifyDialog" title="글수정">   
  <fieldset>
    <div>
      <label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
      <input type="text" id="m_subject" class="text ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="writer" class="header">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
      <input type="text" id="m_writer" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
    </div>
    <div>
      <label for="mail" class="header">메&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</label>
      <input type="text" id="m_mail1" class="mail1 ui-widget-content ui-corner-all"/>
      @
      <input type="text" id="m_mail2" class="mail2 ui-widget-content ui-corner-all"/>
    </div>
    <div>
      <label for="password" class="header">비밀&nbsp;번호</label>
      <input type="password" id="m_password" class="text ui-widget-content ui-corner-all"/>
      <input type="hidden" id="m_seq">
    </div>
    <div>
      <label for="content" class="header">본&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;문</label>
      <br /><br />
      <textarea rows="15" cols="100" id="m_content" class="text ui-widget-content ui-corner-all"></textarea>
    </div>
  </fieldset>
</div>
<div id="deleteDialog" title="글삭제">   
  <fieldset>
    <div>
      <label for="subject" class="header">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</label>
      <input type="text" id="d_subject" class="text ui-widget-content ui-corner-all" readonly="readonly"/>
      <input type="hidden" id="d_seq">
    </div>
    <div>
      <label for="password" class="header">비밀&nbsp;번호</label>
      <input type="password" id="d_password" class="text ui-widget-content ui-corner-all"/>
    </div>
  </fieldset>
</div>

</body>
</html>

```
