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

```java
// 설치된 프로그램 목록 확인
master@master-virtual-machine:~$ dpkg -l
희망상태=알수없음(U)/설치(I)/지우기(R)/깨끗이(P)/고정(H)
| 상태=아님(N)/설치(I)/설정(C)/풀림(U)/절반설정(F)/일부설치(H)/트리거대기(W)/
| /    트리거밀림(T)
|/ 오류?=(없음)/다시설치필요(R) (상태, 오류가 대문자=불량)
||/ 이름                                       버전                           >
+++-==========================================-===============================>
ii  accountsservice                            22.07.5-2ubuntu1.3             >
ii  acl                                        2.3.1-1                        >
ii  acpi-support                               0.144                          >
ii  acpid                                      1:2.0.33-1ubuntu1              >
ii  adduser                                    3.118ubuntu5                   >
ii  adwaita-icon-theme                         41.0-1ubuntu1                  >
ii  alsa-base                                  1.0.25+dfsg-0ubuntu7           >

// vscode.deb 설치
master@master-virtual-machine:~/다운로드$ dpkg -I code_1.79.2-1686734195_amd64.deb 
 new Debian package, version 2.0.
 size 95938824 bytes: control archive=2712 bytes.
    1405 바이트,    18 줄      control              
    3123 바이트,    80 줄   *  postinst             #!/usr/bin/env
     337 바이트,    11 줄   *  postrm               #!/bin/bash
     274 바이트,     6 줄   *  prerm                #!/usr/bin/env
 Package: code
 Version: 1.79.2-1686734195
 Section: devel
 Depends: ca-certificates, libasound2 (>= 1.0.17), libatk-bridge2.0-0 (>= 2.5.3), libatk1.0-0 (>= 2.2.0), libatspi2.0-0 (>= 2.9.90), libc6 (>= 2.14), libc6 (>= 2.17), libc6 (>= 2.2.5), libcairo2 (>= 1.6.0), libcurl3-gnutls | libcurl3-nss | libcurl4 | libcurl3, libdbus-1-3 (>= 1.5.12), libdrm2 (>= 2.4.60), libexpat1 (>= 2.0.1), libgbm1 (>= 17.1.0~rc2), libglib2.0-0 (>= 2.16.0), libglib2.0-0 (>= 2.39.4), libgtk-3-0 (>= 3.9.10), libgtk-3-0 (>= 3.9.10) | libgtk-4-1, libnspr4 (>= 2:4.9-2~), libnss3 (>= 2:3.22), libnss3 (>= 3.26), libpango-1.0-0 (>= 1.14.0), libsecret-1-0 (>= 0.18), libx11-6, libx11-6 (>= 2:1.4.99.1), libxcb1 (>= 1.9.2), libxcomposite1 (>= 1:0.4.4-1), libxdamage1 (>= 1:1.1), libxext6, libxfixes3, libxkbcommon0 (>= 0.4.1), libxkbfile1, libxrandr2, xdg-utils (>= 1.0.2)
 Recommends: libvulkan1
 Priority: optional
 Architecture: amd64
 Maintainer: Microsoft Corporation <vscode-linux@microsoft.com>
 Homepage: https://code.visualstudio.com/
 Installed-Size: 369848
 Provides: visual-studio-code
 Conflicts: visual-studio-code
 Replaces: visual-studio-code
 Description: Code editing. Redefined.
  Visual Studio Code is a new choice of tool that combines the simplicity of
  a code editor with what developers need for the core edit-build-debug cycle.
  See https://code.visualstudio.com/docs/setup/linux for installation
  instructions and FAQ.
master@master-virtual-machine:~/다운로드$ dpkg -l code
dpkg-query: code와 일치하는 패키지를 찾지 못했습니다
master@master-virtual-machine:~/다운로드$ sudo dpkg -i code_1.79.2-1686734195_amd64.deb 
[sudo] master 암호: 
Selecting previously unselected package code.
(데이터베이스 읽는중 ...현재 191894개의 파일과 디렉터리가 설치되어 있습니다.)
Preparing to unpack code_1.79.2-1686734195_amd64.deb ...
Unpacking code (1.79.2-1686734195) ...
code (1.79.2-1686734195) 설정하는 중입니다 ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
Processing triggers for desktop-file-utils (0.26-1ubuntu3) ...
Processing triggers for shared-mime-info (2.1-2) ...
master@master-virtual-machine:~/다운로드$ dpkg -l code
희망상태=알수없음(U)/설치(I)/지우기(R)/깨끗이(P)/고정(H)
| 상태=아님(N)/설치(I)/설정(C)/풀림(U)/절반설정(F)/일부설치(H)/트리거대기(W)/
| /    트리거밀림(T)
|/ 오류?=(없음)/다시설치필요(R) (상태, 오류가 대문자=불량)
||/ 이름           버전              Architecture 설명
+++-==============-=================-============-=================================
ii  code           1.79.2-1686734195 amd64        Code editing. Redefined.
```
```java
// sudo dpkg -r 패키지명 - 설정파일 삭제 X
// sudo dpkg -P 패키지명 - 설정파일 삭제 O
master@master-virtual-machine:~/다운로드$ sudo dpkg -P google-chrome-stable
(데이터베이스 읽는중 ...현재 193424개의 파일과 디렉터리가 설치되어 있습니다.)
google-chrome-stable (114.0.5735.133-1)를 제거합니다...
Purging configuration files for google-chrome-stable (114.0.5735.133-1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
Processing triggers for desktop-file-utils (0.26-1ubuntu3) ...

```

