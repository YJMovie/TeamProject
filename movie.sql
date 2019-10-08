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
----    '영화'||i,'장르'||i,'포스터'||i,'포토'||i,0.1,'리뷰'||i,'배우'||i,'감독'||i,'명대사'||i,
----    sysdate+1
----);
--update movie set mark = mark + j where num = i;
--j := j + 1;
--end loop;
--end;


drop table movie;

select title, open, director, actor from movie;
select num, review from movie;
update movie set review = '리뷰111' where num = 1;

-- 메인페이지에서 영화리스트 랜덤으로 5개 정렬
select rownum rn, A.* from
    (
        select num, title, postfname, actor, director, open from movie
        order by dbms_random.random
    ) A
    where rownum between 1 and 5;
update movie set mark = mark + 0.1 where num = 3;
select mark from movie;


commit;