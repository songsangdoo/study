# Linux
- Platform (Operation System) : 프로그램을 실행하기 위한 기본환경

## Linux(ubuntu) 기본

- linux 운영체제 설치 방법

  - hardware에 직접 설치

  - window 가상 머신에 설치

    - 가상머신 <small> !! CPU에서 virtualization(BIOS)를 지원해야한다</small>
      - 유료 
      
        - vmware &rarr; vmware player(vmware 무료 버전)

      - 무료 
        - virtual box (oracle)

        - Hyper-V / WSL (MS)

- 환경 설정

  - Try Workstation 17 Player for Windows 

  <small> !! https://www.vmware.com/products/workstation-player/workstation-player-evaluation.html 참조</small>

  - Ubuntu 22.04.2

  <small> !! https://ubuntu.com/download/desktop 참조</small>

- Linux 기본 환경

  - GUI : Linux Window System (X-Window)

    &rarr; ctrl + alt + f2 

  - CUI : 리눅스의 기본 명령 환경  

    &rarr; ctrl + alt + [f3, f4, f5, f6] 여러 terminal(console)로 다중 작업이 가능하다


- Linux를 사용하는 개발자

  - SE(System Engineer) : IDC(Internet Data Center)의 설치 / 보안 / 백업 / 복원 모니터링, 관리 프로그램 제작 (시스템 개발자)

  - 백엔드 개발자 : 웹서버 중심의 개발자

  - IoT 개발자 

- root (최상위 관리자)

  <small> !! ubuntu는 다른 Linux 버전과 다르게 최상위 관리자가 가려져 있기 때문에 install에서 설정한 사용자가 root 권한을 대용한다</small>

- Linux 구조

  <img src="https://mblogthumb-phinf.pstatic.net/MjAxNzA4MzBfNTkg/MDAxNTA0MDcwODU4MDM1.tWWygAh5ktGfIM755YwktPezB2Aebj6CvcjD52rVQLgg.w5672L8r0DgK-EIdbAlgGl75RsYwYTYk08-3VDqEv3gg.PNG.vivid_iris41/image_2743834981504070908552.png?type=w800">

  <small> !! shell을 통해 명령을 전달한다</small>

- Linux는 window 처럼 드라이브 개념이 없고 모두 directory로 다룬다

  <small> !! root directory : '/'로 표시한다 </small>

