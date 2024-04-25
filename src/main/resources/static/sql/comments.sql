drop table comments cascade constraints purge;

create table comments(
	num					number primary key,
	id					varchar2(30) references member(id),
	content 			varchar2(200),
	reg_date			date,
	board_num			number references board(board_num) on delete cascade
);

drop sequence com_seq;
create sequence com_seq;

