-- 영화리스트 테이블생성
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

-- 회원정보 테이블생성
create table mem (
    userid VARCHAR2(50) not null primary key,
    userpwd varchar2(50),
    name varchar2(50),
    address varchar2(80),
    email varchar2(60)
);
desc mem;
select * from mem;

-- 리뷰 테이블생성
create table review (
    rnum int not null primary key,
    writer varchar(50),
    rtime date default sysdate,
    rmark number,
    rcomment varchar2(100)
);

desc review;
select * from review order by rnum;

-- 필드 추가
alter table movie add open date;
alter table movie add totreview int;
alter table review add ref int;
alter table review add movie_num int REFERENCES movie(num);
-- 필드 내용 수정
update movie set open = to_date('2019-01-01','yyyy-mm-dd');
update movie set totreview = 0;
update review set movie_num = 1;
-- 필드 내용 삭제
delete from review;
--declare
--i int := 11;
--j number := 0;
--begin
--while i<15 loop
--i := i + 1;
--update movie set title = title || '다' where num = i;
----insert into movie values (
----    (select nvl(max(num)+1,1) from movie),
----    '영화'||i,'장르'||i,'포스터'||i,'포토'||i,0.1,'리뷰'||i,'배우'||i,'감독'||i,'명대사'||i,
----    sysdate+1,0
----);
----update movie set mark = mark + 0.3 where num = i;
----j := j + 0.3;
----update movie set totreview = totreview + 1 where num = i;
----insert into mem values ('user'||i, '1111', '이름'||i, '주소'||i, '이메일'||i);
----insert into review values (
----    (select nvl(max(rnum)+1,1) from review),
----    '작성자6',sysdate,0.1,'6내용'||i,
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
update movie set review = '리뷰111' where num = 1;

-- 메인페이지에서 영화리스트 랜덤으로 5개 정렬
select * from (
    select rownum rn, A.* from
    (
        select num, title, postfname, actor, director, open from movie
        order by dbms_random.random
    ) A
)where rn between 6 and 10;

select mark from movie;
-- 메인페이지에서 영화리스트 평점순으로 5개 정렬
select * from (
    select rownum rn, A.* from (
        select num, mark, title, postfname, open, director from movie order by mark desc
    )A
)where rn between 6 and 10;

select mark, title, postfname, open, director from movie order by mark desc;

-- movie 테이블 총 레코드 수 추출
select count(*) as records from movie;

-- 카테고리에 따른 영화리스트 정렬
select * from movie order by mark desc;
select * from (
    select rownum rn, A.* from(
        select * from movie order by totreview desc
    )A
)where rn between 1 and 16;

-- 리뷰 입력하기
insert into review values (
    (select nvl(max(rnum)+1,1) from review),
    '작성자',sysdate+1,0.1,'내용',
    (select nvl(max(rnum)+1,1) from review),6
);
select * from review order by rnum;

-- 리뷰 정보 추출
select * from (
    select rownum rn, A.* from (
        select * from review where movie_num = 6 order by rnum
    )A
)where rn between 6 and 10;
-- 리뷰 총 레코드 수 추출
select count(*) from review where movie_num = 6;
-- 영화 리스트 검색 결과
select * from (
    select rownum rn, A.* from movie A where title like '%화3%'
)
--where rn between 11 and 20
;
-- 검색 키워드별 레코드 수 추출
select count(*) from (
    select * from (
        select rownum rn, A.* from movie A where title like '%화3%'
    )
);


commit;