```java
// apt / apt-get  : Advanced Package Tool
// *.deb과 의존성 있는 deb 동시에 설치

// deb 설치 홈페이지 확인
master@master-virtual-machine:~/다운로드$ cat /etc/apt/sources.list
#deb cdrom:[Ubuntu 22.04.2 LTS _Jammy Jellyfish_ - Release amd64 (20230223)]/ jammy main restricted

# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.
deb http://kr.archive.ubuntu.com/ubuntu/ jammy main restricted
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://kr.archive.ubuntu.com/ubuntu/ jammy-updates main restricted
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy-updates main restricted

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://kr.archive.ubuntu.com/ubuntu/ jammy universe
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy universe
deb http://kr.archive.ubuntu.com/ubuntu/ jammy-updates universe
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy-updates universe

## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu 
## team, and may not be under a free licence. Please satisfy yourself as to 
## your rights to use the software. Also, please note that software in 
## multiverse WILL NOT receive any review or updates from the Ubuntu
## security team.
deb http://kr.archive.ubuntu.com/ubuntu/ jammy multiverse
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy multiverse
deb http://kr.archive.ubuntu.com/ubuntu/ jammy-updates multiverse
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy-updates multiverse

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
deb http://kr.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src http://kr.archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse

deb http://security.ubuntu.com/ubuntu jammy-security main restricted
# deb-src http://security.ubuntu.com/ubuntu jammy-security main restricted
deb http://security.ubuntu.com/ubuntu jammy-security universe
# deb-src http://security.ubuntu.com/ubuntu jammy-security universe
deb http://security.ubuntu.com/ubuntu jammy-security multiverse
# deb-src http://security.ubuntu.com/ubuntu jammy-security multiverse

# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.
```

```java
// 업데이트
master@master-virtual-machine:~/다운로드$ sudo apt-get update
받기:1 http://packages.microsoft.com/repos/code stable InRelease [3,569 B]
받기:2 http://packages.microsoft.com/repos/code stable/main arm64 Packages [71.1 kB]
받기:3 http://packages.microsoft.com/repos/code stable/main amd64 Packages [70.8 kB]
받기:4 http://packages.microsoft.com/repos/code stable/main armhf Packages [71.4 kB]
받기:5 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]    
기존:6 http://kr.archive.ubuntu.com/ubuntu jammy InRelease                    
받기:7 http://kr.archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]   
받기:8 http://kr.archive.ubuntu.com/ubuntu jammy-backports InRelease [108 kB]
받기:9 http://kr.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [15.3 kB]
받기:10 http://kr.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [20.4 kB]
내려받기 589 k바이트, 소요시간 2초 (251 k바이트/초)                     
패키지 목록을 읽는 중입니다... 완료
// 업그레이드
master@master-virtual-machine:~/다운로드$ sudo apt-get upgrade
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
업그레이드를 계산하는 중입니다... 완료
다음 패키지를 과거 버전으로 유지합니다:
  gdm3 gir1.2-gdm-1.0 libgdm1 linux-generic-hwe-22.04
  linux-headers-generic-hwe-22.04 linux-image-generic-hwe-22.04
다음 패키지를 업그레이드할 것입니다:
  fwupd fwupd-signed gjs gnome-shell-extension-ubuntu-dock libfwupd2
  libfwupdplugin5 libgjs0g ubuntu-drivers-common
8개 업그레이드, 0개 새로 설치, 0개 제거 및 6개 업그레이드 안 함.
3,452 k바이트/3,545 k바이트 아카이브를 받아야 합니다.
이 작업 후 10.2 k바이트의 디스크 공간을 더 사용하게 됩니다.
계속 하시겠습니까? [Y/n] 
...
```

