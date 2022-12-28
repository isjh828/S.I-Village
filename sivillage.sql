/*
    ȸ������(����)
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
    ���ǰԽ���
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

    -- �亯�� �Խ��� 
    ref             number,
    re_step         number,
    re_level        number
);


--���̺� ����
select * from si_users;
select * from si_board;


-- ���� ������ �߰�
insert into si_board values(1,'����','ezen','��ǰ����','���԰�����ΰ���?','������','aaa@naver.com','tel','tel2','20221011',1,1,1,1);
insert into si_board values(2,'����','ezen','��ǰ����2','���԰�����ΰ���?2','������','aaa@naver.com','tel','tel2','20221011',1,1,1,1);
insert into si_board values(3,'����','ezen','��ǰ����3','���԰�����ΰ���?3','������','aaa@naver.com','tel','tel2','20221011',1,1,1,1);

-- ������ �߰�
insert into si_users(seq, id, password, name,tel,role) values((select nvl(max(seq),0)+1 from si_users),'admin','admin','admin',01012341234,'������');
insert into si_users(seq, id, password, name,tel,role) values((select nvl(max(seq),0)+1 from si_users),'aaa','1111','aaa',01012341234,'����');

-- �����ϱ�
update si_board set title = '����1', content = '����1' where seq=1;
-- �����ϱ�
delete from si_board where seq =2;
delete from si_users where seq =2;
-- ���̺� ����
drop table si_users;
drop table si_board;

-- Ŀ��
commit;