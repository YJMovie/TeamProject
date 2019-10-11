-- ��ȭ����Ʈ ���̺����
create table movie (
    num int not null primary key,
    title varchar2(50) not null,
    genre VARCHAR2(50) not null,
    postfname VARCHAR2(50),
    photofname VARCHAR2(50),
    mark number not null,
    review VARCHAR2(100),
    actor VARCHAR2(50) not null,
    director varchar2(50) not null,
    lines varchar2(100),
    open date default sysdate
);
desc movie;
select * from movie;

-- ȸ������ ���̺����
create table mem (
    userid VARCHAR2(50) not null primary key,
    userpwd varchar2(50),
    name varchar2(50),
    address varchar2(80),
    email varchar2(60)
);
desc mem;
select * from mem;

-- ���� ���̺����
create table review (
    rnum int not null primary key,
    writer varchar(50),
    rtime date default sysdate,
    rmark number,
    rcomment varchar2(100)
);

desc review;
select * from review order by rnum;

-- �ʵ� �߰�
alter table movie add open date;
alter table movie add totreview int;
alter table review add ref int;
alter table review add movie_num int REFERENCES movie(num);
-- �ʵ� ���� ����
update movie set open = to_date('2019-01-01','yyyy-mm-dd');
update movie set totreview = 0;
update review set movie_num = 1;
-- �ʵ� ���� ����
delete from review;
--declare
--i int := 11;
--j number := 0;
--begin
--while i<15 loop
--i := i + 1;
--update movie set title = title || '��' where num = i;
----insert into movie values (
----    (select nvl(max(num)+1,1) from movie),
----    '��ȭ'||i,'�帣'||i,'������'||i,'����'||i,0.1,'����'||i,'���'||i,'����'||i,'����'||i,
----    sysdate+1,0
----);
----update movie set mark = mark + 0.3 where num = i;
----j := j + 0.3;
----update movie set totreview = totreview + 1 where num = i;
----insert into mem values ('user'||i, '1111', '�̸�'||i, '�ּ�'||i, '�̸���'||i);
----insert into review values (
----    (select nvl(max(rnum)+1,1) from review),
----    '�ۼ���6',sysdate,0.1,'6����'||i,
----    (select nvl(max(rnum)+1,1) from review),6
----);
--end loop;
--end;
commit;

drop table movie;

update movie set title = title || '3' where num = 3;
select * from movie where num = 3;

select title, open, director, actor from movie;
select num, review from movie;
update movie set review = '����111' where num = 1;

-- �������������� ��ȭ����Ʈ �������� 5�� ����
select * from (
    select rownum rn, A.* from
    (
        select num, title, postfname, actor, director, open from movie
        order by dbms_random.random
    ) A
)where rn between 6 and 10;

select mark from movie;
-- �������������� ��ȭ����Ʈ ���������� 5�� ����
select * from (
    select rownum rn, A.* from (
        select num, mark, title, postfname, open, director from movie order by mark desc
    )A
)where rn between 6 and 10;

select mark, title, postfname, open, director from movie order by mark desc;

-- movie ���̺� �� ���ڵ� �� ����
select count(*) as records from movie;

-- ī�װ��� ���� ��ȭ����Ʈ ����
select * from movie order by mark desc;
select * from (
    select rownum rn, A.* from(
        select * from movie order by totreview desc
    )A
)where rn between 1 and 16;

-- ���� �Է��ϱ�
insert into review values (
    (select nvl(max(rnum)+1,1) from review),
    '�ۼ���',sysdate+1,0.1,'����',
    (select nvl(max(rnum)+1,1) from review),6
);
select * from review order by rnum;

-- ���� ���� ����
select * from (
    select rownum rn, A.* from (
        select * from review where movie_num = 6 order by rnum
    )A
)where rn between 6 and 10;
-- ���� �� ���ڵ� �� ����
select count(*) from review where movie_num = 6;
-- ��ȭ ����Ʈ �˻� ���
select * from (
    select rownum rn, A.* from movie A where title like '%ȭ3%'
)
--where rn between 11 and 20
;
-- �˻� Ű���庰 ���ڵ� �� ����
select count(*) from (
    select * from (
        select rownum rn, A.* from movie A where title like '%ȭ3%'
    )
);


commit;