```java
master@master-virtual-machine:~/다운로드$ sudo apt-get list
E: 잘못된 작업 list
master@master-virtual-machine:~/다운로드$ sudo apt list 
...

// 설치된 파일의 목록만 보여준다
master@master-virtual-machine:~/다운로드$ sudo apt list --installed | grep openjdk

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

openjdk-11-jdk-headless/jammy-updates,jammy-security,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [설치됨,자동]
openjdk-11-jdk/jammy-updates,jammy-security,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [설치됨]
openjdk-11-jre-headless/jammy-updates,jammy-security,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [설치됨,자동]
openjdk-11-jre/jammy-updates,jammy-security,now 11.0.19+7~us1-0ubuntu1~22.04.1 amd64 [설치됨,자동]

// 설치된 파일 정보 확인
master@master-virtual-machine:~/다운로드$ sudo apt-cache show openjdk-11-jdk
Package: openjdk-11-jdk
Architecture: amd64
Version: 11.0.19+7~us1-0ubuntu1~22.04.1
Multi-Arch: same
Priority: optional
Section: java
Source: openjdk-lts
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubunt
...

// 설치할 수 있는 파일 목록
master@master-virtual-machine:~/다운로드$ sudo apt-cache search openjdk-11-jdk
default-jdk - Standard Java or Java compatible Development Kit
default-jdk-headless - Standard Java or Java compatible Development Kit (headless)
openjdk-11-jdk - OpenJDK Development Kit (JDK)
openjdk-11-jdk-headless - OpenJDK Development Kit (JDK) (headless)

// 설치
master@master-virtual-machine:~/다운로드$ sudo apt-get install filezilla
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
다음의 추가 패키지가 설치될 것입니다 :
  filezilla-common libfilezilla-common libfilezilla24 libpugixml1v5 libwxbase3.0-0v5 libwxgtk3.0-gtk3-0v5
다음 새 패키지를 설치할 것입니다:
  filezilla filezilla-common libfilezilla-common libfilezilla24 libpugixml1v5 libwxbase3.0-0v5
  libwxgtk3.0-gtk3-0v5
0개 업그레이드, 7개 새로 설치, 0개 제거 및 6개 업그레이드 안 함.
10.1 M바이트 아카이브를 받아야 합니다.
이 작업 후 36.9 M바이트의 디스크 공간을 더 사용하게 됩니다.
계속 하시겠습니까? [Y/n] Y
...

// 파일 설치여부 확인
master@master-virtual-machine:~/다운로드$ sudo apt list --installed | grep filezilla

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

filezilla-common/jammy,jammy,now 3.58.0-1 all [설치됨,자동]
filezilla/jammy,now 3.58.0-1 amd64 [설치됨]
libfilezilla-common/jammy,jammy,now 0.36.0-2 all [설치됨,자동]
libfilezilla24/jammy,now 0.36.0-2 amd64 [설치됨,자동]

// sudo apt-get remove 패키지명 - 설정파일 삭제 (X)
// sudo apt-get --purge remove 패키지명 - 설정파일 삭제 (O)
// sudo apt autoremove 패키지명 - 추가로 설치된 파일까지 제거
master@master-virtual-machine:~/다운로드$ sudo apt autoremove filezilla
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
다음 패키지를 지울 것입니다:
  filezilla filezilla-common libfilezilla-common libfilezilla24 libpugixml1v5 libwxbase3.0-0v5
  libwxgtk3.0-gtk3-0v5
0개 업그레이드, 0개 새로 설치, 7개 제거 및 6개 업그레이드 안 함.
이 작업 후 36.9 M바이트의 디스크 공간이 비워집니다.
계속 하시겠습니까? [Y/n] Y
(데이터베이스 읽는중 ...현재 194271개의 파일과 디렉터리가 설치되어 있습니다.)
filezilla (3.58.0-1)를 제거합니다...
filezilla-common (3.58.0-1)를 제거합니다...
libfilezilla24:amd64 (0.36.0-2)를 제거합니다...
libfilezilla-common (0.36.0-2)를 제거합니다...
libpugixml1v5:amd64 (1.12.1-1)를 제거합니다...
libwxgtk3.0-gtk3-0v5:amd64 (3.0.5.1+dfsg-4)를 제거합니다...
libwxbase3.0-0v5:amd64 (3.0.5.1+dfsg-4)를 제거합니다...
Processing triggers for hicolor-icon-theme (0.17-2) ...
Processing triggers for gnome-menus (3.36.0-1ubuntu3) ...
Processing triggers for libc-bin (2.35-0ubuntu3.1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for mailcap (3.70+nmu1ubuntu1) ...
Processing triggers for desktop-file-utils (0.26-1ubuntu3) ...

// c / c++ 실행환경 gcc 설치
master@master-virtual-machine:~/다운로드$ sudo apt-get install gcc
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
다음의 추가 패키지가 설치될 것입니다 :
  binutils binutils-common binutils-x86-64-linux-gnu gcc-11 libasan6 libbinutils libc-dev-bin
  libc-devtools libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libgcc-11-dev libitm1 liblsan0
  libnsl-dev libquadmath0 libtirpc-dev libtsan0 libubsan1 linux-libc-dev manpages-dev rpcsvc-proto
제안하는 패키지:
  binutils-doc gcc-multilib make autoconf automake libtool flex bison gcc-doc gcc-11-multilib gcc-11-doc
  gcc-11-locales glibc-doc
다음 새 패키지를 설치할 것입니다:
  binutils binutils-common binutils-x86-64-linux-gnu gcc gcc-11 libasan6 libbinutils libc-dev-bin
  libc-devtools libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libgcc-11-dev libitm1 liblsan0
  libnsl-dev libquadmath0 libtirpc-dev libtsan0 libubsan1 linux-libc-dev manpages-dev rpcsvc-proto
0개 업그레이드, 25개 새로 설치, 0개 제거 및 6개 업그레이드 안 함.
39.1 M바이트 아카이브를 받아야 합니다.
이 작업 후 131 M바이트의 디스크 공간을 더 사용하게 됩니다.
계속 하시겠습니까? [Y/n] Y
...

// gcc 버전 확인
master@master-virtual-machine:~/다운로드$ gcc --version
gcc (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

master@master-virtual-machine:~$ gcc hello.c
master@master-virtual-machine:~$ ls
a.out    eclipse-jee-2023-06-R-linux-gtk-x86_64.tar.gz  snap      문서      사진
dir      eclipse-workspace                              공개      바탕화면  음악
eclipse  hello.c                                        다운로드  비디오    템플릿
master@master-virtual-machine:~$ ./a.out
Hello World
master@master-virtual-machine:~$ gcc -o hello hello.c
master@master-virtual-machine:~$ ls
a.out    eclipse-jee-2023-06-R-linux-gtk-x86_64.tar.gz  hello.c  다운로드  비디오  템플릿
dir      eclipse-workspace                              snap     문서      사진
eclipse  hello                                          공개     바탕화면  음악
master@master-virtual-machine:~$ ./hello
Hello World

```

### 주기적인 실행
- 리눅스에서 서비스(데몬 : 백그라운드 프로세스)로 실행된다

  <small> !! 실행 결과를 메일 형태로 블러온다</small>

