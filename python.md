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

- type 확인
```python
print(type(1))
print(type(1.0))
print(type('1'))
print(type(True))

# 출력 결과
master@master-virtual-machine:~/python$ python3 type01.py
<class 'int'>
<class 'float'>
<class 'str'>
<class 'bool'>
```

- 외부에서 입력받은 데이터 출력
```python
# 외부에서 데이터 입력

msg = input('문자열을 입력해주세요 : ')

print("msg :", msg)
print(type(msg))

# 출력 결과
master@master-virtual-machine:~/python$ python3 input01.py 
문자열을 입력해주세요 : hi
msg : hi
<class 'str'>
master@master-virtual-machine:~/python$ python3 input01.py 
문자열을 입력해주세요 : 7
msg : 7
<class 'str'>
```

- 복합 자료형
  - list : 배열
  - set : set

  - tuple : 특이한 형태 배열

  - dictionary : map

```python
list1 = []
list2 = list()

print(type(list1))
print(type(list2))

nList = [1, 2, 3]
sList = ['life', 'is', 'too', 'short']

print(type(nList))
print(type(sList))

print(nList[0])
print(sList[2])

cList = [1, 2, 'life', 'is']

print(cList) # 에러는 나지 않지만 가능하면 사용하지 않는 것이 좋다

# 다차원 배열
n2List1 = [[11, 12, 13], [21, 22, 23], [31, 32, 33]]

print(type(n2List1))
print(type(n2List1[1]))
print(n2List1[0])
print(n2List1[1][2])
print(n2List1[2][1 : ])

# 출력 결과
master@master-virtual-machine:~/python$ python3 list01.py
<class 'list'>
<class 'list'>
<class 'list'>
<class 'list'>
1
too
[1, 2, 'life', 'is']
<class 'list'>
<class 'list'>
[11, 12, 13]
23
[32, 33]
```
```python
list1 = [1, 2, 3]
list2 = [4, 5, 6]

# + / *
sList = list1 + list2
print(sList)

pList = list1 * 2
print(pList)

# 요소 삭제
del list1[0]
print(list1)

del list2[1 : ]
print(list2)

# 출력 결과
master@master-virtual-machine:~/python$ python3 list02.py 
[1, 2, 3, 4, 5, 6]
[1, 2, 3, 1, 2, 3]
[2, 3]
[4]
```

```python
list = [1, 2, 3, 1]
print(len(list))

# 메서드
print(list.count(1))

list.sort()
print(list)

list2 = ['a', 'd', 'c', 'b']
list2.sort() # ASKII code 순으로 정렬
print(list2)

list2.reverse()

list.append(4)
print(list)

list.append([6, 1])
print(list)

print(list2.index('c')) # 해당 문자 위치를 찾아준다

print(list)
list.insert(0, 4)
print(list)

list.remove(4)
print(list)

print(1 in [1, 2, 3, 4])
print(1 not in [1, 2, 3, 4])

# 출력 결과
master@master-virtual-machine:~/python$ python3 list03.py 
4
2
[1, 1, 2, 3]
['a', 'b', 'c', 'd']
[1, 1, 2, 3, 4]
[1, 1, 2, 3, 4, [6, 1]]
1
[1, 1, 2, 3, 4, [6, 1]]
[4, 1, 1, 2, 3, 4, [6, 1]]
[1, 1, 2, 3, 4, [6, 1]]
True
False
```
```python
str = 'a:b:c:d'
list = str.split(':')

print(type(list))
print(list)

str2 = ','.join(list)
print(str2)

print(':'.join('abcd'))

# 출력 결과
master@master-virtual-machine:~/python$ python3 list04.py 
<class 'list'>
['a', 'b', 'c', 'd']
a,b,c,d
a:b:c:d
```
```python
# 문자열 인덱싱
str = 'Hello'
print(str[0])

# str[0] = 'L' 
# !! 에러

list1 = [1, 2, 3]
print(list1[0])

list1[0] = 10
print(list[0])

# 출력 결과
master@master-virtual-machine:~/python$ python3 list05.py 
H
1
list[0]
```
```python
# 중복되지 않는 데이터 / 순서 없음
set1 = {}
set2 = set()

print(type(set1))
print(type(set2))

set3 = set([1, 2, 3, 4, 5])
print(set3)

set4 = set([1, 2, 3, 4, 4, 5, 5, 5, 6])
print(set4)

set5 = {1, 2, 3 ,4, 4, 5, 5, 5, 6}
print(set5)

set6 = set('Hello')
print(set6)

# 출력 결과
master@master-virtual-machine:~/python$ python3 set01.py
<class 'dict'>
<class 'set'>
{1, 2, 3, 4, 5}
{1, 2, 3, 4, 5, 6}
{1, 2, 3, 4, 5, 6}
{'H', 'e', 'o', 'l'}
```