### 기본 명령어
#### pwd
```java
// 현재위치 표시
master@master-virtual-machine:~$ pwd
/home/master
```
#### ls
```java
// 현재 디렉터리에 포함된 디렉터리, 파일 표시
master@master-virtual-machine:~$ ls
snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿

// '/' 디렉터리에 포함된 디렉터리, 파일 표시
master@master-virtual-machine:~$ ls /
bin    dev   lib    libx32      mnt   root  snap      sys  var
boot   etc   lib32  lost+found  opt   run   srv       tmp
cdrom  home  lib64  media       proc  sbin  swapfile  usr

// 절대경로는 보통 '/' 부터 시작하고 상대경로는 './', '../'부터 시작한다

// '~'는 홈(로그인) 디렉터리를 의미한다
master@master-virtual-machine:~$ ls ~
snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿

// 현재 디렉터리의 내용을 자세히 보여준다
master@master-virtual-machine:~$ ls -l
합계 36
drwx------ 5 master master 4096  6월 14 09:40 snap
drwxr-xr-x 2 master master 4096  6월 13 16:45 공개
drwxr-xr-x 2 master master 4096  6월 13 16:45 다운로드
drwxr-xr-x 2 master master 4096  6월 13 16:45 문서
drwxr-xr-x 2 master master 4096  6월 13 16:45 바탕화면
drwxr-xr-x 2 master master 4096  6월 13 16:45 비디오
drwxr-xr-x 2 master master 4096  6월 13 16:45 사진
drwxr-xr-x 2 master master 4096  6월 13 16:45 음악
drwxr-xr-x 2 master master 4096  6월 13 16:45 템플릿

// 현재 디렉터리의 숨겨진 디렉터리, 파일까지 모두 보여준다
master@master-virtual-machine:~$ ls -a
.              .bash_logout  .config   .profile  다운로드  비디오  템플릿
..             .bashrc       .lesshst  snap      문서      사진
.bash_history  .cache        .local    공개      바탕화면  음악

// 이렇게 한번에 옵션을 쓸 수도 있다
master@master-virtual-machine:~$ ls -al
합계 76
drwxr-x--- 14 master master 4096  6월 14 09:52 .
drwxr-xr-x  3 root   root   4096  6월 13 16:30 ..
-rw-------  1 master master  117  6월 14 10:19 .bash_history
-rw-r--r--  1 master master  220  6월 13 16:30 .bash_logout
-rw-r--r--  1 master master 3771  6월 13 16:30 .bashrc
drwx------ 13 master master 4096  6월 14 09:27 .cache
drwx------ 12 master master 4096  6월 13 17:11 .config
-rw-------  1 master master   20  6월 14 09:52 .lesshst
drwx------  3 master master 4096  6월 13 16:45 .local
-rw-r--r--  1 master master  807  6월 13 16:30 .profile
drwx------  5 master master 4096  6월 14 09:40 snap
drwxr-xr-x  2 master master 4096  6월 13 16:45 공개
drwxr-xr-x  2 master master 4096  6월 13 16:45 다운로드
drwxr-xr-x  2 master master 4096  6월 13 16:45 문서
drwxr-xr-x  2 master master 4096  6월 13 16:45 바탕화면
drwxr-xr-x  2 master master 4096  6월 13 16:45 비디오
drwxr-xr-x  2 master master 4096  6월 13 16:45 사진
drwxr-xr-x  2 master master 4096  6월 13 16:45 음악
drwxr-xr-x  2 master master 4096  6월 13 16:45 템플릿

// tab 키를 이용해 디렉터리에 특정 알파벳으로 시작하는 파일이름을 모두 찾을 수 있다
// Linux는 파일명과 디렉터리명에서 대소문자를 구분한다
```
#### dir, vdir
```java
// window에서 사용하는 명령어 중 사용할 수 있는 명령어도 있다
master@master-virtual-machine:~$ dir
snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
master@master-virtual-machine:~$ vdir
합계 36
drwx------ 5 master master 4096  6월 14 09:40 snap
drwxr-xr-x 2 master master 4096  6월 13 16:45 공개
drwxr-xr-x 2 master master 4096  6월 13 16:45 다운로드
drwxr-xr-x 2 master master 4096  6월 13 16:45 문서
drwxr-xr-x 2 master master 4096  6월 13 16:45 바탕화면
drwxr-xr-x 2 master master 4096  6월 13 16:45 비디오
drwxr-xr-x 2 master master 4096  6월 13 16:45 사진
drwxr-xr-x 2 master master 4096  6월 13 16:45 음악
drwxr-xr-x 2 master master 4096  6월 13 16:45 템플릿
```
#### cd
```java

// 현재 디렉터리를 다른 디렉터리로 바꾼다
master@master-virtual-machine:~$ cd /
master@master-virtual-machine:/$ pwd
/
master@master-virtual-machine:/$ cd /usr
master@master-virtual-machine:/usr$ cd /home/master
master@master-virtual-machine:~$ 

// 현재 디렉터리 변경 전의 디렉터리로 돌아간다
master@master-virtual-machine:~$ cd -
/usr
master@master-virtual-machine:/usr$ 
```

#### mkdir
```java
// 디렉터리를 생성한다
master@master-virtual-machine:~$ mkdir dir1
master@master-virtual-machine:~$ ls
dir1  snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
master@master-virtual-machine:~$ mkdir dir2 dir3 dir4
master@master-virtual-machine:~$ ls
dir1  dir3  snap  다운로드  바탕화면  사진  템플릿
dir2  dir4  공개  문서      비디오    음악

// 디렉터리에 속한 디렉터리를 생성하기 위해서는 -p 옵션을 이용해야 한다
master@master-virtual-machine:~$ mkdir dir1/dir2/dir3/dir4
mkdir: `dir1/dir2/dir3/dir4' 디렉터리를 만들 수 없습니다: 그런 파일이나 디렉터리가 없습니다'

master@master-virtual-machine:~$ mkdir -p dir/dir2/dir3/dir4
master@master-virtual-machine:~$ ls -R dir
dir:
dir2

dir/dir2:
dir3

dir/dir2/dir3:
dir4

dir/dir2/dir3/dir4:
```
#### rmdir
```java
// 특정 디렉터리를 삭제한다
master@master-virtual-machine:~$ ls
dir   dir2  dir4  공개      문서      비디오  음악
dir1  dir3  snap  다운로드  바탕화면  사진    템플릿
master@master-virtual-machine:~$ rmdir dir dir2 dir4 dir1 dir3
rmdir: 'dir' 제거 실패: 디렉터리가 비어있지 않음

