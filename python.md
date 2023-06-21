# Python

<small> https://wikidocs.net </small>
- 제작자 : 귀도 반 로섬

- c언어와 연결성이 좋다

- 다른 언어에 비해 느리기 때문에 아직은 기업용으로 사용하기 어렵다

- 프로그램하기 쉬운 언어

- 세미콜론(;)을 사용하지 않고 엔터키로 문장을 구분한다

- 구현할 수 있는 프로그램

  - 윈도우 프로그램 (CUI, GUI)

  - 웹 프로그램
    - django

    - flask

    - ...

  <small> !! 모바일 프로그램은 구현할 수 없다</small>

- 프로그램 분야

  - 업무(사무) 자동화 &rarr; 문서정리

  - 데이터 분석 &rarr; 머신러닝, 딥러닝 &rarr; AI

  - 사물 인터넷 (IOT)

- python은 모든 os가 지원한다

  <small> https://www.python.org 참조</small>

- 개발환경

  - ide : 설정 저장이 가능하다
    - pycharm(intellij)

    <small> https://www.jetbrains.com 참조</small>

    - eclipse + PyDev

    - Vscode

  - web
    - Jupyter Notebook : python 라이브러리를 설치해야 사용할 수 있다

    <small> https://jupyter.org/ 참조</small>

    - Colab (colaboratory) : python을 설치하지 않아도 사용할 수 있다

    <small> https://colab.research.google.com/ 참조</small>

- python 설치

  <small> https://www.python.org 참조</small> 

  !! 데이터 분석용 python (아나콘다)

  <small> https://www.anaconda.com 참조</small>

- 코딩 방식

  - 인터프리터 : 즉각 해석 방식 (ipython)

  ```python
  master@master-virtual-machine:~$ python3
  Python 3.10.6 (main, May 29 2023, 11:10:38) [GCC 11.3.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>> 1 + 1
  2
  >>> exit()
  ```

  - 파일 저장 : 특정 파일 생성 후 실행

## 기본

<small> https://docs.python.org/ko/3/tutorial/index.html 참조</small>

  - 세미콜론(;)을 사용하지 않는다

  - 들여쓰기를 상황에 맞게 해야 문법적 에러가 생기지 않는다

  - 문자열을 표현할 때 작은 따옴표도 사용할 수 있다

  - '+' 이외에도 ','로 문자열을 연결시킬 수 있다

    <small> 단, ','로 연결할 시 공백이 포함되어 단어를 구분한다</small>

  ```python
  print("Hello python" , end="-")
  # 엔터키가 아닌 '-'로 문자열을 구분해 출력한다
  print("Hello python")
  print("Hello python")

  # 출력 결과
  master@master-virtual-machine:~/python$ python3 ex02.py 
  Hello python-Hello python
  Hello python
  ```

  - 주석
    - '#' : 한줄 주석

    - \' ''' \' : 여러 줄 주석

- 변수, 상수 선언시 자료형을 따로 적어주지 않는다

  <small> python은 자료형이 없고 모두 객체로 취급한다</small>
```python
num1 = 10
num2 = 20

print(num1, num2)
print(num1 + num2)
print(id(num1))
print(id(num2))

# 출력 결과
master@master-virtual-machine:~/python$ python3 ex03.py 
10 20
30
139872786825744 # 주소값 출력
139872786826064
```
```python
# 진리값 : True / False
# true, false는 사용할 수 없다
bool1 = True
bool2 = False

print(bool1, bool2)

print(type(bool1))

# 출력 결과
master@master-virtual-machine:~/python$ python3 ex05.py 
True False
<class 'bool'>
```
```python
# 정수형 - 진수
# 실수형 - 소수점, 지수

num1 = 123
num2 = -178
num3 = 1.2
num4 = 4.34e10
num5 = 0b1010
num6 = 0o177
num7 = 0x8ff

print(num1, num2, num3, num4, num5, num6, num7)

# 출력 결과
master@master-virtual-machine:~/python$ python3 number01.py 
123 -178 1.2 43400000000.0 10 127 2303

```