```python
# set - 집합 : 교집합 / 합집합 / 차집합
set1 = {1, 2, 3, 4, 5, 6}
set2 = {4, 5, 6, 7 ,8 ,9}

print(set1.intersection(set2))
print(set1 & set2)

print(set1.union(set2))
print(set1 | set2)

print(set1.difference(set2))
print(set1 - set2)

# 출력 결과
master@master-virtual-machine:~/python$ python3 set02.py
{4, 5, 6}
{4, 5, 6}
{1, 2, 3, 4, 5, 6, 7, 8, 9}
{1, 2, 3, 4, 5, 6, 7, 8, 9}
{1, 2, 3}
{1, 2, 3}
```
- tuple 
```python
# 튜플 - readonly형 데이터
tuple1 = ()
tuple2 = tuple()
print(type(tuple1))
print(type(tuple2))

tuple3 = (1, 2, 3)
print(tuple3)

tuple41 = (1)
tuple42 = (1, )
print(type(tuple41))
print(type(tuple42))

print(tuple3[0])

# 출력 결과
master@master-virtual-machine:~/python$ python3 tuple.py 
<class 'tuple'>
<class 'tuple'>
(1, 2, 3)
<class 'int'>
<class 'tuple'>
1
```
-  다중 할당
```python
data = 10
print(data)

# 다중 할당
data1, data2 = (10, 20)
print(data1, data2)

(data1, data2) = 10, 20
print(data1, data2)

data1, data2 = 10, 20
print(data1, data2)

# 변수 간 값 교환
a = 3
b = 5
a, b = b , a
print(a, b)

[a, b] = [10, 20]
print(a, b)

# 출력 결과
master@master-virtual-machine:~/python$ python3 tuple02.py 
10
10 20
10 20
10 20
5 3
10 20
```

```python
dict1 = {}
dict2 = dict()
print(type(dict1))
print(type(dict2))

# Map(key, value), JSON
dict = {'name' : 'pey', 'phone' : '01111111111'}
print(dict)
print(dict['name'])
print(dict.get('name'))

dict['data1'] = 'value1'
print(dict)

dict['name'] = 'scott'
print(dict)

del dict['data1']
print(dict)

# 출력 결과
master@master-virtual-machine:~/python$ python3 dictionary01.py 
<class 'dict'>
<class 'dict'>
{'name': 'pey', 'phone': '01111111111'}
pey
pey
{'name': 'pey', 'phone': '01111111111', 'data1': 'value1'}
{'name': 'scott', 'phone': '01111111111', 'data1': 'value1'}
{'name': 'scott', 'phone': '01111111111'}
```

## 제어문

- 조건에 의한 분기
  <small> !! 들여쓰기에 주의하자</small>
```python
print('start')

money = True

if money == False :
    # print('실행문장1')
    pass # 이 명령문이 없으면 사용되지 않더라도 에러가 생긴다
else : 
    print('실행문장2')

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 if01.py 
start
실행문장2
end
```
```python
score = 100

if score >= 90 :
    print('A')
else :
    if score >= 80 :
        print('B')
    else :
        if score >= 70 :
            print('C')
        else : 
            if score >= 60 :
                print('D') 
            else :
                print('F')

# 출력 결과
master@master-virtual-machine:~/python$ python3 hakjum.py 
A
```
```python
score = 100

if score >= 90 :
    print('A')
elif score >= 80 :
    print('B')
elif score >= 70 :
    print('C')
elif score >= 60 :
    print('D') 

else :
    print('F')

# 출력 결과
master@master-virtual-machine:~/python$ python3 hakjum.py 
A
```
```python
pocket = ['paper', 'cellphone', 'money']
if 'money' in pocket :
    print('taxi')
else :
    print('walking')

# 출력 결과
master@master-virtual-machine:~/python$ python3 if04.py 
taxi
```
- 반복
```python
list1 = ['one', 'two', 'three']
print(list1[0])
print(list1[1])
print(list1[2])

for list in list1 :
    print(list)

string1 = 'hello'
for char in string1 : 
    print(char)

dict1 = {'name' : 'pey', 'phone' : '0111111111'}
for key in dict1.keys() :
    print(key)
for value in dict1.values() :
    print(value)

# 출력 결과
master@master-virtual-machine:~/python$ python3 for01.py 
one
two
three
one
two
three
h
e
l
l
o
name
phone
pey
0111111111
```
```python
lists = [(1, 2), (3, 4), (5, 6)]
for (first, last) in lists :
    print(first, last)

dict = {'name' : 'pey', 'phone' : '0110001111'}
for key, value in dict.items() :
    print(key, value)

# 출력 결과
master@master-virtual-machine:~/python$ python3 for02.py 
1 2
3 4
5 6
name pey
phone 0110001111
```
```python
print(range(5))
print(range(0, 5))

list = list(range(0, 5))
print(list)

for i in range(0, 5) :
    print(i, end = ' ')

print()

sum = 0
for i in range(1, 11) :
    sum = sum + i

print(sum)

sum = 0
for i in range(1, 101) :
    if i % 3 == 0 :
        sum = sum + i

print(sum)

# 출력 결과
master@master-virtual-machine:~/python$ python3 for03.py 
range(0, 5)
range(0, 5)
[0, 1, 2, 3, 4]
0 1 2 3 4 
55
1683
```
```python
print('start')

for i in range(1, 3) :
    for j in range(1, 3) :
        print(i , j)

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 for04.py 
start
1 1
1 2
2 1
2 2
end
```
```python
print('이름 : ', end='')
name = input()

nameArr = name.split(' ')
for name in nameArr :
    print(name.capitalize(), end=' ')

# 출력 결과
master@master-virtual-machine:~/python$ python3 capitalize.py 
이름 : hong gil dong
Hong Gil Dong 
```