// 디렉터리가 비어있지 않은 경우 옵션 -p를 이용해야 한다
master@master-virtual-machine:~$ rmdir -p dir/dir2/dir3/dir4
master@master-virtual-machine:~$ ls
snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
```
#### file
```java
// 파일 정보 조회
master@master-virtual-machine:~$ file .bash_history
.bash_history: ASCII text
master@master-virtual-machine:~$ file snap/
snap/: directory
```
#### touch
```java
// 파일 생성 (linux는 확장자가 중요하지 않기 때문에 확장자 없어도 파일 생성이 된다)
master@master-virtual-machine:~$ touch test.txt
master@master-virtual-machine:~$ ls
snap  test.txt  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
```
#### cp
```java
// 파일 복사
master@master-virtual-machine:~$ cp test.txt test1.txt
master@master-virtual-machine:~$ ls
snap      test1.txt  다운로드  바탕화면  사진  템플릿
test.txt  공개       문서      비디오    음악
master@master-virtual-machine:~$ mkdir dir
master@master-virtual-machine:~$ cp test.txt ./dir/test1.txt
master@master-virtual-machine:~$ ls ./dir
test1.txt
```
#### mv
```java
// mv 명령어를 이용해 이름을 바꾸거나 다른 디렉터리로 옮길 수 있다
master@master-virtual-machine:~$ ls
dir   test.txt   공개      문서      비디오  음악
snap  test1.txt  다운로드  바탕화면  사진    템플릿
master@master-virtual-machine:~$ mv test1.txt test2.txt
master@master-virtual-machine:~$ ls
dir   test.txt   공개      문서      비디오  음악
snap  test2.txt  다운로드  바탕화면  사진    템플릿
master@master-virtual-machine:~$ mv test2.txt ./dir/
master@master-virtual-machine:~$ ls 
dir  snap  test.txt  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
master@master-virtual-machine:~$ ls ./dir/
test1.txt  test2.txt
```
#### rm
```java
// 파일을 삭제한다
master@master-virtual-machine:~$ ls
dir  snap  test.txt  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
master@master-virtual-machine:~$ rm test.txt
master@master-virtual-machine:~$ ls
dir  snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
// -r 옵션을 사용해야 디렉터리를 지울 수 있다 (주의!!)
// -f 옵션을 사용하면 강제로 삭제 시킨다 (주의!!)
master@master-virtual-machine:~$ rm dir
rm: 'dir'을(를) 제거할 수 없습니다: 디렉터리입니다
master@master-virtual-machine:~$ rm -r dir
master@master-virtual-machine:~$ ls
snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
```
#### cat
```java
// 파일 내용을 보여준다
master@master-virtual-machine:~$ cp /etc/passwd .
master@master-virtual-machine:~$ ls
passwd  snap  공개  다운로드  문서  바탕화면  비디오  사진  음악  템플릿
master@master-virtual-machine:~$ cat ./passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync ...
// -n 옵션을 사용해 줄번호를 출력할 수 있다
master@master-virtual-machine:~$ cat -n ./passwd
     1	root:x:0:0:root:/root:/bin/bash
     2	daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
     3	bin:x:2:2:bin:/bin:/usr/sbin/nologin
     4	sys:x:3:3:sys:/dev:/usr/sbin/nologin
     5	sync:x:4:65534:sync:/bin:/bin/sync
     6	games:x:5:60:games:/usr/games:/usr/sbin/nologin
     7	man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
     8	lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
...
// 파일에 내용을 덮어쓴다
master@master-virtual-machine:~$ cat > test.txt
Hello Text!! 
master@master-virtual-machine:~$ cat test.txt
Hello Text!! 
// 파일 내용 중 처음부터 10줄을 보여준다
master@master-virtual-machine:~$ head ./passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
// -n 옵션을 이용해 보여주는 줄 수를 정할 수 있다
master@master-virtual-machine:~$ head -n 3 ./passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
// 파일 내용 중 마지막줄부터 몇 줄을 보여준다
master@master-virtual-machine:~$ tail -n 3 ./passwd
hplip:x:127:7:HPLIP system user,,,:/run/hplip:/bin/false
gdm:x:128:134:Gnome Display Manager:/var/lib/gdm3:/bin/false
master:x:1000:1000:master,,,:/home/master:/bin/bash
// enter, spacebar를 이용해 문서의 일부분을 차례로 보여준다 
master@master-virtual-machine:~$ more ./passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
--More--(35%)
...
--More--(100%)
```

<hr>

!! symbolic link file
```java
// 윈도우의 바로가기 파일과 같은 심볼릭 링크 파일 생성한다
master@master-virtual-machine:~$ mkdir dir1
master@master-virtual-machine:~$ mv ./passwd ./dir1/
master@master-virtual-machine:~$ ls ./dir1/
passwd
master@master-virtual-machine:~$ ln -s /home/master/dir1/passwd ./pass
master@master-virtual-machine:~$ ls -l
합계 48
drwxrwxr-x 2 master master 4096  6월 14 11:49 dir1
lrwxrwxrwx 1 master master   24  6월 14 11:50 pass -> /home/master/dir1/passwd
drwx------ 5 master master 4096  6월 14 09:40 snap
-rw-rw-r-- 1 master master   15  6월 14 11:41 test.txt
-rw-rw-r-- 1 master master   13  6월 14 11:40 text.txt
drwxr-xr-x 2 master master 4096  6월 13 16:45 공개
drwxr-xr-x 2 master master 4096  6월 13 16:45 다운로드
drwxr-xr-x 2 master master 4096  6월 13 16:45 문서
drwxr-xr-x 2 master master 4096  6월 13 16:45 바탕화면
drwxr-xr-x 2 master master 4096  6월 13 16:45 비디오
drwxr-xr-x 2 master master 4096  6월 13 16:45 사진
drwxr-xr-x 2 master master 4096  6월 13 16:45 음악
drwxr-xr-x 2 master master 4096  6월 13 16:45 템플릿
master@master-virtual-machine:~$ tail pass
fwupd-refresh:x:120:126:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
nm-openvpn:x:121:127:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
saned:x:122:129::/var/lib/saned:/usr/sbin/nologin
colord:x:123:130:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
geoclue:x:124:131::/var/lib/geoclue:/usr/sbin/nologin
pulse:x:125:132:PulseAudio daemon,,,:/run/pulse:/usr/sbin/nologin
gnome-initial-setup:x:126:65534::/run/gnome-initial-setup/:/bin/false
hplip:x:127:7:HPLIP system user,,,:/run/hplip:/bin/false
gdm:x:128:134:Gnome Display Manager:/var/lib/gdm3:/bin/false
master:x:1000:1000:master,,,:/home/master:/bin/bash

