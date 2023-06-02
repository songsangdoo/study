# Spring MVC album
## sql 
- 테이블 생성 구문
```sql
create table album_board (
  seq int primary key auto_increment,
  subject varchar(150) not null,
  writer varchar(10) not null,
  mail varchar(50),
  password varchar(15) not null,
  content varchar(2000),
  filename varchar(50) not null,
  filesize int not null,
  lat double not null,
  lon double not null,
  hit int not null,
  wip varchar(15) not null,
  wdate datetime not null
);
```

```sql
create table album_comment (
  seq int primary key auto_increment,
  postnum int not null,
  writer varchar(10) not null,
  password varchar(15) not null,
  content varchar(500) not null,
  wdate datetime not null,
  constraint foreign key(postnum) references album_board(seq)
);
```

- 데이터 삽입 구문
```sql
insert into album_board values(
  0, '제목', '글쓴이', 'test@test.com', '123456', '내용', '파일이름', '12345', 123.00, 123.00, 0, '000.000.000.000', now()
);
```

```sql
insert into album_comment values(
  0, 1, '글쓴이', '123456', '내용', now()
);
```