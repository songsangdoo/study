# 기본 기획서

- 팀명 / 팀장 / 팀구성

- 사이트 정의

- 미션 / 목표

- 목표 / 상세내용

- 벤치마킹(스크린샷 + 설명)

  - 기획, 컨텐츠

  - 프로그램

  - 디자인

- 메뉴 구조도

- 스토리보드

- 개발 기술(라이브러리, OpenAPI)

- 일정

# 개발(프로그램) 기획서

- UML

- ERD

- DFD

- 회원관리
  - 기본 정보
  - 인벤 카드

- 정보 게시판
커뮤니티
- qna 게시판
- 자랑 게시판??
- 분양 게시판(유기견)

- 동아리 게시판??


- 채팅
  - 동아리 채팅

- 목요일 발표!!
프로그램 기획 erd, usercase

메뉴 - 업무분장

사용자
  - 등급

관리자


동아리 정보 
g_seq primarykey auto_increment
g_leader foriegn key m_seq
g_name
g_cdate
g_memberNum

동아리 게시판
gb_seq primary key auto_increment
gb_gseq foriegn key g_seq
gb_writer foriegn key m_seq
gb_subject
gb_cdate
gb_hit
gb_rec

질문게시판
q,a