```
!! ubuntu에서 jdk 설치 방법

<small> !! https://www.howtoinstall.me/ubuntu/18-04/openjdk-11-jdk/ 참조 </small>

```java
// jdk도 심볼릭 링크파 일을 이용한다
master@master-virtual-machine:~$ ls -l /usr/bin/java
lrwxrwxrwx 1 root root 22  6월 14 11:57 /usr/bin/java -> /etc/alternatives/java
master@master-virtual-machine:~$ ls -l /etc/alternatives/java
lrwxrwxrwx 1 root root 43  6월 14 11:57 /etc/alternatives/java -> /usr/lib/jvm/java-11-openjdk-amd64/bin/java
master@master-virtual-machine:~$ ls -l /usr/lib/jvm/java-1
java-1.11.0-openjdk-amd64/ java-11-openjdk-amd64/
master@master-virtual-machine:~$ ls -l /usr/lib/jvm/java-11-openjdk-amd64/bin/java
-rwxr-xr-x 1 root root 14528  5월 10 06:03 /usr/lib/jvm/java-11-openjdk-amd64/bin/java
```

```java
// Linux에서 java 실행하기
master@master-virtual-machine:~$ cat > HelloWorld.java
public class HelloWorld{
  public static void main(String[] args){
    System.out.println("Hello java");
  }
}
master@master-virtual-machine:~$ ls
HelloWorld.java  pass  test.txt  공개      문서      비디오  음악
dir1             snap  text.txt  다운로드  바탕화면  사진    템플릿
master@master-virtual-machine:~$ javac HelloWorld.java
master@master-virtual-machine:~$ java HelloWorld
Hello java

```
<hr>

#### grep
```java
// 파일 내부에서 검색한 내용을 보여준다
master@master-virtual-machine:~$ grep root ./dir1/passwd
root:x:0:0:root:/root:/bin/bash
nm-openvpn:x:121:127:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
// -n 옵션을 사용하면 줄 번호까지 보여준다
master@master-virtual-machine:~$ grep -n root ./dir1/passwd
1:root:x:0:0:root:/root:/bin/bash
40:nm-openvpn:x:121:127:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
// 검색한 내용을 가진 root.txt를 만든다
master@master-virtual-machine:~$ grep -n root ./dir1/passwd > root.txt
master@master-virtual-machine:~$ cat root.txt
1:root:x:0:0:root:/root:/bin/bash
40:nm-openvpn:x:121:127:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin

```
#### find
```java
// 특정 디렉터리에서 파일이름을 검색한다
master@master-virtual-machine:~$ find  /usr -name ls
/usr/lib/klibc/bin/ls
/usr/bin/ls
```

#### whereis
```java
// 명령의 위치를 찾아준다
master@master-virtual-machine:~$ whereis ls
ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz
master@master-virtual-machine:~$ ls -l /usr/bin/ls
-rwxr-xr-x 1 root root 138208  2월  8  2022 /usr/bin/ls
master@master-virtual-machine:~$ whereis mv
mv: /usr/bin/mv /usr/share/man/man1/mv.1.gz

// python은 기본적으로 ubuntu에 내장되어 있다
master@master-virtual-machine:~$ whereis python3
python3: /usr/bin/python3 /usr/lib/python3 /etc/python3 /usr/share/python3 /usr/share/man/man1/python3.1.gz
master@master-virtual-machine:~$ whereis -b python3
python3: /usr/bin/python3 /usr/lib/python3 /etc/python3 /usr/share/python3
master@master-virtual-machine:~$ ls -l /usr/bin/python3
lrwxrwxrwx 1 root root 10  6월 13 16:26 /usr/bin/python3 -> python3.10

