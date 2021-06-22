select * from member;
insert into member values(1,'master','master','마왕', sysdate, 'aaa@nav.com', 'n', '1');
insert into member values(4,'member3','1234','멤버3', sysdate, 'member3@aaa.com', 'n', '0');
insert into member values(5,'member4','1234','멤버4', sysdate, 'member4@aaa.com', 'n', '0');
insert into member values(6,'member5','1234','멤버5', sysdate, 'member5@aaa.com', 'n', '0');
insert into member values(7,'member6','1234','멤버6', sysdate, 'member6@aaa.com', 'n', '0');
insert into member values(8,'member7','1234','멤버7', sysdate, 'member7@aaa.com', 'n', '0');
insert into member values(9,'member8','1234','멤버8', sysdate, 'member8@aaa.com', 'n', '0');
insert into member values(10,'member9','1234','멤버9', sysdate, 'member9@aaa.com', 'n', '0');
insert into member values(11,'member10','1234','멤버10', sysdate, 'member10@aaa.com', 'n', '0');
insert into member values(12,'member11','1234','멤버11', sysdate, 'member11@aaa.com', 'n', '0');

select * from article;
insert into article values(1, 1, 1, '첫글', '첫글이다', sysdate, 0, 0, 'n');
insert into article values(2, 1, 1, '뉴스첫글', '첫글이다', sysdate, 0, 0, 'n');
insert into article values(2, 2, 1, '뉴스두번째', '두루두루둘', sysdate, 0, 0, 'n');
insert into article values(2, 3, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 4, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 5, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 6, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 7, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 8, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 9, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 10, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 11, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 12, 1, '더미', '더미', sysdate, 0, 0, 'n');
insert into article values(2, 14, 1, '더미', '더미', sysdate, 0, 0, 'y');
select * from (select rowNum rn from article e) where rn between ? and ?
select * from board;

insert into board values(1, '공지사항');
insert into board values(2, '뉴스');
insert into board values(3, '자유게시판');
insert into board values(4, '매칭게시판');
insert into board values(5, '갤러리/영상');
insert into board values(6, '팁/노하우');

update comments set comment_del='y' where article_num=1 and board_num=1;
update article set article_del='n';
select * from comments;
update comments set comment_del='y' where article_num=20 and board_num=20;
select * from (select rowNum rn, e.* from (select a.*, null, b.board_name from article a, board b where member_num=1 and a.board_num = b.board_num order by article_date desc) e) where rn between 0 and 100;

select * from (select rowNum rn, e.* from (select c.*, b.board_name, a.article_title from comments c, board b, article a where c.member_num=1 and c.board_num=b.board_num and c.article_num = a.article_num order by comment_date desc) e) where rn between 0 and 1111;
select * from comments;
select c.*, a.member_nickname from comments c, member a where c.member_num = a.member_num and c.board_num=2 and c.article_num=4;
select * from article;
select * from (select rowNum rn, e.* from (select a.*, m.member_nickname from article a, member m where board_num = 2 and article_del = 'n' and a.member_num = m.member_num) e) where rn between 2 and 10;