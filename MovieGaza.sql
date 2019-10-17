-- 장르테이블
create table genre (
  genrecode varchar2(20) not null primary key,
  genrename varchar2(50)
);
select * from genre;
desc genre;
insert into genre values (
  '0005','SF'
);
select genrecode from genre where genrename = '공포';
-- 인물테이블
create table person (
  personcode varchar2(20) not null primary key,
  personname varchar2(50),
  personnation varchar2(50),
  personint varchar2(100)
);
select * from person;
insert into person values (
  'B001','홍길동','호주','캔버라사람'
);
select personname from person where personcode = 'A002';
-- 영화정보테이블
create table movie_info (
  moviecode varchar2(50) not null primary key,
  title varchar2(50),
  -- postfnmae varchar2(50)
  score number,
  open date,
  lines varchar2(100)
);
alter table movie_info add postfname varchar2(50); --포스트파일이름 필드추가
alter table movie_info drop COLUMN postfname;
update movie_info set postfname = '포스트1';
commit;
select * from movie_info;
select max(moviecode) from movie_info;
delete from movie_info where moviecode >= 'a0011' and moviecode <='a0015'; --무결성때문에 조건제거
select * from movie_info where moviecode = 'a002';
select rownum rn, A.* from (
    select * from movie_info order by score desc
)A ;
select * from movie_info where 
    title like '%화2%' or
    lines like '%화3%';
insert into movie_info values (
    'a016','영화16',1.6,to_date('2019-09-01','yyyy-mm-dd'),'대사16','포스터16'
);
--declare
--i int := 9;
--begin
--while i<15 loop
--i := i + 1;
--insert into movie_info values (
--  'a0'||i,'영화'||i,0.1*i,to_date('2019-01-'||i,'yyyy-mm-dd'),'대사'||i,'포스터'||i
--);
--end loop;
--end;

-- 영화코드 테이블
create table movie_code (
  mvcode varchar2(50) references movie_info(moviecode),
  grcode varchar2(20) references genre(genrecode),
  pscode varchar2(20) references person(personcode)
);
drop table movie_code;
select * from movie_code;
insert into movie_code values (
  'a001','0003','A002'
);
select DISTINCT grcode from movie_code where mvcode = 'a001';
select DISTINCT pscode from movie_code where mvcode = 'a001';
-- 회원등급 테이블
create table member_grade (
    gradecode int not null primary key,
    gradename varchar2(50)
);
select * from member_grade;
insert into member_grade values (0,'관리자');
insert into member_grade values (1,'VIP회원');
insert into member_grade values (2,'일반회원');
-- 회원정보 테이블
create table member_info (
    inum number not null primary key,
    name varchar2(50),
    userid varchar2(50),
    userpwd varchar2(50),
    gender varchar2(10),
    phone varchar2(20),
    address varchar2(100),
    email varchar2(50),
    userdate date default sysdate,
    usergrade int REFERENCES member_grade(gradecode)
);
select * from member_info;
select usergrade from member_info where name = '관리자';
insert into member_info values (
  (select nvl(max(inum)+1,1) from member_info),
  '관리자','admin','0000','남','000-0000-0000','부산시 북구',
  'admin@gmail.com',sysdate,0
);

drop table member_info;
delete from member_info;
commit;
-- 리뷰정보 테이블
create table review_info (
    r_num number not null primary key,
    r_date date default sysdate,
    r_score number,
    r_comment varchar2(100),
    r_mvcode varchar2(50) references movie_info(moviecode),
    writer varchar2(50)
);
drop table review_info;
alter table review_info add writer varchar2(50);

alter table review_info add r_inum number references member_info(inum);
update review_info set writer = '홍길동';
select * from review_info;
insert into review_info values (
    (select nvl(max(r_num)+1,1)from review_info),
    sysdate, 0.0, '리뷰작성5','a005','홍길순'
);
select * from review_info where r_mvcode = 'a005';
drop table review_info;

----------------------------------------------로그인
select * from member_info where userid = 'lee';
--------------------------------------------------

--create table xx (
--  n1 varchar2(50) not null primary key,
--  n2 varchar2(50)
--);
--insert into xx values ('A','김');
--insert into xx values ('B','이');
--insert into xx values ('C','박');
--select * from xx;
--drop table xx;
--create table yy (
--  m1 varchar2(50) not null primary key,
--  m2 varchar2(50)
--);
--insert into yy values ('A1','a');
--insert into yy values ('B1','b');
--insert into yy values ('C1','c');
--select * from yy;
--drop table yy;
--create table zz (
--  p1 varchar2(50) not null primary key,
--  p2 varchar2(50),
--  p3 varchar2(50)
--);
--insert into zz values ('Z1','x','x1');
--insert into zz values ('Z2','y','y1');
--insert into zz values ('Z3','z','z1');
--select * from zz;
--drop table zz;
--create table aa (
--  s1 varchar2(50) references zz(p1),
--  s2 varchar2(50) references xx(n1),
--  s3 varchar2(50) references yy(m1)
--);
--select * from aa;
--insert into aa values ('Z1','A','A1');
--insert into aa values ('Z1','B','A1');
--commit;