```
### 문서 편집기

- 구분
  - GUI - gedit, VsCode

  - CUI - vi, emacs, nano

- vim 설치

```java
master@master-virtual-machine:~$ sudo apt install vim
```

- vim 사용
```java
master@master-virtual-machine:~$ vi HelloFrame.java

// HelloFrame.java
import javax.swing.JFrame;

public class HelloFrame {
        public static void main(String[] args){
                JFrame frame = new JFrame();
                frame.setTitle("I'm JFrame");

                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

                frame.setSize(800,600);
                frame.setLocation(100, 100);
                frame.setVisible(true);
        }
}
~
~
~
// 03장_문서편집하기.pdf 참조하기
```
### 사용자

- 새로운 사용자는 root가 만들 수 있다

- master가 sudo 명령어를 이용해 root 권한을 빌려 새로운 사용자를 만들 수 있다

- 사용자마다 각각의 디렉터리를 가지고, 권한도 다르다

- 새로운 사용자 만들기

```java
master@master-virtual-machine:~$ sudo adduser tester
[sudo] master 암호: 
'tester' 사용자를 추가 중...
새 그룹 'tester' (1002) 추가 ...
새 사용자 'tester' (1002) 을(를) 그룹 'tester' (으)로 추가 ...
'/home/tester' 홈 디렉터리를 생성하는 중...
'/etc/skel'에서 파일들을 복사하는 중...
새 암호: 
잘못된 비밀번호: 암호는 8 개의 문자 보다 짧습니다
새 암호 재입력: 
passwd: 암호를 성공적으로 업데이트했습니다
tester의 사용자의 정보를 바꿉니다
새로운 값을 넣거나, 기본값을 원하시면 엔터를 치세요
  이름 []: 
  방 번호 []: 
  직장 전화번호 []: 
  집 전화번호 []: 
  기타 []: 
정보가 올바릅니까? [Y/n] Y

// 등록된 사용자 정보를 확인할 수 있다
master@master-virtual-machine:~$ tail /etc/passwd
saned:x:122:129::/var/lib/saned:/usr/sbin/nologin
colord:x:123:130:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
geoclue:x:124:131::/var/lib/geoclue:/usr/sbin/nologin
pulse:x:125:132:PulseAudio daemon,,,:/run/pulse:/usr/sbin/nologin
gnome-initial-setup:x:126:65534::/run/gnome-initial-setup/:/bin/false
hplip:x:127:7:HPLIP system user,,,:/run/hplip:/bin/false
gdm:x:128:134:Gnome Display Manager:/var/lib/gdm3:/bin/false
master:x:1000:1000:master,,,:/home/master:/bin/bash
tester1:x:1001:1001:,,,:/home/tester1:/bin/bash
tester:x:1002:1002:,,,:/home/tester:/bin/bash

// 암호 변경하기
master@master-virtual-machine:~$ passwd
master에 대한 암호 변경 중
현재 암호: 
새 암호: 

// 사용자를 생성하면 /etc/skel 디렉터리의 내용이 복사되어 사용자 디렉터리가 생성된다
master@master-virtual-machine:~$ sudo ls -al /etc/skel
[sudo] master 암호: 
합계 28
drwxr-xr-x   2 root root  4096  2월 23 12:57 .
drwxr-xr-x 132 root root 12288  6월 15 09:43 ..
-rw-r--r--   1 root root   220  1월  7  2022 .bash_logout
-rw-r--r--   1 root root  3771  1월  7  2022 .bashrc
-rw-r--r--   1 root root   807  1월  7  2022 .profile
master@master-virtual-machine:/etc/skel$ sudo su // root로 로그인
root@master-virtual-machine:/etc/skel# touch readme.txt
root@master-virtual-machine:/etc/skel# ls -al
합계 28
drwxr-xr-x   2 root root  4096  6월 15 09:52 .
drwxr-xr-x 132 root root 12288  6월 15 09:43 ..
-rw-r--r--   1 root root   220  1월  7  2022 .bash_logout
-rw-r--r--   1 root root  3771  1월  7  2022 .bashrc
-rw-r--r--   1 root root   807  1월  7  2022 .profile
-rw-r--r--   1 root root     0  6월 15 09:52 readme.txt
root@master-virtual-machine:/etc/skel# adduser tester4
'tester4' 사용자를 추가 중...
새 그룹 'tester4' (1004) 추가 ...
새 사용자 'tester4' (1004) 을(를) 그룹 'tester4' (으)로 추가 ...
'/home/tester4' 홈 디렉터리를 생성하는 중...
'/etc/skel'에서 파일들을 복사하는 중...
새 암호: 
잘못된 비밀번호: 암호는 8 개의 문자 보다 짧습니다
새 암호 재입력: 
passwd: 암호를 성공적으로 업데이트했습니다
tester4의 사용자의 정보를 바꿉니다
새로운 값을 넣거나, 기본값을 원하시면 엔터를 치세요
	이름 []: 
	방 번호 []: 
	직장 전화번호 []: 
	집 전화번호 []: 
	기타 []: 
