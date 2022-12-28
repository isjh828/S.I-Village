/*
    회원정보(가입)
*/
create table si_users (
    seq         number primary key,
    email       varchar2(50),
    id          varchar2(30),
    password    varchar2(30),                                  
    name        varchar2(20),
    tel         varchar2(30),
    bday        varchar2(50),
    address     varchar2(50),
    agree       varchar2(80),
    joinDate    Date            DEFAULT sysdate,
    role        varchar2(10)     default 'guest'
);

/*
    문의게시판
*/
create table si_board(
    seq             number                primary key,
    type            varchar2(20),
    choice          varchar2(20),
    title           varchar2(200),
    content         varchar2(2000),
    user_name       varchar2(30),
    user_email      varchar2(30),
    first_tel       varchar2(30),
    second_tel      varchar2(30),

    regdate         date            default sysdate,
    cnt             number          default 0,

    -- 답변형 게시판 
    ref             number,
    re_step         number,
    re_level        number
);


--테이블 보기
select * from si_users;
select * from si_board;


-- 더미 데이터 추가
insert into si_board values(1,'문의','ezen','제품문의','재입고언제인가요?','김이젠','aaa@naver.com','tel','tel2','20221011',1,1,1,1);
insert into si_board values(2,'문의','ezen','제품문의2','재입고언제인가요?2','김이젠','aaa@naver.com','tel','tel2','20221011',1,1,1,1);
insert into si_board values(3,'문의','ezen','제품문의3','재입고언제인가요?3','김이젠','aaa@naver.com','tel','tel2','20221011',1,1,1,1);

-- 관리자 추가
insert into si_users(seq, id, password, name,tel,role) values((select nvl(max(seq),0)+1 from si_users),'admin','admin','admin',01012341234,'관리자');
insert into si_users(seq, id, password, name,tel,role) values((select nvl(max(seq),0)+1 from si_users),'aaa','1111','aaa',01012341234,'유저');

-- 수정하기
update si_board set title = '제목1', content = '내용1' where seq=1;
-- 삭제하기
delete from si_board where seq =2;
delete from si_users where seq =2;
-- 테이블 삭제
drop table si_users;
drop table si_board;

-- 커밋
commit;