#### 메일

  - 메일 설치, 설정

  ```java
  // 메일 설치
  master@master-virtual-machine:~$ sudo apt -y install postfix
  ...
  master@master-virtual-machine:~$ sudo apt -y install mailutils
  ...

  // 메일이 현재 실행되고 있는지 상태 확인
  master@master-virtual-machine:~$ systemctl status postfix
  ● postfix.service - Postfix Mail Transport Agent
       Loaded: loaded (/lib/systemd/system/postfix.service; enabled; vendor preset: enabled)
       Active: active (exited) since Mon 2023-06-19 09:42:35 KST; 58s ago
         Docs: man:postfix(1)
      Process: 13243 ExecStart=/bin/true (code=exited, status=0/SUCCESS)
     Main PID: 13243 (code=exited, status=0/SUCCESS)
          CPU: 1ms

   6월 19 09:42:35 master-virtual-machine systemd[1]: Starting Postfix Mail Transport Agent...
   6월 19 09:42:35 master-virtual-machine systemd[1]: Finished Postfix Mail Transport Agent.

  // master에게 메일 작성
  master@master-virtual-machine:~$ mail master
  Cc: 
  Subject: 제목
  내용
  내용
  // ctrl + D 로 작성 완료
  // 작성된 메일 확인
  master@master-virtual-machine:~$ mail
  "/var/mail/master": 1 message 1 new
  >N   1 master             월  6월 19 09:  15/529   제목
  ? 1
  Return-Path: <master@master-virtual-machine>
  X-Original-To: master
  Delivered-To: master@master-virtual-machine.localdomain
  Received: by master-virtual-machine.localdomain (Postfix, from userid 1000)
    id 135CE180039; Mon, 19 Jun 2023 09:46:29 +0900 (KST)
  To: master@master-virtual-machine.localdomain
  Subject: 제목
  User-Agent: mail (GNU Mailutils 3.14)
  Date: Mon, 19 Jun 2023 09:46:29 +0900
  Message-Id: <20230619004629.135CE180039@master-virtual-machine.localdomain>
  From: master <master@master-virtual-machine>

  내용
  내용

  ```

#### at
- 정해진 시간에 한번만 실행
  - at 설치, 설정
  ```java
  // at 설치
  master@master-virtual-machine:~$ sudo apt -y install at
  ...

  //  at가 실행되고 있는지 확인
  master@master-virtual-machine:~$ systemctl status atd
  ● atd.service - Deferred execution scheduler
       Loaded: loaded (/lib/systemd/system/atd.service; enabled; vendor preset: enabled)
       Active: active (running) since Mon 2023-06-19 09:51:33 KST; 1min 5s ago
         Docs: man:atd(8)
      Process: 13840 ExecStartPre=find /var/spool/cron/atjobs -type f -name =* -not -newer>
     Main PID: 13841 (atd)
        Tasks: 1 (limit: 4573)
       Memory: 248.0K
          CPU: 2ms
       CGroup: /system.slice/atd.service
               └─13841 /usr/sbin/atd -f

   6월 19 09:51:33 master-virtual-machine systemd[1]: Starting Deferred execution schedule>
   6월 19 09:51:33 master-virtual-machine systemd[1]: Started Deferred execution scheduler.
  // at 강제 종료후 실행되고 있는지 확인
  master@master-virtual-machine:~$ systemctl stop atd
  master@master-virtual-machine:~$ systemctl status atd
  ○ atd.service - Deferred execution scheduler
       Loaded: loaded (/lib/systemd/system/atd.service; enabled; vendor preset: enabled)
       Active: inactive (dead) since Mon 2023-06-19 09:53:54 KST; 10s ago
         Docs: man:atd(8)
      Process: 13840 ExecStartPre=find /var/spool/cron/atjobs -type f -name =* -not -newer>
      Process: 13841 ExecStart=/usr/sbin/atd -f (code=exited, status=0/SUCCESS)
     Main PID: 13841 (code=exited, status=0/SUCCESS)
          CPU: 2ms

   6월 19 09:51:33 master-virtual-machine systemd[1]: Starting Deferred execution schedule>
   6월 19 09:51:33 master-virtual-machine systemd[1]: Started Deferred execution scheduler.
   6월 19 09:53:54 master-virtual-machine systemd[1]: Stopping Deferred execution schedule>
   6월 19 09:53:54 master-virtual-machine systemd[1]: atd.service: Deactivated successfull>
   6월 19 09:53:54 master-virtual-machine systemd[1]: Stopped Deferred execution scheduler.
  lines 1-14/14 (END)
  
  master@master-virtual-machine:~$ ps aux | grep atd
  master     13960  0.0  0.0  19064  2488 pts/0    S+   09:55   0:00 grep --color=auto atd
  // at 관련 옵션 확인
  master@master-virtual-machine:~$ at --help
  at: invalid option -- '-'
  Usage: at [-V] [-q x] [-f file] [-u username] [-mMlbv] timespec ...
         at [-V] [-q x] [-f file] [-u username] [-mMlbv] -t time
         at -c job ...
         at [-V] -l [-o timeformat] [job ...]
         atq [-V] [-q x] [-o timeformat] [job ...]
         at [ -rd ] job ...
         atrm [-V] job ...
         batch
  // at 설정
  master@master-virtual-machine:~$ at 10:15 am
  warning: commands will be executed using /bin/sh
  at Mon Jun 19 10:15:00 2023
  at> ls -l /home/master
  at> <EOT>
  job 2 at Mon Jun 19 10:15:00 2023
  Can't open /run/atd.pid to signal atd. No atd running?'
  master@master-virtual-machine:~$ atq
  1	Tue Jun 20 10:11:00 2023 a master
  2	Mon Jun 19 10:15:00 2023 a master
  master@master-virtual-machine:~$ at -l
  1	Tue Jun 20 10:11:00 2023 a master
  2	Mon Jun 19 10:15:00 2023 a master
  master@master-virtual-machine:~$ at 10:17 am
  warning: commands will be executed using /bin/sh
  at Mon Jun 19 10:17:00 2023
  at> ls -l /home/master > list.txt
  at> <EOT>
  job 3 at Mon Jun 19 10:17:00 2023
  Can't open /run/atd.pid to signal atd. No atd running?'
  master@master-virtual-machine:~$ at -l
  1	Tue Jun 20 10:11:00 2023 a master
  3	Mon Jun 19 10:17:00 2023 a master
  2	Mon Jun 19 10:15:00 2023 a master
  // 기록된 일들 확인
  master@master-virtual-machine:~$ sudo ls -l /var/spool/cron/atjobs/
  [sudo] master 암호: 
  합계 24
  -rwx------ 1 master daemon 4123  6월 19 10:12 a0000101ad1547
  -rwx------ 1 master daemon 4123  6월 19 10:12 a0000201ad0fab
  -rwx------ 1 master daemon 4134  6월 19 10:15 a0000301ad0fad
  // master@master-virtual-machine:~$ at 14:17 pm
  // 위의 표현은 사용할 수 없고 아래와 같이 사용해야 한다
  master@master-virtual-machine:~$ at 02:17 pm
  ```