```python
jumin = input('주민등록번호를 입력해주세요 (xxxxxx-xxxxxxx) : ')
jumin = jumin.replace('-', '')
checkList = (2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5)

sum = 0

for i in range(len(checkList)) :
    sum += int(str[i]) * checkList[i]

cnum = (11 - (sum % 11)) % 10
lnum = int(str[-1])

if cnum == lnum :
    print('정확')
else :
    print('부정확')
```
```python
treeHit = 0
while treeHit < 10:
    treeHit = treeHit +1
    print("나무를 %d번 찍었습니다." % treeHit)
    if treeHit == 10:
        print("나무 넘어갑니다.")

# 출력 결과
master@master-virtual-machine:~/python$ python3 while01.py 
나무를 1번 찍었습니다.
나무를 2번 찍었습니다.
나무를 3번 찍었습니다.
나무를 4번 찍었습니다.
나무를 5번 찍었습니다.
나무를 6번 찍었습니다.
나무를 7번 찍었습니다.
나무를 8번 찍었습니다.
나무를 9번 찍었습니다.
나무를 10번 찍었습니다.
나무 넘어갑니다.
```
```python
coffee = 10
money = 300
while money:
    print("돈을 받았으니 커피를 줍니다.")
    coffee = coffee -1
    print("남은 커피의 양은 %d개입니다." % coffee)
    if coffee == 0:
        print("커피가 다 떨어졌습니다. 판매를 중지합니다.")
        break
        
# 출력 결과
master@master-virtual-machine:~/python$ python3 while02.py 
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 9개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 8개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 7개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 6개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 5개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 4개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 3개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 2개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 1개입니다.
돈을 받았으니 커피를 줍니다.
남은 커피의 양은 0개입니다.
커피가 다 떨어졌습니다. 판매를 중지합니다.
```

```python
print('start')

for i in range(0, 10) :
    if i == 5 :
        break
    print(i)

for i in range(0, 10) :
    if i == 5 :
        continue
    print(i)

for i in range(0, 3) :
    for j in range(0, 3) :
        if i == 1 :
            break
        print(i, j)

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 while03.py 
start
0
1
2
3
4
0
1
2
3
4
6
7
8
9
0 0
0 1
0 2
2 0
2 1
2 2
end
```

## 함수
```python
print('start')

def func1() :
    print('나는 함수')

func1()

def func2(a) :
    print('a :', a) 

func2(2)
func2('hi')

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 func01.py 
start
나는 함수
a : 2
a : hi
end
```
```python
print('start')

a = 1
def func(a) :
    a = a + 1
    print('a1 :', a)

func(a)
print('a2 :', a)

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 func02.py 
start
a1 : 2
a2 : 1
end
```
```python
print('start')

a = 1
def func() :
    global a
    a = a + 1
    print('a1 :', a)
func()
print('a2 :', a)   

print('end')

# 출력 결과
master@master-virtual-machine:~/python$ python3 func03.py 
start
a1 : 2
a2 : 2
end
```
```python
def func(a, b) :
    print(a, b)

a = 10
b = 20

func(a, b)
func(a = 100, b = 300)

# 출력 결과
master@master-virtual-machine:~/python$ python3 func04.py 
10 20
100 300
```
```python
def func(*args) :
    print(type(args))
    print(args)

func(1)
func(1, 2)
func(1, 2, 3)

# 출력 결과
master@master-virtual-machine:~/python$ python3 func05.py 
<class 'tuple'>
(1,)
<class 'tuple'>
(1, 2)
<class 'tuple'>
(1, 2, 3)
```