- 연산자
```python
# 산술 연산자
num1 = 4
num2 = 3

print(num1 + num2)
print(num1 - num2)
print(num1 * num2)
print(num1 / num2)

print(num1 // num2) # 몫
print(num1 % num2) # 나머지

print(num1 ** num2) # 지수승

# 형변환
print(int('1'))
print(float('1'))

# 출력 결과
master@master-virtual-machine:~/python$ python3 number02.py 
7
1
12
1.3333333333333333
1
1
64
1
1.0

```
```python
str1 = "Hello"
str2 = 'Hello'

print(str1)
print(str2)

str3 = '''Hello
Python'''

print(str3)

str4 = '\t탭\n다음줄'
print(str4)

# 문자열 연산
print("Hello" + "Python")
print("Hello" , "python")
print("Hello" * 2)

# 문자열 조작 : 인덱싱 / 슬라이싱
str = "Life is too short, You need Python"
print(len(str)) # 문자열 길이
print(str[0])
print(str[-1])
print(str[-2])

# str[0] = 'p' !! 에러
# 새로운 데이터 할당은 불가능하다

# 슬라이싱
print(str[0 : 5])
print(str[ : ])
print(str[19 : ])
print(str[ : 17])

data = "20230621흐림"

print(data[ : 4], "년", data[4 : 6], "월", data[6 : 8], "일", "날씨 :", data[8 : ])

# 형식화된 문자열
print('I eat', 'five', 'apples')
print('I eat %s apples' % 'five')

word1 = "six"
word2 = "bananas"

print('I eat %s %s' % (word1, word2))

formattedStr1 = 'I eat %s %s' % (word1, word2)
formattedStr2 = f'I eat {word1} {word2}'

print(formattedStr1)
print(formattedStr2)
print('I eat {0} apples'.format('five'))
print('I eat {0} {1}'.format(word1, word2))

# 출력 결과
master@master-virtual-machine:~/python$ python3 string01.py 
Hello
Hello
Hello
Python
        탭
다음줄
HelloPython
Hello python
HelloHello
34
L
n
o
Life 
Life is too short, You need Python
You need Python
Life is too short
2023 년 06 월 21 일 날씨 : 흐림
I eat five apples
I eat five apples
I eat six bananas
I eat six bananas
I eat six bananas
I eat five apples
I eat six bananas
```

- 키워드 확인
```python
master@master-virtual-machine:~/python$ python3
Python 3.10.6 (main, May 29 2023, 11:10:38) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import keyword
>>> keyword.kwlist
['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']

```

- 특정 함수 도움말 제공
```python
master@master-virtual-machine:~/python$ python3
Python 3.10.6 (main, May 29 2023, 11:10:38) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> dir('hello')
['__add__', '__class__', '__contains__', '__delattr__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__iter__', '__le__', '__len__', '__lt__', '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', 'capitalize', 'casefold', 'center', 'count', 'encode', 'endswith', 'expandtabs', 'find', 'format', 'format_map', 'index', 'isalnum', 'isalpha', 'isascii', 'isdecimal', 'isdigit', 'isidentifier', 'islower', 'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join', 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'removeprefix', 'removesuffix', 'replace', 'rfind', 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines', 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
```
```python
str = 'Life is too short, You need Python'
# 함수
print(len(str)) # 문자열 길이
# 메서드
print(str.count('i')) # 문자열 내부 특정 데이터 개수 파악
print(str.find('t')) # 문자열 내부 특정 데이터 인덱스 값
print(str.index('t')) # 문자열 내부 특정 데이터 인덱스 값
print(str.upper()) # 대문자화
print(str.lower()) # 소문자화
print(str.capitalize()) # 단어의 첫 글자 대문자화
print(str.replace('Life', '인생')) # 특정 문자열 대체
# startwith / endwith
# isdecimal ... isXXX

str1 = '   hi   '
print(':' + str1.lstrip() + ':')
print(':' + str1.rstrip() + ':')
print(':' + str1.strip() + ':')

# 출력 결과
master@master-virtual-machine:~/python$ python3 string02.py 
34
2
8
8
LIFE IS TOO SHORT, YOU NEED PYTHON
life is too short, you need python
Life is too short, you need python
인생 is too short, You need Python
:hi   :
:   hi:
:hi:
```