#### crontab

<small> !! https://losskatsu.github.io/os-kernel/crontab/ 참조 </small>

- 스케줄을 정하고 그 시간마다 실행한다

- crontab 설치, 설정
```java
// crontab 설치
master@master-virtual-machine:~$ sudo apt -y install cron
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
패키지 cron는 이미 최신 버전입니다 (3.0pl1-137ubuntu3).
cron 패키지는 수동설치로 지정합니다.
0개 업그레이드, 0개 새로 설치, 0개 제거 및 3개 업그레이드 안 함.

```
```java
master@master-virtual-machine:~$ vi hello.sh
...
  1 #!/bin/sh
  2 echo -n "Hello shell Script"
...
master@master-virtual-machine:~$ ./hello.sh
bash: ./hello.sh: 허가 거부
master@master-virtual-machine:~$ ls -l hello.sh
-rw-rw-r-- 1 master master 39  6월 19 10:36 hello.sh
master@master-virtual-machine:~$ chmod 764 ./hello.sh
master@master-virtual-machine:~$ ls -l hello.sh
-rwxrw-r-- 1 master master 39  6월 19 10:36 hello.sh
master@master-virtual-machine:~$ ./hello.sh
Hello shell Script
```

### 파일 시스템

#### df 
```java
// 공간 사용 확인
master@master-virtual-machine:~$ df
파일 시스템     1K-블록     사용     가용 사용% 마운트위치
tmpfs            398212     2048   396164    1% /run
/dev/sda3      61091660 17252932 40703036   30% /
tmpfs           1991056        0  1991056    0% /dev/shm
tmpfs              5120        4     5116    1% /run/lock
/dev/sda2        524252     6216   518036    2% /boot/efi
tmpfs            398208      108   398100    1% /run/user/1000

// 메가바이트 단위
master@master-virtual-machine:~$ df -BM
파일 시스템    1M-블록   사용   가용 사용% 마운트위치
tmpfs             389M     2M   387M    1% /run
/dev/sda3       59660M 16849M 39750M   30% /
tmpfs            1945M     0M  1945M    0% /dev/shm
tmpfs               5M     1M     5M    1% /run/lock
/dev/sda2         512M     7M   506M    2% /boot/efi
tmpfs             389M     1M   389M    1% /run/user/1000

// 기가바이트 단위
master@master-virtual-machine:~$ df -BG
파일 시스템    1G-블록  사용  가용 사용% 마운트위치
tmpfs               1G    1G    1G    1% /run
/dev/sda3          59G   17G   39G   30% /
tmpfs               2G    0G    2G    0% /dev/shm
tmpfs               1G    1G    1G    1% /run/lock
/dev/sda2           1G    1G    1G    2% /boot/efi
tmpfs               1G    1G    1G    1% /run/user/1000

```
#### du &rarr; 파티션
```java
// master 디렉터리에 할당된 파일, 디렉터리의 용량을 보여준다
master@master-virtual-machine:~$ du /home/master
185848	/home/master/다운로드
4	/home/master/바탕화면
4	/home/master/.config/nautilus
8	/home/master/.config/gtk-3.0
...

// -s를 이용해 특정 디렉터리의 사용 용량을 알 수있다
master@master-virtual-machine:~$ du -s /home/master/
2385716	/home/master/

```
### 네트워크

