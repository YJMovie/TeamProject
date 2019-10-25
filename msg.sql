-- ȸ����� ���̺�
create table member_grade (
    gradecode int not null primary key,
    gradename varchar2(50)
);
----------------------- �帣���̺�
create table genre (
  genrecode varchar2(20) not null primary key,
  genrename varchar2(50)
);
------------------------ �ι����̺�
create table person (
  personcode varchar2(20) not null primary key,
  personname varchar2(50),
  personnation varchar2(50),
  personint varchar2(100)
);
--------------------------- ��ȭ�������̺�
create table movie_info (
  moviecode varchar2(50) not null primary key,
  title varchar2(50),
  score number,
  open date,
  lines varchar2(100),
  postfname varchar2(50)
);
-- ȸ������ ���̺�
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
-- �������� ���̺�
create table review_info (
    r_num number not null primary key,
    r_date date default sysdate,
    r_score number,
    r_comment varchar2(100),
    r_mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
    writer varchar2(50)
);
-- ��ȭ�ڵ� ���̺�
-- on delete cascade : ����Ű(�������̺� �⺻Ű)�� �����ϸ� �ܷ�Ű�� ���޾� ������
create table movie_code (
  mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
  grcode varchar2(20) references genre(genrecode) on delete cascade,
  pscode varchar2(20) references person(personcode) on delete cascade
);
-- ȸ���ڵ� ���̺�
create table member_code(
mem_grcode varchar2(50) references genre(genrecode) on delete cascade,
mem_pscode varchar2(50) references person(personcode) on delete cascade,
mem_mvcode varchar2(50) references movie_info(moviecode) on delete cascade,
mem_userid varchar2(50)  references member_info(userid) on delete cascade
);
-- ���� ����
drop table member_code;
drop table movie_code;
drop table review_info;
drop table member_info;
drop table movie_info;
drop table person;
drop table genre;
drop table member_grade;
-- ���� �Է�
-- �帣 ���� �߰�
insert into genre values ('0001','�׼�');
insert into genre values ('0002','�ڹ�');
insert into genre values ('0003','����');
insert into genre values ('0004','�θǽ�');
insert into genre values ('0005','SF');
-- ȸ�� ��� �߰�
insert into member_grade values (0,'������');
insert into member_grade values (1,'VIPȸ��');
insert into member_grade values (2,'�Ϲ�ȸ��');
-- �ι� ���� �߰�
insert into person values ('A001','������','����','������');
insert into person values ('A002','������','����','�λ���');
insert into person values ('A003','�����̽�','�̱�','LA���');
insert into person values ('B001','ȫ�浿','ȣ��','ĵ������');
-- ������ ����
update member_info set usergrade = 0 where userid = 'admin';
commit;