정보가 올바릅니까? [Y/n] Y
root@master-virtual-machine:/etc/skel# su tester4
tester4@master-virtual-machine:/etc/skel$ cd ~
tester4@master-virtual-machine:~$ ls -al
합계 20
drwxr-x--- 2 tester4 tester4 4096  6월 15 09:53 .
drwxr-xr-x 7 root    root    4096  6월 15 09:53 ..
-rw-r--r-- 1 tester4 tester4  220  6월 15 09:53 .bash_logout
-rw-r--r-- 1 tester4 tester4 3771  6월 15 09:53 .bashrc
-rw-r--r-- 1 tester4 tester4  807  6월 15 09:53 .profile
-rw-r--r-- 1 tester4 tester4    0  6월 15 09:53 readme.txt
// 새로운 사용자 홈디렉터리에 새로 추가한 파일도 같이 생성된다
```

```java
// 사용자 삭제
master@master-virtual-machine:~$ sudo userdel tester4
[sudo] master 암호: 
master@master-virtual-machine:~$ ls -l /home
합계 20
drwxr-x--- 15 master  master  4096  6월 14 16:49 master
drwxr-x---  2 tester  tester  4096  6월 14 16:20 tester
drwxr-x--- 14 tester1 tester1 4096  6월 14 16:19 tester1
drwxr-x---  2 tester3 tester3 4096  6월 15 09:38 tester3
drwxr-x---  2    1004    1004 4096  6월 15 10:13 tester4
// 디렉터리의 이름이 숫자로 바뀐다
master@master-virtual-machine:~$ tail -n 3 /etc/passwd
tester1:x:1001:1001:,,,:/home/tester1:/bin/bash
tester:x:1002:1002:,,,:/home/tester:/bin/bash
tester3:x:1003:1003:,,,:/home/tester3:/bin/bash
// 설정은 삭제된다
master@master-virtual-machine:~$ cd /home
master@master-virtual-machine:/home$ ls
master  tester  tester1  tester4
master@master-virtual-machine:/home$ sudo rm -r tester4
master@master-virtual-machine:/home$ ls
master  tester  tester1
// 디렉터리까지 삭제


// -r 옵션을 사용하면 디렉터리와 설정 모두 삭제된다(권장하지 않음)
master@master-virtual-machine:~$ sudo userdel -r tester3
userdel: tester3 mail spool (/var/mail/tester3) not found
master@master-virtual-machine:~$ ls -l /home
합계 16
drwxr-x--- 15 master  master  4096  6월 14 16:49 master
drwxr-x---  2 tester  tester  4096  6월 14 16:20 tester
drwxr-x--- 14 tester1 tester1 4096  6월 14 16:19 tester1
drwxr-x---  2    1004    1004 4096  6월 15 10:13 tester4
master@master-virtual-machine:~$ tail -n 3 /etc/passwd
master:x:1000:1000:master,,,:/home/master:/bin/bash
tester1:x:1001:1001:,,,:/home/tester1:/bin/bash
tester:x:1002:1002:,,,:/home/tester:/bin/bash

```

- 다른 사용자의 권한 사용 방법

  - 그 사용자 아이디로 재로그인

  - 임시 권한 획득

    - su 사용자id : 현재 상태(위치)에서 잠시 사용자id를 빌린다

    - su - 사용자id : 사용자id의 홈디렉터리로 이동 (재로그인과 같다)


### ubuntu version 확인

```java
master@master-virtual-machine:~$ cat /etc/issue
Ubuntu 22.04.2 LTS \n \l

master@master-virtual-machine:~$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.2 LTS
Release:	22.04
Codename:	jammy
master@master-virtual-machine:~$ uname -a
Linux master-virtual-machine 5.19.0-43-generic #44~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Mon May 22 13:39:36 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
```

### 파일 접근

<small> !! 05장_파일접근 권한 관리하기.pdf 참조</small>

```java

