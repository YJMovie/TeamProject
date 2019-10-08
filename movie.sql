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

alter table movie add open date;

update movie set open = to_date('2019-01-01','yyyy-mm-dd');

--declare
--i int := 0;
--j number := 0;
--begin
--while i<=5 loop
--i := i + 1;
----insert into movie values (
----    (select nvl(max(num)+1,1) from movie),
----    '��ȭ'||i,'�帣'||i,'������'||i,'����'||i,0.1,'����'||i,'���'||i,'����'||i,'����'||i,
----    sysdate+1
----);
--update movie set mark = mark + j where num = i;
--j := j + 1;
--end loop;
--end;


drop table movie;

select title, open, director, actor from movie;
select num, review from movie;
update movie set review = '����111' where num = 1;

-- �������������� ��ȭ����Ʈ �������� 5�� ����
select rownum rn, A.* from
    (
        select num, title, postfname, actor, director, open from movie
        order by dbms_random.random
    ) A
    where rownum between 1 and 5;
update movie set mark = mark + 0.1 where num = 3;
select mark from movie;


commit;