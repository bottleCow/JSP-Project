DROP TABLE accounts;
DROP TABLE article;
DROP TABLE board;
DROP TABLE comments;
DROP TABLE FavoriteID;
DROP TABLE RecentID;
select * from articlerecom;
delete from articlerecom;
ALTER TABLE Article DROP COLUMN article_recom;
ALTER TABLE Comments DROP COLUMN comment_recom;

CREATE TABLE Article
(
    board_num    NUMBER NOT NULL,
    article_num    NUMBER NOT NULL,
    member_num    NUMBER NOT NULL,
    article_title    VARCHAR2(50) NOT NULL,
    article_content    CLOB NOT NULL,
    article_date    VARCHAR2(20) NOT NULL,
    article_read    NUMBER DEFAULT 0 NOT NULL,
    article_del    CHAR(1) DEFAULT 'n' NOT NULL
);

ALTER TABLE Article
 ADD CONSTRAINT Article_PK PRIMARY KEY ( board_num,article_num );


CREATE TABLE Board
(
    board_num    NUMBER NOT NULL,
    board_name    VARCHAR2(20)
);

ALTER TABLE Board
 ADD CONSTRAINT Board_PK PRIMARY KEY ( board_num );


CREATE TABLE Comments
(
    board_num    NUMBER NOT NULL,
    article_num    NUMBER NOT NULL,
    comment_num    NUMBER NOT NULL,
    member_num    NUMBER,
    comment_content    VARCHAR2(200) NOT NULL,
    comment_date    VARCHAR2(20) NOT NULL,
    comment_del    CHAR(1) DEFAULT 'n' NOT NULL
);

ALTER TABLE Comments
 ADD CONSTRAINT Comment_PK PRIMARY KEY ( board_num,article_num,comment_num );


CREATE TABLE FavoriteID
(
    member_num    NUMBER NOT NULL,
    member_favor_id    VARCHAR2(20) NOT NULL
);

ALTER TABLE FavoriteID
 ADD CONSTRAINT FavoriteID_PK PRIMARY KEY ( member_num );


CREATE TABLE Member
(
    member_num    NUMBER NOT NULL,
    member_id    VARCHAR2(20) NOT NULL,
    member_pw    VARCHAR2(24) NOT NULL,
    member_nickname    VARCHAR2(20) NOT NULL,
    member_reg_date    VARCHAR2(20) NOT NULL,
    member_email    VARCHAR2(30),
    member_del    CHAR(1) DEFAULT 'n' NOT NULL,
    member_admin    CHAR(1) DEFAULT '0' NOT NULL
);

ALTER TABLE Member
 ADD CONSTRAINT member_PK PRIMARY KEY ( member_num );


CREATE TABLE RecentID
(
    member_num    NUMBER NOT NULL,
    member_recent_date    VARCHAR2(20) NOT NULL,
    member_recent_id    VARCHAR2(20) NOT NULL
);

ALTER TABLE RecentID
 ADD CONSTRAINT RecentID_PK PRIMARY KEY ( member_num );

CREATE TABLE ArticleRecom
(
    member_num    NUMBER NOT NULL,
    board_num    NUMBER NOT NULL,
    article_num    NUMBER NOT NULL
);

ALTER TABLE ArticleRecom
 ADD CONSTRAINT 엔터티1_PK PRIMARY KEY ( member_num,board_num,article_num );


CREATE TABLE CommentsRecom
(
    member_num    NUMBER NOT NULL,
    board_num    NUMBER NOT NULL,
    article_num    NUMBER NOT NULL,
    comment_num    NUMBER NOT NULL
);

ALTER TABLE CommentsRecom
 ADD CONSTRAINT 엔터티1_PK1 PRIMARY KEY ( member_num,board_num,article_num,comment_num );

insert into board values(1, '공지사항');
insert into board values(2, '뉴스');
insert into board values(3, '자유게시판');
insert into board values(4, '매칭게시판');
insert into board values(5, '갤러리/영상');
insert into board values(6, '팁/노하우');

insert into member values(1,'master','master','마왕', to_char(sysdate, 'RRRR.MM.DD HH24:MI:SS'), 'aaa@nav.com', 'n', '1');