```java
master@master-virtual-machine:~$ ifconfig
명령어 'ifconfig' 을(를) 찾을 수 없습니다. 그러나 다음을 통해 설치할 수 있습니다:
sudo apt install net-tools
master@master-virtual-machine:~$ sudo apt -y install net-tools
[sudo] master 암호: 
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
...
// ip 확인
master@master-virtual-machine:~$ ifconfig
ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.198.129  netmask 255.255.255.0  broadcast 192.168.198.255
        inet6 fe80::bd8d:ce61:2d2f:87ca  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:d9:58:26  txqueuelen 1000  (Ethernet)
        RX packets 103783  bytes 153966962 (153.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 40920  bytes 2548170 (2.5 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 266  bytes 27051 (27.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 266  bytes 27051 (27.0 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
// 네트워크가 잘 작동하는 지 확인
// 윈도우와 다르게 무한 작업하기 때문에 "ctrl + C" 로 종료해야한다
master@master-virtual-machine:~$ ping 192.168.0.7
PING 192.168.0.7 (192.168.0.7) 56(84) bytes of data.
64 bytes from 192.168.0.7: icmp_seq=1 ttl=128 time=0.577 ms
64 bytes from 192.168.0.7: icmp_seq=2 ttl=128 time=1.23 ms
64 bytes from 192.168.0.7: icmp_seq=3 ttl=128 time=1.22 ms
64 bytes from 192.168.0.7: icmp_seq=4 ttl=128 time=1.10 ms
64 bytes from 192.168.0.7: icmp_seq=5 ttl=128 time=1.09 ms
64 bytes from 192.168.0.7: icmp_seq=6 ttl=128 time=1.04 ms
64 bytes from 192.168.0.7: icmp_seq=7 ttl=128 time=1.11 ms
64 bytes from 192.168.0.7: icmp_seq=8 ttl=128 time=1.09 ms
64 bytes from 192.168.0.7: icmp_seq=9 ttl=128 time=1.22 ms
64 bytes from 192.168.0.7: icmp_seq=10 ttl=128 time=1.21 ms
64 bytes from 192.168.0.7: icmp_seq=11 ttl=128 time=1.22 ms
64 bytes from 192.168.0.7: icmp_seq=12 ttl=128 time=1.21 ms
64 bytes from 192.168.0.7: icmp_seq=13 ttl=128 time=1.28 ms
^C
--- 192.168.0.7 ping statistics ---
13 packets transmitted, 13 received, 0% packet loss, time 12049ms
rtt min/avg/max/mdev = 0.577/1.121/1.284/0.172 ms

```
## 서버 구축
- https://tomcat.apache.org/download-90.cgi 에서 tar.gz 파일 다운로드
```java
// 다운 받은 tomcat 압축해제
master@master-virtual-machine:~$ tar xzf apache-tomcat-9.0.76.tar.gz 
master@master-virtual-machine:~$ ls
HelloWorld.class             eclipse-jee-2023-06-R-linux-gtk-x86_64.tar.gz  문서
HelloWorld.java              eclipse-workspace                              바탕화면
apache-tomcat-9.0.76         mbox                                           비디오
apache-tomcat-9.0.76.tar.gz  snap                                           사진
dir                          공개                                           음악
eclipse                      다운로드                                       템플릿
// 리눅스에서는 .sh 파일로 프로그램을 실행시킨다
master@master-virtual-machine:~$ cd apache-tomcat-9.0.76/bin/
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ls *.sh
catalina.sh  configtest.sh  digest.sh    setclasspath.sh  startup.sh       version.sh
ciphers.sh   daemon.sh      makebase.sh  shutdown.sh      tool-wrapper.sh
// tomcat 실행 명령어
// catarlina.sh는 로그가 보이기 때문에 디버깅할 때 사용한다
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ./catalina.sh run
Using CATALINA_BASE:   /home/master/apache-tomcat-9.0.76
Using CATALINA_HOME:   /home/master/apache-tomcat-9.0.76
Using CATALINA_TMPDIR: /home/master/apache-tomcat-9.0.76/temp
...
// startup.sh는 로그가 보이지 않고 실행된다
// 로그가 보이지 않기 때문에 서비스용으로 사용된다
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ./startup.sh
Using CATALINA_BASE:   /home/master/apache-tomcat-9.0.76
Using CATALINA_HOME:   /home/master/apache-tomcat-9.0.76
Using CATALINA_TMPDIR: /home/master/apache-tomcat-9.0.76/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /home/master/apache-tomcat-9.0.76/bin/bootstrap.jar:/home/master/apache-tomcat-9.0.76/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Tomcat started.
// tomcat 실행 확인
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ps aux | grep tomcat
master     15901  2.5  3.2 3592796 130592 pts/0  Sl   11:35   0:02 /usr/bin/java -Djava.util.logging.config.file=/home/master/apache-tomcat-9.0.76/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djdk.tls.ephemeralDHKeySize=2048 -Djava.protocol.handler.pkgs=org.apache.catalina.webresources -Dorg.apache.catalina.security.SecurityListener.UMASK=0027 -Dignore.endorsed.dirs= -classpath /home/master/apache-tomcat-9.0.76/bin/bootstrap.jar:/home/master/apache-tomcat-9.0.76/bin/tomcat-juli.jar -Dcatalina.base=/home/master/apache-tomcat-9.0.76 -Dcatalina.home=/home/master/apache-tomcat-9.0.76 -Djava.io.tmpdir=/home/master/apache-tomcat-9.0.76/temp org.apache.catalina.startup.Bootstrap start
master     15948  0.0  0.0  19064  2448 pts/0    S+   11:37   0:00 grep --color=auto tomcat
// tomcat 종료
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ./shutdown.sh 
Using CATALINA_BASE:   /home/master/apache-tomcat-9.0.76
Using CATALINA_HOME:   /home/master/apache-tomcat-9.0.76
Using CATALINA_TMPDIR: /home/master/apache-tomcat-9.0.76/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /home/master/apache-tomcat-9.0.76/bin/bootstrap.jar:/home/master/apache-tomcat-9.0.76/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
NOTE: Picked up JDK_JAVA_OPTIONS:  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
// tomcat 종료 후 tomcat 실행 확인
master@master-virtual-machine:~/apache-tomcat-9.0.76/bin$ ps aux | grep tomcat
master     15987  0.0  0.0  19064  2484 pts/0    S+   11:39   0:00 grep --color=auto tomcat

```
```java
master@master-virtual-machine:~/apache-tomcat-9.0.76/conf$ vi server.xml 
...

 65          Java AJP  Connector: /docs/config/ajp.html
 66          APR (HTTP/AJP) Connector: /docs/apr.html
 67          Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
 68     -->
 69     <Connector port="9090" protocol="HTTP/1.1"
 70                connectionTimeout="20000"
 71                redirectPort="8443"
// port 속성의 값 8080 을 9090으로 수정
...
// 포트 번호가 바뀐다
```
```java
// /apache-tomcat-9.0.76/webapps/ROOT 에 있는 jsp 파일을 실행시킬 수 있다
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps/ROOT$ vi hello.jsp

// 기존의 ROOT 디렉터리가 아닌 ROOT 안에새로운 디렉터리를 만들고 내부의 jsp 파일을 실행시킬 수 있다
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ mkdir website1
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ mkdir -p website1/WEB-INF
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ ls website1/
WEB-INF
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ cp ./ROOT/hello.jsp website1/
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ ls
ROOT  docs  examples  host-manager  manager  website1
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ ls website1/
WEB-INF  hello.jsp
master@master-virtual-machine:~/apache-tomcat-9.0.76/webapps$ /home/master/apache-tomcat-9.0.76/bin/startup.sh 
Using CATALINA_BASE:   /home/master/apache-tomcat-9.0.76
Using CATALINA_HOME:   /home/master/apache-tomcat-9.0.76
Using CATALINA_TMPDIR: /home/master/apache-tomcat-9.0.76/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /home/master/apache-tomcat-9.0.76/bin/bootstrap.jar:/home/master/apache-tomcat-9.0.76/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Tomcat started.
// 기존의 ROOT가 아닌 완전 다른 디렉터리의 jsp 파일도 실행시킬 수 있다
// 단, 기본적인 디렉터리 구성은 ROOT와 같아야 하고,
// /apache-tomcat-9.0.76/conf/Catalina/localhost에 xml파일을 생성해 경로를 설정해줘야 한다
master@master-virtual-machine:~$ mkdir website2
master@master-virtual-machine:~$ mkdir -p website2/WEB-INF
master@master-virtual-machine:~$ ls website2/
WEB-INF
master@master-virtual-machine:~$ cp /home/master/apache-tomcat-9.0.76/webapps/website1/hello.jsp ./website2/
master@master-virtual-machine:~$ ls website2/
WEB-INF  hello.jsp
master@master-virtual-machine:~$ cd ./apache-tomcat-9.0.76/conf/Catalina/localhost/
master@master-virtual-machine:~/apache-tomcat-9.0.76/conf/Catalina/localhost$ vi website2.xml

...
1 <?xml version="1.0" encoding="utf-8"?>
2 <Context path="/website2" docBase="/home/master/website2" reloadable="true">
3 </Context>
...

master@master-virtual-machine:~/apache-tomcat-9.0.76/conf/Catalina/localhost$ /home/master/apache-tomcat-9.0.76/bin/startup.sh 
Using CATALINA_BASE:   /home/master/apache-tomcat-9.0.76
Using CATALINA_HOME:   /home/master/apache-tomcat-9.0.76
Using CATALINA_TMPDIR: /home/master/apache-tomcat-9.0.76/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /home/master/apache-tomcat-9.0.76/bin/bootstrap.jar:/home/master/apache-tomcat-9.0.76/bin/tomcat-juli.jar
Using CATALINA_OPTS:   
Tomcat started.
```

