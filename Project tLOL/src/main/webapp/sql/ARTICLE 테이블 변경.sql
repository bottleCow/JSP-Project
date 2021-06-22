DROP TABLE article;

TRUNCATE TABLE comments;
TRUNCATE TABLE articleRecom;
TRUNCATE TABLE commentsRecom;

TRUNCATE TABLE article;

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