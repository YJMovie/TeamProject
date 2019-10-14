create table genre (
  genrecode varchar2(20) not null primary key,
  genrename varchar2(50)
);
select * from genre;
insert into genre values (
  '0005','SF'
);
select genrecode from genre where genrename = '공포';
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
create table movie1 (
  moviecode varchar2(50) not null primary key,
  title varchar2(50),
  score number,
  open date,
  lines varchar2(100)
);
select * from movie1;
drop table movie1;
insert into movie1 values (
  'a003','영화3',0.3,to_date('2019-01-03','yyyy-mm-dd'),'대사3'
);
select moviename from movie1 where moviecode = 'a003';
select movieopen from movie1 where moviecode = 'a003';
create table movie_info (
  mvcode varchar2(50) references movie1(moviecode),
  grcode varchar2(20) references genre(genrecode),
  pscode varchar2(20) references person(personcode)
);
drop table movie_info;
select * from movie_info;
insert into movie_info values (
  'a001','0003','A002'
);
select DISTINCT grcode from movie_info where mvcode = 'a001';
select DISTINCT pscode from movie_info where mvcode = 'a001';
commit;

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