## mariaDB

### 설치, 설정

```java
// mariadb 설치
master@master-virtual-machine:~$ sudo apt -y install mariadb-server
[sudo] master 암호: 
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료        
다음의 추가 패키지가 설치될 것입니다 :
  galera-4 gawk libcgi-fast-perl libcgi-pm-perl libconfig-inifiles-perl libdaxctl1
  libdbd-mysql-perl libdbi-perl libfcgi-bin libfcgi-perl libfcgi0ldbl libhtml-template-perl
...
// mariadb 실행상태 확인
master@master-virtual-machine:~$ systemctl status mariadb
● mariadb.service - MariaDB 10.6.12 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-06-19 14:13:14 KST; 55s ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 19139 ExecStartPre=/usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld (c>
    Process: 19141 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (>
    Process: 19143 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=>
    Process: 19189 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION >
    Process: 19191 ExecStartPost=/etc/mysql/debian-start (code=exited, status=0/SUCCESS)
   Main PID: 19173 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 16 (limit: 4573)
     Memory: 65.7M
        CPU: 269ms
     CGroup: /system.slice/mariadb.service
             └─19173 /usr/sbin/mariadbd

 6월 19 14:13:14 master-virtual-machine mariadbd[19173]: 2023-06-19 14:13:14 0 [Note] InnoDB: >
 6월 19 14:13:14 master-virtual-machine mariadbd[19173]: 2023-06-19 14:13:14 0 [Note] /usr/sbi>
 6월 19 14:13:14 master-virtual-machine mariadbd[19173]: Version: '10.6.12-MariaDB-0ubuntu0.22>
 6월 19 14:13:14 master-virtual-machine systemd[1]: Started MariaDB 10.6.12 database server.

```
```java
master@master-virtual-machine:~$ mysql
ERROR 1698 (28000): Access denied for user 'master'@'localhost'
master@master-virtual-machine:~$ sudo mysql
// 암호가 따로 설정되어 있지 않다
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 32
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> select host, user, password, plugin from mysql.user;
+-----------+-------------+----------+-----------------------+
| Host      | User        | Password | plugin                |
+-----------+-------------+----------+-----------------------+
| localhost | mariadb.sys |          | mysql_native_password |
| localhost | root        | invalid  | mysql_native_password |
| localhost | mysql       | invalid  | mysql_native_password |
+-----------+-------------+----------+-----------------------+
3 rows in set (0.001 sec)
...

// 암호 설정
master@master-virtual-machine:~$ sudo mysqladmin -u root password '!123456'
// 암호 설정을 했지만, 암호가 없어도 mysql 접속이 가능하다
master@master-virtual-machine:~$ sudo mysql
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 37
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> select host, user, password, plugin from mysql.user;
+-----------+-------------+-------------------------------------------+-----------------------+
| Host      | User        | Password                                  | plugin                |
+-----------+-------------+-------------------------------------------+-----------------------+
| localhost | mariadb.sys |                                           | mysql_native_password |
| localhost | root        | *B573D3EA036614123CB0B52313A6AD58E1F114C0 | mysql_native_password |
| localhost | mysql       | invalid                                   | mysql_native_password |
+-----------+-------------+-------------------------------------------+-----------------------+
3 rows in set (0.001 sec)

// 내가 설정한 암호로만 mysql 접속하려고 하면 아래와 같은 명령어를 써준다
MariaDB [(none)]> alter user root@localhost identified via mysql_native_password using password('!123456');
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> flush privileges;
Query OK, 0 rows affected (0.000 sec)
...
// 암호 없이 mysql 접속하려고 하면 아래와 같은 에러가 생긴다
master@master-virtual-machine:~$ sudo mysql -u root -p
Enter password: 
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
// 암호 입력
master@master-virtual-machine:~$ sudo mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 40
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> select host, user, password, plugin from mysql.user;
+-----------+-------------+-------------------------------------------+-----------------------+
| Host      | User        | Password                                  | plugin                |
+-----------+-------------+-------------------------------------------+-----------------------+
| localhost | mariadb.sys |                                           | mysql_native_password |
| localhost | root        | *B573D3EA036614123CB0B52313A6AD58E1F114C0 | mysql_native_password |
| localhost | mysql       | invalid                                   | mysql_native_password |
+-----------+-------------+-------------------------------------------+-----------------------+
3 rows in set (0.001 sec)

```
```java
// localhost로 접속
master@master-virtual-machine:~$ sudo mysql -h localhost -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 41
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

// localhost ip를 직접 입력해서 접속하면 에러가 생긴다 (원격접속 에러)
master@master-virtual-machine:~$ sudo mysql -h 192.168.0.7 -u root -p
Enter password: 
ERROR 1105 (HY000): Plugin auth_gssapi_client could not be loaded: /usr/lib/x86_64-linux-gnu/libmariadb3/plugin/auth_gssapi_client.so: cannot open shared object file: No such file or directory

// mysql 원격 접속을 가능하게 하려면 아래와 같은 작업이 필요하다
master@master-virtual-machine:~$ sudo mysql -h localhost -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 42
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> grant all privileges on *.* to 'root'@'%' identified by '!123456';
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]> select host, user, password, plugin from mysql.user;
+-----------+-------------+-------------------------------------------+-----------------------+
| Host      | User        | Password                                  | plugin                |
+-----------+-------------+-------------------------------------------+-----------------------+
| localhost | mariadb.sys |                                           | mysql_native_password |
| localhost | root        | *B573D3EA036614123CB0B52313A6AD58E1F114C0 | mysql_native_password |
| localhost | mysql       | invalid                                   | mysql_native_password |
| %         | root        | *B573D3EA036614123CB0B52313A6AD58E1F114C0 | mysql_native_password |
+-----------+-------------+-------------------------------------------+-----------------------+
4 rows in set (0.001 sec)

master@master-virtual-machine:~$ sudo vi /etc/mysql/mariadb.conf.d/50-server.cnf 
// 설정 변경
master@master-virtual-machine:~$ systemctl restart mariadb
// 원격 접속이 가능해진다
// 윈도우에서도 똑같이 접속이 가능하다
master@master-virtual-machine:~$ sudo mysql -h 192.168.198.129 -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 5
Server version: 10.6.12-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

```