master@master-virtual-machine:/home$ mkdir dir1
mkdir: `dir1' 디렉터리를 만들 수 없습니다: 허가 거부'
master@master-virtual-machine:/home$ sudo mkdir dir1
[sudo] master 암호: 
master@master-virtual-machine:/home$ ls -l
합계 16
drwxr-xr-x  2 root    root    4096  6월 15 10:37 dir1
drwxr-x--- 15 master  master  4096  6월 14 16:49 master
drwxr-x---  2 tester  tester  4096  6월 14 16:20 tester
drwxr-x--- 14 tester1 tester1 4096  6월 14 16:19 tester1
master@master-virtual-machine:/home$ ls -l dir1
합계 0
master@master-virtual-machine:/home$ sudo chmod 750 dir1/
master@master-virtual-machine:/home$ ls -l
합계 16
drwxr-x---  2 root    root    4096  6월 15 10:37 dir1
drwxr-x--- 15 master  master  4096  6월 14 16:49 master
drwxr-x---  2 tester  tester  4096  6월 14 16:20 tester
drwxr-x--- 14 tester1 tester1 4096  6월 14 16:19 tester1
master@master-virtual-machine:/home$ ls -l dir1
ls: 'dir1' 디렉터리를 열 수 없습니다: 허가 거부

```
- 초기 권한 
  - directory : 777

  - file : 666(실행권한만 없는 상태)

- 기본 접근 권한

  - root 
    - directory : 775

    - file : 644
  
  - 일반사용자

    - directory : 775

    - file : 664

### 프로그램 

- 프로세스 

  - 부모 프로세스 - 자식 프로세스
    - 데몬 프로세스 : 서비스

    - 고아 프로세스 : 부모 프로세스가 종료된 프로세스

    - 좀비 프로세스 : 프로세스 종료됐는데 상태가 남아있는 프로세스

#### ps
```java
master@master-virtual-machine:~$ ps
    PID TTY          TIME CMD
   4886 pts/0    00:00:00 bash
   5176 pts/0    00:00:00 ps

```

```java
// 프로세스 강제 종료
master@master-virtual-machine:~$ ps aux | grep vi
root         732  0.0  0.2  63868 11912 ?        Ss   09:10   0:00 /usr/bin/VGAuthService
avahi        783  0.0  0.0   7624  3676 ?        Ss   09:10   0:00 avahi-daemon: running [master-virtual-machine.local]
master      1691  0.0  0.4 603788 18692 ?        Ssl  09:11   0:00 /usr/libexec/gnome-session-binary --systemd-service --session=ubuntu
master      1749  0.0  0.3 348708 15140 ?        Sl   09:11   0:00 /usr/libexec/goa-identity-service
master      1804  0.0  0.1 156964  6024 ?        Ssl  09:11   0:00 /usr/libexec/dconf-service
master      2013  0.0  4.8 1005348 193628 ?      Sl   09:11   0:03 /snap/snap-store/959/usr/bin/snap-store --gapplication-service
master      5490  0.0  0.2  33960 10884 pts/1    S+   12:12   0:00 vi
master      5496  0.0  0.0  19196  2452 pts/0    S+   12:14   0:00 grep --color=auto vi
master@master-virtual-machine:~$ kill 5490

// 지금 실행되는 프로세스 목록을 보여준다
master@master-virtual-machine:~$ ps -au
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
master      1627  0.0  0.1 172540  6376 tty2     Ssl+ 09:11   0:00 /usr/l
master      1630  0.0  0.3 233180 15604 tty2     Sl+  09:11   0:00 /usr/l
master      5414  0.0  0.1  21100  5160 pts/0    Ss   12:10   0:00 bash
master      5480  0.0  0.1  21252  5352 pts/1    Ss+  12:12   0:00 bash
master      5517  0.0  0.0  18720  2732 pts/1    S    12:16   0:00 pager
master      5542  0.0  0.0  22640  1552 pts/0    R+   12:22   0:00 ps -au

// 프로세스 진행 상황을 실사간으로 보여준다
master@master-virtual-machine:~$ top 

```
<hr>

java를 이용해 현재 실행되고있는 파일 목록 불러오기

```java
// ProcessBuilderEx02.java
  1 import java.io.IOException;
  2 import java.io.BufferedReader;
  3 import java.io.InputStreamReader;
  4 
  5 public class ProcessBuilderEx02 {
  6   public static void main(String[] args){
  7     BufferedReader br = null;
  8 
  9     try{
 10       ProcessBuilder pb = new ProcessBuilder("ps", "a");
 11       Process process = pb.start();
 12       br = new BufferedReader(new InputStreamReader(process.getInputStream()));
 13       String msg = null;
 14       while((msg = br.readLine()) != null) {
 15         System.out.println(msg);
 16       }
 17     }catch(IOException e){
 18       System.out.println("에러 : " + e.getMessage());
 19     }finally{
 20       if(br != null) try{br.close();} catch(IOException e){}
 21     }
 22   }
 23 }
```

```java
master@master-virtual-machine:~$ javac ProcessBuilderEx02.java 
master@master-virtual-machine:~$ java ProcessBuilderEx02
    PID TTY      STAT   TIME COMMAND
   1627 tty2     Ssl+   0:00 /usr/libexec/gdm-wayland-session env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --session=ubuntu
   1630 tty2     Sl+    0:00 /usr/libexec/gnome-session-binary --session=ubuntu
   6000 pts/0    Ss     0:00 bash
   6202 pts/0    S      0:01 vi ProcessBuilderEx02.java
   6269 pts/0    S      0:00 /bin/bash
   6306 pts/0    Sl+    0:00 java ProcessBuilderEx02
   6323 pts/0    R+     0:00 ps a

```

