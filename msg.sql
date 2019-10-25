-- 회원등급 테이블
create table member_grade (
    gradecode int not null primary key,
    gradename varchar2(50)
);
----------------------- 장르테이블
create table genre (
  genrecode varchar2(20) not null primary key,
  genrename varchar2(50)
);
------------------------ 인물테이블
create table person (
  personcode varchar2(20) not null primary key,
  personname varchar2(50),
  personnation varchar2(50),
  personint varchar2(100)
);
--------------------------- 영화정보테이블
create table movie_info (
  moviecode varchar2(50) not null primary key,
  title varchar2(50),
  score number,
  open date,
  lines varchar2(100),
  postfname varchar2(50)
);
-- 회원정보 테이블
create table member_info (
    userid varchar2(50) not null primary key,
    userpwd varchar2(50),
    name varchar2(50),
    gender varchar2(10),
    phone varchar2(20),
    address varchar2(100),
    email varchar2(50),
    userdate date default sysdate,
    usergrade int REFERENCES member_grade(gradecode) on delete cascade
);
-- 리뷰정보 테이블
create table review_info (
    r_num number not null primary key,
    r_date date default sysdate,
    r_score number,
    r_comment varchar2(100),
    r_mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
    writer varchar2(50)
);
-- 영화코드 테이블
-- on delete cascade : 참조키(참조테이블 기본키)를 삭제하면 외래키도 연달아 삭제함
create table movie_code (
  mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
  grcode varchar2(20) references genre(genrecode) on delete cascade,
  pscode varchar2(20) references person(personcode) on delete cascade
);
-- 회원코드 테이블
create table member_code(
mem_grcode varchar2(50) references genre(genrecode) on delete cascade,
mem_pscode varchar2(50) references person(personcode) on delete cascade,
mem_mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
mem_userid varchar2(50)  references member_info(userid) on delete cascade
);
-- 삭제 순서
drop table member_code;
drop table movie_code;
drop table review_info;
drop table member_info;
drop table movie_info;
drop table person;
drop table genre;
drop table member_grade;
-- 정보 입력
-- 장르 정보 추가
insert into genre values ('0001','액션');
insert into genre values ('0002','코믹');
insert into genre values ('0003','공포');
insert into genre values ('0004','로맨스');
insert into genre values ('0005','SF');
-- 회원 등급 추가
insert into member_grade values (0,'관리자');
insert into member_grade values (1,'VIP회원');
insert into member_grade values (2,'일반회원');
-- 인물 정보 추가
insert into person values ('A001','강동원','서울','서울사람');
insert into person values ('A002','하정우','서울','부산사람');
insert into person values ('A003','윌스미스','미국','LA사람');
insert into person values ('B001','홍길동','호주','캔버라사람');
-- 관리자 설정
update member_info set usergrade = 0 where userid = 'admin';
commit;