### 파일 업로드

- server : vsftpd

- client : filezilla
#### vsftpd
```java
// install file 캐시 확인
master@master-virtual-machine:~$ sudo apt-cache search vsftpd
[sudo] master 암호:
vsftpd - lightweight, efficient FTP server written for security
vsftpd-dbg - lightweight, efficient FTP server written for security (debug)
ccze - robust, modular log coloriser
ftpd - File Transfer Protocol (FTP) server
resource-agents-extra - Cluster Resource Agents
yasat - simple stupid audit tool
// vsftpd 설치
master@master-virtual-machine:~$ sudo apt -y install vsftpd
패키지 목록을 읽는 중입니다... 완료
의존성 트리를 만드는 중입니다... 완료
상태 정보를 읽는 중입니다... 완료
다음 새 패키지를 설치할 것입니다:
  vsftpd
0개 업그레이드, 1개 새로 설치, 0개 제거 및 10개 업그레이드 안 함.
123 k바이트 아카이브를 받아야 합니다.
이 작업 후 326 k바이트의 디스크 공간을 더 사용하게 됩니다.
받기:1 http://kr.archive.ubuntu.com/ubuntu jammy/main amd64 vsftpd amd64 3.0.5-0ubuntu1 [123 kB]
내려받기 123 k바이트, 소요시간 2초 (62.4 k바이트/초)
...
// vsftpd 실행 여부 확인
master@master-virtual-machine:~$ systemctl status vsftpd
● vsftpd.service - vsftpd FTP server
     Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset>
     Active: active (running) since Tue 2023-06-20 09:18:07 KST; 1min 37s ago
    Process: 5060 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited>
   Main PID: 5061 (vsftpd)
      Tasks: 1 (limit: 4600)
     Memory: 856.0K
        CPU: 3ms
     CGroup: /system.slice/vsftpd.service
             └─5061 /usr/sbin/vsftpd /etc/vsftpd.conf

 6월 20 09:18:07 master-virtual-machine systemd[1]: Starting vsftpd FTP server.>
 6월 20 09:18:07 master-virtual-machine systemd[1]: Started vsftpd FTP server.
set mark: ...skipping...
● vsftpd.service - vsftpd FTP server
     Loaded: loaded (/lib/systemd/system/vsftpd.service; enabled; vendor preset>
     Active: active (running) since Tue 2023-06-20 09:18:07 KST; 1min 37s ago
    Process: 5060 ExecStartPre=/bin/mkdir -p /var/run/vsftpd/empty (code=exited>
   Main PID: 5061 (vsftpd)
      Tasks: 1 (limit: 4600)
     Memory: 856.0K
        CPU: 3ms
     CGroup: /system.slice/vsftpd.service
             └─5061 /usr/sbin/vsftpd /etc/vsftpd.conf

master@master-virtual-machine:~$ sudo vi /etc/vsftpd.conf
...
write_enable=YES
// 위 내용의 주석을 풀어줘야 외부에서 파일을 업로드 할 수 있다
...
```