```java
// gedit만 사용할 수 있다 (forground)
master@master-virtual-machine:~$ gedit
[1]+  완료                  sleep 20
// gedit과 다른 프로그램을 같이 사용할 수 있다(background)
master@master-virtual-machine:~$ gedit & 
[1] 6690
master@master-virtual-machine:~$ sleep 100
^Z
[2]+  멈춤                  sleep 100
master@master-virtual-machine:~$ jobs
[1]-  실행중               gedit &
[2]+  멈춤                  sleep 100
master@master-virtual-machine:~$ bg 2
[2]+ sleep 100 &
master@master-virtual-machine:~$ jobs
[1]-  실행중               gedit &
[2]+  실행중               sleep 100 &
master@master-virtual-machine:~$ fg 2
sleep 100

```

#### 프로그램 제공
- 압축파일 
  - 소스(C / C++)
    
    소스파일 &rarr; 컴파일 &rarr; 설치 &rarr; 실행

  - 실행파일

    압축해제 &rarr; 실행

- 인스톨 파일 (패키지 관리도구)
  - 데비안(우분투) -dpkg(Debian Package) : .db

    <small>!! 다운로드 : apt / apt-get </small>

  - 레드햇 - RPM : .rpm

    <small>!! 다운로드 : yum </small>

##### 압축파일 

- Tar(Tape Archiver[묶음]) + Gzip(압축) &rarr; tar.gz

```java
master@master-virtual-machine:~/dir$ tar cvf test.tar text1.txt test2.txt test3.txt
text1.txt
test2.txt
test3.txt
master@master-virtual-machine:~/dir$ tar tvf test.tar
-rw-rw-r-- master/master     0 2023-06-15 15:18 text1.txt
-rw-rw-r-- master/master     0 2023-06-15 15:18 test2.txt
-rw-rw-r-- master/master     0 2023-06-15 15:18 test3.txt
master@master-virtual-machine:~/dir$ touch test4.txt
master@master-virtual-machine:~/dir$ tar uvf test.tar test4.txt 
test4.txt
master@master-virtual-machine:~/dir$ tar tvf test.tar 
-rw-rw-r-- master/master     0 2023-06-15 15:18 text1.txt
-rw-rw-r-- master/master     0 2023-06-15 15:18 test2.txt
-rw-rw-r-- master/master     0 2023-06-15 15:18 test3.txt
-rw-rw-r-- master/master     0 2023-06-15 15:20 test4.txt
master@master-virtual-machine:~/dir$ ls
test.tar  test2.txt  test3.txt  test4.txt  text1.txt
master@master-virtual-machine:~/dir$ rm te*.txt
master@master-virtual-machine:~/dir$ ls
test.tar
master@master-virtual-machine:~/dir$ tar xvf test.tar
text1.txt
test2.txt
test3.txt
test4.txt
master@master-virtual-machine:~/dir$ ls
test.tar  test2.txt  test3.txt  test4.txt  text1.txt
master@master-virtual-machine:~/dir$ gzip test.tar
master@master-virtual-machine:~/dir$ ls
test.tar.gz  test1.txt  test2.txt  test3.txt  test4.txt
master@master-virtual-machine:~/dir$ gzip -d test.tar.gz 
master@master-virtual-machine:~/dir$ ls
test.tar  test1.txt  test2.txt  test3.txt  test4.txt
master@master-virtual-machine:~/dir$ gzip test.tar
master@master-virtual-machine:~/dir$ rm test*.txt
master@master-virtual-machine:~/dir$ ls
test.tar.gz
master@master-virtual-machine:~/dir$ tar xvzf test.tar.gz 
test1.txt
test2.txt
test3.txt
test4.txt
master@master-virtual-machine:~/dir$ ls
test.tar.gz  test1.txt  test2.txt  test3.txt  test4.txt
master@master-virtual-machine:~/dir$ rm test*.txt
master@master-virtual-machine:~/dir$ ls
test.tar.gz
master@master-virtual-machine:~/dir$ tar xvf test.tar.gz 
test1.txt
test2.txt
test3.txt
test4.txt
master@master-virtual-machine:~/dir$ ls
test.tar.gz  test1.txt  test2.txt  test3.txt  test4.txt
master@master-virtual-machine:~/dir$ rm test.tar.gz
master@master-virtual-machine:~/dir$ tar cvzf test.tar.gz test*.txt
test1.txt
test2.txt
test3.txt
test4.txt
master@master-virtual-machine:~/dir$ ls
test.tar.gz  test1.txt  test2.txt  test3.txt  test4.txt

```

